class UsersController < ApplicationController
  before_action :set_user, only: %i[ show destroy ]

  def redirect_url
    request.referrer
  end
  # GET /users or /users.json
  def index 
    @awaited_users = User.joins(:user_profile).where({ user_profiles: { approved: false } })
    @users = User.joins(:user_profile).where({ user_profiles: { approved: true } })
  end

  # GET /users/1 or /users/1.json
  def show
    @ucs = @user.user_profile.current_semester

    @user_curr_courses = CourseUser.where(user_id: @user.id, semester: @ucs)
    @user_curr_courses_info = []
    @user_curr_courses.each do |uc|
      @c = Course.find_by(id: uc.course_id)
      @s = "pending"
      if uc.result == 1
        @s = "passed"
      elsif uc.result == 2
        @s = "failed"
      end
      @user_curr_courses_info.append(code:@c.code, title:@c.title, status:@s, c_id: @c.id, u_id:@user.id)
    end

    @user_curr_log_courses = CourseUser.where(user_id:@user.id, semester:-@ucs)
    @user_curr_log_courses_info = []
    @user_curr_log_courses.each do |uc|
      @c = Course.find_by(id: uc.course_id)
      @s = "pending"
      if uc.result == 1
        @s = "passed"
      elsif uc.result == 2
        @s = "failed"
      end
      @user_curr_log_courses_info.append(code:@c.code, title:@c.title, status:@s, c_id: @c.id, u_id:@user.id, semester:uc.semester)
    end
  end

  def set_pass
    @user = User.find(params[:u_id])
    @course = Course.find(params[:c_id])
    @uc = CourseUser.where(user_id: @user.id, course_id: @course.id)
    @uc[0].result = 1 
    @uc[0].save!
    redirect_to @user
  end

  def set_fail
    @user = User.find(params[:u_id])
    @course = Course.find(params[:c_id])
    @uc = CourseUser.where(user_id: @user.id, course_id: @course.id)
    @uc[0].result = 2
    @uc[0].save!
    redirect_to @user
  end

  def set_pass_log
    @user = User.find(params[:u_id])
    @course = Course.find(params[:c_id])
    @uc = CourseUser.where(user_id: @user.id, course_id: @course.id, semester: params[:sem])
    @uc[0].result = 1 
    @uc[0].save!
    redirect_to @user
  end

  def set_fail_log
    @user = User.find(params[:u_id])
    @course = Course.find(params[:c_id])
    @uc = CourseUser.where(user_id: @user.id, course_id: @course.id, semester: params[:sem])
    @uc[0].result = 2
    @uc[0].save!
    redirect_to @user
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def approve_user
    @user = User.find(params[:u_id])
    @up = UserProfile.find_by(user_id: @user.id)
    @up.approved = true 
    @up.save!
    redirect_to @user
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
end

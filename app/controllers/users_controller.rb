class UsersController < ApplicationController
  skip_before_action  :authorize
  skip_before_action  :authorize_user
  before_action :set_user, only: %i[ show edit update destroy ]

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

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to welcome_student_index_path(user_id: @user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
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

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end

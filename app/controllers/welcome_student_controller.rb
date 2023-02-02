class WelcomeStudentController < ApplicationController
  skip_before_action :authorize_user
  skip_before_action  :authorize

  @@selected_courses = []

  def index
    cuser = User.find_by(id: session[:user_id])
    @user = cuser
    @user_id = cuser.id
    @user_name = cuser.name
    @user_email = cuser.email

    if @user.user_profile == nil
      @check = 1
    elsif @user.user_profile && @user.user_profile.approved==false
      @check = 2
    else
      @check = 3
    end

    if @check==3
      @user_passed_courses = CourseUser.where(user_id: @user_id, result: 1)
      @user_curr_courses = CourseUser.where(user_id: @user_id, semester: @user.user_profile.current_semester)
      @user_curr_courses_info = []
      @user_curr_courses.each do |uc|
        @c = Course.find_by(id: uc.course_id)
        @s = "pending"
        if uc.result == 1
          @s = "passed"
        elsif uc.result == 2
          @s = "failed"
        end
        @user_curr_courses_info.append(code:@c.code, title:@c.title, status:@s)
      end
    end
  end

  def available_courses
    @user = User.find(params[:u_id])
    @x = CourseUser.where(user_id: @user.id, semester: @user.user_profile.current_semester, result:0)
    @notice = ""
    if @x.count > 0
      @notice = "You can't register for new semester now. The result of your current semester hasn't been published yet."
    end
  end

  def sel_to_enroll
    @course = Course.find(params[:course_id])
    puts @course
    @@selected_courses.append(@course)
  end

  def enroll_courses
    @user = User.find(params[:u_id])
    @ucs = @user.user_profile.current_semester

    if valid_selected_course
      @@selected_courses.each do |sc|
        CourseUser.create(course_id: sc.id, user_id: @user.id, semester: @ucs+1)
      end
      @user.user_profile.current_semester += 1
      @user.user_profile.save
    end
    @@selected_courses = []
    redirect_to welcome_student_index_path
  end

  def course_status
    @user = User.find(params[:u_id])
    @ucs = @user.user_profile.current_semester
    @user_curr_pass = CourseUser.where(user_id:@user.id, semester:@ucs, result:1)
    @user_all_pass = CourseUser.where(user_id:@user.id, result:1)
    @user_all_fail = CourseUser.where(user_id:@user.id, result:2)

    @user_curr_pass_info = []
    @user_curr_pass.each do |uc|
      @c = Course.find_by(id: uc.course_id)
      @user_curr_pass_info.append(code:@c.code, title:@c.title)
    end

    @user_all_pass_info = []
    if @user_all_pass_info.count 
      @user_all_pass.each do |uc|
        @c = Course.find_by(id: uc.course_id)
        if uc.semester < @ucs
          @user_all_pass_info.append(code:@c.code, title:@c.title)
        end
      end
    end

    @user_all_fail_info = []
    @user_all_fail.each do |uc|
      @c = Course.find_by(id: uc.course_id)
      @user_all_fail_info.append(c_id:@c.id, code:@c.code, title:@c.title)
    end
  end

  private
  def valid_selected_course
    @x=1
    @p = @user.user_profile.department.courses.where(semester:@ucs+1, option:"mandatory")
    @p.each do |pc|
      if @@selected_courses.include? pc
        @x = @x + 1
      else
        @x=0
        return false
      end
    end
    @total_credit = @@selected_courses.to_a.sum{|course| course.credit}
    if @@selected_courses.count >= 1 && @@selected_courses.count <=8 && @total_credit < 40 && @x>0
      return true
    else
      return false
    end
  end
end

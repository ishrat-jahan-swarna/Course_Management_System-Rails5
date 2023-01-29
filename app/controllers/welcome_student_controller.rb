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

    @user_curr_courses = CourseUser.where(user_id: @user_id)
    @user_curr_courses_info = []
    @user_curr_courses.each do |uc|
      @c = Course.find_by(id: uc.course_id)
      @user_curr_courses_info.append(code:@c.code, title:@c.title, status:uc.passed)
    end
  end

  def available_courses
    @user = User.find(params[:u_id])
  end

  def sel_to_enroll
    @course = Course.find(params[:course_id])
    puts @course
    @@selected_courses.append(@course)
  end

  def enroll_courses
    @user = User.find(params[:u_id])
    @ucs = @user.user_profile.current_semester
    @total_credit = @@selected_courses.to_a.sum{|course| course.credit}

    if @@selected_courses.count >= 2 && @@selected_courses.count <=8 && @total_credit < 40
      @@selected_courses.each do |sc|
        CourseUser.create(course_id: sc.id, user_id: @user.id, semester: @ucs+1)
      end
      @user.user_profile.current_semester += 1
      @user.user_profile.save
    end
    @@selected_courses = []
    redirect_to welcome_student_index_path
  end
end

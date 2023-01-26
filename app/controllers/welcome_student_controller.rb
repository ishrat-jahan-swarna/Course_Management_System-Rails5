class WelcomeStudentController < ApplicationController
  before_action :authorize_user
  skip_before_action  :authorize

  @@selected_courses = []

  def index
    cuser = User.find_by(id: session[:user_id])
    @user = cuser
    @user_id = cuser.id
    @user_name = cuser.name
    @user_email = cuser.email
  end

  def available_courses
    @user = User.find(params[:u_id])
  end

  def sel_to_enroll
    @course = Course.find(params[:course_id])
    @@selected_courses.append(@course)
  end

  def enroll_courses
    @user = User.find(params[:u_id])
    @total_credit = sum(@@selected_courses.credit)
    puts @total_credit
    if @@selected_courses >= 6 && @total_credit < 40
      @user.courses.push(@@selected_courses)
      @@selected_courses = []
    else
      @@selected_courses = []
    end
    redirect_to welcome_student_index_path
  end
end

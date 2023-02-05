class CourseDeptController < ApplicationController
  skip_before_action :authenticate_admin!, only: [:show_courses_user]
  skip_before_action :authenticate_user! , only: [:index, :show_courses, :sel_course, :add_course, :remove_course]
  
  @@selected_courses = []

  def index
    @dept = Department.find(params[:dept_id])
    @courses = Course.all
  end
  
  def show_courses
    @dept = Department.find(params[:dept_id])
    respond_to do |format|
      format.html{redirect_to welcome_index_path}
      format.js
    end
  end

  def show_courses_user
    if params[:dept_id] == "-2"
      @ch = 2
    elsif params[:dept_id] == "-1"
      @ch = 1
    else
      @dept = Department.find(params[:dept_id])
    end
  end

  def sel_course
    @course = Course.find(params[:course_id])
    puts @course
    @@selected_courses.append(@course)
  end

  def add_course
    puts "I am here"
    @dept = Department.find(params[:dept_id])
    @dept.courses.push(@@selected_courses)
    @@selected_courses = []
    redirect_to welcome_index_path
  end

  def remove_course
    @dept = Department.find(params[:dept_id])
    @dept.courses.delete(@@selected_courses)
    @@selected_courses = []
    redirect_to welcome_index_path
  end
end

class CourseDeptController < ApplicationController
  def index
    @courses = Course.all
  end
  def add_to_dept
    
  end
end

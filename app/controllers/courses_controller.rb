class CoursesController < ApplicationController
  def index
    @courses = Course.all 
  end

  def show
    @course = Course.find(params[:id])
    @photo = Photo.new
  end
end

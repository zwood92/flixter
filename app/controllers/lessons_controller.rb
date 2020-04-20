class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_enrolled_for_current_course, only: [:show]

  def show
  end

  private

  def require_enrolled_for_current_course
    if current_user.enrolled_in?(current_lesson.section.course) == false
      # render plain: "Unauthorized", status: :unauthorized
      redirect_to course_path(current_lesson.section.course), alert: 'You are not enrolled in this course! :('
    end
  end

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end

  # def current_course
  #   @current_course ||= Course.find(params[:course_id])
  # end
end

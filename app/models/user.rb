class User < ApplicationRecord
  has_many :courses
  has_many :enrollments
  has_many :enrolled_courses, through: :enrollments, source: :course
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def enrolled_in?(course)
    # array menthod before using "through:" (through means only one query, instead of n+1 so is more performant) in line 4, same return line for both
    # enrolled_courses = enrollments.collect(&:course)
    return enrolled_courses.include?(course)
  end

end

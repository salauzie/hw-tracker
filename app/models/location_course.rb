class LocationCourse < ActiveRecord::Base
	belongs_to :location
	belongs_to :course
	has_many :location_course_users
	has_many :users, through: :location_course_users
end

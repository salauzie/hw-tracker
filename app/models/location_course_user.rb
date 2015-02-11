class LocationCourseUser < ActiveRecord::Base
	belongs_to :location_course
	belongs_to :user
end

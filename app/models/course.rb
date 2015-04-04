# == Schema Information
#
# Table name: courses
#
#  id          :integer          not null, primary key
#  course_code :string
#  course_name :string
#  term        :string
#  year        :integer
#  note        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Course < ActiveRecord::Base
end

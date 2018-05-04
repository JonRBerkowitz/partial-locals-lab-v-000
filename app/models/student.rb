# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  def self.search(query)
    if query == ''
      Student.all
    else
    s = []
    Student.all.each do |student|
      if student.name.downcase.include?(query.downcase)
        s << student
      end
    end
    s
    end
  end

end

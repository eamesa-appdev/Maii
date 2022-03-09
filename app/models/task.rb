# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  body       :string
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Task < ApplicationRecord

  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })
  validates(:body, { :inclusion => { :in => [ "not yet started", "in progress", "completed" ] } })
  validates(:body, { :presence => true })
end

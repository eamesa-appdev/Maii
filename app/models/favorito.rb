# == Schema Information
#
# Table name: favoritos
#
#  id               :integer          not null, primary key
#  exit_date        :date
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  participacion_id :integer
#  user_id          :integer
#
class Favorito < ApplicationRecord
  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })
  belongs_to(:participacion, { :required => true, :class_name => "Participacion", :foreign_key => "participacion_id" })
end

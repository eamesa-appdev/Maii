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
end

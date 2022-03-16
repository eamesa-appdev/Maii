# == Schema Information
#
# Table name: funds
#
#  id                         :integer          not null, primary key
#  codigo_tipo_fondo          :string
#  nombre_fondo               :string
#  tipo_fondo                 :string
#  tipo_participaciones_count :integer
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  administradora_id          :integer
#
class Fund < ApplicationRecord
  validates_uniqueness_of :nombre_fondo
end

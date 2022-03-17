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
  belongs_to(:administradora, { :required => true, :class_name => "Administradora", :foreign_key => "administradora_id", :counter_cache => :fondos_count })
  has_many(:tipo_participaciones, { :class_name => "Participacion", :foreign_key => "fund_id", :dependent => :destroy })
end

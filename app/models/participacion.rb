# == Schema Information
#
# Table name: participacions
#
#  id                     :integer          not null, primary key
#  codigo_participaciones :integer
#  numero_inversionistas  :integer
#  rentabilidad_anual     :float
#  rentabilidad_diaria    :float
#  rentabilidad_mensual   :float
#  rentabilidad_semestral :float
#  valor_fondo            :float
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  fund_id                :integer
#
class Participacion < ApplicationRecord
  belongs_to(:fondo, { :required => true, :class_name => "Fund", :foreign_key => "fund_id", :counter_cache => :tipo_participaciones_count })
  has_many(:favoritos, { :class_name => "Favorito", :foreign_key => "participacion_id", :dependent => :destroy })
end

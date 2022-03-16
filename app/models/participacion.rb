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
end

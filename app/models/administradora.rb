# == Schema Information
#
# Table name: administradoras
#
#  id                    :integer          not null, primary key
#  fondos_count          :integer
#  nombre_administradora :string
#  tipo_adminsitradora   :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
class Administradora < ApplicationRecord
end

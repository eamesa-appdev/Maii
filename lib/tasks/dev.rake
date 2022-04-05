desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :api_pull => :environment }) do
  #api = "https://www.datos.gov.co/resource/qhpu-8ixx.json"
  two_days_ago = DateTime.now - 30
  api = "https://www.datos.gov.co/resource/qhpu-8ixx.json?fecha_corte=#{two_days_ago.year}-#{two_days_ago.month}-#{two_days_ago.day}T00:00:00.000"

  #api = "https://www.datos.gov.co/resource/qhpu-8ixx.json?fecha_corte=#{DateTime.now-2}"
  
  raw_data = open(api).read
  parsed_data = JSON.parse(raw_data)

Administradora.destroy_all
Fund.destroy_all
Participacion.destroy_all

  parsed_data.each do |dato|
  admin = Administradora.new
  admin.nombre_administradora = dato.fetch("nombre_entidad") 
  admin.save
  #p admin.errors.full_messages
      # p dato.fetch("fecha_corte")
  end

admins = Administradora.all

parsed_data.each do |dato|
found_admin = admins.where(:nombre_administradora => dato.fetch("nombre_entidad")).at(0)

fic = Fund.new
fic.nombre_fondo = dato.fetch("nombre_patrimonio")
fic.tipo_fondo = dato.fetch("nombre_subtipo_patrimonio")
fic.administradora_id = found_admin.id
fic.save
#p fic.errors.full_messages
end

fics = Fund.all
parsed_data.each do |dato|
found_fic = fics.where(:nombre_fondo => dato.fetch("nombre_patrimonio")).at(0)

part = Participacion.new

part.codigo_participaciones = dato.fetch("tipo_participacion").to_i #:integer
part.numero_inversionistas = dato.fetch("numero_inversionistas").to_i #:integer
part.rentabilidad_anual = dato.fetch("rentabilidad_anual").to_f   #:float
part.rentabilidad_diaria  = dato.fetch("rentabilidad_diaria").to_f   #:float
part.rentabilidad_mensual  = dato.fetch("rentabilidad_mensual").to_f  #:float
part.rentabilidad_semestral  = dato.fetch("rentabilidad_semestral").to_f #:float
part.valor_fondo  = dato.fetch("valor_fondo_cierre_dia_t").to_f         #:float
part.fund_id = found_fic.id
part.save

p part.errors.full_messages
end

end

task({ :api_loop => :environment }) do
  #api = "https://www.datos.gov.co/resource/qhpu-8ixx.json"
  two_days_ago = DateTime.now - 30
  api = "https://www.datos.gov.co/resource/qhpu-8ixx.json?fecha_corte=#{two_days_ago.year}-#{two_days_ago.month}-#{two_days_ago.day}T00:00:00.000"

  #api = "https://www.datos.gov.co/resource/qhpu-8ixx.json?fecha_corte=#{DateTime.now-2}"
  
  raw_data = open(api).read
  parsed_data = JSON.parse(raw_data)

  parsed_data.class

  #parsed_data.first.each do |k, v|
    #puts "#{key}: #{value}"
  #end
end
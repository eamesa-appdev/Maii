desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :api_pull => :environment }) do
  #api = "https://www.datos.gov.co/resource/qhpu-8ixx.json"
  two_days_ago = DateTime.now - 30
  api = "https://www.datos.gov.co/resource/qhpu-8ixx.json?fecha_corte=#{two_days_ago.year}-#{two_days_ago.month}-#{two_days_ago.day}T00:00:00.000"

  #api = "https://www.datos.gov.co/resource/qhpu-8ixx.json?fecha_corte=#{DateTime.now-2}"
  
  raw_data = open(api).read
  parsed_data = JSON.parse(raw_data)

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
p fic.errors.full_messages
end

end

class AdministradorasController < ApplicationController
  def index
    matching_administradoras = Administradora.all

    @list_of_administradoras = matching_administradoras.order({ :created_at => :desc })

    render({ :template => "administradoras/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_administradoras = Administradora.where({ :id => the_id })

    @the_administradora = matching_administradoras.at(0)

    render({ :template => "administradoras/show.html.erb" })
  end

  def create
    the_administradora = Administradora.new
    the_administradora.nombre_administradora = params.fetch("query_nombre_administradora")
    the_administradora.tipo_adminsitradora = params.fetch("query_tipo_adminsitradora")
    the_administradora.fondos_count = params.fetch("query_fondos_count")

    if the_administradora.valid?
      the_administradora.save
      redirect_to("/administradoras", { :notice => "Administradora created successfully." })
    else
      redirect_to("/administradoras", { :notice => "Administradora failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_administradora = Administradora.where({ :id => the_id }).at(0)

    the_administradora.nombre_administradora = params.fetch("query_nombre_administradora")
    the_administradora.tipo_adminsitradora = params.fetch("query_tipo_adminsitradora")
    the_administradora.fondos_count = params.fetch("query_fondos_count")

    if the_administradora.valid?
      the_administradora.save
      redirect_to("/administradoras/#{the_administradora.id}", { :notice => "Administradora updated successfully."} )
    else
      redirect_to("/administradoras/#{the_administradora.id}", { :alert => "Administradora failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_administradora = Administradora.where({ :id => the_id }).at(0)

    the_administradora.destroy

    redirect_to("/administradoras", { :notice => "Administradora deleted successfully."} )
  end
end

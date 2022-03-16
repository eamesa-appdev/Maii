class ParticipacionsController < ApplicationController
  def index
    matching_participacions = Participacion.all

    @list_of_participacions = matching_participacions.order({ :created_at => :desc })

    render({ :template => "participacions/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_participacions = Participacion.where({ :id => the_id })

    @the_participacion = matching_participacions.at(0)

    render({ :template => "participacions/show.html.erb" })
  end

  def create
    the_participacion = Participacion.new
    the_participacion.fund_id = params.fetch("query_fund_id")
    the_participacion.codigo_participaciones = params.fetch("query_codigo_participaciones")
    the_participacion.valor_fondo = params.fetch("query_valor_fondo")
    the_participacion.rentabilidad_diaria = params.fetch("query_rentabilidad_diaria")
    the_participacion.rentabilidad_mensual = params.fetch("query_rentabilidad_mensual")
    the_participacion.rentabilidad_semestral = params.fetch("query_rentabilidad_semestral")
    the_participacion.rentabilidad_anual = params.fetch("query_rentabilidad_anual")
    the_participacion.numero_inversionistas = params.fetch("query_numero_inversionistas")

    if the_participacion.valid?
      the_participacion.save
      redirect_to("/participacions", { :notice => "Participacion created successfully." })
    else
      redirect_to("/participacions", { :notice => "Participacion failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_participacion = Participacion.where({ :id => the_id }).at(0)

    the_participacion.fund_id = params.fetch("query_fund_id")
    the_participacion.codigo_participaciones = params.fetch("query_codigo_participaciones")
    the_participacion.valor_fondo = params.fetch("query_valor_fondo")
    the_participacion.rentabilidad_diaria = params.fetch("query_rentabilidad_diaria")
    the_participacion.rentabilidad_mensual = params.fetch("query_rentabilidad_mensual")
    the_participacion.rentabilidad_semestral = params.fetch("query_rentabilidad_semestral")
    the_participacion.rentabilidad_anual = params.fetch("query_rentabilidad_anual")
    the_participacion.numero_inversionistas = params.fetch("query_numero_inversionistas")

    if the_participacion.valid?
      the_participacion.save
      redirect_to("/participacions/#{the_participacion.id}", { :notice => "Participacion updated successfully."} )
    else
      redirect_to("/participacions/#{the_participacion.id}", { :alert => "Participacion failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_participacion = Participacion.where({ :id => the_id }).at(0)

    the_participacion.destroy

    redirect_to("/participacions", { :notice => "Participacion deleted successfully."} )
  end
end

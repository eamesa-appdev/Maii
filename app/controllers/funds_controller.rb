class FundsController < ApplicationController
  def index
    matching_funds = Fund.all

    @list_of_funds = matching_funds.order({ :created_at => :desc })

    render({ :template => "funds/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_funds = Fund.where({ :id => the_id })

    @the_fund = matching_funds.at(0)

    render({ :template => "funds/show.html.erb" })
  end

  def create
    the_fund = Fund.new
    the_fund.nombre_fondo = params.fetch("query_nombre_fondo")
    the_fund.administradora_id = params.fetch("query_administradora_id")
    the_fund.tipo_fondo = params.fetch("query_tipo_fondo")
    the_fund.codigo_tipo_fondo = params.fetch("query_codigo_tipo_fondo")
    the_fund.tipo_participaciones_count = params.fetch("query_tipo_participaciones_count")

    if the_fund.valid?
      the_fund.save
      redirect_to("/funds", { :notice => "Fund created successfully." })
    else
      redirect_to("/funds", { :notice => "Fund failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_fund = Fund.where({ :id => the_id }).at(0)

    the_fund.nombre_fondo = params.fetch("query_nombre_fondo")
    the_fund.administradora_id = params.fetch("query_administradora_id")
    the_fund.tipo_fondo = params.fetch("query_tipo_fondo")
    the_fund.codigo_tipo_fondo = params.fetch("query_codigo_tipo_fondo")
    the_fund.tipo_participaciones_count = params.fetch("query_tipo_participaciones_count")

    if the_fund.valid?
      the_fund.save
      redirect_to("/funds/#{the_fund.id}", { :notice => "Fund updated successfully."} )
    else
      redirect_to("/funds/#{the_fund.id}", { :alert => "Fund failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_fund = Fund.where({ :id => the_id }).at(0)

    the_fund.destroy

    redirect_to("/funds", { :notice => "Fund deleted successfully."} )
  end
end

class FavoritosController < ApplicationController
  def index
    matching_favoritos = Favorito.all

    @list_of_favoritos = matching_favoritos.order({ :created_at => :desc })

    render({ :template => "favoritos/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_favoritos = Favorito.where({ :id => the_id })

    @the_favorito = matching_favoritos.at(0)

    render({ :template => "favoritos/show.html.erb" })
  end

  def create
    the_favorito = Favorito.new
    the_favorito.participacion_id = params.fetch("query_participacion_id")
    the_favorito.user_id = params.fetch("query_user_id")

    if the_favorito.valid?
      the_favorito.save
      redirect_to("/favoritos", { :notice => "Favorito created successfully." })
    else
      redirect_to("/favoritos", { :notice => "Favorito failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_favorito = Favorito.where({ :id => the_id }).at(0)

    the_favorito.participacion_id = params.fetch("query_participacion_id")
    the_favorito.user_id = params.fetch("query_user_id")
    the_favorito.exit_date = params.fetch("query_exit_date")

    if the_favorito.valid?
      the_favorito.save
      redirect_to("/favoritos/#{the_favorito.id}", { :notice => "Favorito updated successfully."} )
    else
      redirect_to("/favoritos/#{the_favorito.id}", { :alert => "Favorito failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_favorito = Favorito.where({ :id => the_id }).at(0)

    the_favorito.destroy

    redirect_to("/favoritos", { :notice => "Favorito deleted successfully."} )
  end
end

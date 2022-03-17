class ApplicationController < ActionController::Base
  before_action(:load_current_user)
  
  # Uncomment this if you want to force users to sign in before any other actions
  # before_action(:force_user_sign_in)
  
  def load_current_user
    the_id = session[:user_id]
    @current_user = User.where({ :id => the_id }).first
  end
  
  def force_user_sign_in
    if @current_user == nil
      redirect_to("/user_sign_in", { :notice => "You have to sign in first." })
    end
  end


  def homepage

    api = "https://www.datos.gov.co/resource/qhpu-8ixx.json"
    raw_data = open(api).read
    @parsed_data = JSON.parse(raw_data)

    render ({:template => "home.html.erb"})
  end

  def portafolio
    render ({:template => "portafolio.html.erb"})
  end

  def nosotros
    render ({:template => "nosotros.html.erb"})
  end

end

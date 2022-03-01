class ApplicationController < ActionController::Base

  def homepage
    render ({:template => "home.html.erb"})
  end

end

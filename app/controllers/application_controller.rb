class ApplicationController < ActionController::Base

  def homepage

    api = "https://www.datos.gov.co/resource/qhpu-8ixx.json"
    raw_data = open(api).read
    @parsed_data = JSON.parse(raw_data)

    render ({:template => "home.html.erb"})
  end

end

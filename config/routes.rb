Rails.application.routes.draw do

get("/", {:controller => "application", :action => "homepage"})
#get("/", { :controller => "application", :action => "home" })

end

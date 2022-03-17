Rails.application.routes.draw do

  # Routes for the Participacion resource:
        
  # READ
  get("/participacions", { :controller => "participacions", :action => "index" })
  
  get("/participacions/:path_id", { :controller => "participacions", :action => "show" })
  
  #------------------------------

  # Routes for the Fund resource:
          
  # READ
  get("/funds", { :controller => "funds", :action => "index" })
  
  get("/funds/:path_id", { :controller => "funds", :action => "show" })
  
  #------------------------------

  # Routes for the Administradora resource:

  # READ
  get("/administradoras", { :controller => "administradoras", :action => "index" })
  
  get("/administradoras/:path_id", { :controller => "administradoras", :action => "show" })
  
  #------------------------------

  # Routes for the Favorito resource:

  # CREATE
  post("/insert_favorito", { :controller => "favoritos", :action => "create" })
          
  # READ
  get("/favoritos", { :controller => "favoritos", :action => "index" })
  
  get("/favoritos/:path_id", { :controller => "favoritos", :action => "show" })
  
  # UPDATE
  
  post("/modify_favorito/:path_id", { :controller => "favoritos", :action => "update" })
  
  # DELETE
  get("/delete_favorito/:path_id", { :controller => "favoritos", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

get("/", {:controller => "application", :action => "homepage"})
get("/portafolio", {:controller => "application", :action => "portafolio"})
get("/nosotros", {:controller => "application", :action => "nosotros"})



end

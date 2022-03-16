Rails.application.routes.draw do

  # Routes for the Participacion resource:

  # CREATE
  post("/insert_participacion", { :controller => "participacions", :action => "create" })
          
  # READ
  get("/participacions", { :controller => "participacions", :action => "index" })
  
  get("/participacions/:path_id", { :controller => "participacions", :action => "show" })
  
  # UPDATE
  
  post("/modify_participacion/:path_id", { :controller => "participacions", :action => "update" })
  
  # DELETE
  get("/delete_participacion/:path_id", { :controller => "participacions", :action => "destroy" })

  #------------------------------

  # Routes for the Fund resource:

  # CREATE
  post("/insert_fund", { :controller => "funds", :action => "create" })
          
  # READ
  get("/funds", { :controller => "funds", :action => "index" })
  
  get("/funds/:path_id", { :controller => "funds", :action => "show" })
  
  # UPDATE
  
  post("/modify_fund/:path_id", { :controller => "funds", :action => "update" })
  
  # DELETE
  get("/delete_fund/:path_id", { :controller => "funds", :action => "destroy" })

  #------------------------------

  # Routes for the Administradora resource:

  # CREATE
  post("/insert_administradora", { :controller => "administradoras", :action => "create" })
          
  # READ
  get("/administradoras", { :controller => "administradoras", :action => "index" })
  
  get("/administradoras/:path_id", { :controller => "administradoras", :action => "show" })
  
  # UPDATE
  
  post("/modify_administradora/:path_id", { :controller => "administradoras", :action => "update" })
  
  # DELETE
  get("/delete_administradora/:path_id", { :controller => "administradoras", :action => "destroy" })

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


end

Rails.application.routes.draw do
  get("/forex", { :controller => "application", :action => "start" })
  get("/forex/:from_currency", { :controller => "application", :action => "from" })
  get("/forex/:from_currrency/:to_currency", { :controller => "application", :action => "to" })
end

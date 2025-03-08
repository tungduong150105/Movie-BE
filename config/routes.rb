Rails.application.routes.draw do
  post("signup", to: "users#create")

  post("login", to: "authentication#login")
end

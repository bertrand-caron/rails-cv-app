Rails.application.routes.draw do

  mount Blog::Engine => "/blog"
end

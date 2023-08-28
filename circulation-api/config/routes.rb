Rails.application.routes.draw do
  post '/check_out', to: 'circulation#check_out'
  post '/check_in', to: 'circulation#check_in'
end

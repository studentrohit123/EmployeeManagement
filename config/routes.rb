Rails.application.routes.draw do
  devise_for :employees, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'employee/sessions',
    registrations: 'employee/registrations'
  }

  resources :departments
  resources :salaries
  resources :leaves
end

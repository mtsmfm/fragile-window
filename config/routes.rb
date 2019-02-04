Rails.application.routes.draw do
  resources :test_example_results
  resources :test_suite_results
  resources :test_examples
  resources :test_suites
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

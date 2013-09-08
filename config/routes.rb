SuperRailsBoilerplate::Application.routes.draw do
  root :to => 'Application#landing'

  resources :interviews
  post 'interviews/new_question' => 'interviews#create_from_question'
  get 'interviews/new/:id' => 'interviews#new'
  get 'voice' => 'voice#twilio'
  get 'recordVoice' => 'voice#recordVoice'

  match 'record/' => 'interviews#record', :as => 'record'
  post 'finishedRecording' => 'voice#finishedRecording'
  post 'transcribeCallback' => 'voice#transcribeCallback'
  post 'testCode' => 'interviews#test_code'

  match 'interviews2/' => 'interviews#index2', :as => 'index2'

end

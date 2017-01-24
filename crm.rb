require 'sinatra'

get '/' do
  @crm_app_name = "Stephanie's CRM"
  erb :index
end

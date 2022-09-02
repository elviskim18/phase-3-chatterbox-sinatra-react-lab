class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add routes
  get '/messages' do
    messages = Message.all.order(created_at: :asc)
    messages.to_json
  end

  post '/messages' do
    messagenew = Message.create(
      body: params[:body],
      username: params[:username]
    )
    messagenew.to_json
  end

  patch '/messages/:id' do
    messageupdate = Message.find(params[:id])
    messageupdate.update(
      body: params[:body],
      username: params[:username]
    )
    messageupdate.to_json
  
  end

  delete '/messages/:id' do
    delmessage = Message.find(params[:id])
    delmessage.destroy
    delmessage.to_json
  end
  
end

# encoding: utf-8

class App < Sinatra::Base
  
  # Set up environment
  enable :sessions  
  helpers Sinatra::Cookies
  register Sinatra::ActiveRecordExtension
    
  configure do
    use OmniAuth::Builder do
      provider :twitter, ENV['CONSUMER_KEY'], ENV['CONSUMER_SECRET']
    end  
    set :cookie_options, :expires => Time.new + 30.days
    # set :public_folder, File.dirname(__FILE__) + '/public'
  end
  
  get '/' do    
    @introduction = "Hello World!"
    
    if current_user
      logger.info "User is authenticated"
      @name = session[:nickname]
      @photo  = session[:image]
    end

    erb :index
  end



  get '/auth/twitter/callback' do
    session[:uid] = env['omniauth.auth']['uid']
    session[:image] = env['omniauth.auth']['info']['image']
    session[:nickname] = env['omniauth.auth']['info']['nickname']    
    session[:access_token] = env['omniauth.auth']['credentials']['token']
    session[:access_token_secret] = env['omniauth.auth']['credentials']['secret']
    redirect to '/'
  end
  
  get '/auth/failure' do
    @alert = "<h1>Authentication Failed:</h1><h3>message:<h3> <pre>#{params}</pre>"
    erb :index
  end
  
  get '/auth/twitter/deauthorized' do
    @alert = "<h1>Twitter has deauthorized this app.</h1>"
    erb :index
  end
  
  get '/logout' do
    session[:authenticated] = false
    redirect '/'
  end

end
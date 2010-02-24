require 'sinatra/base'
require 'haml'
require File.expand_path("../models", __FILE__)

class IGoogleFight < Sinatra::Base
# Config
  set :haml, {:format => :html5 }

# Middlewares
  use Rack::Lint
  configure :development do
    use Sinatra::ShowExceptions
  end

# View helpers
  helpers do
    include Rack::Utils
    alias_method :h, :escape_html
  end

  get '/' do
    @previously = Fight.last(10, :order => :created_at.desc)
    haml :index
  end

  get '/fight/:id' do
    @fight = Fight.get(params[:id])
    haml :fight
  end

  post '/fight' do
    @fight = Fight.create(:query_1 => params["q1"], :query_2 => params["q2"])

    if @fight.new?
      log_error(@fight)
      haml :error
    else
      haml :fight
    end
  end

  def log_error(fight)
    File.open("errors.log", "w+") do |f|
      f.puts "#{Time.now.to_s} Error, sigh."
      f.puts "Params: #{params.inspect}"
      f.puts "Fight: #{fight.inspect}"
      f.puts
    end
  end
end

require 'sinatra/base'
require 'haml'

class IGoogleFight < Sinatra::Base
  get '/' do
    haml :index
  end

  get '/fight/:id' do
    if params[:id] == "1"
      @fight = %w(love hate 101,234,512 38,234,958)
    elsif params[:id] == "2"
      @fight = %w(war peace 101,234,512 38,234,958)
    else
      @fight = %w(broken sigh 1 2)
    end

    if @fight[1] > @fight[3]
      @winner = "some super long string"#@fight[0]
    else
      @winner = @fight[2]
    end
    haml :fight
  end

  post '/fight' do
    require 'openuri'
    @fight = [params["q1"], params["q2"]].map do |query|
      search = open("http://www.google.com/search?hl=en&q=#{CGI.escape(query)}").read
      hits = (m = search.match(/of about <b>(.*?)<\/b> for/) && m[1])
      [query, hits]
    end.flatten

    if @fight[1] > @fight[3]
      @winner = @fight[0]
    else
      @winner = @fight[2]
    end
    haml :fight
  end

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

end

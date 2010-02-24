require 'sinatra/base'
require 'haml'
require 'models'

class IGoogleFight < Sinatra::Base
# Config
  set :haml, {:format => :html5 }
  set :app_file, __FILE__
  set :static, true

  configure :development do
    use Sinatra::ShowExceptions
  end

  configure :production do
    not_found do
      "We couldn't find it. We didn't try very hard, though."
    end

    error do
      "Er... ouch."
    end
  end

# View helpers
  helpers do
    include Rack::Utils
    alias_method :h, :escape_html

    def n(number)
      number.to_s.reverse.gsub(/...(?=.)/,'\&,').reverse
    end
  end

  get '/' do
    @previously = Fight.last(10, :order => :created_at.asc)
    haml :index
  end

  get '/fight/:id' do
    @fight = Fight.get(params[:id])

    unless @fight
      raise NotFound
    else
      haml :fight
    end
  end

  post '/fight' do
    @fight = Fight.create(:query_1 => params["q1"], :query_2 => params["q2"])

    if @fight.new?
      log_error(@fight)
      raise
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

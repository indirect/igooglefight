require 'datamapper'

db_file = File.expand_path("../../igooglefight.db", __FILE__)
DataMapper::setup(:default, "sqlite3://#{db_file}")

class Fight
  include DataMapper::Resource
  property :id,         Serial
  property :query_1,    String,  :required => true
  property :count_1,    Integer, :required => true
  property :query_2,    String,  :required => true
  property :count_2,    Integer, :required => true
  property :created_at, DateTime
  property :updated_at, DateTime

  before :valid?, :get_results!

  def get_results!
    self.count_1 = results_count(query_1)
    self.count_2 = results_count(query_2)
    winner if @count_1 && @count_2
  end

  def winner
    if count_1 > count_2
      query_1
    elsif count_1 < count_2
      query_2
    elsif count_1 == count_2
      "A Tie!"
    else
      "An error"
    end
  end

private
  def results_count(query)
    require 'cgi'
    require 'open-uri'
    search = open("http://www.google.com/search?hl=en&q=#{CGI.escape(query)}").read
    m = search.match(/of about <b>(.*?)<\/b> for/)
    m ? m[1].gsub(',','').to_i : nil
  end

end

# automatically create or update the table
Fight.auto_upgrade!


require 'net/http'
class Build
  attr_accessor :url, :response, :uri, :json, :results

  def initialize
    @url = "http://api.builtwith.com/v9/api.json?KEY=#{ENV['built_with_id']}&lookup=trydailypay.com"
    @uri = URI(url)
    @response = Net::HTTP.get(uri)
    @json = JSON.parse(@response)
    @results = @json["Results"][0]["Result"]["Paths"][0]["Technologies"]
  end


  def parse_results
    return_hash = {}
    @results.each do |result|
      case result["Name"]
      when "Heroku Proxy"
        return_hash["proxy"] = []
        return_hash["proxy"] << result["Name"]
        return_hash["proxy"] << result["Description"]
      when "Ruby on Rails Token"
        return_hash["token"] = []
        return_hash["token"] << result["Name"]
        return_hash["token"] << result["Description"]        
      when "Ruby on Rails"
        return_hash["framework"] = []
        return_hash["framework"] << result["Name"]
        return_hash["framework"] << result["Description"]          
      when "Viewport Meta"
        return_hash["mobile"] = []
        return_hash["mobile"] << result["Name"]
        return_hash["mobile"] << result["Description"]
      when "Heroku SSL"
        return_hash["security"] = []
        return_hash["security"] << result["Name"]
        return_hash["security"] << result["Description"]              
      else
        nil
      end
    end
    return_hash
  end



end



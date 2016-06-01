class WelcomeController < ApplicationController

  def index
      @built_with = Build.new.parse_results
      @pricing = Scrape.new.return_data.html_safe
  end

end

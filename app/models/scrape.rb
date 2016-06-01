require 'nokogiri'
require 'open-uri'

class Scrape

  attr_accessor :return_data

  def initialize
    @doc = Nokogiri::HTML(open("https://www.trydailypay.com/drivers/pricing"))
    pricing_table
  end

  def pricing_table
    @titles = @doc.css('table').css('th')
    @data = @doc.css('table').css('td')
    html = ""
    table_titles = @titles.map do |row|      
      row.text
    end

    table_data = @data.map do |row|

      row.text
    end
      
    @return_data =   "<table style='width:100%;'>
    <tr>
      <th>#{table_titles[0]}</th>
      <th>#{table_titles[1]}</th>
    </tr>
    <tr>
      <td>#{table_data[0]}</td>
      <td>#{table_data[1]}</td>
    </tr>
    <tr>
      <td>#{table_data[2]}</td>
      <td>#{table_data[3]}</td>
    </tr>
  </table>"
  end



end

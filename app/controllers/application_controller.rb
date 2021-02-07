class ApplicationController < ActionController::Base

  def from
    
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")

    @currencies = @symbols_hash.keys
    
    render({ :template => "dashboard_templates/forex.html.erb"})
  end

end

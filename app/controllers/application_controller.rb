class ApplicationController < ActionController::Base

  def start
    
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")

    @currencies = @symbols_hash.keys

    render({ :template => "dashboard_templates/forex.html.erb"})
  end

  def from

    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")

    @currencies = @symbols_hash.keys

    @from = params.fetch("from_currency")
    render({ :template => "dashboard_templates/from.html.erb"})
  end

  def to

    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")

    @currencies = @symbols_hash.keys

    @from = params.fetch("from_currency")
    @to = params.fetch("to_currency")
    render({ :template => "dashboard_templates/from.html.erb"})
  end

end

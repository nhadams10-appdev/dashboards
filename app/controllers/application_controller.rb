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

    @string = "https://api.exchangerate.host/convert?from=" + @from + "&to=" + @to
    @raw_conversion = open(@string).read
    @parsed_conversion = JSON.parse(@raw_conversion)
    @conversion_hash = @parsed_conversion.fetch("info")
    @conversion_rate = @conversion_hash.fetch("rate")
    
    render({ :template => "dashboard_templates/to.html.erb"})
  end

end

# -*- coding: utf-8 -*-    

require 'open-uri'
require 'json'

module OpenWeatherUtil

  module Search

    BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"

    def byLL(latitude, longitude)
      # http://api.openweathermap.org/data/2.5/weather?lat=35&lon=140
      post_url = BASE_URL + "lat=#{latitude.to_s}&lon=#{longitude.to_s}"
      p parse_data post_url
    end
    module_function :byLL

    def parse_data url
      html = open(URI.encode(url)).read
      json = JSON.parser.new(html)
      hash =  json.parse()
      p weather_code = hash["weather"][0]["id"].to_s
      convert_weather weather_code
    end
    module_function :parse_data

    def convert_weather main
      ret = 9
      case main
      when /^2/
        # Thunderstorm
        ret = 0
      when /^3/
        # Drizzle
        ret = 1
      when /^5/
        # Rain
        ret = 2
      when /^6/
        # Snow
        ret = 3
      when /^7/
        # Atmosphere
        ret = 4
      when "800"
        ret = 6
      when "801"
        ret = 6
      when "802"
        ret = 6
      when /^8/
        # Cloud
        ret = 5
      else
        ret = 9
      end
      ret
    end
    module_function :convert_weather

  end

end

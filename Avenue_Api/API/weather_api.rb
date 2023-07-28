require_relative "../spec/spec_helper.rb"

class Weather
  @@api_url = 'https://api.openweathermap.org/data/2.5/'

  def get_weather_lat_lon(lat, lon, token)
    response = HTTParty.post("#{@@api_url}weather?lat=#{lat}&lon=#{lon}&APPID=#{token}",
                             headers: { "Content-Type" => "application/json",
                                        "Accept" => "application/json" })
  end

  def get_city_weather(city, token)
    response = HTTParty.post("#{@@api_url}weather?q=#{city}&APPID=#{token}",
                             headers: { "Content-Type" => "application/json",
                                        "Accept" => "application/json" })
  end

end
require_relative "../../API/weather_api.rb"

describe 'Teste de automação Api', :groups do
    
    before (:all) do
        @weather = Weather.new
        @token   = '457f914738e047707349aa2d9f7c45f8'
    end

    context 'Current weather data' do
        
        it "GET/ 200 Code - Current weather data by latitude and longitude" do

            chicago = @weather.get_weather_lat_lon('17.799999', '-88.300003', @token)
            expect(chicago.code).to eq(200)
            expect(chicago.headers['content-type']).to include('application/json')
            expect(chicago['name']).to eq('Chicago')
            expect(chicago['weather']).not_to be_empty
            expect(chicago['base']).to eq('stations')
            expect(chicago['main']).not_to be_empty
            expect(chicago['wind']).not_to be_empty
            expect(chicago['clouds']).not_to be_empty
            
        end

        it "GET/ INVALID Api Key - Current weather data by latitude and longitude" do

            invalid_token = @weather.get_weather_lat_lon('17.799999', '-88.300003', 'INVALID')
            expect(invalid_token.code).to eq(401)
            expect(invalid_token['message']).to include('Invalid API key')
            
        end

        it "GET/ INVALID latitude - Current weather data by latitude and longitude" do

            invalid_lat = @weather.get_weather_lat_lon('AAAA', '-88.300003', @token)
            expect(invalid_lat.code).to eq(400)
            expect(invalid_lat['message']).to include('wrong latitude')
            
        end

        it "GET/ INVALID longitude - Current weather data by latitude and longitude" do

            invalid_lon = @weather.get_weather_lat_lon('17.799999', 'AAAA', @token)
            expect(invalid_lon.code).to eq(400)
            expect(invalid_lon['message']).to include('wrong longitude')            
        end
    end

    context 'Current weather cities' do

        it "GET/ 200 Code - Current weather data by cities" do

            london = @weather.get_city_weather('London,uk', @token)
            expect(london.code).to eq(200)
            expect(london['name']).to eq('London')
            expect(london['weather']).not_to be_empty
            expect(london['base']).to eq('stations')
            expect(london['main']).not_to be_empty
            expect(london['wind']).not_to be_empty
            expect(london['clouds']).not_to be_empty
            
        end

        it "GET/ Invalid city - Current weather data by cities" do

            invalid = @weather.get_city_weather('AAAA', @token)
            expect(invalid.code).to eq(404)
            expect(invalid['message']).to eq('city not found')   

        end
    end
end
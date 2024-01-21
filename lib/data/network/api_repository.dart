
import '../models/universal_response.dart';
import '../models/weather/weather_model.dart';
import '../models/weather_daily_hourly/weather_model_daily_hourly.dart';
import 'api_provider.dart';

class ApiRepository{
  final ApiProvider apiProvider;
  ApiRepository({required this.apiProvider});

  Future<WeatherModelAllTime?> getHourlyData({ required num lat,
    required num long,})async{
    UniversalResponse universalResponse=await apiProvider.getHourlyData(lat: lat, long: long);
    if(universalResponse.error.isEmpty){
      return universalResponse.data as  WeatherModelAllTime;
    }
    return null;
  }

  Future<WeatherModel?> getWeatherDataByLatLong({required num lat, required num long})async{
    UniversalResponse universalResponse=await apiProvider.getCurrentDayDataByLatlon(lat: lat, long: long);
    if(universalResponse.error.isEmpty){
      return universalResponse.data as  WeatherModel;
    }
    return null;
  }

  Future<WeatherModel?> getWeatherDataByQuery({required String region})async{
    UniversalResponse universalResponse=await apiProvider.getCurrentDayDataByQuery(region);
    if(universalResponse.error.isEmpty){
      return universalResponse.data as  WeatherModel;
    }
    return null;
  }
}
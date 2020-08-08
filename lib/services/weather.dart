import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey= '7e174d8bb0ec15682b388401dd1c843d';

class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async {

    NetworkHelper networkhelp= NetworkHelper('https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey');

    var weatherData= await networkhelp.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Locator locate= Locator();
    await locate.getCurrentLocation();

    NetworkHelper networkhelp= NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=${locate.latitude}&lon=${locate.longitude}&appid=$apiKey');

    var weatherData= await networkhelp.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}

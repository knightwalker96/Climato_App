import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getLocator();
  }

  void getLocator() async {

        WeatherModel weath = WeatherModel();
        var weatherData= await weath.getLocationWeather();

        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return LocationScreen(WeatherData: weatherData);
        },));
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.blue,
          size: 150,
        ),
      ),
    );
  }
}

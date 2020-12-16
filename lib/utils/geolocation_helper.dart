import 'package:geolocator/geolocator.dart';

class GeolocationHelper {
  static Future<Position> getCurrentPosition() async {
    Position position;
    try {
      position = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.low)
          .timeout(const Duration(seconds: 4));
    } catch (e) {
      print(e);
    }
    return position;
  }
}

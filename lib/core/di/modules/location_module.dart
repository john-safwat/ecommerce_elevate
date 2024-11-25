// 📦 Package imports:
import 'package:geocode/geocode.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';

@module
abstract class LocationModule {
  @lazySingleton
  Location get location => Location();

  @lazySingleton
  GeoCode get geoCode => GeoCode();
}

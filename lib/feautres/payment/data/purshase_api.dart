//class purshase api using glassfy api
import 'package:glassfy_flutter/glassfy_flutter.dart';

class PurshaseApi {
  static const _apiKey = '4223e55517534c95bd28f879f5ce5fd4';
  static Future<void> init() async {
    await Glassfy.initialize(_apiKey);
  }
}
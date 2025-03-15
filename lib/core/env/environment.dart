import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static Future<void> initEnvironment() async {
    // if (kIsProduction) {
    await dotenv.load(fileName: "app_config_develop.env");
    // }
  }

  static String get apiBaseUrl {
    return dotenv.get("API_BASE_URL");
  }

  static String get apiKey {
    return dotenv.get("API_KEY");
  }
}

import "dart:io";
import 'dart:convert';
import 'package:chalk/chalk.dart';
import "package:ip_geolocation_io/ip_geolocation_io.dart";
import "package:adhan_dart/adhan_dart.dart";

void main(List<String> args) async {
  // Create a variable that holds the config file path in the home directory
  String configFilePath = "${Platform.environment["HOME"]}/.adhancfg.json";

  final apiKey = "8a21b90d12d644f99c28d3793ac453c4";

  final geolocation = IpGeoLocationIO(apiKey);
  final geoResponse = await geolocation.getUserLocation();

  // Create the config file if it doesn't exist
  if (!File(configFilePath).existsSync()) {
    print(chalk
        .blue("Config file not found. Creating one at $configFilePath..."));

    File(configFilePath).createSync();

    // Set the default values for the config file
    final defaultCfg = {
      "latitude": geoResponse.latitude,
      "longitude": geoResponse.longitude,
      "timezone": geoResponse.timeZone.name,
      "madhab": Madhab.Hanafi,
      "calculationMethod": CalculationMethod.Karachi,
    };

    // Write the default config file
    File(configFilePath).writeAsStringSync(json.encode(defaultCfg),
        mode: FileMode.write, flush: true);

    print(chalk.green("Config file created successfully."));
  }

  // Create a variable that holds the config file
  File configFile = File(configFilePath);


  print(chalk.blue("Reading config file..."));

  // Read the config file

  final config = json.decode(configFile.readAsStringSync());

  print(config);
}

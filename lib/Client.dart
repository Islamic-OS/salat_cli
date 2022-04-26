import 'package:adhan_dart/adhan_dart.dart';
import 'package:intl/intl.dart';
import "package:ip_geolocation_io/ip_geolocation_io.dart";
import 'package:chalk/chalk.dart';
// import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/standalone.dart' as tz;

class Client {
  Future<void> today() async {
    tz.initializeTimeZone();

    final apiKey = "8a21b90d12d644f99c28d3793ac453c4";
    final geolocation = IpGeoLocationIO(apiKey);

    final userLocation = await geolocation.getUserLocation();
    final latitude = userLocation.latitude;
    final longitude = userLocation.longitude;
    final timezone = tz.getLocation(userLocation.timeZone.name);

    final Coordinates coordinates = Coordinates(latitude, longitude);
    final date = tz.TZDateTime.from(DateTime.now(), timezone);
    final params = CalculationMethod.Karachi();
    params.madhab = Madhab.Hanafi;
    final prayerTimes = PrayerTimes(coordinates, date, params, precision: true);

    print(chalk.green("Today's Salah timimgs:\n").bold());

    print(chalk.blue("Fajr: ").bold() +
        chalk.green(DateFormat.jm()
            .format(tz.TZDateTime.from(prayerTimes.fajr!, timezone))));
    print(chalk.blue("Sunrise: ").bold() +
        chalk.green(DateFormat.jm()
            .format(tz.TZDateTime.from(prayerTimes.sunrise!, timezone))));
    print(chalk.blue("Dhuhr: ").bold() +
        chalk.green(DateFormat.jm()
            .format(tz.TZDateTime.from(prayerTimes.dhuhr!, timezone))));
    print(chalk.blue("Asr: ").bold() +
        chalk.green(DateFormat.jm()
            .format(tz.TZDateTime.from(prayerTimes.asr!, timezone))));
    print(chalk.blue("Maghrib: ").bold() +
        chalk.green(DateFormat.jm()
            .format(tz.TZDateTime.from(prayerTimes.maghrib!, timezone))));
    print(chalk.blue("Isha: ").bold() +
        chalk.green(DateFormat.jm()
            .format(tz.TZDateTime.from(prayerTimes.isha!, timezone))));
  }

  void configure() {
    print("Configure Salah Daemon Settings");
  }

  void help() {
    print(chalk.green("Usage: adhan [OPTION]...\n").bold() +
        chalk.blue("Options:\n") +
        chalk.blue("  -t, --today\n") +
        chalk.blue("  -c, --configure\n") +
        chalk.blue("  -h, --help\n") +
        chalk.blue("  -v, --version\n"));
  }
}

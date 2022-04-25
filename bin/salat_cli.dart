import 'package:adhan_dart/adhan_dart.dart';
import 'package:intl/intl.dart';
import 'package:args/args.dart';
import 'config_wizard.dart';

void main(List<String> arguments) {
  final parser = ArgParser();
  parser.addOption('latitude', abbr: 'l', defaultsTo: '0.0');
  parser.addOption('longitude', abbr: 'g', defaultsTo: '0.0');
  parser.addFlag('help', abbr: 'h', defaultsTo: false);
  parser.addFlag('configure', abbr: 'c', defaultsTo: false);

  if (arguments.contains('--configure')) {
    _startWizard();
  }

  final myCoordinates = Coordinates(23.9088, 89.1220);
  final date = DateTime.now();
  final params = CalculationMethod.Karachi();
  params.madhab = Madhab.Hanafi;
  final prayerTimes = PrayerTimes(myCoordinates, date, params);

  print('My Prayer Times');
  print(DateFormat.jm().format(prayerTimes.fajr!));
  print(DateFormat.jm().format(prayerTimes.sunrise!));
  print(DateFormat.jm().format(prayerTimes.dhuhr!));
  print(DateFormat.jm().format(prayerTimes.asr!));
  print(DateFormat.jm().format(prayerTimes.maghrib!));
  print(DateFormat.jm().format(prayerTimes.isha!));
}

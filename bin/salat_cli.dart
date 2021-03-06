import 'package:adhan_dart/adhan_dart.dart';
import 'package:intl/intl.dart';

void main(List<String> arguments) {
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

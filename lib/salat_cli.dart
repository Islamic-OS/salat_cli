import 'package:adhan_dart/adhan_dart.dart';
import 'package:chalk/chalk.dart';
import 'package:intl/intl.dart';
import 'package:args/args.dart';
import 'package:cli_dialog/cli_dialog.dart';
import 'Client.dart';

String askForMissingArgs() {
  final dialog = CLI_Dialog(listQuestions: [
    [
      {
        "question": "What you want to do?",
        "options": [
          "See today's Salah timimgs",
          "Configure Salah Daemon Settings",
          "Help",
          "Quit"
        ],
      },
      "action"
    ]
  ]);

  final result = dialog.ask();

  return result["action"];
}

void main(List<String> arguments) {
  print(
    chalk.blue("As-salamu alaykum wa Ra'hmatullaahi wa Barakaatuhu!\n").bold(),
  );

  final action = askForMissingArgs();

  print(action);

  // final parser = ArgParser();
  // parser.addOption('latitude', abbr: 'l', defaultsTo: '0.0');
  // parser.addOption('longitude', abbr: 'g', defaultsTo: '0.0');
  // parser.addFlag('help', abbr: 'h', defaultsTo: false);
  // parser.addFlag('configure', abbr: 'c', defaultsTo: false);

  // if (arguments.contains('--configure')) {
  //   ConfigWizard wizard = ConfigWizard();

  //   wizard.startWizard();
  // }

  // final myCoordinates = Coordinates(23.9088, 89.1220);
  // final date = DateTime.now();
  // final params = CalculationMethod.Karachi();
  // params.madhab = Madhab.Hanafi;
  // final prayerTimes = PrayerTimes(myCoordinates, date, params);

  // print('My Prayer Times');
  // print(DateFormat.jm().format(prayerTimes.fajr!));
  // print(DateFormat.jm().format(prayerTimes.sunrise!));
  // print(DateFormat.jm().format(prayerTimes.dhuhr!));
  // print(DateFormat.jm().format(prayerTimes.asr!));
  // print(DateFormat.jm().format(prayerTimes.maghrib!));
  // print(DateFormat.jm().format(prayerTimes.isha!));
}

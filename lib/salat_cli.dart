import 'package:chalk/chalk.dart';
import 'package:args/args.dart';
import 'package:dart_inquirer/dart_inquirer.dart';
// import 'package:adhan_dart/adhan_dart.dart';
// import 'package:intl/intl.dart';
import 'Client.dart';

void greeting() {
  print("      __     ______   __     __     __     ___    __    " +
      chalk.green("     _______ __       ________"));
  print("     /  /\\  |   __  \\|   |  |   |  /  /\\  |   |\\ |   |  " +
      chalk.green("    /  ____  \\ |     |__    __|"));
  print("    /  /  \\ |  |  \\  \\   |__|   | /  /  \\ |   | \\|   |  " +
      chalk.green("   /  /    \\__||        |  |"));
  print("   /  /_\\  \\|  |   |  |         |/  /_\\  \\|   |  \\   |  " +
      chalk.green("  |  |      |  |        |  |"));
  print("  /  _____  \\  |   |  |   __    |  _____  \\   |\\  \\  |  " +
      chalk.green("  |  |      __ |        |  |"));
  print(" /  /     \\  \\ |__/  /   |  |   | /     \\  \\  | \\  \\ |  " +
      chalk.green("   \\  \\____/  ||______ _|  |__"));
  print("/__/       \\__\\____ /|__ |  |__ |/       \\__\\ |  \\__\\|  " +
      chalk.green("    \\ ______ /_______ |______ |\n"));

  print(
      chalk.green("Adhan CLI ${Client().clientVersion}\n").bold().underLine() +
          "\n");

  print(chalk
      .blue("As-salamu 'alaykum wa Ra'hmatullaahi wa Barakaatuhu!\n")
      .bold());
}

Future<String> askForMissingArgs() async {
  // final dialog = CLI_Dialog(listQuestions: [
  //   [
  //     {
  //       "question": "What you want to do?",
  //       "options": [
  //         "See today's Salah timimgs",
  //         "Configure Salah Daemon Settings",
  //         "Help",
  //         "Quit"
  //       ],
  //     },
  //     "action"
  //   ]
  // ]);

  // final result = dialog.ask();

  // return result["action"];

  List<Question> questions = [
    ListQuestion("action", "What you want to do?", [
      "See today's Salah timimgs",
      "Configure Salah Daemon Settings",
      "Help",
      "Quit"
    ])
  ];

  Prompt prompt = Prompt(questions);

  String action = (await prompt.execute())["action"];

  return action;
}

void main(List<String> arguments) async {
  greeting();

  final parser = ArgParser();
  parser.addFlag("today", abbr: "t", defaultsTo: false);
  parser.addFlag("configure", abbr: "c", defaultsTo: false);
  parser.addFlag("help", abbr: "h", defaultsTo: false);
  parser.addFlag("version", abbr: "v", defaultsTo: false);

  // print(arguments);

  Client client = Client();

  if (arguments.isEmpty) {
    final action = await askForMissingArgs();

    switch (action) {
      case "See today's Salah timimgs":
        client.today();
        break;
      case "Configure Salah Daemon Settings":
        client.configure();
        break;
      case "Help":
        client.help();
        break;
      case "Quit":
        print(chalk.blue("Allah Hafiz!\n"));
        break;
      default:
        break;
    }
  } else {
    final args = parser.parse(arguments);

    if (args["today"]) {
      client.today();
    } else if (args["configure"]) {
      client.configure();
    } else if (args["help"]) {
      client.help();
    } else if (args["version"]) {
      print(chalk.green("Adhan CLI version: 1.0.0\n"));
    }
  }

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

import 'package:args/args.dart';
import 'config_wizard.dart';

class ArgumentParser {
    final parser = ArgParser();
    parser.addOption(
      'latitude',
      abbr: 'l',
      defaultsTo: '0.0',
      help:
          'Latitude of your location, (Default: as per ~/.config/salat_cli/config.toml)',
    );
    parser.addOption(
      'longitude',
      abbr: 'g',
      defaultsTo: '0.0',
      help:
          'Longitude of your location, (Default: as per ~/.config/salat_cli/config.toml)',
    );
    parser.addOption(
      'method',
      abbr: 'm',
      help: 'Method to use for prayer times',
      allowed: [
        'MuslimWorldLeague',
        'Egyptian',
        'Karachi',
        'UmmAlQura',
        'Dubai',
        'MoonsightingCommittee',
        'NorthAmerica',
        'Kuwait',
        'Qatar',
        'Singapore',
        'Tehran',
        'Turkey',
        'Morroco',
        'Other',
      ],
      defaultsTo: 'MWL',
    );
    parser.addFlag(
      'help',
      abbr: 'h',
      defaultsTo: false,
      help: 'Show this help text',
    );
    parser.addFlag(
      'configure',
      abbr: 'c',
      defaultsTo: false,
      help: 'Edit the configuration file interactively',
    );

    if (arguments.contains('--configure')) {
      startWizard();
    }
    if (arguments.contains('--help')) {
      print(parser.usage);
      return;
    }}
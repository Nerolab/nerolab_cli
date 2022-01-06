import 'package:args/args.dart';
import 'package:args/command_runner.dart';
import 'package:mason/mason.dart';
import 'package:flutter_nerolab_cli/src/version.dart';

import 'commands/commands.dart';

/// {@template nerolab_command_runner}
/// A [CommandRunner] for the Nerolab CLI.
/// {@endtemplate}
class NerolabCommandRunner extends CommandRunner<int> {
  /// {@macro nerolab_command_runner}
  NerolabCommandRunner({Logger? logger})
      : _logger = logger ?? Logger(),
        super('🐦 nerolab', ' Flutter starter project Command Line Interface') {
    argParser.addFlag(
      'version',
      negatable: false,
      help: 'Print the current version.',
    );
    addCommand(CreateCommand(logger: logger));
  }

  /// Standard timeout duration for the CLI.
  static const timeout = Duration(milliseconds: 500);

  final Logger _logger;

  @override
  Future<int> run(Iterable<String> args) async {
    try {
      /*if (_analytics.firstRun) {
        final response = _logger.prompt(lightGray.wrap(
'''+---------------------------------------------------+
|           Welcome to the Nerolab CLI!           |
+---------------------------------------------------+
| We would like to collect anonymous                |
| usage statistics in order to improve the tool.    |
| Would you like to opt-into help us improve? [y/n] |
+---------------------------------------------------+\n''',
        ));
        final normalizedResponse = response.toLowerCase().trim();
        _analytics.enabled =
            normalizedResponse == 'y' || normalizedResponse == 'yes';
      }*/
      final _argResults = parse(args);
      return await runCommand(_argResults) ?? ExitCode.success.code;
    } on FormatException catch (e, stackTrace) {
      _logger
        ..err(e.message)
        ..err('$stackTrace')
        ..info('')
        ..info(usage);
      return ExitCode.usage.code;
    } on UsageException catch (e) {
      _logger
        ..err(e.message)
        ..info('')
        ..info(usage);
      return ExitCode.usage.code;
    }
  }

  @override
  Future<int?> runCommand(ArgResults topLevelResults) async {
    if (topLevelResults['version'] == true) {
      _logger.info('nerolab version: $packageVersion');
      return ExitCode.success.code;
    }
    /*if (topLevelResults['analytics'] != null) {
      final optIn = topLevelResults['analytics'] == 'true' ? true : false;
      _analytics.enabled = optIn;
      _logger.info('analytics ${_analytics.enabled ? 'enabled' : 'disabled'}.');
      return ExitCode.success.code;
    }*/
    return super.runCommand(topLevelResults);
  }
}

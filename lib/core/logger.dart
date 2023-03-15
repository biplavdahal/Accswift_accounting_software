import 'package:logger/logger.dart';

mixin CustomLogger<T> {
  final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 3,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      printTime: true,
    ),
  );

  void info(message) {
    _logger.i('[$T]: $message');
  }

  void problem(message) {
    _logger.e('[$T]: $message');
  }

  void debug(message) {
    _logger.d('[$T]: $message');
  }

  void warning(message) {
    _logger.w('[$T]: $message');
  }

  void verbose(message) {
    _logger.v('[$T]: $message');
  }

  void wtf(message) {
    _logger.wtf('[$T]: $message');
  }
}

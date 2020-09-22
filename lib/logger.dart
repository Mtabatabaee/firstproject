import 'package:get/get.dart';
import 'package:logger/logger.dart';

Logger getLogger(RxString className) {
  return Logger(printer: SimpleLogPrinter(className));
}

class SimpleLogPrinter extends LogPrinter {
  final RxString className;
  SimpleLogPrinter(this.className);

  @override
  List<String> log(LogEvent event) {
    AnsiColor color = PrettyPrinter.levelColors[event.level];
    String emoji = PrettyPrinter.levelEmojis[event.level];
    return [color('$emoji [$className]: ${event.message}')];
  }
}
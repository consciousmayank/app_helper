import 'package:intl/intl.dart';

class StringToDateTimeConverter {
  StringToDateTimeConverter.ddmmyy({
    required this.date,
  }) {
    format = 'dd-MM-yyyy';
  }

  StringToDateTimeConverter.yyyymmdd({
    required this.date,
  }) {
    format = 'yyyy-MM-dd';
  }

  StringToDateTimeConverter.ddmmyyhhmm({
    required this.date,
  }) {
    format = 'dd-MM-yyyy hh:mm';
  }

  StringToDateTimeConverter.ddmmyyhhmmss({
    required this.date,
  }) {
    format = 'dd-MM-yyyy hh:mm:ss';
  }

  StringToDateTimeConverter.ddmmyyhhmmss24Hr({
    required this.date,
  }) {
    format = 'dd-MM-yyyy H:m:ss';
  }

  StringToDateTimeConverter.ddmmyyhhmmssaa({
    required this.date,
  }) {
    format = 'dd-MM-yyyy hh:mm:ss aa';
  }

  StringToDateTimeConverter.otpTimer({
    required this.date,
  }) {
    format = 'hh:mm';
  }

  final String date;
  late String format;

  DateTime convert() {
    return DateTime.parse(
      DateFormat(format, "en_US").parse(date).toString(),
    );
  }
}

class DateTimeToStringConverter {
  DateTimeToStringConverter.MMddyyyy({
    required this.date,
  }) {
    format = 'MMM dd, yyyy';
  }

  DateTimeToStringConverter.dd({
    required this.date,
  }) {
    format = 'dd';
  }

  DateTimeToStringConverter.MMMMyyyy({
    required this.date,
  }) {
    format = 'MMMM-yyyy';
  }

  DateTimeToStringConverter.ddMMMMyy({
    required this.date,
  }) {
    format = 'dd-MMMM-yy';
  }

  DateTimeToStringConverter.ddMMMMyyyy({
    required this.date,
  }) {
    format = 'dd-MMMM-yyyy';
  }

  DateTimeToStringConverter.ddMMMMyyyyhhmmssaa({
    required this.date,
  }) {
    format = 'dd-MM-yyyy, hh:mm aa';
  }

  DateTimeToStringConverter.ddMMMyy({
    required this.date,
  }) {
    format = 'dd/MMM/yy';
  }

  DateTimeToStringConverter.ddmmmyy({
    required this.date,
  }) {
    format = 'dd';
  }

  DateTimeToStringConverter.ddmmyy({
    required this.date,
  }) {
    format = 'dd/MM/yyyy';
  }

  DateTimeToStringConverter.ddmmyyWithHyphen({
    required this.date,
  }) {
    format = 'dd-MM-yyyy';
  }

  DateTimeToStringConverter.ddmmyy24Hrs({
    required this.date,
  }) {
    format = 'dd-MM-yyyy H:m:ss';
  }

  DateTimeToStringConverter.ddmmyyhhmm({
    required this.date,
  }) {
    format = 'dd-MM-yyyy hh:mm';
  }

  DateTimeToStringConverter.ddmmyyhhmmss({
    required this.date,
  }) {
    format = 'dd-MM-yyyy hh:mm:ss';
  }

  DateTimeToStringConverter.ddmmyyhhmmssaa({
    required this.date,
  }) {
    format = 'dd-MM-yyyy hh:mm:ss aa';
  }

  DateTimeToStringConverter.ddmmyyhhmmssaaNewLine({
    required this.date,
  }) {
    format = 'dd/MM/yyyy hh:mm aa';
  }

  DateTimeToStringConverter.hhmmssaaMenuTimings({
    required this.date,
  }) {
    format = 'hh:mm aa';
  }

  DateTimeToStringConverter.hhmmssaa({
    required this.date,
  }) {
    format = 'hh:mm';
  }

  DateTimeToStringConverter.otpTimer({
    required this.date,
  }) {
    format = 'mm:ss';
  }

  DateTimeToStringConverter.yyyy({
    required this.date,
  }) {
    format = 'yyyy';
  }

  DateTimeToStringConverter.yyyymmdd({
    required this.date,
  }) {
    format = 'yyyy-MM-dd';
  }

  final DateTime date;
  late String format;

  String convert() {
    // DateFormat.Hm();
    return DateFormat(format).format(date);
  }
}

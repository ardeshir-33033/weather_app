import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

extension TranslationHelperStateless on StatelessWidget {
  AppLocalizations tr(BuildContext context) {
    return AppLocalizations.of(context)!;
  }
}

extension TranslationHelperStateful<T extends StatefulWidget> on State<T> {
  AppLocalizations tr(BuildContext context) {
    return AppLocalizations.of(context)!;
  }
}

extension AppThemeHelper on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  Brightness get brightness => theme.brightness;
  ColorScheme get colorScheme => theme.colorScheme;
}

extension StringEx on String {
  String toDatetime() {
    return DateFormat('MMMM dd yyyy – hh:mm a')
        .format(DateTime.fromMillisecondsSinceEpoch(int.parse(this)));
  }

  String toDate() {
    return DateFormat('MMMM dd yyyy')
        .format(DateTime.fromMillisecondsSinceEpoch(int.parse(this)));
  }
}

extension DateTimeEx on DateTime {
  String toDatetimeFromDate() {
    return DateFormat('MM/dd/yyyy').format(this);
  }
}

extension IntEx on int {
  String moneyFormatter() {
    return NumberFormat.decimalPattern('fa').format(this);
  }
}

extension BuildContextHelper on BuildContext {
  double get screenWidth {
    return MediaQuery.sizeOf(this).width;
  }

  double get screenHeight {
    return MediaQuery.sizeOf(this).height;
  }

  double heightPercentage(double percentage) {
    return MediaQuery.sizeOf(this).height * (percentage / 100);
  }

  double widthPercentage(double percentage) {
    return MediaQuery.sizeOf(this).width * (percentage / 100);
  }
}

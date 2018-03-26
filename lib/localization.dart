import 'dart:async';

import 'package:flutter/material.dart';

class AppLocalizations {
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String get appTitle => 'Smart Calendar Copy App';

  String get addEvent => 'Add Event';
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  @override
  bool isSupported(Locale locale) {
    return locale.languageCode.toLowerCase().contains('en');
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return new Future(() => new AppLocalizations());
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}

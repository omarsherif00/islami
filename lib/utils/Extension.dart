import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension Extensions on BuildContext {
  AppLocalizations get applocalization => AppLocalizations.of(this)!;
}

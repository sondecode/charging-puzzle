import 'package:flutter/widgets.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String transFact(BuildContext context, int level) {
  switch (level) {
    case 1:
      return AppLocalizations.of(context)!.fact1;

    case 2:
      return AppLocalizations.of(context)!.fact2;

    case 3:
      return AppLocalizations.of(context)!.fact3;

    case 4:
      return AppLocalizations.of(context)!.fact4;

    case 5:
      return AppLocalizations.of(context)!.fact5;

    case 6:
      return AppLocalizations.of(context)!.fact6;

    case 7:
      return AppLocalizations.of(context)!.fact7;

    case 8:
      return AppLocalizations.of(context)!.fact8;

    case 9:
      return AppLocalizations.of(context)!.fact9;

    case 10:
      return AppLocalizations.of(context)!.fact10;

    default:
      return "fact";
    // Handle cases where widget.level.number is not between 1 and 10
  }
}

String transNameLevel(BuildContext context, int level) {
  switch (level) {
    case 1:
      return AppLocalizations.of(context)!.name1;

    case 2:
      return AppLocalizations.of(context)!.name2;
    case 3:
      return AppLocalizations.of(context)!.name3;

    case 4:
      return AppLocalizations.of(context)!.name4;

    case 5:
      return AppLocalizations.of(context)!.name5;

    case 6:
      return AppLocalizations.of(context)!.name6;

    case 7:
      return AppLocalizations.of(context)!.name7;

    case 8:
      return AppLocalizations.of(context)!.name8;

    case 9:
      return AppLocalizations.of(context)!.name9;

    case 10:
      return AppLocalizations.of(context)!.name10;

    default:
      return "Play";
    // Handle cases where widget.level.number is not between 1 and 10
  }
}

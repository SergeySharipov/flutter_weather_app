import 'package:flutter/cupertino.dart';

import 'app_localizations.dart';

class DegreeConverter {
  static String degreeToCardinalDirection(
      BuildContext context, int directionInDegrees) {
    final directions = AppLocalizations.of(context).translate("directions").split(" ");
    return directions[(directionInDegrees / 45).round() % 8];
  }
}

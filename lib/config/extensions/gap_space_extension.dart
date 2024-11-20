import 'package:flutter/material.dart';

extension EmptySpaceExtention on double {
  SizedBox get verticalSpace => SizedBox(
        height: toDouble(),
      );
  SizedBox get horizontalSpace => SizedBox(
        width: toDouble(),
      );
}


import 'package:flutter/material.dart';

import '../../common/constants.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(message, style: kHeading6.copyWith(color: kBlueViolet)));
  }
}

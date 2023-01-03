import 'package:al_quran_app/common/constants.dart';
import 'package:flutter/material.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Bookmark Page",
          style: kHeading6.copyWith(color: kBlueViolet),
        ),
      ),
    );
  }
}

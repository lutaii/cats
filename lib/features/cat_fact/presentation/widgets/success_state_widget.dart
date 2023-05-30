import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../../../../utils/date_formetter.dart';
import '../../../../utils/palette.dart';

class SuccessStateWidget extends StatelessWidget {
  const SuccessStateWidget({
    Key? key,
    required this.catFact,
    required this.dateTime,
    required this.imageBytes,
  }) : super(key: key);

  final String catFact;
  final Uint8List imageBytes;
  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 4,
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.memory(
                imageBytes,
                width: MediaQuery.of(context).size.width - 40,
                height: MediaQuery.of(context).size.width - 40,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Palette.backGroundColor,
            child: Center(
                child: Text(
              DateFormatter.formatDateTimeToLocaleString(dateTime, context),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Color(0xFF0E0C57),
              ),
            )),
          ),
        ),
        Expanded(
          flex: 4,
          child: Scrollbar(
            child: SingleChildScrollView(
              child: Text(
                catFact,
                style: const TextStyle(
                    fontSize: 25,
                    color: Palette.textColor,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

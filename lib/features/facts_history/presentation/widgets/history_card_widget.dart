import 'package:cats/utils/palette.dart';
import 'package:flutter/material.dart';

import '../../../../utils/date_formetter.dart';
import '../../domain/models/cat_history_model.dart';

class HistoryCardWidget extends StatelessWidget {
  const HistoryCardWidget({
    Key? key,
    required this.catHistory,
  }) : super(key: key);

  final CatHistoryModel catHistory;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Palette.cardColor,
      child: ListTile(
        contentPadding: const EdgeInsets.all(10.0),
        textColor: Palette.textColor,
        title: Text(
          catHistory.fact,
          style: const TextStyle(fontSize: 17),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Opacity(
              opacity: 0.6,
              child: Text(
                DateFormatter.formatDateTimeToLocaleString(
                    catHistory.dateTime, context),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

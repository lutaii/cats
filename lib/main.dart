import 'package:cats/features/cat_fact/presentation/screen/home_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'features/facts_history/domain/models/cat_history_model.dart';
import 'utils/palette.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(CatHistoryModelAdapter());
  await Hive.openBox<CatHistoryModel>('catHistoryBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              fontSize: 25,
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.w600,
              color: Palette.actionColor,
            ),
          ),
          fontFamily: 'Quicksand',
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: Palette.actionColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
            ),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Palette.actionColor,
              textStyle: const TextStyle(
                fontSize: 25,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.w600,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          )),
      home: const HomeScreenWidget(),
    );
  }
}

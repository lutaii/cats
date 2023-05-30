import 'package:cats/features/cat_fact/presentation/cubit/cat_fact_states.dart';
import 'package:cats/features/cat_fact/presentation/widgets/success_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../../../../utils/palette.dart';
import '../../../facts_history/presentation/screen/facts_history_screen_widget.dart';
import '../cubit/cat_fact_cubit.dart';
import '../widgets/error_state_widget.dart';
import '../widgets/loading_state_widget.dart';

class HomeScreenWidget extends StatelessWidget {
  const HomeScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting(Localizations.localeOf(context).languageCode);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.backGroundColor,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const FactsHistoryScreenWidget()),
              );
            },
            child: Hero(
              tag: 'fact-history',
              child: Text(
                'Fact History',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: Palette.actionColor),
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.only(right: 10))
        ],
        elevation: 0,
      ),
      body: BlocProvider(
        create: (context) => CatCubit()..fetchCatData(),
        child: Column(
          children: [
            Expanded(
              flex: 12,
              child: Container(
                color: Palette.backGroundColor,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: BlocBuilder<CatCubit, CatState>(
                        builder: (context, state) {
                      if (state is CatLoading) {
                        return const LoadingStateWidget();
                      } else if (state is CatLoaded) {
                        return SuccessStateWidget(
                          catFact: state.catFact,
                          dateTime: DateTime.now(),
                          imageBytes: state.catImage,
                        );
                      } else if (state is CatError) {
                        return const ErrorStateWidget();
                      } else {
                        return Container();
                      }
                    }),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: Palette.backGroundColor,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 40.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 40,
                      height: MediaQuery.of(context).size.height / 5 - 110,
                      child: Builder(
                        builder: (context) {
                          return OutlinedButton(
                            onPressed:
                                BlocProvider.of<CatCubit>(context).fetchCatData,
                            child: const Text(
                              'Another fact!',
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

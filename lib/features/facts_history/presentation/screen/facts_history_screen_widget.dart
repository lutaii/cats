import 'package:cats/features/facts_history/presentation/cubit/history_states.dart';
import 'package:cats/utils/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/facts_history_cubit.dart';
import '../widgets/history_card_widget.dart';

class FactsHistoryScreenWidget extends StatelessWidget {
  const FactsHistoryScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.backGroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Palette.actionColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Hero(
            tag: 'fact-history',
            child: Text(
              'Fact History',
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: Palette.actionColor),
            )),
      ),
      body: Container(
        color: Palette.backGroundColor,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: BlocProvider(
          create: (context) => FactsHistoryCubit()..fetchHistory(),
          child: BlocBuilder<FactsHistoryCubit, HistoryState>(
              builder: (context, state) {
            if (state is HistoryInitial) {
              return const Center(child: Text('History is empty'));
            } else if (state is HistoryLoaded) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                  itemCount: state.items.length,
                  itemBuilder: (context, index) {
                    final catHistory = state.items[index];
                    return HistoryCardWidget(catHistory: catHistory);
                  },
                ),
              );
            } else {
              return Container();
            }
          }),
        ),
      ),
    );
  }
}

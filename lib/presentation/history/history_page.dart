import 'package:flutter/material.dart';

import '../../core/styles.dart';
import '../widgets/history_card/finished_history_card.dart';
import '../widgets/history_card/on_process_history_card.dart';
import '../widgets/history_card/rejected_history_card.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              labelStyle: primaryTextStyle.copyWith(
                  fontSize: 16.0, fontWeight: semiBold),
              unselectedLabelStyle: subtitleTextStyle.copyWith(
                  fontSize: 16.0, fontWeight: regular),
              tabs: [
                Tab(
                  text: 'Waiting',
                ),
                Tab(
                  text: 'On Process',
                ),
                Tab(
                  text: 'Finished',
                ),
                Tab(
                  text: 'Rejected',
                ),
              ],
            ),
            title: const Text('History'),
          ),
          body: TabBarView(
            children: <Widget>[
              // Waiting TAB
              ListView(
                children: <Widget>[
                  // Add multiple instances of OnProcessHistoryCard() here
                  OnProcessHistoryCard(),
                  OnProcessHistoryCard(),
                  OnProcessHistoryCard(),
                  OnProcessHistoryCard(),
                  OnProcessHistoryCard(),
                  // Add more OnProcessHistoryCard() widgets as needed
                ],
              ),

// ======================

              ListView(
                children: <Widget>[
                  // Add multiple instances of OnProcessHistoryCard() here
                  OnProcessHistoryCard(),
                  OnProcessHistoryCard(),
                  OnProcessHistoryCard(),
                  OnProcessHistoryCard(),
                  OnProcessHistoryCard(),
                  // Add more OnProcessHistoryCard() widgets as needed
                ],
              ),
              ListView(
                children: <Widget>[
                  // Add multiple instances of FinishedHistoryCard() here
                  FinishedHistoryCard(),
                  FinishedHistoryCard(),
                  FinishedHistoryCard(),
                  FinishedHistoryCard(),
                  FinishedHistoryCard(),
                  // Add more FinishedHistoryCard() widgets as needed
                ],
              ),
              ListView(
                children: <Widget>[
                  // Add multiple instances of RejectedHistoryCard() here
                  RejectedHistoryCard(),
                  RejectedHistoryCard(),
                  RejectedHistoryCard(),
                  RejectedHistoryCard(),
                  RejectedHistoryCard(),
                  // Add more RejectedHistoryCard() widgets as needed
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

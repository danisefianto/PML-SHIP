import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/core.dart';
import '../../core/styles.dart';
import 'bloc/history/history_bloc.dart';
import 'order_detail_page.dart';

// TODO: Create API for every status
// TODO: pisahkan menjadi widget sendiri-sendiri
class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  void initState() {
    context.read<HistoryBloc>().add(const HistoryEvent.getHistory());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                labelStyle: primaryTextStyle.copyWith(
                    fontSize: 16.0, fontWeight: semiBold),
                unselectedLabelStyle: subtitleTextStyle.copyWith(
                    fontSize: 16.0, fontWeight: regular),
                tabs: const [
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

                // Add multiple instances of OnProcessHistoryCard() here
                BlocBuilder<HistoryBloc, HistoryState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () {
                        return const Center(child: Text('Error'));
                      },
                      loading: () {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                      success: (historyResponse) {
                        return ListView.separated(
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 4),
                          itemCount: historyResponse.data!.length,
                          itemBuilder: (context, index) {
                            return Visibility(
                              visible: historyResponse.data![index].status ==
                                  'order_pending',
                              // replacement: Text('No data'), //Output sebanyak data yang ada, inginnya 1 kali saja
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 12),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(historyResponse
                                              .data![index].createdAt!
                                              .toFormattedIndonesianShortDateAndUTC7Time()),
                                          Text(historyResponse
                                              .data![index].transactionId
                                              .toString()),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        border: Border.all(),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      margin: const EdgeInsets.all(10),
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(historyResponse
                                              .data![index].shipperName
                                              .toString()),
                                          Text(
                                              '${historyResponse.data![index].portOfLoading!.name.toString()} - ${historyResponse.data![0].portOfDischarge!.name.toString()}'),
                                          Text(
                                              '${historyResponse.data![index].cargoDescription.toString()} ${historyResponse.data![0].cargoWeight.toString()}')
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextButton(
                                            style: TextButton.styleFrom(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 24.0,
                                                vertical: 10.0,
                                              ),
                                              backgroundColor: secondaryColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  25.0,
                                                ),
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      OrderDetailPage(
                                                    transactionIdMessage:
                                                        historyResponse
                                                            .data![index]
                                                            .transactionId
                                                            .toString(),
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Text(
                                              'Order Detail',
                                              style: primaryTextStyle.copyWith(
                                                fontWeight: medium,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                          ),
                                          TextButton(
                                            style: TextButton.styleFrom(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 24.0,
                                                vertical: 10.0,
                                              ),
                                              backgroundColor: secondaryColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  25.0,
                                                ),
                                              ),
                                            ),
                                            onPressed: () {},
                                            child: Text(
                                              'Track Vessel',
                                              style: primaryTextStyle.copyWith(
                                                fontWeight: medium,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
                // OnProcessHistoryCard(),
                // OnProcessHistoryCard(),
                // OnProcessHistoryCard(),
                // OnProcessHistoryCard(),
                // OnProcessHistoryCard(),
                // Add more OnProcessHistoryCard() widgets as needed

                // ======================
                BlocBuilder<HistoryBloc, HistoryState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () {
                        return const Center(child: Text('Error'));
                      },
                      loading: () {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                      success: (historyResponse) {
                        return ListView.separated(
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 4),
                          itemCount: historyResponse.data!.length,
                          itemBuilder: (context, index) {
                            return Visibility(
                              visible: historyResponse.data![index].status ==
                                  'on_shipping',
                              // replacement: Text('No data'), //Output sebanyak data yang ada, inginnya 1 kali saja
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 12),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: Column(
                                  mainAxisSize: MainAxisSize
                                      .min, // Set mainAxisSize to min
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              '${historyResponse.data![index].createdAt?.toFormattedIndonesianShortDateAndUTC7Time()}'),
                                          Text(historyResponse
                                              .data![index].transactionId
                                              .toString()),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        border: Border.all(),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      margin: const EdgeInsets.all(10),
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(historyResponse
                                              .data![index].shipperName
                                              .toString()),
                                          Text(
                                              '${historyResponse.data![index].portOfLoading!.name.toString()} - ${historyResponse.data![0].portOfDischarge!.name.toString()}'),
                                          Text(
                                              '${historyResponse.data![index].cargoDescription.toString()} ${historyResponse.data![0].cargoWeight.toString()}')
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextButton(
                                            style: TextButton.styleFrom(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 24.0,
                                                vertical: 10.0,
                                              ),
                                              backgroundColor: secondaryColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  25.0,
                                                ),
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      OrderDetailPage(
                                                    transactionIdMessage:
                                                        historyResponse
                                                            .data![index]
                                                            .transactionId
                                                            .toString(),
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Text(
                                              'Order Detail',
                                              style: primaryTextStyle.copyWith(
                                                fontWeight: medium,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                          ),
                                          TextButton(
                                            style: TextButton.styleFrom(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 24.0,
                                                vertical: 10.0,
                                              ),
                                              backgroundColor: secondaryColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  25.0,
                                                ),
                                              ),
                                            ),
                                            onPressed: () {},
                                            child: Text(
                                              'Track Vessel',
                                              style: primaryTextStyle.copyWith(
                                                fontWeight: medium,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
                BlocBuilder<HistoryBloc, HistoryState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () {
                        return const Center(child: Text('Error'));
                      },
                      loading: () {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                      success: (historyResponse) {
                        return ListView.separated(
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 4),
                          itemCount: historyResponse.data!.length,
                          itemBuilder: (context, index) {
                            return Visibility(
                              visible: historyResponse.data![index].status ==
                                  'order_completed',
                              // replacement: Text('No data'), //Output sebanyak data yang ada, inginnya 1 kali saja
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 12),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: Column(
                                  mainAxisSize: MainAxisSize
                                      .min, // Set mainAxisSize to min
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              '${historyResponse.data![index].createdAt?.toFormattedIndonesianShortDateAndUTC7Time()}'),
                                          Text(historyResponse
                                              .data![index].transactionId
                                              .toString()),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        border: Border.all(),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      margin: const EdgeInsets.all(10),
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(historyResponse
                                              .data![index].shipperName
                                              .toString()),
                                          Text(
                                              '${historyResponse.data![index].portOfLoading?.name.toString()}-${historyResponse.data![index].portOfDischarge?.name.toString()}'),
                                          Text(
                                              '${historyResponse.data![index].cargoDescription.toString()} ${historyResponse.data![index].cargoWeight.toString()}')
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          TextButton(
                                            style: TextButton.styleFrom(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 24.0,
                                                vertical: 10.0,
                                              ),
                                              backgroundColor: secondaryColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  25.0,
                                                ),
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      OrderDetailPage(
                                                    transactionIdMessage:
                                                        historyResponse
                                                            .data![index]
                                                            .transactionId
                                                            .toString(),
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Text(
                                              'Order Detail',
                                              style: primaryTextStyle.copyWith(
                                                fontWeight: medium,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
                // ListView(
                // children: const <Widget>[
                // Add multiple instances of FinishedHistoryCard() here
                // FinishedHistoryCard(),
                // FinishedHistoryCard(),
                // FinishedHistoryCard(),
                // FinishedHistoryCard(),
                // FinishedHistoryCard(),
                // Add more FinishedHistoryCard() widgets as needed
                // ],
                // ),
                BlocBuilder<HistoryBloc, HistoryState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () {
                        return const Center(child: Text('Error'));
                      },
                      loading: () {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                      success: (historyResponse) {
                        return ListView.separated(
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 4),
                          itemCount: historyResponse.data!.length,
                          itemBuilder: (context, index) {
                            return Visibility(
                              visible: historyResponse.data![index].status ==
                                  'order_canceled',
                              // replacement: Text('No data'), //Output sebanyak data yang ada, inginnya 1 kali saja
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 12),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: Column(
                                  mainAxisSize: MainAxisSize
                                      .min, // Set mainAxisSize to min
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(historyResponse
                                              .data![index].createdAt!
                                              .toFormattedIndonesianShortDateAndUTC7Time()),
                                          Text(historyResponse
                                              .data![index].transactionId
                                              .toString()),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        border: Border.all(),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      margin: const EdgeInsets.all(10),
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(historyResponse
                                              .data![index].shipperName
                                              .toString()),
                                          Text(
                                              '${historyResponse.data![index].portOfLoading!.name.toString()} - ${historyResponse.data![0].portOfDischarge!.name.toString()}'),
                                          Text(
                                              '${historyResponse.data![index].cargoDescription.toString()} ${historyResponse.data![0].cargoWeight.toString()}')
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          TextButton(
                                            style: TextButton.styleFrom(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 24.0,
                                                vertical: 10.0,
                                              ),
                                              backgroundColor: secondaryColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  25.0,
                                                ),
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      OrderDetailPage(
                                                    transactionIdMessage:
                                                        historyResponse
                                                            .data![index]
                                                            .transactionId
                                                            .toString(),
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Text(
                                              'Order Detail',
                                              style: primaryTextStyle.copyWith(
                                                fontWeight: medium,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
                // ListView(
                //   children: const <Widget>[
                //     // Add multiple instances of RejectedHistoryCard() here
                //     RejectedHistoryCard(),
                // RejectedHistoryCard(),
                //     RejectedHistoryCard(),
                //     RejectedHistoryCard(),
                //     RejectedHistoryCard(),
                //     // Add more RejectedHistoryCard() widgets as needed
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.dart';
import '../../../core/styles.dart';

import '../../bloc/history/canceledOrdersData/canceled_orders_data_bloc.dart';
import '../../bloc/history/completedOrdersData/completed_orders_data_bloc.dart';
import '../../bloc/history/onShippingOrdersData/on_shipping_orders_data_bloc.dart';
import '../../bloc/history/paymentPendingOrdersData/payment_pending_orders_data_bloc.dart';
import '../../bloc/history/pendingOrdersData/pending_orders_data_bloc.dart';
import '../../bloc/history/rejectedOrdersData/rejected_orders_data_bloc.dart';
import 'order_detail_page.dart';
import '../../../data/models/response/history_response_model.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage>
    with SingleTickerProviderStateMixin {
  static const List<Tab> historyTabs = <Tab>[
    Tab(
      text: 'Pending',
    ),
    Tab(
      text: 'Payment Pending',
    ),
    Tab(
      text: 'On Shipping',
    ),
    Tab(
      text: 'Completed',
    ),
    Tab(
      text: 'Rejected',
    ),
    Tab(
      text: 'Canceled',
    )
  ];
  late TabController _tabController;

  void getAllPendingOrders() {
    context.read<PendingOrdersDataBloc>().add(
          const PendingOrdersDataEvent.getAllPendingOrders(),
        );
  }

  void getAllPaymentPendingOrders() {
    context.read<PaymentPendingOrdersDataBloc>().add(
          const PaymentPendingOrdersDataEvent.getAllPaymentPendingOrders(),
        );
  }

  void getAllOnShippingOrders() {
    context.read<OnShippingOrdersDataBloc>().add(
          const OnShippingOrdersDataEvent.getAllOnShippingOrders(),
        );
  }

  void getAllCompletedOrders() {
    context.read<CompletedOrdersDataBloc>().add(
          const CompletedOrdersDataEvent.getAllCompletedOrders(),
        );
  }

  void getRejectedOrders() {
    context.read<RejectedOrdersDataBloc>().add(
          const RejectedOrdersDataEvent.getAllRejectedOrders(),
        );
  }

  void getCanceledOrders() {
    context.read<CanceledOrdersDataBloc>().add(
          const CanceledOrdersDataEvent.getAllCanceledOrders(),
        );
  }

  @override
  void initState() {
    super.initState();
    // Trigger the initial data load for the first tab.
    // Adjust this to load data for all tabs or a specific tab based on your app's needs.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getAllPendingOrders();
    });
    _tabController = TabController(vsync: this, length: historyTabs.length);
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        fetchDataForCurrentTab();
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void fetchDataForCurrentTab() {
    // Dispatch an event to the Bloc based on the current tab index
    switch (_tabController.index) {
      case 0:
        getAllPendingOrders();
        break;
      case 1:
        getAllPaymentPendingOrders();
        break;
      case 2:
        getAllOnShippingOrders();
        break;
      case 3:
        getAllCompletedOrders();
        break;
      case 4:
        getRejectedOrders();
        break;
      case 5:
        getCanceledOrders();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            labelStyle: primaryTextStyle.copyWith(
              fontSize: 16.0,
              fontWeight: semiBold,
            ),
            unselectedLabelStyle: subtitleTextStyle.copyWith(
              fontSize: 16.0,
              fontWeight: regular,
            ),
            onTap: (index) {
              if (index == 0) {
                getAllPendingOrders();
              } else if (index == 1) {
                getAllPaymentPendingOrders();
              } else if (index == 2) {
                getAllOnShippingOrders();
              } else if (index == 3) {
                getAllCompletedOrders();
              } else if (index == 4) {
                getRejectedOrders();
              } else {
                getCanceledOrders();
              }
            },
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            tabs: historyTabs,
            controller: _tabController,
          ),
          title: const Text('History'),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            buildOrderDataTab<PendingOrdersDataBloc, PendingOrdersDataState>(
              context.read<PendingOrdersDataBloc>(),
            ),

            buildOrderDataTab<PaymentPendingOrdersDataBloc,
                PaymentPendingOrdersDataState>(
              context.read<PaymentPendingOrdersDataBloc>(),
            ),

            buildOrderDataTab<OnShippingOrdersDataBloc,
                OnShippingOrdersDataState>(
              context.read<OnShippingOrdersDataBloc>(),
            ),
            buildOrderDataTab<CompletedOrdersDataBloc,
                CompletedOrdersDataState>(
              context.read<CompletedOrdersDataBloc>(),
            ),
            buildOrderDataTab<RejectedOrdersDataBloc, RejectedOrdersDataState>(
              context.read<RejectedOrdersDataBloc>(),
            ),
            buildOrderDataTab<CanceledOrdersDataBloc, CanceledOrdersDataState>(
              context.read<CanceledOrdersDataBloc>(),
            ),
            // Text('Payment Pending'),
            // Text('On Shipping'),
            // Text('Completed'),
            // Text('Rejected'),
            // Text('Canceled'),
          ],
        ),
      ),
    );
  }
}

// BlocBuilder<PendingOrdersDataBloc, PendingOrdersDataState> buildOrderDataTab()
Widget buildOrderDataTab<BlocType extends BlocBase<StateType>, StateType>(
  BlocType bloc,
) {
  return BlocBuilder<BlocType, StateType>(
    builder: (context, state) {
      return (state as dynamic).maybeWhen(
        orElse: () {
          return const Center(child: Text('Error'));
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        success: (historyResponse) {
          if (historyResponse.data.isEmpty) {
            return const Center(child: Text('No Data Available'));
          }
          return buildOrderDataItem(historyResponse);
        },
      );
    },
  );
}

ListView buildOrderDataItem(HistoryResponseModel response) {
  return ListView.separated(
    separatorBuilder: (context, index) => const SizedBox(height: 4),
    itemCount: response.data.length,
    itemBuilder: (context, index) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(5.0)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(response.data[index].createdAt.toIso8601String()),
                  Text(response.data[index].transactionId.toString()),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(5.0),
              ),
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(response.data[index].shipperName.toString()),
                  Text(
                      '${response.data[index].portOfLoadingName.toString()} - ${response.data[0].portOfDischargeName.toString()}'),
                  Text(
                      '${response.data[index].cargoDescription.toString()} ${response.data[0].cargoWeight.toString()}')
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Button.filled(
                    fontSize: 12,
                    width: 150,
                    onPressed: () {
                      // TODO: Add better condition if negotiation is not approved
                      // Example: if negotiation is not approved, go to Detail Page but show that negotiation is not approved
                      if (response.data[index].negotiationApprovedAt == null) {
                        // Show snackbar
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Negotiation is not approved yet'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OrderDetailPage(
                              transactionIdMessage:
                                  response.data[index].transactionId.toString(),
                            ),
                          ),
                        );
                      }
                    },
                    label: 'Order Detail',
                  ),
                  //  If historyResponse.data![index].status == 'on_shipping', show Track Vessel button
                  // Visibility(
                  //   visible: response.data[index].status == 'on_shipping',
                  //   child: Button.filled(
                  //     width: 150,
                  //     onPressed: () {},
                  //     label: 'Track Vessel',
                  //   ),
                  // )
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}

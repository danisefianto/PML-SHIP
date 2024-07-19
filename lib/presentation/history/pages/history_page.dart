import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/history_order/history_order_bloc.dart';
import '../widgets/order_data_card.dart';

import '../../../core/styles.dart';

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
    context.read<HistoryOrderBloc>().add(
          const HistoryOrderEvent.getAllPendingOrders(),
        );
  }

  void getAllPaymentPendingOrders() {
    context.read<HistoryOrderBloc>().add(
          const HistoryOrderEvent.getAllPaymentPendingOrders(),
        );
  }

  void getAllOnShippingOrders() {
    context.read<HistoryOrderBloc>().add(
          const HistoryOrderEvent.getAllOnShippingOrders(),
        );
  }

  void getAllCompletedOrders() {
    context.read<HistoryOrderBloc>().add(
          const HistoryOrderEvent.getAllCompletedOrders(),
        );
  }

  void getRejectedOrders() {
    context.read<HistoryOrderBloc>().add(
          const HistoryOrderEvent.getAllRejectedOrders(),
        );
  }

  void getCanceledOrders() {
    context.read<HistoryOrderBloc>().add(
          const HistoryOrderEvent.getAllCanceledOrders(),
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
            buildOrderDataTab<HistoryOrderBloc, HistoryOrderState>(
              context.read<HistoryOrderBloc>(),
            ),
            buildOrderDataTab<HistoryOrderBloc, HistoryOrderState>(
              context.read<HistoryOrderBloc>(),
            ),
            buildOrderDataTab<HistoryOrderBloc, HistoryOrderState>(
              context.read<HistoryOrderBloc>(),
            ),
            buildOrderDataTab<HistoryOrderBloc, HistoryOrderState>(
              context.read<HistoryOrderBloc>(),
            ),
            buildOrderDataTab<HistoryOrderBloc, HistoryOrderState>(
              context.read<HistoryOrderBloc>(),
            ),
            buildOrderDataTab<HistoryOrderBloc, HistoryOrderState>(
              context.read<HistoryOrderBloc>(),
            ),
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
          return OrderDataCard(response: historyResponse);
        },
      );
    },
  );
}

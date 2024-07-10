import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/order_data_card.dart';

import '../../../core/styles.dart';
import '../bloc/canceledOrdersData/canceled_orders_data_bloc.dart';
import '../bloc/completedOrdersData/completed_orders_data_bloc.dart';
import '../bloc/onShippingOrdersData/on_shipping_orders_data_bloc.dart';
import '../bloc/paymentPendingOrdersData/payment_pending_orders_data_bloc.dart';
import '../bloc/pendingOrdersData/pending_orders_data_bloc.dart';
import '../bloc/rejectedOrdersData/rejected_orders_data_bloc.dart';

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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../../../data/models/request/new_order_request_model.dart';
import '../../bloc/order/newOrder/new_order_bloc.dart';
import 'order_summary_page.dart';

class AddShipperConsigneeDataPage extends StatefulWidget {
  final int portOfLoadingId;
  final int portOfDischargeId;
  final int vesselId;
  final DateTime dateOfDischarge;
  final DateTime dateOfLoading;
  final String cargoDescription;
  final String cargoWeight;
  final int shippingCost;
  final int handlingCost;
  final int biayaParkirPelabuhan;

  const AddShipperConsigneeDataPage({
    super.key,
    required this.portOfLoadingId,
    required this.portOfDischargeId,
    required this.vesselId,
    required this.dateOfLoading,
    required this.dateOfDischarge,
    required this.cargoDescription,
    required this.cargoWeight,
    required this.shippingCost,
    required this.handlingCost,
    required this.biayaParkirPelabuhan,
  });

  @override
  State<AddShipperConsigneeDataPage> createState() =>
      _AddShipperConsigneeDataPageState();
}

class _AddShipperConsigneeDataPageState
    extends State<AddShipperConsigneeDataPage> {
  final TextEditingController shipperNameController = TextEditingController();
  final TextEditingController shipperAddressController =
      TextEditingController();
  final TextEditingController consigneeNameController = TextEditingController();
  final TextEditingController consigneeAddressController =
      TextEditingController();

  @override
  void dispose() {
    shipperNameController.dispose();
    shipperAddressController.dispose();
    consigneeNameController.dispose();
    consigneeAddressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Shipper and Consignee Data'),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: ListView(
            children: [
              const SpaceHeight(30),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8.0),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    CustomTextField(
                      controller: shipperNameController,
                      label: 'Shipper Name',
                      hintText: 'Shipper\'s company name',
                      textInputAction: TextInputAction.next,
                      prefixIcon: const Icon(
                        Icons.sailing,
                      ),
                    ),
                    const SpaceHeight(30),
                    CustomTextField(
                      controller: shipperAddressController,
                      label: 'Shipper Address',
                      hintText: 'Shipper\'s company address',
                      textInputAction: TextInputAction.next,
                      prefixIcon: const Icon(
                        Icons.pin_drop,
                      ),
                    ),
                  ],
                ),
              ),
              const SpaceHeight(30),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8.0),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    CustomTextField(
                      controller: consigneeNameController,
                      label: 'Consignee Name',
                      hintText: 'Consignee\'s company name',
                      textInputAction: TextInputAction.next,
                      prefixIcon: Transform.scale(
                        scaleX: -1,
                        child: const Icon(
                          Icons.sailing,
                        ),
                      ),
                    ),
                    const SpaceHeight(30),
                    CustomTextField(
                      controller: consigneeAddressController,
                      label: 'Consignee Address',
                      hintText: 'Consignee\'s company address',
                      textInputAction: TextInputAction.next,
                      prefixIcon: const Icon(
                        Icons.pin_drop,
                      ),
                    ),
                  ],
                ),
              ),
              const SpaceHeight(30),
              BlocConsumer<NewOrderBloc, NewOrderState>(
                listener: (context, state) {
                  state.maybeWhen(
                    orElse: () {},
                    error: (error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(error),
                          backgroundColor: Colors.red,
                        ),
                      );
                    },
                    success: (data) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Data ditambahkan'),
                          backgroundColor: AppColors.green,
                        ),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderSummaryPage(
                            transactionIdMessage: data.data.transactionId,
                          ),
                        ),
                      );
                    },
                  );
                },
                builder: (context, state) {
                  return Button.filled(
                    onPressed: () {
                      final dataRequest = NewOrderRequestModel(
                        portOfLoadingId: widget.portOfLoadingId,
                        portOfDischargeId: widget.portOfDischargeId,
                        dateOfLoading: widget.dateOfLoading,
                        cargoDescription: widget.cargoDescription,
                        cargoWeight: widget.cargoWeight,
                        vesselId: widget.vesselId,
                        dateOfDischarge: widget.dateOfDischarge,
                        shippingCost: widget.shippingCost,
                        handlingCost: widget.handlingCost,
                        biayaParkirPelabuhan: widget.biayaParkirPelabuhan,
                        shipperName: shipperNameController.text,
                        shipperAddress: shipperAddressController.text,
                        consigneeName: consigneeNameController.text,
                        consigneeAddress: consigneeAddressController.text,
                      );
                      context.read<NewOrderBloc>().add(
                            NewOrderEvent.placeOrder(dataRequest),
                          );
                    },
                    label: 'Place order',
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

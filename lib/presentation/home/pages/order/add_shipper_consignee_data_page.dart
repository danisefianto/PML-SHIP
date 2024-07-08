import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../../../core/styles.dart';
import '../../../../data/models/request/new_order_request_model.dart';
import '../../bloc/order/newOrder/new_order_bloc.dart';

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
  final TextEditingController shipperName = TextEditingController();
  final TextEditingController shipperAddress = TextEditingController();
  final TextEditingController consigneeName = TextEditingController();
  final TextEditingController consigneeAddress = TextEditingController();

  @override
  void dispose() {
    shipperName.dispose();
    shipperAddress.dispose();
    consigneeName.dispose();
    consigneeAddress.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget actorInput(String actorName, TextEditingController controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$actorName Name',
            style: primaryTextStyle.copyWith(
              fontWeight: medium,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Container(
            height: 50.0,
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(
                5.0,
              ),
            ),
            child: Center(
              child: Row(
                children: [
                  if (actorName == 'Shipper')
                    const Icon(
                      Icons.sailing,
                    )
                  else
                    Transform.scale(
                      scaleX: -1,
                      child: const Icon(
                        Icons.sailing,
                      ),
                    ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Expanded(
                    child: TextFormField(
                      style: primaryTextStyle,
                      controller: controller,
                      decoration: InputDecoration.collapsed(
                        hintText: '$actorName\'s company name',
                        hintStyle: subtitleTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      );
    }

    Widget actorAddressInput(
      String actorName,
      TextEditingController controller,
    ) {
      return Container(
        margin: const EdgeInsets.only(top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$actorName Address',
              style: primaryTextStyle.copyWith(
                fontWeight: medium,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Container(
              height: 50.0,
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(
                  5.0,
                ),
              ),
              child: Center(
                child: Row(
                  children: [
                    const Icon(
                      Icons.pin_drop,
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      child: TextFormField(
                        style: primaryTextStyle,
                        controller: controller,
                        decoration: InputDecoration.collapsed(
                          hintText: '$actorName\'s company address',
                          hintStyle: subtitleTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

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
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8.0),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    // Text(this.widget.transactionIdMessage),
                    actorInput('Shipper', shipperName),
                    actorAddressInput('Shipper', shipperAddress),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8.0),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    actorInput('Consignee', consigneeName),
                    actorAddressInput('Consignee', consigneeAddress),
                  ],
                ),
              ),
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
                          backgroundColor: Colors.green,
                        ),
                      );
                      Navigator.pushNamed(
                        context,
                        AppRoutes.orderSummary,
                        arguments: data.data.transactionId,
                      );
                    },
                  );
                },
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Button.filled(
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
                          shipperName: shipperName.text,
                          shipperAddress: shipperAddress.text,
                          consigneeName: consigneeName.text,
                          consigneeAddress: consigneeAddress.text,
                        );
                        context.read<NewOrderBloc>().add(
                              NewOrderEvent.placeOrder(dataRequest),
                            );
                      },
                      label: 'Place order',
                    ),
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

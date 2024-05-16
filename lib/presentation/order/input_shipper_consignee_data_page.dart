import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pml_ship/data/models/request/add_shipper_consignee_request_model.dart';
import 'package:pml_ship/presentation/order/bloc/addShipperConsignee/add_shipper_consignee_bloc.dart';
import 'package:pml_ship/presentation/order/order_port_page.dart';
import 'package:pml_ship/presentation/order/order_summary_page.dart';

import '../../core/styles.dart';

class InputShipperConsigneeDataPage extends StatefulWidget {
  final String transactionIdMessage;

  const InputShipperConsigneeDataPage({
    super.key,
    required this.transactionIdMessage,
  });

  @override
  State<InputShipperConsigneeDataPage> createState() =>
      _InputShipperConsigneeDataPageState();
}

class _InputShipperConsigneeDataPageState
    extends State<InputShipperConsigneeDataPage> {
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
    Widget actorInput(String actor_name, TextEditingController controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$actor_name Name',
            style: primaryTextStyle.copyWith(
              fontWeight: medium,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
          Container(
            height: 50.0,
            padding: EdgeInsets.symmetric(
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
                  if (actor_name == 'Shipper')
                    Icon(
                      Icons.sailing,
                    )
                  else
                    Transform.scale(
                      scaleX: -1,
                      child: Icon(
                        Icons.sailing,
                      ),
                    ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Expanded(
                    child: TextFormField(
                      style: primaryTextStyle,
                      controller: controller,
                      decoration: InputDecoration.collapsed(
                        hintText: '$actor_name\'s company name',
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
      String actor_name,
      TextEditingController controller,
    ) {
      return Container(
        margin: EdgeInsets.only(top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$actor_name Address',
              style: primaryTextStyle.copyWith(
                fontWeight: medium,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            Container(
              height: 50.0,
              padding: EdgeInsets.symmetric(
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
                    Icon(
                      Icons.pin_drop,
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      child: TextFormField(
                        style: primaryTextStyle,
                        controller: controller,
                        decoration: InputDecoration.collapsed(
                          hintText: '$actor_name\'s company address',
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
          title: Text('Shipper and Consignee Data'),
          leading: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 8.0),
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
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 8.0),
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
              // TODO: Add BlocConsumer
              BlocConsumer<AddShipperConsigneeBloc, AddShipperConsigneeState>(
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
                      // Navigator.pushNamed(context, '/order-summary');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderSummaryPage(
                              transactionIdMessage: data.data.transactionId),
                        ),
                      );
                    },
                  );
                },
                builder: (context, state) {
                  return Container(
                    height: 50.0,
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 30.0, bottom: 30.0),
                    child: FilledButton(
                      child: Text(
                        'Place order',
                        style: primaryTextStyle.copyWith(
                          fontWeight: semiBold,
                          fontSize: 16.0,
                          color: primaryColor,
                        ),
                      ),
                      onPressed: () {
                        final dataRequest = AddShipperConsigneeRequestModel(
                          transactionId: widget.transactionIdMessage,
                          shipperName: shipperName.text,
                          shipperAddress: shipperAddress.text,
                          consigneeName: consigneeName.text,
                          consigneeAddress: consigneeAddress.text,
                        );
                        context.read<AddShipperConsigneeBloc>().add(
                              AddShipperConsigneeEvent.addShipperConsignee(
                                  dataRequest),
                            );
                      },
                      style: FilledButton.styleFrom(
                        backgroundColor: secondaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
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

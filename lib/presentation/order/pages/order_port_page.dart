import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.dart';
import '../../../core/styles.dart';
import '../../../data/models/request/order_port_request_model.dart';
import '../../widgets/select_date_widget.dart';
import '../../widgets/select_port_dropdown_widget.dart';
import '../bloc/orderPort/order_port_bloc.dart';
import 'quotation_and_weather_risk_mitigation_page.dart';

// TODO: improvement. Jangan kirim POST semua data ke server supaya nanti di history tidak muncul semua. Kirim POST port loading, port discharge, dan loading date. Nantinya baru diPOST semua di halaman add consignee
class OrderPortPage extends StatefulWidget {
  const OrderPortPage({super.key});

  @override
  State<OrderPortPage> createState() => _OrderPortPageState();
}

class _OrderPortPageState extends State<OrderPortPage> {
  int? loadingPortId;
  int? dischargePortId;

  final TextEditingController loadingDateController = TextEditingController();

  final TextEditingController cargoDescriptionController =
      TextEditingController();
  final TextEditingController cargoWeightController = TextEditingController();

  @override
  void dispose() {
    loadingDateController.dispose();

    cargoDescriptionController.dispose();
    cargoWeightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool allFieldsAreEmpty() {
      return loadingDateController.text.isEmpty ||
          cargoDescriptionController.text.isEmpty ||
          cargoWeightController.text.isEmpty;
    }

    Widget cargoInput(
      String customLabelText,
      String customHintText,
      TextEditingController cargoController,
    ) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              customLabelText,
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
                border: Border.all(color: secondaryColor),
                borderRadius: BorderRadius.circular(
                  5.0,
                ),
              ),
              child: Center(
                child: TextFormField(
                  controller: cargoController,
                  style: primaryTextStyle,
                  decoration: InputDecoration.collapsed(
                    hintText: customHintText,
                    hintStyle: subtitleTextStyle,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Request Order'),
          leading: IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  color: secondaryColor,
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                  child: Text(
                    'Port',
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      color: primaryColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SelectPortDropdownWidget(
                  customMargin: 30,
                  portType: 'loading',
                  onPortSelected: (name, id) {
                    setState(() {
                      loadingPortId = id;
                    });
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                SelectPortDropdownWidget(
                  customMargin: 30,
                  portType: 'discharge',
                  onPortSelected: (name, id) {
                    setState(() {
                      dischargePortId = id;
                    });
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  color: secondaryColor,
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                  child: Text(
                    'Date',
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      color: primaryColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      SelectDateWidget(
                        dateController: loadingDateController,
                        labelText: 'Loading date',
                      ),
                      Text(
                        'Loading dates must be scheduled at least two week in advance.',
                        style: primaryTextStyle.copyWith(
                            color: Colors.red.shade900),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  color: secondaryColor,
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                  child: Text(
                    'Cargo',
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      color: primaryColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                cargoInput(
                  'Cargo description',
                  'Describe your cargo',
                  cargoDescriptionController,
                ),
                const SizedBox(
                  height: 15,
                ),
                cargoInput(
                  'Gross weight',
                  'How many metric tonness of your cargo?',
                  cargoWeightController,
                ),
                BlocConsumer<OrderPortBloc, OrderPortState>(
                  listener: (context, state) {
                    state.maybeWhen(
                      orElse: () {},
                      success: (data) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Data ditambahkan'),
                            backgroundColor: Colors.green,
                          ),
                        );

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                QuotationAndWeatherRiskMitigationPage(
                                    transactionIdMessage:
                                        data.data.transactionId),
                          ),
                        );
                      },
                      error: (error) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(error),
                            backgroundColor: Colors.red,
                          ),
                        );
                      },
                    );
                  },
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () {
                        return Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Button.filled(
                            onPressed: () {
                              if (allFieldsAreEmpty()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Some fields are empty!'),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              } else if (loadingPortId == dischargePortId) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'Loading port and discharge port cannot be the same!'),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              } else {
                                final dataRequest = OrderPortRequestModel(
                                  portOfLoadingId: loadingPortId!,
                                  portOfDischargeId: dischargePortId!,
                                  dateOfLoading: DateTime.parse(
                                      loadingDateController.text),
                                  cargoDescription:
                                      cargoDescriptionController.text,
                                  cargoWeight: cargoWeightController.text,
                                );

                                context
                                    .read<OrderPortBloc>()
                                    .add(OrderPortEvent.orderPort(dataRequest));
                              }
                            },
                            label: 'Next',
                          ),
                        );
                      },
                      loading: () {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

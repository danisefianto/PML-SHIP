import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pml_ship/core/components/buttons.dart';
import 'package:pml_ship/data/models/request/order_port_request_model.dart';
import 'package:pml_ship/presentation/order/bloc/orderPort/order_port_bloc.dart';
import 'package:pml_ship/presentation/order/pages/add_shipper_consignee_data_page.dart';

import '../../../core/styles.dart';
import '../../widgets/select_date_widget.dart';

class OrderPortPage extends StatefulWidget {
  const OrderPortPage({super.key});

  @override
  State<OrderPortPage> createState() => _OrderPortPageState();
}

class _OrderPortPageState extends State<OrderPortPage> {
  // final Data? responseData;
  final TextEditingController loadingPortController = TextEditingController();
  final TextEditingController dischargePortController = TextEditingController();
  final TextEditingController loadingDateController = TextEditingController();

  final TextEditingController cargoDescriptionController =
      TextEditingController();
  final TextEditingController cargoWeightController = TextEditingController();

  @override
  void dispose() {
    loadingPortController.dispose();
    dischargePortController.dispose();
    loadingDateController.dispose();

    cargoDescriptionController.dispose();
    cargoWeightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool allFieldsAreEmpty() {
      // Replace the following with your actual logic
      return loadingPortController.text.isEmpty ||
          dischargePortController.text.isEmpty ||
          loadingDateController.text.isEmpty ||
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
          // margin: EdgeInsets.symmetric(
          //   horizontal: defaultMargin,
          // ),
          child: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  color: secondaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
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
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Loading port',
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
                            controller: loadingPortController,
                            style: primaryTextStyle,
                            decoration: InputDecoration.collapsed(
                              hintText: 'Masukkan nama loading pelabuhan',
                              hintStyle: subtitleTextStyle,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // SelectPortDropdownWidget(
                //   customMargin: defaultMargin,
                //   cargoState: 'loading',
                // ),
                // SizedBox(
                //   height: 20,
                // ),
                // Container(
                //   width: double.infinity,
                //   color: secondaryColor,
                //   padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                //   child: Text(
                //     'Port',
                //     style: primaryTextStyle.copyWith(
                //       fontSize: 16,
                //       color: primaryColor,
                //     ),
                //   ),
                // ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Discharge port',
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
                            controller: dischargePortController,
                            style: primaryTextStyle,
                            decoration: InputDecoration.collapsed(
                              hintText: 'Masukkan nama pelabuhan',
                              hintStyle: subtitleTextStyle,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // SelectPortDropdownWidget(
                //   customMargin: defaultMargin,
                //   cargoState: 'discharge',
                // ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  color: secondaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
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
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
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
                        // Navigator.pushNamed(context, '/plan-order');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddShipperConsigneeDataPage(
                                transactionIdMessage: data.data.transactionId),
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
                              } else {
                                final dataRequest = OrderPortRequestModel(
                                  portOfLoadingId:
                                      int.parse(loadingPortController.text),
                                  portOfDischargeId:
                                      int.parse(dischargePortController.text),
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

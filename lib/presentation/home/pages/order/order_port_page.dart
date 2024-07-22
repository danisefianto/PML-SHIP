import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../widgets/select_date_widget.dart';
import '../../widgets/select_port_dropdown_widget.dart';
import 'quotation_and_weather_risk_mitigation_page.dart';

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
              style: const TextStyle(
                fontWeight: FontWeight.w500,
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
                border: Border.all(color: AppColors.blue),
                borderRadius: BorderRadius.circular(
                  5.0,
                ),
              ),
              child: Center(
                child: TextFormField(
                  controller: cargoController,
                  decoration: InputDecoration.collapsed(
                    hintText: customHintText,
                    hintStyle: const TextStyle(
                      color: Color(0xff504F5E),
                    ),
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
        ),
        body: Container(
          padding: const EdgeInsets.all(0),
          child: ListView(
            children: [
              Container(
                width: double.infinity,
                color: AppColors.blue,
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                child: const Text(
                  'Port',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: SelectPortDropdownWidget(
                  customMargin: 30,
                  portType: 'loading',
                  onPortSelected: (name, id) {
                    setState(() {
                      loadingPortId = id;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: SelectPortDropdownWidget(
                  customMargin: 30,
                  portType: 'discharge',
                  onPortSelected: (name, id) {
                    setState(() {
                      dischargePortId = id;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                color: AppColors.blue,
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                child: const Text(
                  'Date',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.primaryColor,
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
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 180)),
                    ),
                    Text(
                      'Loading dates must be scheduled at least two weeks in advance.',
                      style: TextStyle(
                        color: Colors.red.shade900,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                color: AppColors.blue,
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                child: const Text(
                  'Cargo',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.primaryColor,
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
              // Container(
              //   margin: const EdgeInsets.symmetric(horizontal: 30),
              //   child: CustomTextField(
              //     controller: cargoDescriptionController,
              //     label: 'Cargo description',
              //     hintText: 'Describe your cargo',
              //     textInputAction: TextInputAction.next,
              //   ),
              // ),
              const SpaceHeight(15),

              cargoInput(
                'Gross weight',
                'How many metric tonnes of your cargo?',
                cargoWeightController,
              ),
              // Container(
              //   margin: const EdgeInsets.symmetric(horizontal: 30),
              //   child: CustomTextField(
              //     controller: cargoWeightController,
              //     label: 'Gross weight',
              //     hintText: 'How many metric tonnes of your cargo?',
              //     textInputAction: TextInputAction.next,
              //   ),
              // ),
              const SpaceHeight(30),
              Padding(
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
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Quotation berhasil dibuat!'),
                          backgroundColor: AppColors.green,
                        ),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              QuotationAndWeatherRiskMitigationPage(
                            portOfLoadingId: loadingPortId!,
                            portOfDischargeId: dischargePortId!,
                            dateOfLoading:
                                DateTime.parse(loadingDateController.text),
                            cargoDescription: cargoDescriptionController.text,
                            cargoWeight: cargoWeightController.text,
                          ),
                        ),
                      );
                    }
                  },
                  label: 'Next',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

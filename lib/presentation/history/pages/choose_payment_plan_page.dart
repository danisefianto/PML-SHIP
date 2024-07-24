import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/core.dart';
import '../../home/bloc/addPayment/add_payment_bloc.dart';

import '../../../data/models/request/add_payment_request_model.dart';
import '../../home/bloc/paymentOptions/payment_options_bloc.dart';
import '../../home/pages/order/upload_payment_proof_page.dart';

class ChoosePaymentPlanPage extends StatefulWidget {
  final String transactionId;

  const ChoosePaymentPlanPage({
    super.key,
    required this.transactionId,
  });

  @override
  State<ChoosePaymentPlanPage> createState() => _ChoosePaymentPlanPageState();
}

class _ChoosePaymentPlanPageState extends State<ChoosePaymentPlanPage> {
  int _selectedOption = 1;

  @override
  void initState() {
    context
        .read<PaymentOptionsBloc>()
        .add(PaymentOptionsEvent.getPaymentOptions(widget.transactionId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Choose how to pay'),
        ),
        body: BlocListener<AddPaymentBloc, AddPaymentState>(
          listener: (context, state) {
            state.maybeWhen(
                orElse: () {},
                error: (message) {
                  return ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Error: $message'),
                      backgroundColor: Colors.red,
                    ),
                  );
                },
                success: (state) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                          'Choose payment plan SUCCESS'), //menampilkan snackbar success
                      backgroundColor: AppColors.green,
                    ),
                  );
                });
          },
          child: BlocBuilder<PaymentOptionsBloc, PaymentOptionsState>(
            builder: (context, state) {
              return state.maybeWhen(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (message) {
                  return Center(child: Text('Error: $message'));
                },
                orElse: () => const Center(child: Text('No data')),
                success: (response) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Pick a payment plan",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'Choose the best way to pay your order',
                        ),
                        RadioListTile<int>(
                          title: const Text('Pay All at Once'),
                          subtitle: const Text('Pay all at once upfront'),
                          value: 1,
                          groupValue: _selectedOption,
                          onChanged: (int? value) {
                            setState(() {
                              _selectedOption = value!;
                            });
                          },
                        ),
                        RadioListTile<int>(
                          title: const Text('Pay in 2 Times'),
                          subtitle:
                              const Text('Pay twice at upfront and at the end'),
                          value: 2,
                          groupValue: _selectedOption,
                          onChanged: (int? value) {
                            setState(() {
                              _selectedOption = value!;
                            });
                          },
                        ),
                        RadioListTile<int>(
                          title: const Text('Pay in 3 Times'),
                          subtitle: const Text(
                              'Pay three times at upfront, middle, and end'),
                          value: 3,
                          groupValue: _selectedOption,
                          onChanged: (int? value) {
                            setState(() {
                              _selectedOption = value!;
                            });
                          },
                        ),
                        const SpaceHeight(20),
                        if (_selectedOption == 1) ...[
                          Text(
                            'Payment all at once: ${response.data.paymentOptions.payAllAtOnce.firstPayment.currencyEYDFormatRp}',
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Total: '),
                              Text(
                                response.data.paymentOptions.payAllAtOnce
                                    .firstPayment.currencyEYDFormatRp,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            'Pay To: ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Assets.image.bca.image(height: 100),
                              const Column(
                                children: [
                                  Text('Bank BCA'),
                                  Text('1234567890'),
                                  Text('a/n PT. Patria Maritime Lines')
                                ],
                              )
                            ],
                          )
                        ],
                        if (_selectedOption == 2) ...[
                          const Text(
                            'Payment in 2 times:',
                          ),
                          Text(
                            'First payment: ${response.data.paymentOptions.payIn2Times.firstPayment.currencyEYDFormatRp}',
                          ),
                          Text(
                            'Second payment: ${response.data.paymentOptions.payIn2Times.secondPayment.currencyEYDFormatRp}',
                          ),
                          const Text(
                            'Pay To: ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Assets.image.bca.image(height: 100),
                              const Column(
                                children: [
                                  Text('Bank BCA'),
                                  Text('1234567890'),
                                  Text('a/n PT. Patria Maritime Lines')
                                ],
                              )
                            ],
                          )
                        ],
                        if (_selectedOption == 3) ...[
                          const Text(
                            'Payment in 3 times:',
                          ),
                          Text(
                            'First payment: ${response.data.paymentOptions.payIn3Times.firstPayment.currencyEYDFormatRp}',
                          ),
                          Text(
                            'Second payment: ${response.data.paymentOptions.payIn3Times.secondPayment.currencyEYDFormatRp}',
                          ),
                          Text(
                            'Third payment: ${response.data.paymentOptions.payIn3Times.thirdPayment.currencyEYDFormatRp}',
                          ),
                          const Text(
                            'Pay To: ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Assets.image.bca.image(height: 100),
                              const Column(
                                children: [
                                  Text('Bank BCA'),
                                  Text('1234567890'),
                                  Text('a/n PT. Patria Maritime Lines')
                                ],
                              )
                            ],
                          )
                        ],
                        if (_selectedOption != 1 &&
                            _selectedOption != 2 &&
                            _selectedOption != 3)
                          const Text('No data'),
                        Center(
                          child: Button.filled(
                            onPressed: () {
                              final dataRequest = AddPaymentRequestModel(
                                transactionId: widget.transactionId,
                                totalBill: response.data.totalBill.toDouble(),
                                totalInstallments: _selectedOption.toInt(),
                              );
                              context.read<AddPaymentBloc>().add(
                                    AddPaymentEvent.addPayment(dataRequest),
                                  );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UploadPaymentProofPage(
                                      transactionId: widget.transactionId),
                                ),
                              );
                            },
                            label: ('Pay Now'),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

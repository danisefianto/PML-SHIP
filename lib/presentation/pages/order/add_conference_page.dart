// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pml_ship/core/styles.dart';
import 'package:pml_ship/data/models/request/add_conference_request_model.dart';
import 'package:pml_ship/presentation/widgets/select_date_widget.dart';

import '../../../core/core.dart';
import '../../bloc/order/addConference/add_conference_bloc.dart';
import '../../bloc/summaryOrder/summary_order_bloc.dart';

enum ConferenceMethod { offline, online }

DateTime loadingDate = DateFormat("yyyy-MM-dd").parse('2024-05-31');

// This is assume today is 2024-05-17
DateTime orderDate = DateFormat("yyyy-MM-dd").parse('2024-05-17');

// Range for conference date is 2024-05-18 until 2024-05-20.
DateTime conferenceDateStarted = orderDate.add(const Duration(days: 1));
DateTime conferenceDateEnded = orderDate.add(const Duration(days: 3));

DateTime conferenceSuccessDate = DateFormat("yyyy-MM-dd").parse('2024-05-20');

// If conference success, customer can input document until 2 days later (2024-05-22)
DateTime maxInputDocument = conferenceSuccessDate.add(const Duration(days: 2));
DateTime customerInputDocumentShippingInstruction =
    DateFormat("yyyy-MM-dd").parse('2024-05-22');

DateTime maxPayment =
    customerInputDocumentShippingInstruction.add(const Duration(days: 2));
DateTime customerPaymentDate = DateFormat("yyyy-MM-dd").parse('2024-05-25');
DateTime adminCheckCustomerPaymentDate =
    customerPaymentDate.add(const Duration(days: 1));

class AddConferencePage extends StatefulWidget {
  final String transactionIdMessage;
  const AddConferencePage({
    super.key,
    required this.transactionIdMessage,
  });

  @override
  State<AddConferencePage> createState() => _AddConferencePageState();
}

class _AddConferencePageState extends State<AddConferencePage> {
  @override
  void initState() {
    context.read<SummaryOrderBloc>().add(SummaryOrderEvent.getSummaryOrder(
          widget.transactionIdMessage,
        ));
    super.initState();
  }

  ConferenceMethod? _conferenceMethodItem = ConferenceMethod.offline;
  final TextEditingController offlineConferenceLocation =
      TextEditingController();
  final TextEditingController dateController = TextEditingController();
  List<String> dropdownItemsOnlineLocation = [
    "Google Meet",
    "Microsoft Teams",
    "Zoom",
  ];
  List<String> dropdownItemsTime = [
    "09.00 WIB",
    "10.00 WIB",
    "11.00 WIB",
    "13.00 WIB",
  ];
  String? _selectedDropdownItemOnlineLocation;
  String? _selectedDropdownItemTime;

  @override
  void dispose() {
    offlineConferenceLocation.dispose();
    dateController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Set Conference Time'),
          ),
          body: ListView(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 20.0,
                  left: defaultMargin,
                  right: defaultMargin,
                ),
                child: Text(
                  'Conference method',
                  style: primaryTextStyle.copyWith(
                    fontWeight: bold,
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  RadioListTile<ConferenceMethod>(
                    value: ConferenceMethod.offline,
                    groupValue: _conferenceMethodItem,
                    onChanged: (ConferenceMethod? value) {
                      setState(() {
                        _conferenceMethodItem = value;
                      });
                    },
                    title: const Text('Offline'),
                  ),
                  RadioListTile<ConferenceMethod>(
                    value: ConferenceMethod.online,
                    groupValue: _conferenceMethodItem,
                    onChanged: (ConferenceMethod? value) {
                      setState(() {
                        _conferenceMethodItem = value;
                      });
                    },
                    title: const Text('Online'),
                  ),
                ],
              ),
              Visibility(
                visible: _conferenceMethodItem == ConferenceMethod.offline,
                child: Container(
                  margin: EdgeInsets.only(
                    top: 20.0,
                    left: defaultMargin,
                    right: defaultMargin,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Enter your preferred conference venue',
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
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Center(
                          child: TextFormField(
                            controller: offlineConferenceLocation,
                            style: primaryTextStyle,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Meeting Room Gedung A',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: _conferenceMethodItem == ConferenceMethod.online,
                child: Container(
                  margin: EdgeInsets.only(
                    top: 20.0,
                    left: defaultMargin,
                    right: defaultMargin,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DropdownButton<String>(
                        isExpanded: true,
                        value: _selectedDropdownItemOnlineLocation,
                        hint:
                            const Text('Choose an online conference platform'),
                        items: dropdownItemsOnlineLocation
                            .map((String item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(item),
                                ))
                            .toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedDropdownItemOnlineLocation = newValue;
                          });
                        },
                      ),
                      const Text('Meeting link will be provided by us'),
                    ],
                  ),
                ),
              ),
              BlocBuilder<SummaryOrderBloc, SummaryOrderState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    orElse: () {
                      return const Center(child: Text('Error'));
                    },
                    loading: () {
                      return const Center(child: CircularProgressIndicator());
                    },
                    success: (summaryorder) {
                      return Container(
                        margin: EdgeInsets.only(
                          top: 20.0,
                          left: defaultMargin,
                          right: defaultMargin,
                        ),
                        // Assume today is 2024-05-17, it can choose between 2024-05-18 until 2024-05-20
                        child: SelectDateWidget(
                          labelText: 'Date',
                          dateController: dateController,
                          // firstDate: conferenceDateStarted,
                          // lastDate: conferenceDateEnded,
                          firstDate: summaryorder.data.createdAt
                              .add(const Duration(days: 1)),
                          lastDate: summaryorder.data.createdAt
                              .add(const Duration(days: 3)),
                        ),
                      );
                    },
                  );
                },
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 20.0,
                  left: defaultMargin,
                  right: defaultMargin,
                ),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: _selectedDropdownItemTime,
                  hint: const Text('Choose time for the conference'),
                  items: dropdownItemsTime
                      .map((String item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(item),
                          ))
                      .toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedDropdownItemTime = newValue;
                    });
                  },
                ),
              ),
            ],
          ),
          bottomNavigationBar:
              BlocConsumer<AddConferenceBloc, AddConferenceState>(
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
                      content: Text('Conference ditambahkan'),
                      backgroundColor: Colors.green,
                    ),
                  );

                  Navigator.pushNamed(
                    context,
                    AppRoutes.orderProcessWaiting,
                  );
                },
              );
            },
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(30.0),
                child: Button.filled(
                  onPressed: () {
                    context.read<AddConferenceBloc>().add(
                          AddConferenceEvent.addConference(
                            AddConferenceRequestModel(
                              transactionId: widget.transactionIdMessage,
                              conferenceType: _conferenceMethodItem ==
                                      ConferenceMethod.offline
                                  ? 'offline'
                                  : 'online',
                              location: _conferenceMethodItem ==
                                      ConferenceMethod.offline
                                  ? offlineConferenceLocation.text
                                  : _selectedDropdownItemOnlineLocation ?? '',
                              conferenceDate:
                                  DateTime.parse(dateController.text),
                              conferenceTime: _selectedDropdownItemTime ?? '',
                            ),
                          ),
                        );
                  },
                  label: 'Confirm',
                ),
              );
            },
          )),
    );
  }
}

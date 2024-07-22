import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../../data/models/response/order_detail_response_model.dart';

class BuildOrderInfoCard extends StatefulWidget {
  final OrderDetailResponseModel summaryOrderResponseModel;
  const BuildOrderInfoCard({
    super.key,
    required this.summaryOrderResponseModel,
  });

  @override
  State<BuildOrderInfoCard> createState() => _BuildOrderInfoCardState();
}

class _BuildOrderInfoCardState extends State<BuildOrderInfoCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(color: Colors.amber),
            padding: const EdgeInsets.all(8),
            child: const Text(
              'Detail pesanan',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Transaction ID: ${widget.summaryOrderResponseModel.data!.transactionId}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '${widget.summaryOrderResponseModel.data!.loading!.port} - ${widget.summaryOrderResponseModel.data!.discharge!.port}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Date of Loading: ${widget.summaryOrderResponseModel.data!.loading!.date!.toFormattedIndonesianLongDate()}',
                  style: const TextStyle(fontWeight: FontWeight.w300),
                ),
                Text(
                  'Date of Discharge: ${widget.summaryOrderResponseModel.data!.discharge!.date!.toFormattedIndonesianLongDate()}',
                  style: const TextStyle(fontWeight: FontWeight.w300),
                ),
                const Divider(),
                Text(
                  'Cargo Description: ${widget.summaryOrderResponseModel.data!.cargo!.description}',
                ),
                Text(
                  'Cargo Weight: ${widget.summaryOrderResponseModel.data!.cargo!.weight}',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

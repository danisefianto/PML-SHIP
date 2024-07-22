import 'package:flutter/material.dart';

import '../../../data/models/response/order_detail_response_model.dart';

class BuildPaymentWaitingForApprovalHeader extends StatelessWidget {
  final OrderDetailResponseModel responseModel;
  const BuildPaymentWaitingForApprovalHeader({
    super.key,
    required this.responseModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(color: Color(0xFFB2DFDB)),
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 16,
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(Icons.hourglass_bottom),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Please Wait for Admin Approval',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Your payment proof has been uploaded. Please wait for admin approval.',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

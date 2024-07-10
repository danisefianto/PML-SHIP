import 'package:flutter/material.dart';

import '../../../core/styles.dart';
import '../../../data/models/response/order_detail_response_model.dart';

class BuildOnShippingHeader extends StatelessWidget {
  final OrderDetailResponseModel responseModel;
  const BuildOnShippingHeader({
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(Icons.sailing),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'On Shipping',
                  style: primaryTextStyle.copyWith(
                    fontWeight: bold,
                    fontSize: 16,
                  ),
                ),
                // Text(
                //   'Max input ${responseModel.data!.documents!.first.maxInputDocumentAt?.toFormattedIndonesianLongDateAndUTC7Time()}.',
                //   style: primaryTextStyle.copyWith(
                //     fontWeight: regular,
                //     color: Colors.red,
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

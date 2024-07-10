import 'package:flutter/material.dart';
import '../../../core/core.dart';

import '../../../core/styles.dart';
import '../../../data/models/response/order_detail_response_model.dart';

class BuildPaymentSummary extends StatelessWidget {
  final OrderDetailResponseModel summaryOrderResponseModel;
  const BuildPaymentSummary({
    super.key,
    required this.summaryOrderResponseModel,
  });

  @override
  Widget build(BuildContext context) {
    Row paymentSubItem(String label, String content) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(
            content,
            style: primaryTextStyle.copyWith(fontWeight: bold),
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ringkasan Pembayaran',
          style: primaryTextStyle.copyWith(
            fontWeight: bold,
            fontSize: 16,
          ),
        ),
        paymentSubItem(
          'Biaya Pengiriman',
          summaryOrderResponseModel
              .data!.payment!.shippingCost!.currencyEYDFormatRp,
        ),
        paymentSubItem(
          'Biaya Penanganan',
          summaryOrderResponseModel
              .data!.payment!.handlingCost!.currencyEYDFormatRp,
        ),
        paymentSubItem(
          'Biaya Parkir Pelabuhan',
          summaryOrderResponseModel
              .data!.payment!.biayaParkirPelabuhan!.currencyEYDFormatRp,
        ),
        paymentSubItem(
          'Biaya Pajak',
          summaryOrderResponseModel.data!.payment!.tax!.currencyEYDFormatRp,
        ),
        const Divider(),
        paymentSubItem(
          'Total Biaya',
          summaryOrderResponseModel
              .data!.payment!.totalBill!.currencyEYDFormatRp,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../../data/models/response/order_detail_response_model.dart';

class BuildUploadShippingInstructionDocumentHeader extends StatelessWidget {
  final OrderDetailResponseModel responseModel;
  const BuildUploadShippingInstructionDocumentHeader({
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
            child: Icon(Icons.cloud_upload),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Upload Shipping Instruction Document',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Max input ${responseModel.data!.documents!.first.maxInputDocumentAt}.',
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.red,
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

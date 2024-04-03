import 'package:flutter/material.dart';
import 'package:pml_ship/core/app_export.dart';
import 'package:pml_ship/presentation/tracking_one_screen/tracking_one_screen.dart';

class RiskmitigationItemwidget extends StatelessWidget {
  const RiskmitigationItemwidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 17.v),
      decoration: AppDecoration.fillTeal.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder5,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "10 minutes ago",
              style: theme.textTheme.bodySmall,
            ),
          ),
          SizedBox(height: 18.v),
          Padding(
            padding: EdgeInsets.only(left: 4.h, right: 61.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgScatteradThunderstorm,
                  height: 20.adaptSize,
                  width: 20.adaptSize,
                  marginBottom: 10,
                  margin: EdgeInsets.only(bottom: 105.v),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 13.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 186.h,
                          margin: EdgeInsets.only(right: 25.h),
                          child: Text(
                            "Potensi Hujan Lebat disertai petir berpeluang terjadi di:",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.bodyMedium!.copyWith(
                              height: 1.43,
                              color:
                                  Colors.black, // Ubah warna teks menjadi hitam
                            ),
                          ),
                        ),
                        SizedBox(height: 3.v),
                        Container(
                          width: 203.h,
                          margin: EdgeInsets.only(left: 7.h),
                          child: Text(
                            "Perairan Riau\nPerairan Kalimantan Barat\nTeluk Bone\nPerairan Agats Amamapare",
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style: CustomTextStyles.bodyMediumGray600.copyWith(
                              height: 1.43,
                              color:
                                  Colors.black, // Ubah warna teks menjadi hitam
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24.v),
        ],
      ),
    );
  }
}

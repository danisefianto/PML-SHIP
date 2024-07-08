// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pml_ship/data/models/response/user_response_model.dart';

import '../../../core/core.dart';
import '../../../core/styles.dart';

class ProfileHeader extends StatefulWidget {
  final UserResponseModel profile;
  const ProfileHeader({
    super.key,
    required this.profile,
  });

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 124.0, //Didapat dari Figma
      titleSpacing:
          0, //Untuk menghilangkan padding dari leading (leading = biasanya berupa tombol back)
      backgroundColor: backgroundColor1,
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Container(
        padding: EdgeInsets.all(defaultMargin),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage:
                  AssetImage(Assets.image.imageProfileExample.path),
              radius: 30.0,
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.profile.data?.user!.name ?? '',
                  style: primaryTextStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: 24,
                  ),
                  softWrap: true,
                  overflow: TextOverflow.visible,
                ),
                Text(
                  widget.profile.data?.user!.email ?? '',
                  style: subtitleTextStyle.copyWith(
                    fontWeight: regular,
                    fontSize: 16,
                  ),
                  softWrap: true,
                  overflow: TextOverflow.visible,
                ),
                Text(
                  widget.profile.data?.company!.companyName ?? '',
                  style: subtitleTextStyle.copyWith(
                    fontWeight: regular,
                    fontSize: 16,
                  ),
                  softWrap: true,
                  overflow: TextOverflow.visible,
                ),
                Text(
                  'NPWP: ${widget.profile.data?.company!.companyNpwp}',
                  style: subtitleTextStyle.copyWith(
                    fontWeight: regular,
                    fontSize: 16,
                  ),
                  softWrap: true,
                  overflow: TextOverflow.visible,
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}

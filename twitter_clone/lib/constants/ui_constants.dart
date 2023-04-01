import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:twitter_clone/constants/constants.dart';
import 'package:twitter_clone/theme/pallet.dart';

class UIConstants {
  static AppBar appBar() {
    return AppBar(
      centerTitle: true,
      title: SvgPicture.asset(
        AssetsConstsnts.twitterLogo,
        // ignore: deprecated_member_use
        color: Pallete.blueColor,
        height: 30,
      ),
    );
  }
}

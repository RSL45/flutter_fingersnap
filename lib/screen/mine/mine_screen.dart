import 'package:flutter/material.dart';
import 'package:flutter_fingersnap/constant/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MineScreen extends StatelessWidget {
  const MineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color_0F0F0F,
      body: Column(
        children: [
          MineHeader(),
        ],
      ),
    );
  }
}

class MineHeader extends StatefulWidget {
  const MineHeader({super.key});

  @override
  State<MineHeader> createState() => _MineHeaderState();
}

class _MineHeaderState extends State<MineHeader> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/images/ic_home.svg",
                width: 24.w, height: 24.w),
            SvgPicture.asset("assets/images/ic_playlist.svg",
                width: 24.w, height: 24.w),
          ],
        ),
        Text(
          "Abby Abd",
          style: TextStyle(color: AppColors.white),
        )
      ],
    );
  }
}

class MineItem extends StatelessWidget {
  const MineItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [],
        )
      ],
    );
  }
}

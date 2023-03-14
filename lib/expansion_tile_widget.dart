import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_constants.dart';

class ExpansionTileWidget extends StatefulWidget {
  const ExpansionTileWidget({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);
  final String title;
  final List<Widget> children;

  @override
  State<ExpansionTileWidget> createState() => _ExpansionTileWidgetState();
}

class _ExpansionTileWidgetState extends State<ExpansionTileWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: Theme(
        data: ThemeData(
            primaryColor: primaryColor,
            fontFamily: 'Medium',
            dividerColor: Colors.transparent,
            focusColor: primaryColor,
            disabledColor: cWhiteColor),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.r),
          child: ExpansionTile(
            tilePadding: EdgeInsets.only(
                bottom: 10.h, right: 27.w, top: 10.h, left: 27.w),
            onExpansionChanged: (value) {
              setState(() {
                _isExpanded = value;
              });
            },
            collapsedBackgroundColor: cWhiteColor,
            textColor: primaryColor,
            backgroundColor: cWhiteColor,
            iconColor: primaryColor,
            collapsedIconColor: primaryColor,
            title: Text(widget.title),
            trailing: AnimatedRotation(
              turns: _isExpanded ? .25 : 0,
              duration: const Duration(milliseconds: 300),
              child: SvgPicture.asset(
                'assets/icons/ic_arrow_right.svg',
                color: primaryColor,
                // height: 30,
              ),
            ),
            children: widget.children,
          ),
        ),
      ),
    );
  }
}

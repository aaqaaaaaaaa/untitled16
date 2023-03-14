import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:savdo_admin/core/utils/app_constants.dart';

class DropDownWidget extends StatefulWidget {
  DropDownWidget({
    Key? key,
    required this.items,
    required this.dropdownValue,
    required this.name,
  }) : super(key: key);
  String? dropdownValue;
  String name;
  var items = [
    'Item 1',
  ];

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: cWhiteColor, borderRadius: BorderRadius.circular(15.r)),
      height: 80.h,
      padding:
      EdgeInsets.only(bottom: 10.h, right: 27.w, top: 15.h, left: 27.w),
      margin: EdgeInsets.only(left: 32.w, right: 32.w, bottom: 16.h),
      child: DropdownButton(
        isExpanded: true,
        iconDisabledColor: primaryColor,
        underline: Container(),
        borderRadius: BorderRadius.circular(15.r),
        value: widget.dropdownValue,
        hint: Text(widget.name, style: textStylePrimaryM16),
        style: textStylePrimaryM16,
        icon: SvgPicture.asset(
          'assets/icons/ic_arrow_right.svg',
          color: primaryColor,
        ),
        items: widget.items.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(
              items,
              style: textStylePrimaryM16,
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            widget.dropdownValue = newValue!;
          });
        },
      ),
    );
  }
}

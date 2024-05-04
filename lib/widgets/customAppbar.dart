import 'package:MCC/constants/colors.dart';
import 'package:MCC/generated/l10n.dart';
import 'package:MCC/widgets/homePageHelperWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class customAppbar extends StatelessWidget {
  final String title;
  final bool arrow;
  customAppbar({
    super.key,
    required this.title,
    this.arrow = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: BorderDirectional(
          bottom: BorderSide(color: FxColors.primary, width: 1.w),
          top: BorderSide(color: FxColors.primary, width: 1.w),
        ),
        color: Theme.of(context).primaryColor,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        child: Row(
          children: [
            !arrow
                ? IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: const Icon(
                      Icons.menu,
                      // color: ColorsManager.Color10Light,
                    ))
                : IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                    )),
            Spacer(),
            Spacer(),
            Text(
              title,
              style: TextStyle(fontSize: 24.sp),
            ),
            Spacer(),
            Spacer(),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

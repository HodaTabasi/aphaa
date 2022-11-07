import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewWidgetNetworkLoadMore extends StatelessWidget {
  const NewWidgetNetworkLoadMore({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(16.0.r),
      child: Center(child:  Text(" تحقق من اتصالك بالانترنت واضغط هنا لاعادة التحميل",style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 12.sp,
          fontFamily: 'Tajawal'
      ),),),
    );
  }
}
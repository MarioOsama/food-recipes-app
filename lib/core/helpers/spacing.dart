import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


SizedBox verticalSpace(double height) {
  return SizedBox(height: height.h);
}

SizedBox horizontalSpace(double width) {
  return SizedBox(width: width.w);
}

SliverToBoxAdapter verticalSliverSpace(double height) {
  return SliverToBoxAdapter(child: verticalSpace(height));
}

SliverToBoxAdapter horizontalSliverSpace(double width) {
  return SliverToBoxAdapter(child: horizontalSpace(width));
}

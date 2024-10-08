import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class RtSkeleton extends StatelessWidget {
  const RtSkeleton({
    super.key,
    this.marginBottom = 0.0,
    this.borderRadius = 12.0,
    required this.width,
    required this.height,
  });

  final double marginBottom;
  final double borderRadius;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: marginBottom),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

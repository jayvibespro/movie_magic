import 'package:daladala/core/utils/constants/colors.dart';
import 'package:daladala/presentation/components/dot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ReviewContainer extends StatelessWidget {
  final String review;
  const ReviewContainer({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 0, 20, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text("Paragon240", style: TextStyle(fontSize: 16, color: cGrey)),
              Dot(),
              Text("14.08.23", style: TextStyle(fontSize: 16, color: cGrey)),
            ],
          ),
          Text(
            review,
            style: TextStyle(fontSize: 16, color: cWhiteWithOpacity),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset("assets/svg/star.svg", width: 16),

              RichText(
                text: TextSpan(
                  text: " 6/",
                  style: TextStyle(color: cWhiteWithOpacity, fontSize: 14),
                  children: [
                    TextSpan(
                      text: "10",
                      style: TextStyle(color: cGrey, fontSize: 10),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

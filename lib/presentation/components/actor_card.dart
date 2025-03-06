import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/utils/constants/colors.dart';

class ActorCard extends StatelessWidget {
  const ActorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: SizedBox(
        width: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipOval(
              clipBehavior: Clip.hardEdge,
              child: SizedBox(
                width: 120,
                height: 120,
                child: Image.asset(
                  "assets/images/jason_statham.jpeg",
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset("assets/svg/star.svg", width: 20),
                Text(" 8.0", style: TextStyle(color: cGrey, fontSize: 18)),
              ],
            ),
            Text(
              "Jason Statham".replaceAll(" ", "\n"),
              textAlign: TextAlign.center,

              style: TextStyle(fontSize: 16, color: cWhiteWithOpacity),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/utils/constants/colors.dart';

class ActorCard extends StatelessWidget {
  final bool isActor;
  const ActorCard({super.key, this.isActor = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: SizedBox(
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipOval(
              clipBehavior: Clip.hardEdge,
              child: SizedBox(
                width: 100,
                height: 100,
                child: Image.asset(
                  "assets/images/jason_statham.jpeg",
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            SizedBox(height: 8),
            isActor
                ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset("assets/svg/star.svg", width: 18),
                    Text(" 8.0", style: TextStyle(color: cGrey, fontSize: 16)),
                  ],
                )
                : Text("Actor", style: TextStyle(color: cGrey)),
            SizedBox(height: 5),
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

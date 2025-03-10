import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_magic/core/models/people_model/people_model.dart';
import 'package:movie_magic/presentation/components/Custom_cached_image.dart';

import '../../core/utils/constants/colors.dart';
import '../../core/utils/constants/urls.dart';

class ActorCard extends StatelessWidget {
  final bool isActor;
  final PeopleModel actor;
  final VoidCallback onTap;
 
  const ActorCard({
    super.key,
    this.isActor = true,
    required this.actor,
    required this.onTap,
  });

  double _getRateAverage() {
    if (actor.knownFor != null) {
      double average = 0;
      for (var film in actor.knownFor!) {
        average += film.voteAverage ?? 0;
      }
      return average / actor.knownFor!.length;
    } else {
      return 5.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
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
                  child: CustomCachedImage(
                    imageUrl: "$backdropBaseUrl/${actor.profilePath ?? ""}",
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
              SizedBox(height: 8),
              isActor
                  ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset("assets/svg/star.svg", width: 18),
                  Text(
                    " ${_getRateAverage().toStringAsFixed(1)}",
                    style: TextStyle(color: cGrey, fontSize: 16),
                  ),
                ],
              )
                  : Text("Actor", style: TextStyle(color: cGrey)),
              SizedBox(height: 5),
              Text(
                "${actor.name}".replaceAll(" ", "\n"),
                textAlign: TextAlign.center,

                style: TextStyle(fontSize: 16, color: cWhiteWithOpacity),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

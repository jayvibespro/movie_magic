import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class SectionTitle extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  final Widget? trailing;
  const SectionTitle({
    super.key,
    required this.title,
    this.onTap,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          trailing ??
              InkWell(
                onTap: onTap,
                child: HeroIcon(HeroIcons.chevronRight, color: Colors.white),
              ),
        ],
      ),
    );
  }
}

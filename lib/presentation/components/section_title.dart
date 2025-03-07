import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class SectionTitle extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  final Widget? trailing;
  final bool showTrailing;

  const SectionTitle({
    super.key,
    required this.title,
    this.onTap,
    this.trailing,
    this.showTrailing = true,
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
          if (showTrailing)
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

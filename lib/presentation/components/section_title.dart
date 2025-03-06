import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class SectionTitle extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  const SectionTitle({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          InkWell(
            onTap: onTap,
            child: HeroIcon(HeroIcons.chevronRight, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

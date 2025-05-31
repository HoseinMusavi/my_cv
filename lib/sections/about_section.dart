import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../core/constants.dart';

class AboutSection extends StatelessWidget {
  final String Function(String) translate;
  const AboutSection({super.key, required this.translate});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      constraints: const BoxConstraints(maxWidth: kMaxSectionWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElasticIn(
            duration: const Duration(milliseconds: 800),
            child: Text(
              translate('about'),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          const SizedBox(height: 10),
          FadeInLeft(
            duration: const Duration(milliseconds: 900),
            child: Text(
              translate('about_me'),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}

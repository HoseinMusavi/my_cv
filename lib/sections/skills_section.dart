import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../core/constants.dart';

class SkillsSection extends StatelessWidget {
  final String Function(String) translate;
  const SkillsSection({super.key, required this.translate});

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
              translate('skills_title'),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          const SizedBox(height: 10),
          FadeInUp(
            duration: const Duration(milliseconds: 900),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: const [
                Chip(
                    label: Text('Dart'),
                    padding: EdgeInsets.symmetric(horizontal: 12)),
                Chip(
                    label: Text('C++'),
                    padding: EdgeInsets.symmetric(horizontal: 12)),
                Chip(
                    label: Text('C#'),
                    padding: EdgeInsets.symmetric(horizontal: 12)),
                Chip(
                    label: Text('Flutter'),
                    padding: EdgeInsets.symmetric(horizontal: 12)),
                Chip(
                    label: Text('Unity'),
                    padding: EdgeInsets.symmetric(horizontal: 12)),
                Chip(
                    label: Text('BLoC'),
                    padding: EdgeInsets.symmetric(horizontal: 12)),
                Chip(
                    label: Text('REST API'),
                    padding: EdgeInsets.symmetric(horizontal: 12)),
                Chip(
                    label: Text('Dio'),
                    padding: EdgeInsets.symmetric(horizontal: 12)),
                Chip(
                    label: Text('Hive'),
                    padding: EdgeInsets.symmetric(horizontal: 12)),
                Chip(
                    label: Text('SharedPreferences'),
                    padding: EdgeInsets.symmetric(horizontal: 12)),
                Chip(
                    label: Text('Adobe XD'),
                    padding: EdgeInsets.symmetric(horizontal: 12)),
                Chip(
                    label: Text('Photoshop'),
                    padding: EdgeInsets.symmetric(horizontal: 12)),
                Chip(
                    label: Text('UX Concepts'),
                    padding: EdgeInsets.symmetric(horizontal: 12)),
                Chip(
                    label: Text('Clean Architecture'),
                    padding: EdgeInsets.symmetric(horizontal: 12)),
                Chip(
                    label: Text('OOP'),
                    padding: EdgeInsets.symmetric(horizontal: 12)),
                Chip(
                    label: Text('Design Patterns'),
                    padding: EdgeInsets.symmetric(horizontal: 12)),
                Chip(
                    label: Text('Git'),
                    padding: EdgeInsets.symmetric(horizontal: 12)),
                Chip(
                    label: Text('GitHub'),
                    padding: EdgeInsets.symmetric(horizontal: 12)),
                Chip(
                    label: Text('Teamwork'),
                    padding: EdgeInsets.symmetric(horizontal: 12)),
                Chip(
                    label: Text('Time Management'),
                    padding: EdgeInsets.symmetric(horizontal: 12)),
                Chip(
                    label: Text('Problem-Solving'),
                    padding: EdgeInsets.symmetric(horizontal: 12)),
                Chip(
                    label: Text('Persian (Native)'),
                    padding: EdgeInsets.symmetric(horizontal: 12)),
                Chip(
                    label: Text('English (Fluent)'),
                    padding: EdgeInsets.symmetric(horizontal: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

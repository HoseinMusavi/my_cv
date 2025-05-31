import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../core/constants.dart';
import 'package:go_router/go_router.dart';

class HomeSection extends StatelessWidget {
  final String Function(String) translate;
  const HomeSection({super.key, required this.translate});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor.withOpacity(0.4),
            Theme.of(context).primaryColor.withOpacity(0.2)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      width: double.infinity,
      child: Column(
        children: [
          ElasticIn(
            duration: const Duration(milliseconds: 1000),
            child: CircleAvatar(
              radius: 60,
              backgroundImage: const NetworkImage(kProfileImageUrl),
              onBackgroundImageError: (exception, stackTrace) =>
                  const AssetImage('assets/images/placeholder.png'),
            ),
          ),
          const SizedBox(height: 20),
          FadeInUp(
            duration: const Duration(milliseconds: 800),
            child: Text(
              translate('name'),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          const SizedBox(height: 10),
          FadeInUp(
            duration: const Duration(milliseconds: 900),
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  translate('title'),
                  textStyle: Theme.of(context).textTheme.headlineSmall,
                  speed: const Duration(milliseconds: 100),
                ),
              ],
              totalRepeatCount: 1,
            ),
          ),
          const SizedBox(height: 20),
          FadeInUp(
            duration: const Duration(milliseconds: 1000),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => context.go('/contact'),
                  child: Text(translate('contact')),
                ),
                const SizedBox(width: 10),
                OutlinedButton(
                  onPressed: () => context.go('/projects'),
                  child: Text(translate('projects')),
                ),
                const SizedBox(width: 10),
                OutlinedButton(
                  onPressed: () => context.go('/resume'),
                  child: Text(translate('resume')),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

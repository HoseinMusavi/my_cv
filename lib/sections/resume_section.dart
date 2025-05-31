import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../core/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class ResumeSection extends StatelessWidget {
  final String Function(String) translate;
  const ResumeSection({super.key, required this.translate});

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
              translate('resume_title'),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          const SizedBox(height: 10),
          FadeInLeft(
            duration: const Duration(milliseconds: 900),
            child: Text(
              translate('resume_content'),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const SizedBox(height: 20),
          FadeInUp(
            duration: const Duration(milliseconds: 1000),
            child: ElevatedButton(
              onPressed: () async {
                final url = Uri.parse(kResumePdfUrl);
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                }
              },
              child: Text(translate('download_resume')),
            ),
          ),
        ],
      ),
    );
  }
}

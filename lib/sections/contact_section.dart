import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../core/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactSection extends StatefulWidget {
  final String Function(String) translate;
  const ContactSection({super.key, required this.translate});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

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
              widget.translate('contact_title'),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          const SizedBox(height: 10),
          FadeInLeft(
            duration: const Duration(milliseconds: 900),
            child: Text(
              widget.translate('contact_info'),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const SizedBox(height: 20),
          Form(
            key: _formKey,
            child: Column(
              children: [
                FadeInUp(
                  duration: const Duration(milliseconds: 950),
                  child: TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: widget.translate('contact_name'),
                      border: const OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return widget.translate('form_error');
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 10),
                FadeInUp(
                  duration: const Duration(milliseconds: 1000),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: widget.translate('contact_email'),
                      border: const OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return widget.translate('form_error');
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 10),
                FadeInUp(
                  duration: const Duration(milliseconds: 1050),
                  child: TextFormField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      labelText: widget.translate('contact_message'),
                      border: const OutlineInputBorder(),
                    ),
                    maxLines: 4,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return widget.translate('form_error');
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20),
                FadeInUp(
                  duration: const Duration(milliseconds: 1100),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final url = Uri.parse(
                          'mailto:$kEmail?subject=Contact from Resume Website&body=Name: ${_nameController.text}\nEmail: ${_emailController.text}\nMessage: ${_messageController.text}',
                        );
                        launchUrl(url);
                      }
                    },
                    child: Text(widget.translate('contact_send')),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          FadeInUp(
            duration: const Duration(milliseconds: 1150),
            child: Row(
              children: [
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.linkedin),
                  onPressed: () async {
                    final url = Uri.parse(kLinkedInUrl);
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    }
                  },
                  tooltip: 'LinkedIn',
                ),
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.github),
                  onPressed: () async {
                    final url = Uri.parse(kGitHubUrl);
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    }
                  },
                  tooltip: 'GitHub',
                ),
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.instagram),
                  onPressed: () async {
                    final url = Uri.parse(kInstagramUrl);
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    }
                  },
                  tooltip: 'Instagram',
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          FadeInUp(
            duration: const Duration(milliseconds: 1200),
            child: Text(
              widget.translate('footer'),
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}

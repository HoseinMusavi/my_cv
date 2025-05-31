import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animate_do/animate_do.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback toggleTheme;
  final String Function(String) translate;
  final Function(Locale) setLocale;
  final Function(int) scrollToSection;
  const CustomAppBar({
    super.key,
    required this.toggleTheme,
    required this.translate,
    required this.setLocale,
    required this.scrollToSection,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: ZoomIn(
        duration: const Duration(milliseconds: 800),
        child: Text(translate('app_title')),
      ),
      actions: [
        ZoomIn(
          duration: const Duration(milliseconds: 900),
          child: IconButton(
            icon: Icon(
              Theme.of(context).brightness == Brightness.light
                  ? FontAwesomeIcons.moon
                  : FontAwesomeIcons.sun,
            ),
            onPressed: toggleTheme,
            tooltip: translate('theme_toggle'),
          ),
        ),
        ZoomIn(
          duration: const Duration(milliseconds: 950),
          child: PopupMenuButton<Locale>(
            icon: const Icon(FontAwesomeIcons.language),
            onSelected: (Locale locale) {
              setLocale(locale);
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: const Locale('fa'),
                child: Text(translate('persian')),
              ),
              PopupMenuItem(
                value: const Locale('en'),
                child: Text(translate('english')),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () {
            context.go('/');
            scrollToSection(0);
          },
          child: Text(translate('home'),
              style: TextStyle(
                  color: Theme.of(context).appBarTheme.foregroundColor)),
        ),
        TextButton(
          onPressed: () {
            context.go('/about');
            scrollToSection(1);
          },
          child: Text(translate('about'),
              style: TextStyle(
                  color: Theme.of(context).appBarTheme.foregroundColor)),
        ),
        TextButton(
          onPressed: () {
            context.go('/skills');
            scrollToSection(2);
          },
          child: Text(translate('skills'),
              style: TextStyle(
                  color: Theme.of(context).appBarTheme.foregroundColor)),
        ),
        TextButton(
          onPressed: () {
            context.go('/projects');
            scrollToSection(3);
          },
          child: Text(translate('projects'),
              style: TextStyle(
                  color: Theme.of(context).appBarTheme.foregroundColor)),
        ),
        TextButton(
          onPressed: () {
            context.go('/resume');
            scrollToSection(4);
          },
          child: Text(translate('resume'),
              style: TextStyle(
                  color: Theme.of(context).appBarTheme.foregroundColor)),
        ),
        TextButton(
          onPressed: () {
            context.go('/contact');
            scrollToSection(5);
          },
          child: Text(translate('contact'),
              style: TextStyle(
                  color: Theme.of(context).appBarTheme.foregroundColor)),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

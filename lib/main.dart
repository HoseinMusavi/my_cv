import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'sections/home_section.dart';
import 'sections/about_section.dart';
import 'sections/skills_section.dart';
import 'sections/projects_section.dart';
import 'sections/resume_section.dart';
import 'sections/contact_section.dart';
import 'widgets/custom_app_bar.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(const MyResumeWebsite());
}

class MyResumeWebsite extends StatefulWidget {
  const MyResumeWebsite({super.key});

  @override
  State<MyResumeWebsite> createState() => _MyResumeWebsiteState();
}

class _MyResumeWebsiteState extends State<MyResumeWebsite> {
  bool _isDarkMode = true;
  Locale _locale = const Locale('fa');
  Map<String, String> _localizedStrings = {};
  final ScrollController _scrollController = ScrollController();

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  Future<void> _loadLocale(Locale locale) async {
    try {
      final String jsonString =
          await rootBundle.loadString('lib/l10n/${locale.languageCode}.json');
      setState(() {
        _localizedStrings = Map<String, String>.from(jsonDecode(jsonString));
        _locale = locale;
      });
    } catch (e) {
      print('Error loading locale: $e');
    }
  }

  String translate(String key) => _localizedStrings[key] ?? key;

  void _scrollToSection(int index) {
    final double offset = index * 600.0;
    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    super.initState();
    _loadLocale(_locale);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      locale: _locale,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa'),
        Locale('en'),
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.grey[100],
        textTheme: GoogleFonts.vazirmatnTextTheme(
          ThemeData.light().textTheme.copyWith(
                headlineMedium: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
                headlineSmall:
                    const TextStyle(fontSize: 20, color: Colors.black54),
                bodyMedium:
                    const TextStyle(fontSize: 16, color: Colors.black87),
              ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            elevation: 3,
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.blue,
            side: const BorderSide(color: Colors.blue),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
        ),
        cardTheme: CardTheme(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          margin: const EdgeInsets.symmetric(vertical: 10),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.blue, width: 2),
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          elevation: 4,
        ),
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.grey[900],
        textTheme: GoogleFonts.vazirmatnTextTheme(
          ThemeData.dark().textTheme.copyWith(
                headlineMedium: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                headlineSmall:
                    const TextStyle(fontSize: 20, color: Colors.white70),
                bodyMedium:
                    const TextStyle(fontSize: 16, color: Colors.white70),
              ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue[700],
            foregroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            elevation: 3,
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.blue[300],
            side: BorderSide(color: Colors.blue[300]!),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
        ),
        cardTheme: CardTheme(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          margin: const EdgeInsets.symmetric(vertical: 10),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[800],
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.blue[300]!, width: 2),
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue[900],
          foregroundColor: Colors.white,
          elevation: 4,
        ),
      ),
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      routerConfig: GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => ResumeHomePage(
              toggleTheme: _toggleTheme,
              translate: translate,
              setLocale: _loadLocale,
              scrollToSection: _scrollToSection,
            ),
          ),
          GoRoute(
            path: '/about',
            builder: (context, state) => Scaffold(
              appBar: CustomAppBar(
                toggleTheme: _toggleTheme,
                translate: translate,
                setLocale: _loadLocale,
                scrollToSection: _scrollToSection,
              ),
              body: AboutSection(translate: translate),
            ),
          ),
          GoRoute(
            path: '/skills',
            builder: (context, state) => Scaffold(
              appBar: CustomAppBar(
                toggleTheme: _toggleTheme,
                translate: translate,
                setLocale: _loadLocale,
                scrollToSection: _scrollToSection,
              ),
              body: SkillsSection(translate: translate),
            ),
          ),
          GoRoute(
            path: '/projects',
            builder: (context, state) => Scaffold(
              appBar: CustomAppBar(
                toggleTheme: _toggleTheme,
                translate: translate,
                setLocale: _loadLocale,
                scrollToSection: _scrollToSection,
              ),
              body: ProjectsSection(translate: translate),
            ),
          ),
          GoRoute(
            path: '/resume',
            builder: (context, state) => Scaffold(
              appBar: CustomAppBar(
                toggleTheme: _toggleTheme,
                translate: translate,
                setLocale: _loadLocale,
                scrollToSection: _scrollToSection,
              ),
              body: ResumeSection(translate: translate),
            ),
          ),
          GoRoute(
            path: '/contact',
            builder: (context, state) => Scaffold(
              appBar: CustomAppBar(
                toggleTheme: _toggleTheme,
                translate: translate,
                setLocale: _loadLocale,
                scrollToSection: _scrollToSection,
              ),
              body: ContactSection(translate: translate),
            ),
          ),
        ],
      ),
    );
  }
}

class ResumeHomePage extends StatelessWidget {
  final VoidCallback toggleTheme;
  final String Function(String) translate;
  final Function(Locale) setLocale;
  final Function(int) scrollToSection;
  const ResumeHomePage({
    super.key,
    required this.toggleTheme,
    required this.translate,
    required this.setLocale,
    required this.scrollToSection,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        toggleTheme: toggleTheme,
        translate: translate,
        setLocale: setLocale,
        scrollToSection: scrollToSection,
      ),
      body: SingleChildScrollView(
        controller: context
            .findAncestorStateOfType<_MyResumeWebsiteState>()!
            ._scrollController,
        child: Column(
          children: [
            HomeSection(translate: translate),
            AboutSection(translate: translate),
            SkillsSection(translate: translate),
            ProjectsSection(translate: translate),
            ResumeSection(translate: translate),
            ContactSection(translate: translate),
          ],
        ),
      ),
    );
  }
}

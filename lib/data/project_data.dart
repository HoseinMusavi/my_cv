class Project {
  final String titleKey;
  final String descriptionKey;
  final List<String> technologies;
  final String imagePath;
  final String? link;

  Project({
    required this.titleKey,
    required this.descriptionKey,
    required this.technologies,
    required this.imagePath,
    this.link,
  });
}

final List<Project> projects = [
  Project(
    titleKey: 'ghese_shab_project_title',
    descriptionKey: 'ghese_shab_project_desc',
    technologies: [
      'Flutter',
      'BLoC',
      'Clean Architecture',
      'Hive',
      'SharedPreferences'
    ],
    imagePath: 'assets/images/ghese_shab.png',
    link:
        'https://github.com/HoseinMusavi/ghese_shab_app/tree/main/gheseh_shab',
  ),
  Project(
    titleKey: 'cavallo_project_title',
    descriptionKey: 'cavallo_project_desc',
    technologies: ['Flutter', 'REST API'],
    imagePath: 'assets/images/cavallo.png',
    link: 'https://github.com/HoseinMusavi/cavalloapp',
  ),
];

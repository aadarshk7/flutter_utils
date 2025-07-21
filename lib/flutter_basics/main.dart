import 'package:flutter/material.dart';

import 'lesson_01_basic_widgets.dart';
import 'lesson_02_layouts.dart';
import 'lesson_03_state_management.dart';
import 'lesson_04_navigation.dart';
import 'lesson_05_forms_input.dart';
import 'lesson_06_lists_grids.dart';

void main() {
  runApp(const FlutterBasicsApp());
}

class FlutterBasicsApp extends StatelessWidget {
  const FlutterBasicsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Basics Tutorial',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const LessonMenu(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LessonMenu extends StatelessWidget {
  const LessonMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final lessons = [
      {
        'title': 'Lesson 1: Basic Widgets',
        'subtitle': 'Text, Container, Image, Icon',
        'icon': Icons.widgets,
        'page': const BasicWidgetsLesson(),
      },
      {
        'title': 'Lesson 2: Layouts',
        'subtitle': 'Row, Column, Stack, Flex',
        'icon': Icons.view_quilt,
        'page': const LayoutsLesson(),
      },
      {
        'title': 'Lesson 3: State Management',
        'subtitle': 'StatefulWidget, setState',
        'icon': Icons.refresh,
        'page': const StateManagementLesson(),
      },
      {
        'title': 'Lesson 4: Navigation',
        'subtitle': 'Routes, Navigator, Pages',
        'icon': Icons.navigation,
        'page': const NavigationLesson(),
      },
      {
        'title': 'Lesson 5: Forms & Input',
        'subtitle': 'TextFields, Buttons, Forms',
        'icon': Icons.input,
        'page': const FormsInputLesson(),
      },
      {
        'title': 'Lesson 6: Lists & Grids',
        'subtitle': 'ListView, GridView, Cards',
        'icon': Icons.list,
        'page': const ListsGridsLesson(),
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Basics Tutorial'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade50,
              Colors.white,
            ],
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: lessons.length,
          itemBuilder: (context, index) {
            final lesson = lessons[index];
            return Card(
              elevation: 4,
              margin: const EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(
                    lesson['icon'] as IconData,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  lesson['title'] as String,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    lesson['subtitle'] as String,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.blue,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => lesson['page'] as Widget,
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

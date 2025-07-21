import 'package:flutter/material.dart';

class BasicWidgetsLesson extends StatelessWidget {
  const BasicWidgetsLesson({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lesson 1: Basic Widgets'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section Title
            const Text(
              'Basic Flutter Widgets',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),

            // Text Widget Example
            _buildSection(
              'Text Widget',
              'The Text widget displays text on the screen.',
              [
                const Text('Hello, Flutter!'),
                const SizedBox(height: 8),
                const Text(
                  'Styled Text',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Text with different styling',
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline,
                    color: Colors.green,
                  ),
                ),
              ],
            ),

            // Container Widget Example
            _buildSection(
              'Container Widget',
              'Container is like a box that can hold other widgets.',
              [
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                  child: const Center(
                    child: Text(
                      'Box',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.blue, width: 2),
                  ),
                  child: const Text('Decorated Container'),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 200,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.purple, Colors.pink],
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Center(
                    child: Text(
                      'Gradient Container',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Icon Widget Example
            _buildSection(
              'Icon Widget',
              'Icons are pre-built symbols you can use in your app.',
              [
                const Row(
                  children: [
                    Icon(Icons.home, size: 30, color: Colors.blue),
                    SizedBox(width: 16),
                    Icon(Icons.favorite, size: 30, color: Colors.red),
                    SizedBox(width: 16),
                    Icon(Icons.star, size: 30, color: Colors.orange),
                    SizedBox(width: 16),
                    Icon(Icons.settings, size: 30, color: Colors.grey),
                  ],
                ),
                const SizedBox(height: 16),
                const Row(
                  children: [
                    Icon(Icons.phone, size: 24),
                    SizedBox(width: 8),
                    Text('Call Me'),
                  ],
                ),
              ],
            ),

            // Image Widget Example
            _buildSection(
              'Image Widget',
              'Display images from assets, network, or files.',
              [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.image,
                    size: 50,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Image placeholder (add real images to assets folder)',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),

            // Button Examples
            _buildSection(
              'Button Widgets',
              'Different types of buttons for user interaction.',
              [
                ElevatedButton(
                  onPressed: () {
                    _showSnackBar(context, 'Elevated Button Pressed!');
                  },
                  child: const Text('Elevated Button'),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () {
                    _showSnackBar(context, 'Text Button Pressed!');
                  },
                  child: const Text('Text Button'),
                ),
                const SizedBox(height: 8),
                OutlinedButton(
                  onPressed: () {
                    _showSnackBar(context, 'Outlined Button Pressed!');
                  },
                  child: const Text('Outlined Button'),
                ),
                const SizedBox(height: 8),
                IconButton(
                  onPressed: () {
                    _showSnackBar(context, 'Icon Button Pressed!');
                  },
                  icon: const Icon(Icons.thumb_up),
                ),
              ],
            ),

            // Code Example
            _buildCodeExample(),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String description, List<Widget> widgets) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widgets,
          ),
        ),
      ],
    );
  }

  Widget _buildCodeExample() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        const Text(
          'Code Example',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              '''Text('Hello, Flutter!')
Container(
  padding: EdgeInsets.all(16),
  decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(8),
  ),
  child: Text('Container with decoration'),
)
Icon(Icons.favorite, color: Colors.red)
ElevatedButton(
  onPressed: () {},
  child: Text('Button'),
)''',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'monospace',
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

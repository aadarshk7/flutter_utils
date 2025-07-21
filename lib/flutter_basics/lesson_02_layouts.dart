import 'package:flutter/material.dart';

class LayoutsLesson extends StatelessWidget {
  const LayoutsLesson({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lesson 2: Layouts'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Flutter Layout Widgets',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 16),

            // Row Layout
            _buildSection(
              'Row Widget',
              'Arranges widgets horizontally (side by side).',
              [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        color: Colors.red,
                        child: const Center(child: Text('1')),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 50,
                        height: 50,
                        color: Colors.blue,
                        child: const Center(child: Text('2')),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 50,
                        height: 50,
                        color: Colors.orange,
                        child: const Center(child: Text('3')),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                const Text('Row with MainAxisAlignment.spaceEvenly:'),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.home, color: Colors.blue),
                      Icon(Icons.favorite, color: Colors.red),
                      Icon(Icons.star, color: Colors.orange),
                    ],
                  ),
                ),
              ],
            ),

            // Column Layout
            _buildSection(
              'Column Widget',
              'Arranges widgets vertically (top to bottom).',
              [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 80,
                        height: 30,
                        color: Colors.purple,
                        child: const Center(child: Text('Top')),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: 80,
                        height: 30,
                        color: Colors.teal,
                        child: const Center(child: Text('Middle')),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: 80,
                        height: 30,
                        color: Colors.pink,
                        child: const Center(child: Text('Bottom')),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Stack Layout
            _buildSection(
              'Stack Widget',
              'Stacks widgets on top of each other (like layers).',
              [
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Stack(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        color: Colors.blue.shade200,
                        child: const Center(child: Text('Background')),
                      ),
                      Positioned(
                        top: 20,
                        left: 20,
                        child: Container(
                          width: 80,
                          height: 80,
                          color: Colors.red.shade300,
                          child: const Center(child: Text('Middle')),
                        ),
                      ),
                      Positioned(
                        top: 40,
                        left: 40,
                        child: Container(
                          width: 40,
                          height: 40,
                          color: Colors.yellow,
                          child: const Center(child: Text('Top')),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Expanded and Flexible
            _buildSection(
              'Expanded & Flexible',
              'Control how widgets fill available space.',
              [
                const Text('Expanded widgets (fill available space):'),
                const SizedBox(height: 8),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.red.shade200,
                          child: const Center(child: Text('1 flex')),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          color: Colors.blue.shade200,
                          child: const Center(child: Text('2 flex')),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.green.shade200,
                          child: const Center(child: Text('1 flex')),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Padding and Margin
            _buildSection(
              'Padding & Margin',
              'Add space around and inside widgets.',
              [
                const Text('Padding (space inside):'),
                const SizedBox(height: 8),
                Container(
                  color: Colors.blue.shade100,
                  child: const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text('This text has padding'),
                  ),
                ),
                const SizedBox(height: 16),
                const Text('Margin (space outside):'),
                const SizedBox(height: 8),
                Container(
                  color: Colors.grey.shade200,
                  child: Container(
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.all(8),
                    color: Colors.orange.shade200,
                    child: const Text('This container has margin'),
                  ),
                ),
              ],
            ),

            // Alignment
            _buildSection(
              'Alignment',
              'Control how widgets are positioned.',
              [
                const Text('Center alignment:'),
                const SizedBox(height: 8),
                Container(
                  height: 80,
                  width: double.infinity,
                  color: Colors.grey.shade200,
                  child: const Center(
                    child: Text('Centered Text'),
                  ),
                ),
                const SizedBox(height: 12),
                const Text('Different alignments in Container:'),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 60,
                        color: Colors.red.shade100,
                        alignment: Alignment.topLeft,
                        child: const Text('Top Left'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Container(
                        height: 60,
                        color: Colors.blue.shade100,
                        alignment: Alignment.center,
                        child: const Text('Center'),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Container(
                        height: 60,
                        color: Colors.green.shade100,
                        alignment: Alignment.bottomRight,
                        child: const Text('Bottom Right'),
                      ),
                    ),
                  ],
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
              '''Row(
  children: [
    Icon(Icons.home),
    SizedBox(width: 8),
    Text('Home'),
  ],
)

Column(
  children: [
    Text('Title'),
    SizedBox(height: 8),
    Text('Description'),
  ],
)

Stack(
  children: [
    Container(color: Colors.blue),
    Positioned(
      top: 10,
      left: 10,
      child: Text('Overlay'),
    ),
  ],
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
}

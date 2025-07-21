import 'package:flutter/material.dart';

class ListsGridsLesson extends StatefulWidget {
  const ListsGridsLesson({super.key});

  @override
  State<ListsGridsLesson> createState() => _ListsGridsLessonState();
}

class _ListsGridsLessonState extends State<ListsGridsLesson> {
  final List<String> items = List.generate(20, (index) => 'Item ${index + 1}');
  final List<Person> people = [
    Person('Alice', 28, Icons.person),
    Person('Bob', 32, Icons.person_outline),
    Person('Charlie', 25, Icons.face),
    Person('Diana', 30, Icons.account_circle),
    Person('Eve', 27, Icons.person_2),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lesson 6: Lists & Grids'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Lists and Grids in Flutter',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Lists and grids are used to display multiple items in a scrollable format.',
              style: TextStyle(fontSize: 16),
            ),

            // Simple List
            _buildSection(
              'Simple ListView',
              'A basic scrollable list of widgets.',
              [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListView(
                    children: const [
                      ListTile(
                        leading: Icon(Icons.home),
                        title: Text('Home'),
                        subtitle: Text('Go to home page'),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        leading: Icon(Icons.settings),
                        title: Text('Settings'),
                        subtitle: Text('App settings'),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        leading: Icon(Icons.help),
                        title: Text('Help'),
                        subtitle: Text('Get help'),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        leading: Icon(Icons.info),
                        title: Text('About'),
                        subtitle: Text('About this app'),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // ListView.builder
            _buildSection(
              'ListView.builder',
              'Efficiently builds lists with many items.',
              [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.teal,
                          child: Text('${index + 1}'),
                        ),
                        title: Text(items[index]),
                        subtitle: Text('Description for ${items[index]}'),
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Tapped on ${items[index]}')),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),

            // Custom List with Cards
            _buildSection(
              'Custom List with Cards',
              'Using cards to create attractive list items.',
              [
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    itemCount: people.length,
                    itemBuilder: (context, index) {
                      final person = people[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 8),
                        elevation: 2,
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.teal,
                            child: Icon(person.icon, color: Colors.white),
                          ),
                          title: Text(person.name),
                          subtitle: Text('Age: ${person.age}'),
                          trailing: const Icon(Icons.more_vert),
                          onTap: () {
                            _showPersonDetails(person);
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),

            // GridView
            _buildSection(
              'GridView',
              'Display items in a grid layout.',
              [
                SizedBox(
                  height: 200,
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 1.5,
                    ),
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.teal.shade100,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.teal.shade300),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              _getIconForIndex(index),
                              size: 30,
                              color: Colors.teal,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Grid ${index + 1}',
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),

            // Grid with Images
            _buildSection(
              'Image Grid',
              'Grid layout with image placeholders.',
              [
                SizedBox(
                  height: 200,
                  child: GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                    children: List.generate(9, (index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.image,
                              size: 40,
                              color: Colors.grey,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Photo ${index + 1}',
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),

            // Horizontal List
            _buildSection(
              'Horizontal ListView',
              'Scrollable list in horizontal direction.',
              [
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 100,
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color: Colors.teal.shade100,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.teal.shade300),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.teal,
                              size: 30,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Item ${index + 1}',
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),

            // Interactive List
            _buildSection(
              'Interactive List',
              'List with swipe-to-delete and reordering.',
              [
                SizedBox(
                  height: 200,
                  child: ReorderableListView.builder(
                    itemCount: people.length,
                    itemBuilder: (context, index) {
                      final person = people[index];
                      return Dismissible(
                        key: Key(person.name),
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20),
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                        onDismissed: (direction) {
                          setState(() {
                            people.removeAt(index);
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('${person.name} deleted')),
                          );
                        },
                        child: Card(
                          margin: const EdgeInsets.symmetric(vertical: 2),
                          child: ListTile(
                            leading: Icon(person.icon),
                            title: Text(person.name),
                            subtitle: Text('Age: ${person.age}'),
                            trailing: const Icon(Icons.drag_handle),
                          ),
                        ),
                      );
                    },
                    onReorder: (oldIndex, newIndex) {
                      setState(() {
                        if (newIndex > oldIndex) {
                          newIndex -= 1;
                        }
                        final person = people.removeAt(oldIndex);
                        people.insert(newIndex, person);
                      });
                    },
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Tip: Swipe left to delete, drag to reorder',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,
                  ),
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

  void _showPersonDetails(Person person) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(person.name),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(person.icon, size: 50, color: Colors.teal),
              const SizedBox(height: 16),
              Text('Age: ${person.age}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  IconData _getIconForIndex(int index) {
    final icons = [
      Icons.home,
      Icons.work,
      Icons.school,
      Icons.favorite,
      Icons.star,
      Icons.settings,
      Icons.help,
      Icons.info,
    ];
    return icons[index % icons.length];
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
              '''// ListView.builder
ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) {
    return ListTile(
      title: Text(items[index]),
      onTap: () {
        // Handle tap
      },
    );
  },
)

// GridView
GridView.builder(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 8,
    mainAxisSpacing: 8,
  ),
  itemBuilder: (context, index) {
    return Container(
      child: Text('Grid \$index'),
    );
  },
)

// Card in ListView
Card(
  child: ListTile(
    leading: Icon(Icons.person),
    title: Text('Name'),
    subtitle: Text('Description'),
    trailing: Icon(Icons.arrow_forward),
  ),
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

class Person {
  final String name;
  final int age;
  final IconData icon;

  Person(this.name, this.age, this.icon);
}

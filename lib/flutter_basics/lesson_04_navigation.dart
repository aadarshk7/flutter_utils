import 'package:flutter/material.dart';

class NavigationLesson extends StatelessWidget {
  const NavigationLesson({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lesson 4: Navigation'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Navigation in Flutter',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Navigation allows users to move between different screens (pages) in your app.',
              style: TextStyle(fontSize: 16),
            ),

            // Basic Navigation
            _buildSection(
              'Basic Navigation',
              'Navigate to new screens and go back.',
              [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      // ignore: inference_failure_on_instance_creation
                      MaterialPageRoute(
                        builder: (context) => const SecondPage(title: 'Basic Navigation'),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Go to Second Page'),
                ),
                const SizedBox(height: 12),
                const Text(
                  'This uses Navigator.push() to go to a new page.\n'
                  'The back button will automatically appear.',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),

            // Navigation with Data
            _buildSection(
              'Pass Data to New Page',
              'Send information to the next screen.',
              [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DataPage(
                          message: 'Hello from Navigation Lesson!',
                          number: 42,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Send Data to New Page'),
                ),
              ],
            ),

            // Navigation with Return Data
            _buildSection(
              'Get Data Back from Page',
              'Receive data when returning from a page.',
              [
                ElevatedButton(
                  onPressed: () async {
                    final result = await Navigator.push<String>(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const InputPage(),
                      ),
                    );

                    if (result != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('You entered: $result'),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Go to Input Page'),
                ),
                const SizedBox(height: 8),
                const Text(
                  'This page will return data when you go back.',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),

            // Named Routes Example
            _buildSection(
              'Named Routes',
              'Use route names instead of direct page references.',
              [
                const Text(
                  'Named routes make navigation more organized in larger apps.',
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    // In a real app, you would set up named routes in main.dart
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SecondPage(
                          title: 'Named Route Example',
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Example Named Route'),
                ),
              ],
            ),

            // Tab Navigation
            _buildSection(
              'Tab Navigation',
              'Navigate between tabs within the same screen.',
              [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TabNavigationExample(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('See Tab Navigation'),
                ),
              ],
            ),

            // Drawer Navigation
            _buildSection(
              'Drawer Navigation',
              'Side menu navigation.',
              [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DrawerNavigationExample(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('See Drawer Navigation'),
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
              '''// Navigate to new page
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => SecondPage(),
  ),
);

// Go back to previous page
Navigator.pop(context);

// Pass data to new page
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => SecondPage(data: 'Hello'),
  ),
);

// Get data back from page
final result = await Navigator.push<String>(
  context,
  MaterialPageRoute(builder: (context) => InputPage()),
);''',
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

// Second Page Example
class SecondPage extends StatelessWidget {
  final String title;

  const SecondPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle,
              size: 80,
              color: Colors.green,
            ),
            const SizedBox(height: 20),
            Text(
              'Welcome to $title!',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'This is a new page. Press the back button or\nuse the gesture to go back.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}

// Data Page Example
class DataPage extends StatelessWidget {
  final String message;
  final int number;

  const DataPage({super.key, required this.message, required this.number});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Received'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.mail,
              size: 80,
              color: Colors.blue,
            ),
            const SizedBox(height: 20),
            const Text(
              'Data Received:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue.shade200),
              ),
              child: Column(
                children: [
                  Text('Message: $message', style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 8),
                  Text('Number: $number', style: const TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Input Page Example
class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Page'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter some text:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Type something...',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, _controller.text);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              child: const Text('Return Data'),
            ),
          ],
        ),
      ),
    );
  }
}

// Tab Navigation Example
class TabNavigationExample extends StatelessWidget {
  const TabNavigationExample({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tab Navigation'),
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
          bottom: const TabBar(
            labelColor: Colors.white,
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.search), text: 'Search'),
              Tab(icon: Icon(Icons.person), text: 'Profile'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('Home Tab', style: TextStyle(fontSize: 24))),
            Center(child: Text('Search Tab', style: TextStyle(fontSize: 24))),
            Center(child: Text('Profile Tab', style: TextStyle(fontSize: 24))),
          ],
        ),
      ),
    );
  }
}

// Drawer Navigation Example
class DrawerNavigationExample extends StatelessWidget {
  const DrawerNavigationExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer Navigation'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.indigo),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text(
          'Swipe from left or tap the menu button\nto open the drawer!',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

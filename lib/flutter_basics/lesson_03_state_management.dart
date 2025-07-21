import 'package:flutter/material.dart';

class StateManagementLesson extends StatefulWidget {
  const StateManagementLesson({super.key});

  @override
  State<StateManagementLesson> createState() => _StateManagementLessonState();
}

class _StateManagementLessonState extends State<StateManagementLesson> {
  // State variables
  int _counter = 0;
  String _text = 'Hello, Flutter!';
  bool _isVisible = true;
  Color _containerColor = Colors.blue;
  double _sliderValue = 50.0;
  String _selectedOption = 'Option 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lesson 3: State Management'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'State Management in Flutter',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'State is information that can change during the lifetime of a widget. '
              'When state changes, the UI updates automatically.',
              style: TextStyle(fontSize: 16),
            ),

            // Counter Example
            _buildSection(
              'Counter Example',
              'A simple counter that increases when you tap a button.',
              [
                Center(
                  child: Column(
                    children: [
                      const Text(
                        'You have pushed the button this many times:',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '$_counter',
                        style: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _counter++;
                              });
                            },
                            child: const Text('Increment'),
                          ),
                          const SizedBox(width: 16),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _counter--;
                              });
                            },
                            child: const Text('Decrement'),
                          ),
                          const SizedBox(width: 16),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _counter = 0;
                              });
                            },
                            child: const Text('Reset'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Text Changing Example
            _buildSection(
              'Text Changing Example',
              'Change text content using setState().',
              [
                Center(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.purple.shade50,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.purple.shade200),
                        ),
                        child: Text(
                          _text,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 8,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _text = 'Hello, Flutter!';
                              });
                            },
                            child: const Text('Hello'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _text = 'Welcome to Flutter!';
                              });
                            },
                            child: const Text('Welcome'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _text = 'Flutter is awesome!';
                              });
                            },
                            child: const Text('Awesome'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Visibility Toggle Example
            _buildSection(
              'Visibility Toggle',
              'Show and hide widgets using boolean state.',
              [
                Center(
                  child: Column(
                    children: [
                      AnimatedOpacity(
                        opacity: _isVisible ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 300),
                        child: Container(
                          width: 150,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(
                            child: Text(
                              'I can hide!',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _isVisible = !_isVisible;
                          });
                        },
                        child: Text(_isVisible ? 'Hide' : 'Show'),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Color Changing Example
            _buildSection(
              'Color Changing',
              'Change colors dynamically using state.',
              [
                Center(
                  child: Column(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          color: _containerColor,
                          borderRadius: BorderRadius.circular(60),
                        ),
                        child: const Icon(
                          Icons.palette,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 8,
                        children: [
                          _colorButton(Colors.blue),
                          _colorButton(Colors.red),
                          _colorButton(Colors.green),
                          _colorButton(Colors.orange),
                          _colorButton(Colors.purple),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Slider Example
            _buildSection(
              'Slider Example',
              'Use slider to change values dynamically.',
              [
                Column(
                  children: [
                    Text(
                      'Slider Value: ${_sliderValue.round()}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 8),
                    Slider(
                      value: _sliderValue,
                      min: 0,
                      max: 100,
                      divisions: 10,
                      label: _sliderValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _sliderValue = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    LinearProgressIndicator(
                      value: _sliderValue / 100,
                      backgroundColor: Colors.grey.shade300,
                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.purple),
                    ),
                  ],
                ),
              ],
            ),

            // Dropdown Example
            _buildSection(
              'Dropdown Example',
              'Select from multiple options.',
              [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Selected Option:'),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.purple.shade50,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        _selectedOption,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    DropdownButton<String>(
                      value: _selectedOption,
                      isExpanded: true,
                      items: ['Option 1', 'Option 2', 'Option 3', 'Option 4'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedOption = newValue!;
                        });
                      },
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

  Widget _colorButton(Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _containerColor = color;
        });
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: _containerColor == color ? Border.all(color: Colors.black, width: 3) : null,
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
              '''class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Count: \$_counter'),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _counter++;
            });
          },
          child: Text('Increment'),
        ),
      ],
    );
  }
}''',
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

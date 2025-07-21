import 'package:flutter/material.dart';

class FormsInputLesson extends StatefulWidget {
  const FormsInputLesson({super.key});

  @override
  State<FormsInputLesson> createState() => _FormsInputLessonState();
}

class _FormsInputLessonState extends State<FormsInputLesson> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _messageController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _agreeToTerms = false;
  String _selectedGender = 'Male';
  double _age = 25;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lesson 5: Forms & Input'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Forms and Input in Flutter',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Forms allow users to input data. Flutter provides various input widgets.',
              style: TextStyle(fontSize: 16),
            ),

            // Basic Text Fields
            _buildSection(
              'Text Input Fields',
              'Basic text input with different configurations.',
              [
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    hintText: 'Enter your name',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                  onChanged: (value) {
                    // Handle text changes
                  },
                ),
                const SizedBox(height: 16),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                  obscureText: !_isPasswordVisible,
                ),
              ],
            ),

            // Multi-line Text Field
            _buildSection(
              'Multi-line Text Field',
              'For longer text input like messages or comments.',
              [
                const TextField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    labelText: 'Message',
                    hintText: 'Enter your message here...',
                    border: OutlineInputBorder(),
                    alignLabelWithHint: true,
                  ),
                ),
              ],
            ),

            // Checkboxes and Switches
            _buildSection(
              'Checkboxes and Switches',
              'For boolean (yes/no) inputs.',
              [
                CheckboxListTile(
                  title: const Text('I agree to the terms and conditions'),
                  value: _agreeToTerms,
                  onChanged: (bool? value) {
                    setState(() {
                      _agreeToTerms = value ?? false;
                    });
                  },
                ),
                const SizedBox(height: 8),
                SwitchListTile(
                  title: const Text('Enable notifications'),
                  value: _agreeToTerms,
                  onChanged: (bool value) {
                    setState(() {
                      _agreeToTerms = value;
                    });
                  },
                ),
              ],
            ),

            // Radio Buttons
            _buildSection(
              'Radio Buttons',
              'For selecting one option from multiple choices.',
              [
                const Text('Select Gender:', style: TextStyle(fontWeight: FontWeight.bold)),
                RadioListTile<String>(
                  title: const Text('Male'),
                  value: 'Male',
                  groupValue: _selectedGender,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedGender = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Female'),
                  value: 'Female',
                  groupValue: _selectedGender,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedGender = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Other'),
                  value: 'Other',
                  groupValue: _selectedGender,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedGender = value!;
                    });
                  },
                ),
              ],
            ),

            // Slider
            _buildSection(
              'Slider Input',
              'For selecting numeric values within a range.',
              [
                Text('Age: ${_age.round()} years', style: const TextStyle(fontSize: 16)),
                Slider(
                  value: _age,
                  min: 18,
                  max: 100,
                  divisions: 82,
                  label: _age.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _age = value;
                    });
                  },
                ),
              ],
            ),

            // Complete Form Example
            _buildSection(
              'Complete Form with Validation',
              'A full form with validation and submission.',
              [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          labelText: 'Full Name',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!value.contains('@')) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _messageController,
                        decoration: const InputDecoration(
                          labelText: 'Message',
                          border: OutlineInputBorder(),
                          alignLabelWithHint: true,
                        ),
                        maxLines: 3,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a message';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _submitForm,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: const Text('Submit Form', style: TextStyle(fontSize: 16)),
                        ),
                      ),
                    ],
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

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, process the data
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Form Submitted!'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name: ${_nameController.text}'),
                Text('Email: ${_emailController.text}'),
                Text('Gender: $_selectedGender'),
                Text('Age: ${_age.round()}'),
                Text('Message: ${_messageController.text}'),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  _clearForm();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  void _clearForm() {
    _nameController.clear();
    _emailController.clear();
    _passwordController.clear();
    _messageController.clear();
    setState(() {
      _selectedGender = 'Male';
      _age = 25;
      _agreeToTerms = false;
    });
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
              '''// Basic TextField
TextField(
  decoration: InputDecoration(
    labelText: 'Name',
    hintText: 'Enter your name',
    border: OutlineInputBorder(),
    prefixIcon: Icon(Icons.person),
  ),
)

// Form with validation
Form(
  key: _formKey,
  child: Column(
    children: [
      TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
      ),
      ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            // Process data
          }
        },
        child: Text('Submit'),
      ),
    ],
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

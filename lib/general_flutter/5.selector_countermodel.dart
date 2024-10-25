import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Model that extends ChangeNotifier
class CounterModel extends ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }

  void reset() {
    _counter = 0;
    notifyListeners();
  }
}

void main() {
  runApp(
    // Wrap the app with ChangeNotifierProvider
    ChangeNotifierProvider(
      create: (context) => CounterModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selector Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),

            // Using Selector to rebuild only when counter value changes
            Selector<CounterModel, int>(
              selector: (_, counterModel) => counterModel.counter,
              builder: (context, counter, child) {
                return Text(
                  '$counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Accessing the whole model but not rebuilding
                context.read<CounterModel>().increment();
              },
              child: const Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}

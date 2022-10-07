import 'package:flutter/material.dart';

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pick an option')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, 'Yep');
                },
                child: const Text('Yep')),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, 'Nope');
                },
                child: const Text('Nope'))
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'second_route.dart';
import 'extract_arguments.dart';
import 'screen_arguments.dart';
import 'pass_arguments.dart';
import 'selection_button.dart';

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Second Screen'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/second');
              },
            ),
            ListTile(
              title: const Text('Passed Argument'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(
                  context,
                  PassArgumentsScreen.routeName,
                  arguments: ScreenArguments(
                    'Accept Arguments Screen',
                    'This message is extracted in the onGenerateRoute '
                        'function.',
                  ),
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('First Route'),
      ),
      body: Center(
          child: Column(
        children: [
          //go to Second Route
          ElevatedButton(
              child: const Text('Go to Second route'),
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              }),

          //go to extract_arguments.dart
          ElevatedButton(
            child: const Text('Go to Extract Arguments'),
            onPressed: () {
              // When the user taps the button,
              // navigate to a named route and
              // provide the arguments as an optional
              // parameter.
              Navigator.pushNamed(
                context,
                ExtractArgumentsScreen.routeName,
                arguments: ScreenArguments(
                  'Extract Arguments Screen',
                  'This message is extracted in the build method.',
                ),
              );
            },
          ),

          //go to pass_argument
          ElevatedButton(
              child: const Text('Go to Pass Arguments'),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  PassArgumentsScreen.routeName,
                  arguments: ScreenArguments(
                    'Accept Arguments Screen',
                    'This message is extracted in the onGenerateRoute '
                        'function.',
                  ),
                );
              }),

          //go to sellection screen
          SelectionButton(),
        ],
      )),
    );
  }
}

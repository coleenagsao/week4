import 'package:flutter/material.dart';
import 'first_route.dart';
import 'second_route.dart';
import 'extract_arguments.dart';
import 'screen_arguments.dart';
import 'pass_arguments.dart';

void main() {
  runApp(MaterialApp(
    title: 'Named Routes Demo',
    // Start the app with the "/" named route. In this case, the app starts
    // on the FirstScreen widget.
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => const FirstRoute(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/second': (context) => const SecondRoute(),

      ExtractArgumentsScreen.routeName: (context) =>
          const ExtractArgumentsScreen(),
    },

    onGenerateRoute: (settings) {
      // If you push the PassArguments route
      if (settings.name == PassArgumentsScreen.routeName) {
        // Cast the arguments to the correct
        // type: ScreenArguments.
        final args = settings.arguments as ScreenArguments;

        // Then, extract the required data from
        // the arguments and pass the data to the
        // correct screen.
        return MaterialPageRoute(
          builder: (context) {
            return PassArgumentsScreen(
              title: args.title,
              message: args.message,
            );
          },
        );
      }
      // The code only supports
      // PassArgumentsScreen.routeName right now.
      // Other values need to be implemented if we
      // add them. The assertion here will help remind
      // us of that higher up in the call stack, since
      // this assertion would otherwise fire somewhere
      // in the framework.
      assert(false, 'Need to implement ${settings.name}');
      return null;
    },
  ));
}

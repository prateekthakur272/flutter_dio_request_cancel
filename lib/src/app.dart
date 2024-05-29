import 'package:flutter/material.dart';
import 'package:flutter_dio_request_cancel/src/screens/home_screen/home_screen.dart';
import 'package:flutter_dio_request_cancel/src/screens/home_screen/repository/repository.dart';
import 'package:flutter_dio_request_cancel/src/screens/home_screen/state/provider.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(HomeRepository()),
      child: MaterialApp(
        title: 'Request Cancel',
        home: const HomeScreen(),
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
      ),
    );
  }
}

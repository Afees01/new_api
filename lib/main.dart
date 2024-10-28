import 'package:flutter/material.dart';
import 'package:new_api/controllers/news_screen_controller.dart';
import 'package:new_api/view/news_screen/news_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) =>NewsScreenController() ,)
      ],
      child: MaterialApp(
        home: NewsScreen(),
      ),
    );
  }
}

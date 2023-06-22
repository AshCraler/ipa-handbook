import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../config/router/screen_name.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('Setting'),
          onPressed: () {
            context.pushNamed(BaseScreen.settings.name);
          },
        ),
      ),
    );
  }
}

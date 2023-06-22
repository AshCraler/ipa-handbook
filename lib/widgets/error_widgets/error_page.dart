import 'package:flutter/material.dart';

class NotFoundErrorPageView extends StatelessWidget {
  const NotFoundErrorPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Error: Page not found'),
      ),
    );
  }
}

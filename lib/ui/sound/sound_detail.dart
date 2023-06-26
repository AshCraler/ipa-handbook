import 'package:flutter/material.dart';

class SoundDetailScreen extends StatefulWidget {
  const SoundDetailScreen({
    super.key,
    required this.sound,
  });
  final String sound;

  @override
  State<SoundDetailScreen> createState() => _SoundDetailScreenState();
}

class _SoundDetailScreenState extends State<SoundDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.sound),
      ),
      body: Center(
        child: ListView(children: []),
      ),
    );
  }
}

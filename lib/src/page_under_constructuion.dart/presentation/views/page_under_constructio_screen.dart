import 'package:flutter/material.dart';

class PageUnderConstrutionScreen extends StatelessWidget {
  const PageUnderConstrutionScreen({super.key});

  static const routeName = '/page-under-construction';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Under Construction'),
      ),
      body: const Center(
        child: Text('Halaman tidak di temukan'),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'pages/whatsapp_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pro-Image-Editor',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue.shade800),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildCard(),
    );
  }

  Widget _buildCard() {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 700),
        child: Card(
          clipBehavior: Clip.hardEdge,
          margin: const EdgeInsets.all(16),
          child: _buildExamples(),
        ),
      ),
    );
  }

  Widget _buildExamples() {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: Text(
              'Examples',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          WhatsAppExample(),
          Divider(height: 1),
        ],
      ),
    );
  }
}

class Test extends Container {
  Test({
    super.key,
    super.child,
    super.color,
  });

  @override
  Widget build(BuildContext context) {
    Widget? current = child;

    if (color != null) {
      current = ColoredBox(color: color!, child: current);
    }

    return current!;
  }
}

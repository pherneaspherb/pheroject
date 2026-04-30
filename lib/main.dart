import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'overlay_bubble.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const VeriGuardApp());
}

@pragma("vm:entry-point")
void overlayMain() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: OverlayBubble(),
        ),
      ),
    ),
  );
}

class VeriGuardApp extends StatelessWidget {
  const VeriGuardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VeriGuard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.teal,
      ),
      home: const HomeScreen(),
    );
  }
}
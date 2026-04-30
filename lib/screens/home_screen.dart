import 'package:flutter/material.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';
import 'package:pheroject/screens/result_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> startProtection(BuildContext context) async {
    debugPrint("START BUTTON TAPPED");

    final bool isPermissionGranted =
        await FlutterOverlayWindow.isPermissionGranted();

    debugPrint("OVERLAY PERMISSION: $isPermissionGranted");

    if (!isPermissionGranted) {
      final bool? permissionResult =
          await FlutterOverlayWindow.requestPermission();

      debugPrint("PERMISSION REQUEST RESULT: $permissionResult");

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Enable Display over other apps, then tap Start again.',
          ),
        ),
      );

      return;
    }

    debugPrint("SHOWING OVERLAY NOW");

    await FlutterOverlayWindow.showOverlay(
      height: 80,
      width: 80,
      alignment: OverlayAlignment.centerRight,
      flag: OverlayFlag.defaultFlag,
      visibility: NotificationVisibility.visibilityPublic,
      enableDrag: true,
    );
  }

  Future<void> stopProtection() async {
    await FlutterOverlayWindow.closeOverlay();
  }

  @override
  void initState() {
    super.initState();

    FlutterOverlayWindow.overlayListener.listen((event) {
      if (event == "scan") {
        debugPrint("SCAN TRIGGERED FROM OVERLAY");

        showDialog(
          context: context,
          builder: (_) => const AlertDialog(
            title: Text("VeriGuard"),
            content: Text("Scanning content..."),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5FFFC),
      appBar: AppBar(title: const Text('VeriGuard'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.verified_user_rounded,
              size: 88,
              color: Colors.teal,
            ),
            const SizedBox(height: 24),
            const Text(
              'Real-time protection while scrolling.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              'Enable VeriGuard to show a floating shield while using social media. Tap the shield when you want to check suspicious content.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),
            FilledButton.icon(
              onPressed: () => startProtection(context),
              icon: const Icon(Icons.shield_rounded),
              label: const Text('Start VeriGuard Protection'),
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: stopProtection,
              icon: const Icon(Icons.close_rounded),
              label: const Text('Stop Protection'),
            ),
            const SizedBox(height: 20),

            FilledButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ResultScreen()),
                );
              },
              icon: const Icon(Icons.search),
              label: const Text("Scan Now"),
            ),
          ],
        ),
      ),
    );
  }
}

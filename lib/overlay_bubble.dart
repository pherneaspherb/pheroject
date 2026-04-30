import 'package:flutter/material.dart';
import 'package:flutter_overlay_window/flutter_overlay_window.dart';

class OverlayBubble extends StatelessWidget {
  const OverlayBubble({super.key});

  Future<void> handleTap() async {
    debugPrint("VERIGUARD BUBBLE TAPPED");

    await FlutterOverlayWindow.closeOverlay();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: handleTap,
        child: Container(
          width: 80,
          height: 80,
          decoration: const BoxDecoration(
            color: Colors.orange,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                blurRadius: 12,
                color: Colors.black26,
              ),
            ],
          ),
          child: const Icon(
            Icons.shield_rounded,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
    );
  }
}
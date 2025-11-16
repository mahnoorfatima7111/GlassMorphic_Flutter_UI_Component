import 'dart:ui';

import 'package:flutter/material.dart';

class GlassMorphic extends StatelessWidget {
  final double blur;
  final double opacity;
  final Widget child;
  const GlassMorphic({
    super.key,
    required this.blur,
    required this.opacity,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(40),
        bottomRight: Radius.circular(40),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(
                  255,
                  182,
                  111,
                  41,
                ).withOpacity(opacity),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
                border: Border.all(
                  color: Colors.blue.withAlpha(100),
                  width: 2.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.55), // Lighter color
                    offset: const Offset(-5, -5), // Moves shadow to top-left
                    blurRadius: 15,
                    // spreadRadius: 0.0,
                  ),
                  // Bottom-Right Dark Shadow (for the "depth" effect)
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3), // Darker color
                    offset: const Offset(5, 5), // Moves shadow to bottom-right
                    blurRadius: 15,
                    // spreadRadius: spreadRadius,
                  ),
                ],
              ),
              child: child,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 25),
              child: Text(
                'Glass',
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  letterSpacing: 1,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 60),
              child: Text(
                'Morphism',
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 85),
              child: Text(
                '...',
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  letterSpacing: 4,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 180, top: 260),
              child: Text(
                '012 345 678 910 123',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  letterSpacing: 3,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

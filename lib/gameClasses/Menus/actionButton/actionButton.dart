import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
// Abstract base class for Action Buttons
abstract class AbsActionButton extends PositionComponent  with TapCallbacks  {
  // The render function that child classes must implement
  @override
  void render(Canvas canvas);

  // The onTap function that child classes must implement
  @override
  void onTapDown(TapDownEvent event) {
  }
}

// A child class of AbsActionButton that displays a private string as text
class TextActionButton extends AbsActionButton {
  // Private string to render
  final String _text;

  // Styling options for the text
  final TextStyle textStyle;
  Paint backgroundPaint = Paint()..color = Colors.white;
  final double padding;

  // Function to execute on tap
  final VoidCallback onTap;
  TextActionButton(
      this._text, {
        required this.onTap,
        this.textStyle = const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        this.padding = 8.0,
      });

  @override
  void render(Canvas canvas) {
    // Draw the button background
    canvas.drawRect(size.toRect(), backgroundPaint);

    // Measure text
    final textPainter = TextPainter(
      text: TextSpan(text: _text, style: textStyle),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();

    // Center the text inside the button
    final textOffset = Offset(
      (size.x - textPainter.width) / 2,
      (size.y - textPainter.height) / 2,
    );
    textPainter.paint(canvas, textOffset);
  }

  @override
  bool onTapDown(TapDownEvent info) {
    // Execute the provided onTap function
    onTap();
    return true;
  }

  @override
  void onGameResize(Vector2 gameSize) {
    super.onGameResize(gameSize);
    // Adjust the size if needed (e.g., based on game screen dimensions)
    size = Vector2(120, 50); // Example size: 120x50
  }
}

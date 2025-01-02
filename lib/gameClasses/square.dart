import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class SquareComponent extends PositionComponent {
  final String terrainType = "grass";

  SquareComponent({required Vector2 position, required Vector2 size})
      : super(position: position, size: size);

  @override
  void render(Canvas canvas) {
    // Draw the dark green outer square
    Paint outerPaint = Paint()..color = Colors.green[900]!;
    canvas.drawRect(size.toRect(), outerPaint);

    // Draw the lighter green inner square with margin
    Paint innerPaint = Paint()..color = Colors.green;
    Rect innerRect = Rect.fromLTWH(
      5, // Left margin
      5, // Top margin
      size.x - 10, // Width reduced by 2 * margin
      size.y - 10, // Height reduced by 2 * margin
    );
    canvas.drawRect(innerRect, innerPaint);
  }}

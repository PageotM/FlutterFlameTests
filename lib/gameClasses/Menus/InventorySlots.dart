import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class InventorySlot extends PositionComponent {
  InventorySlot({required Vector2 position, required Vector2 size})
      : super(position: position, size: size);

  @override
  void render(Canvas canvas) {
    // Draw a rounded rectangle for the inventory slot
    Paint slotPaint = Paint()..color = Colors.grey[700]!;
    RRect slotRect = RRect.fromRectAndRadius(size.toRect(), Radius.circular(5));
    canvas.drawRRect(slotRect, slotPaint);
  }
}

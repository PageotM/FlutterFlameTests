import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import '../ItemsConst/itemEnum.dart';

class InventorySlot extends PositionComponent {
  final MapEntry<ItemEnum, int> content;

  InventorySlot({
    required Vector2 position,
    required Vector2 size,
    required this.content,
  }) : super(position: position, size: size);

  @override
  void render(Canvas canvas) {
    // Draw a rounded rectangle for the inventory slot
    Paint slotPaint = Paint()..color = Colors.grey[700]!;
    RRect slotRect = RRect.fromRectAndRadius(size.toRect(), Radius.circular(5));
    canvas.drawRRect(slotRect, slotPaint);

    // Retrieve the icon for the current content item
    final iconData = itemIcons[content.key] ?? Icons.block; // Fallback to "none" icon
    final iconPainter = TextPainter(
      text: TextSpan(
        text: String.fromCharCode(iconData.codePoint),
        style: TextStyle(
          fontFamily: iconData.fontFamily,
          fontSize: size.y * 0.8, // Scale the icon size to fit the slot
          color: Colors.white,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    iconPainter.layout();

    // Render the icon in the center
    final iconX = (size.x - iconPainter.width) / 2;
    final iconY = (size.y - iconPainter.height) / 2;
    iconPainter.paint(canvas, Offset(iconX, iconY));

    // Render the count in the bottom-right corner
    final textPainter = TextPainter(
      text: TextSpan(
        text: getNumberForItem(content.value),
        style: TextStyle(
          color: Colors.white,
          fontSize: size.y * 0.2, // Scale the font size to be smaller
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();

    final textX = size.x - textPainter.width - 2; // Small padding from the right edge
    final textY = size.y - textPainter.height - 2; // Small padding from the bottom edge
    textPainter.paint(canvas, Offset(textX, textY));
  }
}

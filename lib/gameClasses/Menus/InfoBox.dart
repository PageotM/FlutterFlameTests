import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import '../player.dart';
import 'InventorySlots.dart';

class InfoBox extends PositionComponent {
  final PlayerComponent player;
  late TextComponent textComponent;
  static const int rows = 3;
  static const int cols = 5;
  static const double slotSize = 20;
  static const double slotPadding = 5;

  InfoBox({required this.player, required Vector2 position})
      : super(position: position, size: Vector2(150, 100 + rows * (slotSize + slotPadding))); // Adjust size to include inventory

  @override
  Future<void> onLoad() async {
    super.onLoad();

    // Create a text component to display the player's movement left
    textComponent = TextComponent(
      text: "Moves Left: ${player.movementLeft}",
      position: Vector2(10, 10), // Padding inside the info box
    );

    add(textComponent);

    // Add inventory slots
    _createInventorySlots();
  }

  void _createInventorySlots() {
    double startX = 10; // Starting x-offset
    double startY = 40; // Starting y-offset (below the text)

    for (int row = 0; row < rows; row++) {
      for (int col = 0; col < cols; col++) {
        double x = startX + col * (slotSize + slotPadding);
        double y = startY + row * (slotSize + slotPadding);

        add(InventorySlot(position: Vector2(x, y), size: Vector2(slotSize, slotSize)));
      }
    }
  }

  @override
  void update(double dt) {
    super.update(dt);

    // Update the text with the latest movementLeft value
    textComponent.text = "Moves Left: ${player.movementLeft}";
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    // Draw the background of the info box
    Paint boxPaint = Paint()..color = Colors.black.withOpacity(0.8);
    canvas.drawRect(size.toRect(), boxPaint);
  }
}



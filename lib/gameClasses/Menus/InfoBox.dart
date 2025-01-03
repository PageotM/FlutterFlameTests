import 'package:dddd/gameClasses/Menus/InventoryUI.dart';
import 'package:dddd/gameClasses/Menus/moveDiplayUi.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import '../gameConcepts/player.dart';

class InfoBox extends PositionComponent {
  final PlayerComponent player;

  InfoBox({required this.player, required Vector2 position})
      : super(position: position, size: Vector2(150, 200)); // Adjusted size

  @override
  Future<void> onLoad() async {
    super.onLoad();

    // Add MoveDisplay
    add(MoveDiplayUI(
      player: player,
      position: Vector2(10, 10),
    ));

    // Add Inventory
    add(InventoryUI(
      inventory: player.inv,
      position: Vector2(10, 50), // Position inventory below the MoveDisplay
    ));
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    // Draw the background of the info box
    Paint boxPaint = Paint()..color = Colors.black.withOpacity(0.8);
    canvas.drawRect(size.toRect(), boxPaint);
  }
}

import 'package:dddd/GameServices/gameGridService.dart';
import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class PlayerComponent extends PositionComponent with KeyboardHandler {
  // Grid coordinates of the player
  Vector2 coords;
  int movementLeft = 10;

  PlayerComponent({required this.coords, required Vector2 size})
      : super(size: size);

  @override
  void render(Canvas canvas) {
    // Calculate pixel position based on grid coordinates
    final pixelPosition = coords * GameSettingsController.squareSize;

    // Draw the player circle at the calculated pixel position
    Paint paint = Paint()..color = Colors.white;
    canvas.drawCircle(
      Offset(pixelPosition.x + size.x, pixelPosition.y + size.y ),
      size.x / 2,
      paint,
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    // Clamp coords to grid boundaries
    coords = Vector2(
      coords.x.clamp(0, GameSettingsController.gridSize - 1),
      coords.y.clamp(0, GameSettingsController.gridSize  - 1),
    );
  }

  @override
  bool onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    if (event is KeyDownEvent) {
      if (movementLeft > 0){
        if (keysPressed.contains(LogicalKeyboardKey.arrowUp)) {
          movementLeft -= 1;
          coords.y -= 1;
        } else if (keysPressed.contains(LogicalKeyboardKey.arrowDown)) {
          movementLeft -= 1;
          coords.y += 1;
        } else if (keysPressed.contains(LogicalKeyboardKey.arrowLeft)) {
          movementLeft -= 1;
          coords.x -= 1;
        } else if (keysPressed.contains(LogicalKeyboardKey.arrowRight)) {
          movementLeft -= 1;
          coords.x += 1;
        }
      }
      if (keysPressed.contains(LogicalKeyboardKey.digit1)) {
        movementLeft = 10;
        coords = Vector2(0, 0);
      }
    }
    return true;
  }
}

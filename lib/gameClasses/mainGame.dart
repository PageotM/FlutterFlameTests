import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import '../GameServices/gameGridService.dart';
import 'Menus/InfoBox.dart';
import 'square.dart';
import 'player.dart';

class MainGame extends FlameGame with HasKeyboardHandlerComponents {
  late PlayerComponent player;

  @override
  Future<void> onLoad() async {
    double squareSize = GameSettingsController.squareSize;
    int gridSize = GameSettingsController.gridSize;
    // Create the grid of squares
    for (int row = 0; row < gridSize; row++) {
      for (int col = 0; col < gridSize; col++) {
        add(SquareComponent(
          position: Vector2(col * squareSize, row * squareSize),
          size: Vector2(squareSize, squareSize),
        ));
      }
    }

    // Add the player
    // Add the player
    player = PlayerComponent(
      coords: Vector2(0, 0),
      size: Vector2(squareSize / 2, squareSize / 2),
    );
    add(player);

    // Add the info box
    add(InfoBox(player: player, position: Vector2(gridSize * squareSize, 0)));
  }
}

import 'package:dddd/gameClasses/gameConcepts/Map/MapRender.dart';
import 'package:dddd/gameClasses/gameConcepts/Map/mapLayer.dart';
import 'package:dddd/gameClasses/gameConcepts/Map/multiMapLayer.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/widgets.dart';
import '../GameServices/gameGridService.dart';
import 'Menus/rightMenu.dart';
import 'gameConcepts/Map/terrainDisplay.dart';
import 'gameConcepts/player.dart';

class MainGame extends FlameGame with HasKeyboardHandlerComponents  {
  late PlayerComponent player;

  @override
  Future<void> onLoad() async {
    double squareSize = GameSettingsController.squareSize;
    int gridSize = GameSettingsController.gridSize;

    // Create the grid of squares
    add(MapRender(position: Vector2(0, 0)));
    player = PlayerComponent(
      coords: Vector2(0, 0),
      size: Vector2(squareSize / 2, squareSize / 2),
    );
    add(player);

    add(RightMenu(player: player, position: Vector2(gridSize * squareSize, 0)));
  }
}

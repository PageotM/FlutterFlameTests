import 'package:dddd/GameServices/gameGridService.dart';
import 'package:flame/components.dart';

import 'BuildingDisplay.dart';
import 'terrainDisplay.dart';
import 'mapLayer.dart';
import 'multiMapLayer.dart';

class MapRender extends PositionComponent {

  MapRender({required Vector2 position})
      : super(position: position, size: Vector2(500, 500));

  double  squareSize = GameSettingsController.squareSize;
  num gridSize = GameSettingsController.gridSize;
  @override
  Future<void> onLoad() async {
    mapLayer terrainLayer = mapLayer(rows: 10, cols: 10, defaultValue: "ocean");
    terrainLayer.grid[2][5] = "plain";
    mapLayer buildingLayer = mapLayer(rows: 10, cols: 10, defaultValue: "none");
    buildingLayer.grid[2][0] = "house";
    MultiMapLayer gameMap = MultiMapLayer();
    gameMap.addLayer("terrain",terrainLayer);
    gameMap.addLayer("building",buildingLayer);

    for (int row = 0; row < gridSize; row++) {
      for (int col = 0; col < gridSize; col++) {
        Map<String,String> tileInfo = gameMap.getSlice(col, row);
        add(TerrainDisplay(
          terrain: tileInfo["terrain"]!,
          position: Vector2(col * squareSize, row * squareSize),
          size: Vector2(squareSize, squareSize),
        ));
        add(BuildingDisplay(
          building: tileInfo["building"]!,
          position: Vector2(col * squareSize, row * squareSize),
          size: Vector2(squareSize, squareSize),
        ));
      }
    }

  }
}

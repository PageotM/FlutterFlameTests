import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class TerrainDisplay extends PositionComponent {
  final String terrain;
  TerrainDisplay( {required String this.terrain, required Vector2 position, required Vector2 size} )
      : super(position: position, size: size);

  List<Color> getColors(String terrainType){
    switch(terrainType){
      case "ocean":
        return [Colors.blue,Colors.blue[900]!];
      case "plain":
        return [Colors.green,Colors.green[900]!];
    }
    return [Colors.yellow, Colors.blueGrey];
  }

  @override
  void render(Canvas canvas) {
    List<Color> colors = this.getColors(terrain);
    // Draw the dark green outer square
    Paint outerPaint = Paint()..color = colors[1];
    canvas.drawRect(size.toRect(), outerPaint);

    // Draw the lighter green inner square with margin
    Paint innerPaint = Paint()..color = colors[0];
    Rect innerRect = Rect.fromLTWH(
      5, // Left margin
      5, // Top margin
      size.x - 10, // Width reduced by 2 * margin
      size.y - 10, // Height reduced by 2 * margin
    );
    canvas.drawRect(innerRect, innerPaint);
  }}

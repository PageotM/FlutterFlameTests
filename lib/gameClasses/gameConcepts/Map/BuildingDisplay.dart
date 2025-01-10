import 'dart:ui' as ui;
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';

class BuildingDisplay extends PositionComponent {
  final String building;
  late ui.Image _buildingImage;

  BuildingDisplay({
    required this.building,
    required Vector2 position,
    required Vector2 size,
  }) : super(position: position, size: size);

  @override
  Future<void> onLoad() async {
    super.onLoad();
    if (building == "house"){
    // Load the image based on the building type
    String imagePath ='houseLogo.png' ;
    _buildingImage = await Flame.images.load(imagePath); }// Loads dart:ui.Image
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    if (building == "house") {
      final rect = size.toRect();
      paintImageOnCanvas(canvas, _buildingImage, rect);
    } else {
    }
  }

  void paintImageOnCanvas(Canvas canvas, ui.Image image, Rect rect) {
    // Draws the image directly onto the canvas
    final paint = Paint();
    canvas.drawImageRect(
      image,
      Rect.fromLTWH(0, 0, image.width.toDouble(), image.height.toDouble()), // Source rect
      rect, // Destination rect
      paint,
    );
  }
}

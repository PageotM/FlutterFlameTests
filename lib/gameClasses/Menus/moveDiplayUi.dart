import 'package:flame/components.dart';
import '../gameConcepts/player.dart';

class MoveDiplayUI extends PositionComponent {
  final PlayerComponent player;
  late TextComponent textComponent;

  MoveDiplayUI({required this.player, required Vector2 position})
      : super(position: position, size: Vector2(150, 30)); // Size for MoveDisplay

  @override
  Future<void> onLoad() async {
    super.onLoad();

    textComponent = TextComponent(
      text: "Moves Left: ${player.movementLeft}",
      position: Vector2.zero(), // Start at (0, 0) within MoveDisplay
    );

    add(textComponent);
  }

  @override
  void update(double dt) {
    super.update(dt);

    // Update the text with the latest movementLeft value
    textComponent.text = "Moves Left: ${player.movementLeft}";
  }
}

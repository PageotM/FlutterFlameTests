import 'package:flame/components.dart';
import '../gameConcepts/player.dart';

class StatsDiplayUI extends PositionComponent {
  final PlayerComponent player;
  late TextComponent moveTextComponent;
  late TextComponent moneyTextComponent;

  StatsDiplayUI({required this.player, required Vector2 position})
      : super(position: position, size: Vector2(150, 30)); // Size for MoveDisplay

  @override
  Future<void> onLoad() async {
    super.onLoad();

    moveTextComponent = TextComponent(
      text: "Moves Left: ${player.movementLeft}",
      position: Vector2.zero(), // Start at (0, 0) within MoveDisplay
    );

    add(moveTextComponent);
    moneyTextComponent = TextComponent(
      text: "Money Left: ${player.money}",
      position: Vector2(0.0,30.0), // Start at (0, 0) within MoveDisplay
    );

    add(moneyTextComponent);

  }

  @override
  void update(double dt) {
    super.update(dt);

    // Update the text with the latest movementLeft value
    moveTextComponent.text = "Moves Left: ${player.movementLeft}";
    moneyTextComponent.text = "Money Left: ${player.money}";

  }
}

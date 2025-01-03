import 'package:flame/components.dart';
import '../gameConcepts/Inventory.dart';
import 'InventorySlots.dart';

class InventoryUI extends PositionComponent {
  static const int rows = 3;
  static const int cols = 5;
  static const double slotSize = 40;
  static const double slotPadding = 5;

  final InventoryData inventory;

  InventoryUI({required Vector2 position, required this.inventory})
      : super(position: position, size: Vector2(150, rows * (slotSize + slotPadding)));

  @override
  Future<void> onLoad() async {
    super.onLoad();
    _createInventorySlots();
  }

  void _createInventorySlots() {
    for (int row = 0; row < rows; row++) {
      for (int col = 0; col < cols; col++) {
        double x = col * (slotSize + slotPadding);
        double y = row * (slotSize + slotPadding);

        // Calculate the index in the inventory list
        int index = row * cols + col;

        // Check if there is an item at this index
        final content = inventory[index] ;

        // Add the inventory slot
        add(InventorySlot(
          position: Vector2(x, y),
          size: Vector2(slotSize, slotSize),
          content: content, // Pass the corresponding MapEntry or null
        ));
      }
    }
  }
}

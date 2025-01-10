import 'mapLayer.dart';

class MultiMapLayer {
  final Map<String, mapLayer> layers = {};

  /// Adds a new MapLayer to the collection with a unique name.
  void addLayer(String name, mapLayer layer) {
    if (layers.containsKey(name)) {
      throw ArgumentError('Layer "$name" already exists.');
    }
    layers[name] = layer;
  }

  /// Removes a MapLayer by name.
  void removeLayer(String name) {
    if (!layers.containsKey(name)) {
      throw ArgumentError('Layer "$name" does not exist.');
    }
    layers.remove(name);
  }

  /// Retrieves the value at (x, y) for all layers and returns as a map.
  Map<String, String> getSlice(int x, int y) {
    final Map<String, String> slice = {};
    layers.forEach((layerName, layer) {
      try {
        slice[layerName] = layer.getValue(x, y);
      } catch (e) {
        slice[layerName] = 'Invalid Index';
      }
    });
    return slice;
  }
}
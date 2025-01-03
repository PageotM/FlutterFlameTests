// Define an enumeration for items
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum ItemEnum {
  sword,
  wood,
  bread,
  none
}

final Map<ItemEnum, IconData> itemIcons = {
  ItemEnum.sword: Icons.security, // Example icon for sword
  ItemEnum.wood: Icons.nature,    // Example icon for wood
  ItemEnum.bread: Icons.local_pizza, // Example icon for bread
};

// Function to get the icon for a given item
IconData getIconForItem(ItemEnum item) {
  return itemIcons[item] ?? Icons.help_outline; // Fallback to a "none" icon
}

String getNumberForItem(num number){
  if (number <= 1)
      return "";
  else
    return number.toString();
}
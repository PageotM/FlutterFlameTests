import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'GameServices/gameGridService.dart';
import 'gameClasses/mainGame.dart';

void main() {
  Get.put(GameSettingsController());

  runApp(GameWidget(game: MainGame()));
}

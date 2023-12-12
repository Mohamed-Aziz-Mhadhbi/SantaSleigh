import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart' hide Route;
import 'package:santa_sleigh/screens/game_play_screen.dart';

void main() {
  runApp(GameWidget(game: SantaGame()));
}

class SantaGame extends FlameGame with TapDetector {
  Vector2 gravity = Vector2(0, 30);
  late final RouterComponent router;

  @override
  void onLoad() async {
    super.onLoad();
    add(
      router = RouterComponent(
        initialRoute: "gameplay",
        routes: {"gameplay": Route(GamePlayScreen.new)},
      ),
    );
  }

  @override
  void onTapUp(TapUpInfo info) {
    gravity.y -= 20;
    super.onTapUp(info);
  }
}

import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart' hide Route;
import 'package:santa_sleigh/screens/game_over_screen.dart';
import 'package:santa_sleigh/screens/game_play_screen.dart';

void main() {
  runApp(GameWidget(game: SantaGame()));
}

class SantaGame extends FlameGame with TapCallbacks {
  Vector2 gravity = Vector2(0, 30);
  late final RouterComponent router;
  bool gameOver = false;
  bool showGameOverScreen = false;

  @override
  void onLoad() async {
    super.onLoad();
    add(
      router = RouterComponent(
        initialRoute: "gameplay",
        routes: {
          "gameplay": Route(GamePlayScreen.new),
          "gameover": Route(GameOverScreen.new)
        },
      ),
    );
  }

  @override
  void update(double dt) {
    if (gameOver && !showGameOverScreen) {
      router.pushNamed("gameover");
      showGameOverScreen = true;
    }

    super.update(dt);
  }

}

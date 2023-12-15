import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart' hide Route;
import 'package:santa_sleigh/santa.dart';
import 'package:santa_sleigh/screens/game_over_screen.dart';
import 'package:santa_sleigh/screens/game_play_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  Flame.device.setLandscape();
  runApp(GameWidget(game: SantaGame()));
}

class SantaGame extends FlameGame with HasDraggables, HasCollisionDetection {
  Vector2 gravity = Vector2(0, 30);
  late final RouterComponent router;
  bool gameOver = false;
  bool showGameOverScreen = false;
  Santa santa = Santa();

  @override
  Future<void>? onLoad() async {
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

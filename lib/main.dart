import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart' hide Route;
import 'package:santa_sleigh/actors/santa.dart';
import 'package:santa_sleigh/screens/game_over_screen.dart';
import 'package:santa_sleigh/screens/game_play_screen.dart';
import 'package:santa_sleigh/screens/game_start_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  Flame.device.setLandscape();
  runApp(GameWidget(game: SantaGame()));
}

class SantaGame extends FlameGame with TapCallbacks, HasCollisionDetection {
  Vector2 gravity = Vector2(0, 30);
  late final RouterComponent router;
  bool gameOver = false;
  bool showGameOverScreen = false;
  Santa santa = Santa();
  Stopwatch elapsedtime = Stopwatch();

  @override
  Future<void>? onLoad() async {
    super.onLoad();
    add(
      router = RouterComponent(
        initialRoute: "gamestart",
        routes: {
          "gameplay": Route(GamePlayScreen.new),
          "gameover": Route(GameOverScreen.new),
          "gamestart": Route(GameStartScreen.new),
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

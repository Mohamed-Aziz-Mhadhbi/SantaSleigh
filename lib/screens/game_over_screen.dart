import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart' hide Route;
import 'package:santa_sleigh/main.dart';

class GameOverScreen extends Component
    with HasGameRef<SantaGame>, TapCallbacks {
  @override
  void onLoad() async {
    await super.onLoad();
    FlameAudio.bgm.dispose();
    add(
      TextComponent(
        text: 'Game Over',
        anchor: Anchor.center,
        position: gameRef.size / 2,
        textRenderer: TextPaint(
          style: const TextStyle(fontSize: 16, color: Colors.red),
        ),
      ),
    );
  }

  @override
  void update(double dt) {
    if (gameRef.elapsedtime.isRunning) {
      gameRef.elapsedtime.reset();
      gameRef.elapsedtime.stop();
    }
    super.update(dt);
  }

  @override
  bool containsLocalPoint(Vector2 point) => true;

  @override
  void onTapUp(TapUpEvent event) {
    gameRef.santa.position = gameRef.size / 2;
    gameRef.showGameOverScreen = false;
    gameRef.gameOver = false;
    gameRef.gravity = Vector2(0, 30);
    gameRef.router.pop();
    gameRef.elapsedtime.start();
    FlameAudio.bgm.play('happy-santa.mp3');
    super.onTapUp(event);
  }
}

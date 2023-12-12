import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart' hide Route;
import 'package:santa_sleigh/main.dart';

class GameOverScreen extends Component
    with HasGameRef<SantaGame>, TapCallbacks {
  @override
  void onLoad() async {
    await super.onLoad();
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
  bool containsLocalPoint(Vector2 point) => true;

  @override
  void onTapUp(TapUpEvent event) {
    gameRef.santa.position = gameRef.size / 2;
    gameRef.showGameOverScreen = false;
    gameRef.gameOver = false;
    gameRef.gravity = Vector2(0, 30);
    gameRef.router.pop();
    super.onTapUp(event);
  }
}

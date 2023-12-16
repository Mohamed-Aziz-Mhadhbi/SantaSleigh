import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:santa_sleigh/main.dart';

class ElapsedTime extends TextComponent with HasGameRef<SantaGame> {
  @override
  void onLoad() {
    super.onLoad();
    scale = Vector2.all(1.4);
    position = Vector2(gameRef.size.x * .3, 4);
    textRenderer = TextPaint(style: const TextStyle(color: Colors.black));
  }

  @override
  void update(double dt) {
    text = gameRef.elapsedtime.elapsed.inSeconds.toString();
    super.update(dt);
  }
}

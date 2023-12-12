import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/parallax.dart';
import 'package:flame/src/gestures/events.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(GameWidget(game: SantaGame()));
}

class SantaGame extends FlameGame with TapDetector {
  late SpriteAnimationComponent santa;
  Vector2 gravity = Vector2(0, 30);

  @override
  void onLoad() async {
    super.onLoad();
    ParallaxComponent mountinBackgound = await loadParallaxComponent(
      [
        ParallaxImageData('sky.png'),
        ParallaxImageData('clouds_bg.png'),
        ParallaxImageData('glacial_mountains.png'),
        ParallaxImageData('clouds_mg_1.png'),
        ParallaxImageData('cloud_lonely.png'),
      ],
      baseVelocity: Vector2(50, 0),
      velocityMultiplierDelta: Vector2(1.6, 1.0),
    );
    add(mountinBackgound);
    final santaAnimation = await loadSpriteAnimation(
      "santa.png",
      SpriteAnimationData.sequenced(
        amount: 24,
        amountPerRow: 4,
        stepTime: 0.1,
        textureSize: Vector2(30, 20),
      ),
    );
    santa = SpriteAnimationComponent(
      animation: santaAnimation,
      position: size / 2,
      anchor: Anchor.center,
      size: Vector2(size.y * 100 / 40, size.y) * .1,
    );
    add(santa);
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (santa.y < size.y && santa.y > 0) {
      gravity.y += .4;
      santa.position += gravity * dt;
    }
  }

  @override
  void onTapUp(TapUpInfo info) {
    gravity.y -= .2;
    super.onTapUp(info);
  }
}

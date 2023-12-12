import 'dart:math';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:santa_sleigh/main.dart';

class SnowBall extends SpriteAnimationComponent with HasGameRef<SantaGame> {
  // SnowBall() : super() {
  //   debugMode = true;
  // }
  final _random = Random();
  @override
  void onLoad() async {
    await super.onLoad();
    final snowballAnimation = await gameRef.loadSpriteAnimation(
      "snowball.png",
      SpriteAnimationData.sequenced(
        amount: 6,
        amountPerRow: 3,
        stepTime: 0.1,
        textureSize: Vector2(495, 400),
      ),
    );
    animation = snowballAnimation;
    double yPosition = _random.nextDouble() * game.size.y;
    position = Vector2(gameRef.size.x * .95, yPosition);
    anchor = Anchor.center;
    size = Vector2(gameRef.size.y * 50 / 20, gameRef.size.y) * .1;
    add(
      CircleHitbox(
          anchor: Anchor.center, radius: size.y * .35, position: size / 2),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (x > 0 && !gameRef.gameOver) {
      x = x - 100 * dt;
    } else {
      removeFromParent();
    }
  }
}

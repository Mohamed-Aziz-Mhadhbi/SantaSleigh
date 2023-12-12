import 'package:flame/components.dart';
import 'package:santa_sleigh/main.dart';

class SnowBall extends SpriteComponent with HasGameRef<SantaGame> {
  late SpriteAnimationComponent snowball;
  @override
  void onLoad() async {
    await super.onLoad();
    final snowballAnimation = await gameRef.loadSpriteAnimation(
      "snowball.png",
      SpriteAnimationData.sequenced(
        amount: 6,
        amountPerRow: 3,
        stepTime: 0.1,
        textureSize: Vector2(30, 20),
      ),
    );
    snowball = SpriteAnimationComponent(
      animation: snowballAnimation,
      position: gameRef.size / 2,
      anchor: Anchor.center,
      size: Vector2(gameRef.size.y * 100 / 40, gameRef.size.y) * .1,
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    x = x - 100 * dt;
  }
}

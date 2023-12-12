import 'dart:math';
import 'package:flame/components.dart';
import 'package:santa_sleigh/main.dart';

class SnowBall extends SpriteAnimationComponent with HasGameRef<SantaGame> {
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
        textureSize: Vector2(50, 50),
      ),
    );
    animation = snowballAnimation;
    double yPosition = _random.nextDouble()*game.size.y;
    position = gameRef.size / 2;
    anchor = Anchor.center;
    size = Vector2(gameRef.size.y * 50 / 50, yPosition) * .1;
  }

  @override
  void update(double dt) {
    super.update(dt);
    x = x - 100 * dt;
  }
}

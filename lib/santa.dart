// import 'dart:math';
import 'package:flame/components.dart';
import 'package:santa_sleigh/main.dart';

class Santa extends SpriteAnimationComponent with HasGameRef<SantaGame> {
  @override
  void onLoad() async {
    await super.onLoad();
    final santaAnimation = await gameRef.loadSpriteAnimation(
      "santa.png",
      SpriteAnimationData.sequenced(
        amount: 24,
        amountPerRow: 4,
        stepTime: 0.1,
        textureSize: Vector2(140, 50),
      ),
    );
    animation = santaAnimation;
    position = gameRef.size / 2;
    anchor = Anchor.center;
    size = Vector2(gameRef.size.y * 110 / 40, gameRef.size.y) * .1;
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (y < gameRef.size.y && y > 0) {
      gameRef.gravity.y += .4;
      position += gameRef.gravity * dt;
    } else if (!gameRef.showGameOverScreen) {
      gameRef.gameOver = true;
    }
  }
}

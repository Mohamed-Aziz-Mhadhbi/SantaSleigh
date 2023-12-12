import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/parallax.dart';
import 'package:santa_sleigh/main.dart';
import 'package:santa_sleigh/snow_ball.dart';

class GamePlayScreen extends Component
    with HasGameRef<SantaGame>, TapCallbacks {
  late SpriteAnimationComponent santa;
  @override
  void onLoad() async {
    await super.onLoad();
    ParallaxComponent mountinBackgound = await gameRef.loadParallaxComponent(
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
    final santaAnimation = await gameRef.loadSpriteAnimation(
      "santa.png",
      SpriteAnimationData.sequenced(
        amount: 24,
        amountPerRow: 4,
        stepTime: 0.1,
        textureSize: Vector2(140, 50),
      ),
    );
    santa = SpriteAnimationComponent(
      animation: santaAnimation,
      position: gameRef.size / 2,
      anchor: Anchor.center,
      size: Vector2(gameRef.size.y * 110 / 40, gameRef.size.y) * .1,
    );
    add(santa);
    add(SnowBall());
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (santa.y < gameRef.size.y && santa.y > 0) {
      gameRef.gravity.y += .4;
      santa.position += gameRef.gravity * dt;
    }
  }

  @override
  void onTapUp(TapUpEvent event) {
    gameRef.gravity.y -= 20;
    super.onTapUp(event);
  }
}

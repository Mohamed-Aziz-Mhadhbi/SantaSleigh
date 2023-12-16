import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/parallax.dart';
import 'package:santa_sleigh/main.dart';
import 'package:santa_sleigh/snow_ball.dart';

class GamePlayScreen extends Component with HasGameRef<SantaGame>,TapCallbacks{
  Timer interval = Timer(6, repeat: true);
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
    add(gameRef.santa);
    interval.onTick = () => add(SnowBall());
  }

  @override
  void update(double dt) {
    interval.update(dt);
    super.update(dt);
  }

  @override
  bool containsLocalPoint(Vector2 point) => true;

  @override
  void onTapUp(TapUpEvent event) {
    gameRef.gravity.y -= 20;
    super.onTapUp(event);
  }
}

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/parallax.dart';
import 'package:santa_sleigh/gui/gui_elapsedtime.dart';
import 'package:santa_sleigh/main.dart';
import 'package:santa_sleigh/actors/snow_ball.dart';
import 'package:flame_audio/flame_audio.dart';

class GamePlayScreen extends Component
    with HasGameRef<SantaGame>, TapCallbacks {
  late AudioPool launchSFX;
  Timer interval = Timer(6, repeat: true);
  @override
  void onLoad() async {
    await super.onLoad();
    await FlameAudio.loopLongAudio("happy-santa.mp3");
    gameRef.elapsedtime.start();
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
    addSnowBall();
    add(ElapsedTime());
  }

  void addSnowBall() {
    interval.onTick = () {
      double elapsedSeconds = gameRef.elapsedtime.elapsed.inSeconds.toDouble();
      void addSnowBallAtSecond(int secondToAdd) {
        Future.delayed(Duration(seconds: secondToAdd), () => add(SnowBall()));
      }

      add(SnowBall());
      if (elapsedSeconds > 10.0) {
        addSnowBallAtSecond(3);
      }
      if (elapsedSeconds > 20.0) {
        addSnowBallAtSecond(2);
      }
      if (elapsedSeconds > 30.0) {
        addSnowBallAtSecond(4);
      }
    };
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

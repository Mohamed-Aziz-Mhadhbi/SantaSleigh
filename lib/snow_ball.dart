import 'package:flame/components.dart';
import 'package:santa_sleigh/main.dart';

class SnowBall extends SpriteComponent with HasGameRef<SantaGame> {
  @override
  void onLoad() async {
    await super.onLoad();
    sprite = await gameRef.loadSprite("snowball.png");
    size = Vector2(gameRef.size.y, gameRef.size.y)*.2; // (x,y)
  }
}

import 'dart:async';

import 'package:flame/components.dart';
import 'package:santa_sleigh/main.dart';

class GameOverScreen extends Component with HasGameRef<SantaGame> {
  @override
  void onLoad() async {
    await super.onLoad();
    add(
      TextComponent(
        text: 'Game Over',
        anchor: Anchor.center,
        position: gameRef.size / 2,
      ),
    );
  }
}

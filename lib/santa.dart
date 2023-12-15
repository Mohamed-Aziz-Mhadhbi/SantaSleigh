// import 'dart:math';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart' hide Draggable;
import 'package:santa_sleigh/main.dart';

class Santa extends SpriteAnimationComponent
    with HasGameRef<SantaGame>, CollisionCallbacks, Draggable {
  // Santa() : super() {
  //   debugMode = true;
  // }

  Vector2? dragDeltaPosition;

  @override
  void onLoad() async {
    await super.onLoad();
    final santaAnimation = await gameRef.loadSpriteAnimation(
      "santa.png",
      SpriteAnimationData.sequenced(
        amount: 12,
        amountPerRow: 4,
        stepTime: 0.1,
        textureSize: Vector2(153, 130),
      ),
    );
    animation = santaAnimation;
    position = gameRef.size / 2;
    anchor = Anchor.center;
    size = Vector2(gameRef.size.y * 75 / 40, gameRef.size.y) * .1;
    add(RectangleHitbox.relative(Vector2(.8, .3), parentSize: size));
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

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    gameRef.gameOver = true;
    super.onCollisionStart(intersectionPoints, other);
  }

  @override
  bool onDragUpdate(int pointerId, DragStartInfo info) {
    dragDeltaPosition = info.eventPosition.global - position;
    return false;
  }

  @override
  bool onDragUpdate(int pointerId, DragUpdateInfo info) {
    if (parent is! DragDemoGame) {
      return true;
    }
    final dragDeltaPosition = this.dragDeltaPosition;
    if (dragDeltaPosition == null) {
      return false;
    }
    position.setFrom(info.eventPosition.global - dragDeltaPosition);
    return false;
  }

  @override
  bool onDragEnd(int pointerId, DragEndInfo _) {
    dragDeltaPosition = null;
    return false;
  }

  @override
  bool onDragCancel(int pointerId) {
    dragDeltaPosition = null;
    return false;
  }
}

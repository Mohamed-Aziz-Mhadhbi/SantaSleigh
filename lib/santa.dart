// import 'dart:math';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Santa extends PositionComponent with CollisionCallbacks {
  Santa({this.playerRadius = 15});

  final _velocity = Vector2.zero();
  // final _gravity = 980.0;
  final _jumpSpeed = 300.0;

  final double playerRadius;

  @override
  void onLoad() {
    super.onLoad();
    add(CircleHitbox(
      radius: playerRadius,
      anchor: anchor,
    ));
  }

  @override
  void onMount() {
    position = Vector2(0, 0);
    size = Vector2.all(playerRadius * 2);
    anchor = Anchor.center;
    super.onMount();
  }

  @override
  void update(double dt) {
    super.update(dt);
    position += _velocity * dt;

    // Ground ground = gameRef.findByKeyName(Ground.keyname)!;
    // if (positionOfAnchor(Anchor.bottomCenter).y > ground.position.y) {
    //   _velocity.setValues(0, 0);
    //   position = Vector2(0, ground.position.y - (height / 2));
    // } else {
    //   _velocity.y += _gravity * dt;
    // }
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawCircle(
      const Offset(0, 0) + (size / 2).toOffset(),
      playerRadius,
      Paint()..color = Colors.yellow,
    );
  }

  void jump() {
    _velocity.y = -_jumpSpeed;
  }
}

@override
void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
  // super.onCollision(intersectionPoints, other);

  // if (other is ComponentsGame) {
  //   Ground ground = gameRef.findByKeyName(Ground.keyname)!;
  //   final targetX = ground.position.x;
  //   final targetY = ground.position.y - (height / 2);

  //   final direction =
  //       Vector2(targetX - position.x, targetY - position.y).normalized();

  //   _velocity.setValues(direction.x * _jumpSpeed, direction.y * _jumpSpeed);
  // }
}

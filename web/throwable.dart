part of ld33;

abstract class Throwable {

  num progress;   // 0 = just started, 1 = finished
  num speed;      // progress per millisecond
  int target;     // -1 = left, 0 = center, 1 = right
  num damage;

  Throwable(this.speed, this.damage) {
    progress = 0;
    target = random.nextInt(3) - 1;
  }

  void hit() {
    if (target == classroom.teacher.position) {
      classroom.teacher.damage(damage);
    }
  }

  void update(num delta) {
    progress += speed * delta;
    if (progress >= 1) {
      hit();
    }
  }

  void draw();

}

class PaperBall extends Throwable {

  int target;   // -1 = left, 0 = center, 1 = right

  PaperBall() : super(0.001, 5);  // 1/1000 progress per millisecond = finished in 1 second

  void draw() {
    bufferContext.fillStyle = '#F00';
    bufferContext.fillRect(425 + target * 200, 200, 50, 50); // paper ball
  }

}
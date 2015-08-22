part of ld33;

abstract class Throwable {

  num progress;   // 0 = just started, 1 = finished
  num speed;      // progress per millisecond

  Throwable(this.speed) {
    progress = 0;
  }

  void hit();

  void update(num delta) {
    progress += speed * delta;
    if (progress >= 1) {
      if (leftKey == false || rightKey == false) {
        hit();
        buffer.fillStyle = '#F00';
        buffer.fillRect(10, 10, 50, 50); // TEST
      }
    }
  }

  void draw();

}

class PaperBall extends Throwable {

  int target;   // -1 = left, 0 = center, 1 = right

  PaperBall() : super(0.001) {  // 1/1000 progress per millisecond = finished in 1 second
    int r = random.nextInt(5);  // 1 out of 5 times left, 1 out of 5 times right, 3 out of 5 times center
    if (r == 0) {
      target = -1;
    } else if (r == 1) {
      target = 1;
    } else {
      target = 0;
    }
  }

  void hit() {
    classroom.teacher.damage(5);
  }

  void draw() {
    bufferContext.fillStyle = '#F00';
    bufferContext.fillRect(425 + target * 200, 200, 50, 50); // paper ball
  }

}
part of ld33;

abstract class Throwable {

  num progress;   // 0 = just started, 1 = finished
  num speed;      // progress per millisecond
  int target;     // -1 = left, 0 = center, 1 = right
  num damage;
  bool dead;

  Throwable(num time, this.damage) { //time:seconds
    progress = 0;
    target = random.nextInt(3) - 1;
    dead = false;
    speed = 1/(1000*time);
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
      dead = true;
    }
  }

  void draw();

}

class PaperBall extends Throwable {

  int target;   // -1 = left, 0 = center, 1 = right
  num rotationsSpeed;

  PaperBall() : super(1, 5) {
    rotationsSpeed = random.nextDouble()*8-4;
  }

  void draw() {
    num w = 70 / ( 3* (progress + 0.1)) + 20;
    num h = w / 143 * 117;
    num x = 400 + target * 200;
    num y = 100 * (3*progress - 2) * (3*progress - 2) + 200;

    bufferContext.save();
    bufferContext.translate(x,y);
    bufferContext.rotate(rotationsSpeed*progress);
    bufferContext.translate(-x, -y);
    bufferContext.drawImageScaled(images['paperBall'], x - w/2 , y -h/2, w, h);
    bufferContext.restore();
  }

}
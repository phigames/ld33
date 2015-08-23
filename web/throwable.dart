part of ld33;

abstract class Throwable {

  num progress;   // 0 = just started, 1 = finished
  num speed;      // progress per millisecond
  int target;     // -1 = left, 0 = center, 1 = right
  num damage;
  bool dead;
  num x, y;

  Throwable(num time, this.damage) { //time:seconds
    progress = 0;
    target = random.nextInt(3) - 1;
    dead = false;
    speed = 1/(1000*time);
    x = y = 0;
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
  num rotationSpeed;

  PaperBall() : super(1, 5) {
    rotationSpeed = random.nextDouble()*8-4;
  }

  void draw() {
    num w = 70 / ( 3* (progress + 0.1)) + 20;
    num h = w / 143 * 117;
    x = 400 + target * 200;
    y = 100 * (3*progress - 2) * (3*progress - 2) + 200;

    bufferContext.save();
    bufferContext.translate(x,y);
    bufferContext.rotate(rotationSpeed*progress);
    bufferContext.translate(-x, -y);
    bufferContext.drawImageScaled(images['paperBall'], x - w/2 , y -h/2, w, h);
    bufferContext.restore();
  }

}

class Sandwich extends Throwable {

  int target;   // -1 = left, 0 = center, 1 = right
  num rotationSpeed;

  Sandwich() : super(1, 5) {
    rotationSpeed = random.nextDouble()*8-4;
  }

  void draw() {
    num w = 70 / ( 3* (progress + 0.1)) + 50;
    num h = w / 145 * 113;
    x = 400 + target * 200;
    y = 100 * (3*progress - 2) * (3*progress - 2) + 200;

    bufferContext.save();
    bufferContext.translate(x,y);
    bufferContext.rotate(rotationSpeed*progress);
    bufferContext.translate(-x, -y);
    bufferContext.drawImageScaled(images['sandwich'], x - w/2 , y -h/2, w, h);
    bufferContext.restore();
  }

}
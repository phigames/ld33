part of ld33;

abstract class Action {

  num progress;   // 0 = just started, 1 = finished
  num speed;      // progress per millisecond
  num silence;
  bool dead;

  Action(num time, this.silence) {
    progress = 0;
    speed = 1 / (1000 * time);
    dead = false;
  }

  void hit() {
    classroom.silence(silence);
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

class ActionWarning extends Action {

  ActionWarning() : super(2, 10);

  void draw() {
    bufferContext.save();
    bufferContext.drawImage(images['teacherBody'], 320, 250);
    bufferContext.drawImage(images['teacherHead'], 350, 170);
    // upper arm
    bufferContext.translate(430, 310);
    bufferContext.rotate(-0.8);
    bufferContext.translate(-430, -310);
    bufferContext.drawImage(images['teacherUpperArm'], 425, 275);
    // lower arm
    bufferContext.translate(520, 310);
    bufferContext.rotate(sin(progress * 30) * 0.4 + 0.8);
    bufferContext.translate(-520, -310);
    bufferContext.drawImage(images['teacherArm'], 500, 208);
    bufferContext.restore();
  }

}

class ActionFingernail extends Action {

  ActionFingernail() : super(1.5, 20);

  void draw() {
    bufferContext.save();
    bufferContext.drawImage(images['teacherBody'], 320, 250);
    bufferContext.drawImage(images['teacherHead'], 350, 170);
    // upper arm
    bufferContext.translate(430, 310);
    bufferContext.rotate(progress - 0.8);
    bufferContext.translate(-430, -310);
    bufferContext.drawImage(images['teacherUpperArm'], 425, 275);
    // lower arm
    bufferContext.translate(520, 310);
    bufferContext.rotate(-progress * 0.8 + 0.7);
    bufferContext.translate(-520, -310);
    bufferContext.drawImage(images['teacherArm'], 500, 208);
    bufferContext.restore();
  }

}

class ActionShout extends Action {

  ActionShout() : super(2, 20);

  void draw() {
    bufferContext.save();
    bufferContext.drawImage(images['teacherBody'], 320, 250);
    bufferContext.translate(390, 270);
    bufferContext.rotate(sin(progress * 8 + 2) * 0.2);
    bufferContext.translate(-390, -270);
    bufferContext.drawImage(images['teacherHead'], 350, 170);
    bufferContext.restore();
    bufferContext.save();
    // upper arm
    bufferContext.translate(430, 310);
    bufferContext.rotate(-progress * 0.5 + 1.2);
    bufferContext.translate(-430, -310);
    bufferContext.drawImage(images['teacherUpperArm'], 425, 275);
    // lower arm
    bufferContext.translate(520, 310);
    bufferContext.rotate(-progress * 0.3 + 1.5);
    bufferContext.translate(-520, -310);
    bufferContext.drawImage(images['teacherArm'], 500, 208);
    bufferContext.restore();
  }

}

class ActionChalk extends Action {

  ActionChalk() : super(2, 20);

  void draw() {
    bufferContext.save();
    bufferContext.drawImage(images['teacherBody'], 320, 250);
    bufferContext.translate(390, 270);
    bufferContext.rotate(progress);
    bufferContext.translate(-390, -270);
    bufferContext.drawImage(images['teacherHead'], 350, 170);
    bufferContext.restore();
    bufferContext.save();
    // upper arm
    bufferContext.translate(430, 310);
    bufferContext.rotate(-progress * 0.5 + 1.2);
    bufferContext.translate(-430, -310);
    bufferContext.drawImage(images['teacherUpperArm'], 425, 275);
    // lower arm
    bufferContext.translate(520, 310);
    bufferContext.rotate(-progress * 0.3 + 1.5);
    bufferContext.translate(-520, -310);
    bufferContext.drawImage(images['teacherArm'], 500, 208);
    bufferContext.restore();
  }

}
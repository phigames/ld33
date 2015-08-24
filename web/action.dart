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
    hit();
  }

  void hit() {
    classroom.silence(silence);
  }

  void onDone();

  void update(num delta) {
    classroom.teacher.position = 0;
    progress += speed * delta;
    if (progress >= 1) {
      print('done');
      onDone();
      dead = true;
    }
  }

  void draw();

}

class ActionWarning extends Action {

  static const num PRICE = 20;

  ActionWarning() : super(2, 10) {
    classroom.teacher.damage(PRICE);
    sounds['warning'].currentTime = 0;
    sounds['warning'].play();
  }

  void onDone() { }

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

  static const num PRICE = 30;

  ActionFingernail() : super(1.5, 20) {
    classroom.teacher.damage(PRICE);
    sounds['fingernail'].currentTime = 0;
    sounds['fingernail'].play();
  }

  void onDone() { }

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

  static const num PRICE = 40;

  ActionShout() : super(2, 40) {
    classroom.teacher.damage(PRICE);
    sounds['shout'].currentTime = 0;
    sounds['shout'].play();
  }

  void onDone() { }

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

  static const num PRICE = 70;

  ActionChalk() : super(1, 50) {
    classroom.teacher.damage(PRICE);
  }

  void onDone() { }

  void draw() {
    bufferContext.save();
    bufferContext.drawImage(images['teacherBody'], 320, 250);
    bufferContext.translate(390, 270);
    bufferContext.rotate(max(-progress * 4 + 0.4, -0.4));
    bufferContext.translate(-390, -270);
    bufferContext.drawImage(images['teacherHead'], 350, 170);
    bufferContext.restore();
    bufferContext.save();
    // upper arm
    bufferContext.translate(430, 310);
    bufferContext.rotate(max(-progress * 5 + 0.5, -1.2));
    bufferContext.translate(-430, -310);
    bufferContext.drawImage(images['teacherUpperArm'], 425, 275);
    // lower arm
    bufferContext.translate(520, 310);
    bufferContext.rotate(max(-progress * 1.2 + 1.2, 0.7));
    print(max(-progress * 1.2 + 1.2, 0.7));
    bufferContext.translate(-520, -310);
    num p = max(progress - 0.3, 0);
    bufferContext.drawImageScaled(images['chalk'], 483 - p * 600, 207 + p * 400, 43 + p * 86, 32 + p * 64);
    bufferContext.drawImage(images['teacherArm'], 500, 208);
    bufferContext.restore();
  }

}

class ActionMonster extends Action {

  static const num PRICE = 100;

  ActionMonster() : super(3, 100) {
    classroom.teacher.damage(PRICE);
    classroom.attentiveness = 100;
    classroom.currentAttentivenessSound.pause();
    sounds['monster'].currentTime = 0;
    sounds['monster'].play();
  }

  void onDone() {
    classroom.currentAttentivenessSound.pause();
    gamestate = new GamestateEnd();
  }

  void draw() {
    bufferContext.save();
    bufferContext.drawImage(images['teacherBody'], 320, 250);
    bufferContext.drawImage(images['monster'], 320, 100);
    // upper arm
    bufferContext.translate(430, 310);
    bufferContext.rotate(1);
    bufferContext.translate(-430, -310);
    bufferContext.drawImage(images['teacherUpperArm'], 425, 275);
    // lower arm
    bufferContext.translate(520, 310);
    bufferContext.rotate(2.2);
    bufferContext.translate(-520, -310);
    bufferContext.drawImage(images['teacherArm'], 505, 208);
    bufferContext.restore();
  }

}
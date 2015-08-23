part of ld33;

class Teacher {

  num coolness;   // 0 = uncool, 100 = maximally cool
  int position;   // -1 = left, 0 = center, 1 = right
  num animatePosition;
  num animateArm;

  Teacher() {
    coolness = 50;
    position = 0;
    animatePosition = 0;
    animateArm = 0;
  }

  void damage(num coolnessDeduction) {
    coolness -= coolnessDeduction;
  }

  void update(num delta) {
    if (leftKey) {
      position = -1;
    } else if (rightKey) {
      position = 1;
    } else {
      position = 0;
    }
    animatePosition += (position - animatePosition) / 50 * delta;
    animateArm += delta / 100;
  }

  void draw() {
    bufferContext.save();
    bufferContext.translate(400, 450);
    bufferContext.rotate(animatePosition * 0.1);
    bufferContext.translate(-400, -450);
    bufferContext.drawImage(images['teacherBody'], 320 + animatePosition * 150, 250);
    bufferContext.drawImage(images['teacherHead'], 350 + animatePosition * 150, 170);
    // upper arm
    bufferContext.translate(430 + animatePosition * 150, 310);
    bufferContext.rotate(sin(animateArm * 0.8) * 0.1);
    bufferContext.translate(-(430 + animatePosition * 150), -310);
    bufferContext.drawImage(images['teacherUpperArm'], 425 + animatePosition * 150, 275);
    // lower arm
    bufferContext.translate(520 + animatePosition * 150, 310);
    bufferContext.rotate(sin(animateArm) * 0.2);
    bufferContext.translate(-(520 + animatePosition * 150), -310);
    bufferContext.drawImage(images['teacherArm'], 500 + animatePosition * 150, 208);
    bufferContext.restore();
  }

}
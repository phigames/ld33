part of ld33;

abstract class Gamestate {

  void update(num delta);

  void draw();

}

class GamestatePlaying extends Gamestate {

  GamestatePlaying() {
    classroom = new Classroom();
  }

  void update(num delta) {
    classroom.update(delta);
  }

  void draw() {
    classroom.draw();
  }

}

class GamestateEnd extends Gamestate {

  GamestateEnd() {

  }

  void update(num delta) {

  }

  void draw() {
    bufferContext.drawImage(images['backgroundMenu'], 0, 0);
    bufferContext.drawImage(images['monster'], 150, 100);
    bufferContext.fillStyle = '#A1D42B';
    bufferContext.font = '30px "Special Elite"';
    bufferContext.fillText('You shocked your', 430, 150);
    bufferContext.fillText('students to death', 430, 200);
    bufferContext.fillStyle = '#9D2F39';
    bufferContext.font = '45px "Special Elite"';
    bufferContext.fillText("You're fired", 430, 300);
    bufferContext.fillStyle = '#000';
    bufferContext.font = '20px "Special Elite"';
    bufferContext.fillText("PS: You won the game", 300, 435);
  }

}

class GamestateLost extends Gamestate {

  num glitch;

  GamestateLost() {
    glitch = 0;
  }

  void update(num delta) {
    glitch += delta;
  }

  void draw() {
    bufferContext.drawImage(images['backgroundMenu'], 0, 0);

    // teacher
    bufferContext.save();
    bufferContext.translate(400, 450);
    bufferContext.rotate(sin(glitch * 0.01) * 0.2);
    bufferContext.translate(-400, -450);
    bufferContext.drawImage(images['teacherBody'], 320, 250);
    bufferContext.translate(390, 270);
    bufferContext.rotate(glitch * 0.008);
    bufferContext.translate(-390, -270);
    bufferContext.drawImage(images['teacherHead'], 350, 170);
    bufferContext.restore();
    bufferContext.save();
    // upper arm
    bufferContext.translate(430, 310);
    bufferContext.rotate(glitch * 0.005);
    bufferContext.translate(-430, -310);
    bufferContext.drawImage(images['teacherUpperArm'], 425, 275);
    // lower arm, chalk
    bufferContext.translate(520, 310);
    bufferContext.rotate(glitch * 0.02);
    bufferContext.translate(-520, -310);
    bufferContext.drawImageScaled(images['chalk'], 483, 207, 43, 32);
    bufferContext.drawImage(images['teacherArm'], 500, 208);
    bufferContext.restore();

    bufferContext.fillStyle = '#A1D42B';
    bufferContext.font = '30px "Special Elite"';
    bufferContext.fillText('The inattention of your', 180, 100);
    bufferContext.fillText('students made you go insane', 180, 150);
    bufferContext.fillStyle = '#A1D42B';
    bufferContext.font = '20px "Special Elite"';
    bufferContext.fillText("Refresh the page for another try", 445, 430);
  }

}
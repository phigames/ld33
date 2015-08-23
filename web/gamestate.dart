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
    bufferContext.fillText('You shocked your', 400, 150);
    bufferContext.fillText('students to death', 400, 200);
    bufferContext.fillStyle = '#9D2F39';
    bufferContext.font = '50px "Special Elite"';
    bufferContext.fillText("You're fired", 400, 300);
  }

}
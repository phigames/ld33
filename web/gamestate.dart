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
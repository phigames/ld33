part of ld33;

class Classroom {

  Teacher teacher;
  num attentiveness;  // 0-100
  List<Throwable> throwables = new List<Throwable>();
  int lastThrow;
  int throwTest;

  Classroom() {
    teacher = new Teacher();
    attentiveness = 100;
    lastThrow = 0;
  }

  void update(num delta) {
    lastThrow += delta;
    teacher.update(delta);
    attentiveness -= delta * 0.01; //per second: - 10
    if (lastThrow > 2000) {
      lastThrow = 0;
      throwables.add(new PaperBall());
    }
    for (int i = 0; i < throwables.length; i++) {
      throwables[i].update(delta);
      if (throwables[i].dead) {
        throwables.removeAt(i);
        i--;
      }
    }
  }

  void draw() {
    bufferContext.drawImage(images['background'], 0, 0);
    teacher.draw();
    bufferContext.fillStyle = '#0F0';
    bufferContext.fillRect(100, 350, attentiveness / 100 * 600, 20);  // attentiveness bar
    bufferContext.fillStyle = '#00F';
    teacher.draw();
    for (int i = 0; i < throwables.length; i++) {
      throwables[i].draw();
    }
  }
}

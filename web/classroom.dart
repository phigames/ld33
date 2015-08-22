part of ld33;

class Classroom {

  Teacher teacher;
  num attentiveness;  // 0-100

  Classroom() {
    teacher = new Teacher();
    attentiveness = 100;
  }

  void update(num delta) {
    teacher.update(delta);
    attentiveness -= delta * 0.01; //per second: - 10
    }

  void draw() {
    bufferContext.fillStyle = '#ACF';
    bufferContext.fillRect(0, 0, canvasWidth, canvasHeight);  // classroom background
    teacher.draw();
    bufferContext.fillStyle = '#0F0';
    bufferContext.fillRect(100, 350, attentiveness / 100 * 600, 20);  // attentiveness bar
    bufferContext.fillStyle = '#00F';
    bufferContext.fillRect(testInput, 0, 50, 50);  // test input
    teacher.draw();
    }
}

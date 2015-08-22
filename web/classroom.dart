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
    teacher.draw();
    bufferContext.fillStyle = '#ACF';
    bufferContext.fillRect(0, 0, canvasWidth, canvasHeight);  // classroom background
    bufferContext.fillStyle = '#0F0';
    bufferContext.fillRect(100, 350, attentiveness / 100 * 600, 20);  // attentiveness bar
    }
}

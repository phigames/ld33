part of ld33;

class Classroom {

  Teacher teacher;
  num attentiveness;  // 0-100
  List<Throwable> throwables;
  int lastThrow;

  Classroom() {
    teacher = new Teacher();
    throwables = new List<Throwable>();
    attentiveness = 100;
    lastThrow = 0;
  }

  void silence(num attentivenessDeduction) {
    attentiveness -= attentivenessDeduction;
  }

  void update(num delta) {
    lastThrow += delta;
    teacher.update(delta);
    attentiveness -= delta * 0.01; //per second: - 10
    if (lastThrow > 2000) {
      lastThrow = 0;
      throwables.add(new Sandwich());
    }
    for (int i = 0; i < throwables.length; i++) {
      throwables[i].update(delta);
      if (throwables[i].dead) {
        throwables.removeAt(i);
        i--;
      }
    }
    if (mouseX > 33 && mouseX < 153 && mouseY > 0 && mouseY < 132) {
      canvas.style.cursor = 'pointer';
      if (leftMouse) {
        teacher.act(new ActionWarning());
      }
    } else if (mouseX > 186 && mouseX < 306 && mouseY > 0 && mouseY < 132) {
      canvas.style.cursor = 'pointer';
      if (leftMouse) {
        teacher.act(new ActionFingernail());
      }
    } else if (mouseX > 339 && mouseX < 459 && mouseY > 0 && mouseY < 132) {
      canvas.style.cursor = 'pointer';
      if (leftMouse) {
        teacher.act(new ActionShout());
      }
    } else if (mouseX > 492 && mouseX < 612 && mouseY > 0 && mouseY < 132) {
      canvas.style.cursor = 'pointer';
      if (leftMouse) {
       teacher.act(new ActionChalk());
      }
    } else if (mouseX > 645 && mouseX < 765 && mouseY > 0 && mouseY < 132) {
      canvas.style.cursor = 'pointer';
      if (leftMouse) {
        teacher.act(new ActionMonster());
      }
    } else {
      canvas.style.cursor = 'auto';
    }
  }

  void draw() {
    bufferContext.drawImage(images['background'], 0, 0);
    bufferContext.drawImage(images['action0'], 33, 0);
    bufferContext.drawImage(images['action1'], 186, 0);
    bufferContext.drawImage(images['action2'], 339, 0);
    bufferContext.drawImage(images['action3'], 492, 0);
    bufferContext.drawImage(images['action4'], 645, 0);

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
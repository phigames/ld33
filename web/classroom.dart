part of ld33;

class Classroom {

  Teacher teacher;
  num attentiveness;  // 0-100
  List<Throwable> throwables;
  int lastThrow;
  List<Poof> poofs;
  AudioElement currentAttentivenessSound;

  Classroom() {
    teacher = new Teacher();
    throwables = new List<Throwable>();
    attentiveness = 100;
    lastThrow = 0;
    poofs = new List<Poof>();
  }

  void silence(num attentivenessAddition) {
    attentiveness += attentivenessAddition;
    if (attentiveness > 100) {
      attentiveness = 100;
    }
  }

  void update(num delta) {
    lastThrow += delta;
    teacher.update(delta);
    //attentiveness -= delta * 0.005; //per second: - 10
    if (lastThrow > 2000) {
      lastThrow = 0;
      throwables.add(new Sandwich());
    }
    for (int i = 0; i < throwables.length; i++) {
      throwables[i].update(delta);
      if (throwables[i].dead) {
        poofs.add(new Poof(throwables[i].x, throwables[i].y));
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
    for (int i = 0; i < poofs.length; i++) {
      poofs[i].update(delta);
      if (poofs[i].dead) {
        poofs.removeAt(i);
        i--;
      }
    }
      if (currentAttentivenessSound != sounds['attentiveness1'] && attentiveness < 100 / 3) {
        currentAttentivenessSound = sounds['attentiveness1'];
      } else if (currentAttentivenessSound != sounds['attentiveness2'] && attentiveness < 200 / 3) {
        currentAttentivenessSound = sounds['attentiveness2'];
      } else if (currentAttentivenessSound != sounds['attentiveness3']) {
        currentAttentivenessSound = sounds['attentiveness3'];
      }
    currentAttentivenessSound.loop = true;
      currentAttentivenessSound.play();
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
    for (int i = 0; i < poofs.length; i++) {
      poofs[i].draw();
    }
  }
}

class Poof {

  num x, y;
  num time;
  bool dead;

  Poof(this.x, this.y) {
    time = 0;
    dead = false;
  }

  void update(num delta) {
    time += delta;
    if (time >= 300) {
      dead = true;
    }
  }

  void draw() {
    num w = (time + 100) / 2;
    num h = w / 206 * 202;
    bufferContext.globalAlpha = 1 - time / 300;
    bufferContext.drawImageScaled(images['poof'], x - w / 2, y - h / 2, w, h);
    bufferContext.globalAlpha = 1;
  }

}
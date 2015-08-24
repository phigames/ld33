part of ld33;

class Classroom {

  Teacher teacher;
  num attentiveness;  // 0-100
  List<Throwable> throwables;
  num nextThrow;
  List<Poof> poofs;
  AudioElement currentAttentivenessSound;

  Classroom() {
    teacher = new Teacher();
    throwables = new List<Throwable>();
    attentiveness = 100;
    nextThrow = 3000;
    poofs = new List<Poof>();
    currentAttentivenessSound = sounds['attentiveness3'];
    currentAttentivenessSound.loop = true;
    currentAttentivenessSound.play();
  }

  void silence(num attentivenessAddition) {
    attentiveness += attentivenessAddition;
    if (attentiveness > 100) {
      attentiveness = 100;
    }
  }

  void party(num attentivenessDeduction) {
    attentiveness -= attentivenessDeduction;
    if (attentiveness < 0) {
      attentiveness = 0;
      gamestate = new GamestateLost();
    }
  }

  void update(num delta) {
    nextThrow -= delta;
    teacher.update(delta);
    party(delta * 0.00002 * teacher.coolness);
    if (nextThrow <= 0) {
      nextThrow = 3000 + random.nextDouble() * 2000 - teacher.coolness * 30;
      if (teacher.coolness < 50) {
        throwables.add(new PaperBall());
      } else if (teacher.coolness < 80) {
        throwables.add(new Sandwich());
      } else {
        throwables.add(new Book());
      }
    }
    for (int i = 0; i < throwables.length; i++) {
      throwables[i].update(delta);
      if (throwables[i].dead) {
        poofs.add(new Poof(throwables[i].x, throwables[i].y));
        throwables.removeAt(i);
        i--;
      }
    }
    if (mouseX > 33 && mouseX < 153 && mouseY > 0 && mouseY < 132 && teacher.coolness >= ActionWarning.PRICE) {
      canvas.style.cursor = 'pointer';
      if (leftMouse && teacher.action == null) {
        teacher.act(new ActionWarning());
      }
    } else if (mouseX > 186 && mouseX < 306 && mouseY > 0 && mouseY < 132 && teacher.coolness >= ActionFingernail.PRICE) {
      canvas.style.cursor = 'pointer';
      if (leftMouse && teacher.action == null) {
        teacher.act(new ActionFingernail());
      }
    } else if (mouseX > 339 && mouseX < 459 && mouseY > 0 && mouseY < 132 && teacher.coolness >= ActionShout.PRICE) {
      canvas.style.cursor = 'pointer';
      if (leftMouse && teacher.action == null) {
        teacher.act(new ActionShout());
      }
    } else if (mouseX > 492 && mouseX < 612 && mouseY > 0 && mouseY < 132 && teacher.coolness >= ActionChalk.PRICE) {
      canvas.style.cursor = 'pointer';
      if (leftMouse && teacher.action == null) {
       teacher.act(new ActionChalk());
      }
    } else if (mouseX > 645 && mouseX < 765 && mouseY > 0 && mouseY < 132 && teacher.coolness >= ActionMonster.PRICE) {
      canvas.style.cursor = 'pointer';
      if (leftMouse && teacher.action == null) {
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
    if (!(gamestate is GamestateEnd)) {
      if (currentAttentivenessSound != sounds['attentiveness1'] && attentiveness < 100 / 3) {
        currentAttentivenessSound.pause();
        currentAttentivenessSound = sounds['attentiveness1'];
        currentAttentivenessSound.loop = true;
        currentAttentivenessSound.play();
        print(1);
      }
      if (currentAttentivenessSound != sounds['attentiveness2'] && attentiveness > 100 / 3 && attentiveness < 200 / 3) {
        currentAttentivenessSound.pause();
        currentAttentivenessSound = sounds['attentiveness2'];
        currentAttentivenessSound.loop = true;
        currentAttentivenessSound.play();
        print(2);
      }
      if (currentAttentivenessSound != sounds['attentiveness3'] && attentiveness > 200 / 3) {
        currentAttentivenessSound.pause();
        currentAttentivenessSound = sounds['attentiveness3'];
        currentAttentivenessSound.loop = true;
        currentAttentivenessSound.play();
        print(3);
      }
    } else {
      currentAttentivenessSound.pause();
    }
  }

  void draw() {
    bufferContext.drawImage(images['background'], 0, 0);
    if (teacher.coolness < ActionWarning.PRICE) {
      bufferContext.globalAlpha = 0.5;
      bufferContext.fillStyle = '#F00';
      bufferContext.font = 'bold 15px "Special Elite"';
      bufferContext.drawImage(images['action0'], 33, 0);
      bufferContext.globalAlpha = 1;
      bufferContext.fillText('not cool enough', 33, 145);
    } else {
      bufferContext.drawImage(images['action0'], 33, 0);
    }
    if (teacher.coolness < ActionFingernail.PRICE) {
      bufferContext.globalAlpha = 0.5;
      bufferContext.fillStyle = '#F00';
      bufferContext.font = 'bold 15px "Special Elite"';
      bufferContext.drawImage(images['action1'], 186, 0);
      bufferContext.globalAlpha = 1;
      bufferContext.fillText('not cool enough', 186, 145);
    } else {
      bufferContext.drawImage(images['action1'], 186, 0);
    }
    if (teacher.coolness < ActionShout.PRICE) {
      bufferContext.globalAlpha = 0.5;
      bufferContext.fillStyle = '#F00';
      bufferContext.font = 'bold 15px "Special Elite"';
      bufferContext.drawImage(images['action2'], 339, 0);
      bufferContext.globalAlpha = 1;
      bufferContext.fillText('not cool enough', 339, 145);
    } else {
      bufferContext.drawImage(images['action2'], 339, 0);
    }
    if (teacher.coolness < ActionChalk.PRICE) {
      bufferContext.globalAlpha = 0.5;
      bufferContext.fillStyle = '#F00';
      bufferContext.font = 'bold 15px "Special Elite"';
      bufferContext.drawImage(images['action3'], 492, 0);
      bufferContext.globalAlpha = 1;
      bufferContext.fillText('not cool enough', 492, 145);
    } else {
      bufferContext.drawImage(images['action3'], 492, 0);
    }
    if (teacher.coolness < ActionMonster.PRICE) {
      bufferContext.globalAlpha = 0.5;
      bufferContext.fillStyle = '#F00';
      bufferContext.font = 'bold 15px "Special Elite"';
      bufferContext.drawImage(images['action4'], 645, 0);
      bufferContext.globalAlpha = 1;
      bufferContext.fillText('not cool enough', 645, 145);
    } else {
      bufferContext.drawImage(images['action4'], 645, 0);
    }

    teacher.draw();
    // attentiveness bar
    if (attentiveness > 200 / 3) {
      bufferContext.fillStyle = '#0A0';
    } else if (attentiveness > 100 / 3) {
      bufferContext.fillStyle = '#AA0';
    } else {
      bufferContext.fillStyle = '#A00';
    }
    bufferContext.fillRect(30, 370, 20, -attentiveness * 2);
    bufferContext.strokeStyle = '#FFF';
    bufferContext.lineWidth = 3;
    bufferContext.strokeRect(30, 370, 20, -200);
    bufferContext.drawImage(images['ear'], 10, 340);

    // coolness bar
    bufferContext.fillStyle = '#00F';
    bufferContext.fillRect(750, 370, 20, -teacher.coolness * 2);
    bufferContext.strokeStyle = '#FFF';
    bufferContext.lineWidth = 3;
    bufferContext.strokeRect(750, 370, 20, -200);
    bufferContext.drawImage(images['glasses'], 650, 340);

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
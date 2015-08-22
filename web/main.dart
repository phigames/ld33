library ld33;

import 'dart:html';
import 'dart:math';

part 'gamestate.dart';
part 'classroom.dart';
part 'teacher.dart';
part 'throwable.dart';
part 'input.dart';
part 'resources.dart';

num loopTime;
int canvasWidth, canvasHeight;
CanvasElement canvas, buffer;
CanvasRenderingContext2D canvasContext, bufferContext;
Gamestate gamestate;
Classroom classroom;
Random random;

void main() {
  loopTime = -1;
  canvas = querySelector('#canvas');
  canvasWidth = canvas.width;
  canvasHeight = canvas.height;
  buffer = new CanvasElement(width: canvasWidth, height: canvasHeight); //to draw: use bufferContext
  canvasContext = canvas.context2D;
  bufferContext = buffer.context2D;
  loadResources();
  initInput();
  window.onKeyDown.listen(onKeyDown);
  window.onKeyUp.listen(onKeyUp);
  canvas.onMouseDown.listen(onMouseDown);
  canvas.onMouseUp.listen(onMouseUp);
  canvas.onMouseMove.listen(onMouseMove);
  gamestate = new GamestatePlaying();
  random = new Random();
  requestFrame();
}

void frame(num time) {
  if (loopTime == -1) {
    loopTime = time;
  } else {
    gamestate.update(time - loopTime);
    bufferContext.clearRect(0, 0, canvasWidth, canvasHeight);
    gamestate.draw();
    canvasContext.clearRect(0, 0, canvasWidth, canvasHeight);
    canvasContext.drawImage(buffer, 0, 0);
    loopTime = time;
  }
  requestFrame();
}

void requestFrame() {
  window.animationFrame.then(frame);
}
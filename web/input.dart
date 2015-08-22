part of ld33;

bool leftKey, rightKey;
bool leftMouse;
int mouseX, mouseY;

void initInput(){
  leftKey = false;
  rightKey = false;
  leftMouse = false;
  mouseX = 0;
  mouseY = 0;
}

void onKeyDown(KeyboardEvent event) {
  if (event.keyCode == KeyCode.LEFT || event.keyCode == KeyCode.A) {
    leftKey = true;
  } else if (event.keyCode == KeyCode.RIGHT || event.keyCode == KeyCode.D) {
    rightKey = true;
  }
}

void onKeyUp(KeyboardEvent event) {
  if (event.keyCode == KeyCode.LEFT || event.keyCode == KeyCode.A) {
    leftKey = false;
  } else if (event.keyCode == KeyCode.RIGHT || event.keyCode == KeyCode.D) {
    rightKey = false;
  }
}

void onMouseDown(MouseEvent event) {
  if (event.button == 0) {
    leftMouse = true;
  }
}

void onMouseUp(MouseEvent event) {
  if (event.button == 0) {
    leftMouse = false;
  }
}

void onMouseMove(MouseEvent event) {
  mouseX = event.layer.x; //Get the horizontal coordinate
  mouseY = event.layer.y; //Get the vertical coordinate
}
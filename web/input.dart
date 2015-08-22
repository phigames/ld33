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
  if (event.keyCode == KeyCode.LEFT) {
    leftKey = true;
  } else if (event.keyCode == KeyCode.RIGHT) {
    rightKey = true;
  }
}

void onKeyUp(KeyboardEvent event) {
  if (event.keyCode == KeyCode.LEFT) {
    leftKey = false;
  } else if (event.keyCode == KeyCode.RIGHT) {
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
  mouseX = event.client.x - canvas.offsetLeft + window.scrollX; //Get the horizontal coordinate --> ABER was macht dr räscht? :D
  mouseY = event.client.y - canvas.offsetTop + window.scrollY; //Get the vertical coordinate
}
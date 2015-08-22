part of ld33;

class Teacher {

  num coolness;   // 0 = uncool, 100 = maximally cool
  int position;   // -1 = left, 0 = center, 1 = right

  Teacher() {
    coolness = 50;
  }

  void damage(num coolnessDeduction) {
    coolness -= coolnessDeduction;
  }

  void update(num delta) {
    if (leftKey) {
      position = -1;
    } else if (rightKey) {
      position = 1;
    } else {
      position = 0;
    }
  }

  void draw() {
    bufferContext.fillStyle = '#00F';
    bufferContext.fillRect(300 + position * 200, 200, 200, 250); // teacher body
  }

}
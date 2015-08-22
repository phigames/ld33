part of ld33;

class Teacher {

  num coolness;   // 0 = uncool, 100 = maximally cool

  Teacher() {
    coolness = 50;
  }

  void damage(num coolnessDeduction) {
    coolness -= coolnessDeduction;
  }

  void update(num delta) {

  }

  void draw() {
    bufferContext.fillStyle = '#00F';
    bufferContext.fillRect(300, 200, 200, 250); // teacher body
  }

}
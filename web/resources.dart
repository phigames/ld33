part of ld33;

Map<String, ImageElement> images;
Map<String, AudioElement> sounds;

void loadResources() {
  images = new Map<String, ImageElement>();
  images['background'] = new ImageElement(src: 'res/background.png');
  images['teacherBody'] = new ImageElement(src: 'res/teacherBody.png');
  images['teacherHead'] = new ImageElement(src: 'res/teacherHead.png');
  images['teacherUpperArm'] = new ImageElement(src: 'res/teacherUpperArm.png');
  images['teacherArm'] = new ImageElement(src: 'res/teacherArm.png');
  images['chalk'] = new ImageElement(src: 'res/chalk.png');
  images['paperBall'] = new ImageElement(src: 'res/paperBall.png');
  images['sandwich'] = new ImageElement(src: 'res/sandwich.png');
  images['book'] = new ImageElement(src: 'res/book.png');
  images['action0'] = new ImageElement(src: 'res/action0.png');
  images['action1'] = new ImageElement(src: 'res/action1.png');
  images['action2'] = new ImageElement(src: 'res/action2.png');
  images['action3'] = new ImageElement(src: 'res/action3.png');
  images['action4'] = new ImageElement(src: 'res/action4.png');
  sounds = new Map<String, AudioElement>();
}
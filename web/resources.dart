part of ld33;

Map<String, ImageElement> images;
Map<String, AudioElement> sounds;

void loadResources() {
  images = new Map<String, ImageElement>();
  images['teacherBody'] = new ImageElement(src: 'res/teacherBody.png');
  images['teacherHead'] = new ImageElement(src: 'res/teacherHead.png');
  images['teacherUpperArm'] = new ImageElement(src: 'res/teacherUpperArm.png');
  images['teacherArm'] = new ImageElement(src: 'res/teacherArm.png');
  images['paperBall'] = new ImageElement(src: 'res/paperBall.png');
  images['sandwich'] = new ImageElement(src: 'res/sandwich.png');
  images['book'] = new ImageElement(src: 'res/book.png');
  sounds = new Map<String, AudioElement>();
}
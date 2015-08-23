part of ld33;

Map<String, ImageElement> images;
Map<String, AudioElement> sounds;

void loadResources() {
  images = new Map<String, ImageElement>();
  images['teacherBody'] = new ImageElement(src: 'res/teacherBody.png');
  images['teacherHead'] = new ImageElement(src: 'res/teacherHead.png');
  images['teacherArm'] = new ImageElement(src: 'res/teacherArm.png');
  images['paperBall'] = new ImageElement(src: 'res/paperBall.png');
  sounds = new Map<String, AudioElement>();
}
part of ld33;

int imagesLoaded;
int soundsLoaded;
Map<String, ImageElement> images;
Map<String, AudioElement> sounds;

void loadResources() {
  imagesLoaded = 0;
  soundsLoaded = 0;
  images = new Map<String, ImageElement>();
  images['background'] = new ImageElement(src: 'res/background.png');
  images['teacherBody'] = new ImageElement(src: 'res/teacherBody.png');
  images['teacherHead'] = new ImageElement(src: 'res/teacherHead.png');
  images['teacherUpperArm'] = new ImageElement(src: 'res/teacherUpperArm.png');
  images['teacherArm'] = new ImageElement(src: 'res/teacherArm.png');
  images['monster'] = new ImageElement(src: 'res/monster.png');
  images['chalk'] = new ImageElement(src: 'res/chalk.png');
  images['paperBall'] = new ImageElement(src: 'res/paperBall.png');
  images['sandwich'] = new ImageElement(src: 'res/sandwich.png');
  images['book'] = new ImageElement(src: 'res/book.png');
  images['poof'] = new ImageElement(src: 'res/poof.png');
  images['action0'] = new ImageElement(src: 'res/action0.png');
  images['action1'] = new ImageElement(src: 'res/action1.png');
  images['action2'] = new ImageElement(src: 'res/action2.png');
  images['action3'] = new ImageElement(src: 'res/action3.png');
  images['action4'] = new ImageElement(src: 'res/action4.png');
  images['ear'] = new ImageElement(src: 'res/ear.png');
  images['glasses'] = new ImageElement(src: 'res/glasses.png');
  images['backgroundMenu'] = new ImageElement(src: 'res/backgroundMenu.png');
  for (int i = 0; i < images.length; i++) {
    images.values.elementAt(i).onLoad.first.then((e) => onImageLoaded());
  }
  sounds = new Map<String, AudioElement>();
  sounds['attentiveness1'] = new AudioElement('res/attentiveness1.wav');
  sounds['attentiveness2'] = new AudioElement('res/attentiveness2.wav');
  sounds['attentiveness3'] = new AudioElement('res/attentiveness3.wav');
  sounds['warning'] = new AudioElement('res/warning.wav');
  sounds['fingernail'] = new AudioElement('res/fingernail.wav');
  sounds['monster'] = new AudioElement('res/monster.wav');
  sounds['shout'] = new AudioElement('res/shout.wav');
  sounds['ouch'] = new AudioElement('res/ouch.wav');
  for (int i = 0; i < sounds.length; i++) {
    sounds.values.elementAt(i).onLoadedData.first.then((e) => onSoundLoaded());
  }
}

void onImageLoaded() {
  imagesLoaded++;
  if (imagesLoaded == images.length) {
    querySelector('#loadimages').style.display = 'none';
    if (soundsLoaded == sounds.length) {
      querySelector('#start').style.display = 'block';
    }
  }
}

void onSoundLoaded() {
  soundsLoaded++;
  if (soundsLoaded == sounds.length) {
    querySelector('#loadsounds').style.display = 'none';
    if (imagesLoaded == images.length) {
      querySelector('#start').style.display = 'block';
    }
  }
}
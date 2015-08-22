part of ld33;

Map<String, ImageElement> images;
Map<String, AudioElement> sounds;

void loadResources() {
  images = new Map<String, ImageElement>();
  //images['test'] = new ImageElement(src: 'res/start.png');
  sounds = new Map<String, AudioElement>();
}
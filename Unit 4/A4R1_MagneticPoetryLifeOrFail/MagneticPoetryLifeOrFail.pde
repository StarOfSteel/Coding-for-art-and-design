//Word being pointed by pedal to the right is where the poem starts
//As this is magnetic poetry you can create new wordings with this and may be ablt to create a whole new poem
//This is a self made poem
PFont font;
String[] words = {"A", "reason", "to", "fail", "is", "another", "reason", "to", "sprout", "A", "reason", "to", "Stop", "is", "another", "reason", "to", "go", "A", "reason", "to", "fall", "is", "another", "reason", "to", "get", "up", "But", "there's", "no", "reason", "to" , "give", "up", "because", "the", "only", "way", "is", "to", "keep", "on", "going"};
Word[] wordObjects;
float angle;

void setup() {
  size(800, 800);
  background(255);
  font = createFont("Arial", 16);
  textFont(font);
  textAlign(CENTER, CENTER);
  //Word length
  angle = TWO_PI / words.length;
  wordObjects = new Word[words.length];
  
  for (int i = 0; i < words.length; i++) {
    float x = width/2 + cos(angle * i) * width/3;
    float y = height/2 + sin(angle * i) * height/3;
    wordObjects[i] = new Word(words[i], x, y);
  }
}

void draw() {
  background(255);
  translate(width/2, height/2);
  
  // Flower shape
  fill(172, 172, 172);
  for (int i = 0; i < 8; i++) {
    pushMatrix();
    rotate(PI/4 * i);
    ellipse(0, -height/8, 37, 206);
    popMatrix();
  }
  fill(13, 13, 11);
  ellipse(0, 2, 50, 59);
  
  // Words
  for (Word word : wordObjects) {
    word.display();
  }
}
//Mouse moving words
void mouseDragged() {
  for (Word word : wordObjects) {
    word.drag();
  }
}
//Calling the class
class Word {
  String text;
  float x, y; //Coordinates 
  boolean dragging = false; //Word not being dragged
  
  //Constructor
  Word(String text, float x, float y) {
    this.text = text;
    this.x = x;
    this.y = y;
  }
  //Discplay text at location
  void display() {
    fill(0);
    text(text, x - width/2, y - height/2);
  }
  //Words being able to be dragged
  void drag() {
    if (mousePressed && dist(mouseX, mouseY, x, y) < 20) {
      x = mouseX;
      y = mouseY;
      dragging = true;
    } else {
      dragging = false;
    }
  }
}
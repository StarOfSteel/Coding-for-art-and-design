//Went for a hypno like design using circles and squares.

int totalFrames = 120;
int counter = 0;

void setup() {
 size(555,555);
  
}

//Exiting frames after code is done
void draw() {
 
  float percent = float(counter) / totalFrames;
  render(percent);
  saveFrame("output/gif-"+nf(counter,4)+".png");
  counter++;
   if (counter == totalFrames) {
    exit();
  }
}

  //squares in a gif
  //simple loop
void render(float percent) {
  background(0);
  fill(255);
  
  float angle = percent * TWO_PI;
  translate(width/2, height/2);
  rectMode(CENTER);
  noFill();
  stroke(255);
  strokeWeight(5);
  rotate(angle);
  square(0, 0, 50);
  square(0, 0, 100);
  square(0, 0, 300);
  circle(0, 0, 100);
  circle(0, 0, 200);
  circle(0,0,400);
  square(0, 0, 500);
  circle(0, 0, 600);
  
}

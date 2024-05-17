//I'm going to have lots of comments only because this as fun to do and I'm trying to get a good grade pftfft
//Most of the comments was to organize my code
//I wanted a bar graph that shows the sales of Monster Hunter Games. 
//I also added a legend to show which is which for an easier look
//I'm actually proud of this as i took a while and adding the links with figuring out how to incorporate them was fun.
//Creating the Legend was also fun
//L will equal legend for the sake of writing time
//BG will mean bar graph
//mh = Monster Hunter
BG bar; //At first I didn't call this globally but I was having problems

void setup() {
   size(800,500);
   String[] mh = {"MH", "MH2", "MH3", "MH4", "MHGen", "MHW", "MHR"};
   int[] sales = {2, 7, 9, 8, 9, 37, 23}; //Sales by thousands
   int[] colors = {color(#f3d02b), color(#2bdbf3), 
   color(#2b6bf3), color(#a59834), color(#ea420d),
   color(#6ad268), color(#8868d2)};
//Was having soo much trouble implementing the bar graph on click opening the link to the MH wiki
//At first I had only 1 draw function having everything in draw.
//But I realized that anything in the class won't work if it's not in the code globally
//So I created anothee draw function for the legend and bar graph THEN I added mouse Clicked globally so that the links can work on click.
//MH urls
  String[] url = {"https://monsterhunter.fandom.com/wiki/MH1:_Monsters", 
"https://monsterhunter.fandom.com/wiki/Monster_Hunter_2",
"https://monsterhunter.fandom.com/wiki/Monster_Hunter_3",
"https://monsterhunter.fandom.com/wiki/Monster_Hunter_4",
"https://monsterhunter.fandom.com/wiki/Monster_Hunter_Generations",
"https://monsterhunterworld.wiki.fextralife.com/Monsters",
"https://monsterhunterrise.wiki.fextralife.com/monster+hunter+rise+wiki"
  };
//Graph properties
 bar = new BG(mh, sales, colors, url); //Creating bg
}
void draw() {
  background(255);
  //draw out graph globally
  bar.draw();
  //draw out legensd
  drawL();
}
//The mouseClicked was another thing because I had to add this globally and within the class as the assignment was to have a class.
void mouseClicked() {
  bar.mouseClicked();
}

//I have learned that when I have my bar graph in class I cannot tweak unless I'm changing what's inside of the class
//Since adding at least one class is in the assignment I'll keep his and tweak it old fashion
class BG { //class for the bar 
  String[] mh;
  int[] sales;
  int[] colors;
  int bWidth = 70; //Size of the bar
  String[] url; //For URLs
  
  BG(String[] mh, int[] sales, int[] colors, String[]url) {
    this.mh = mh;
    this.sales = sales;
    this.colors = colors;
    this. url = url;
  }
//Mouse clicks for the bars
void mouseClicked() {
  for (int i = 0; i < mh.length; i++) {
    int x = 50 + i * (bWidth + 10);
    int y = height - sales[i] * 10;
    int bHeight = sales[i] * 10;
  //Mouse clicks directly to the bars  
    if (mouseX >= x) {
      if (mouseX <= x + bWidth) {
        if (mouseY >= y) { //I had this code to be mouseY > = y and was wondering why it wasn't working and well the problem was the space PFFFT
          if (mouseY <= y + bHeight) {
            link(url[i]); 
          }
        }
      }
    }
  }
}

  
 void draw() {
    //Doing this whole line of code was weird as I had to learn more about well height and length in a litmited amount of time.
    //Didn't perfect it but this give me what I want. Hoping to get better with loops
    for (int i = 0; i < mh.length; i++) {
      int x = 50 + i * (bWidth + 10); // horizontal position (This one was weird)
      int y = height - sales[i] * 10; // Vertical position of the bar
      int bHeight = sales[i] * 10; //Height of the bar
      fill(colors[i]); //colors for each game
      rect(x, y, bWidth, bHeight);
      fill(0);
      text(mh[i], x + bWidth / 4, height - 10); // Monster Hunter Label
      
    }
  }
}
  
  
 //Size of the legend and location 
 //l = legend
void drawL() {
  int lX = 650; 
  int lY = 100; 
  int lWidth = 100;
  int lHeight = 200; 
  int lMargin = 20; 

  // Legend for Monster Hunter
  
  fill(255);
  stroke(0);
  rect(lX, lY, lWidth, lHeight);

  //Legend Labels and colored boxes
  //Legend to the right
  String[] mh = {"MH", "MH2", "MH3", "MH4", 
  "MHGen", "MHW", "MHR"};
  int[] colors = {color(#f3d02b), color(#2bdbf3), 
    color(#2b6bf3), color(#a59834), color(#ea420d),
    color(#6ad268), color(#8868d2)};
  for (int i = 0; i < mh.length; i++) {
    int labelX = lX + lMargin;
    int labelY = lY + lMargin + i * 20;
    int box = 10;

    fill(colors[i]);
    rect(labelX, labelY, box, box);

    fill(0);
    text(mh[i], labelX + box + 5, labelY + box);
  }
} 

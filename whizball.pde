int rad = 30;        // Width of the shape
float xpos, ypos;    // Starting position of shape    

float xspeed = 3;  // Speed of the shape
float yspeed = 3;  // Speed of the shape

float xdirection = 1;  // Left or Right
float ydirection = 1;  // Top to Bottom
PImage img1;
String userName = "";

/*** Game State Boolean Variables ****/
boolean gameStarted = false;
boolean userNameInput = false;


void setup()   
{
  img1 = loadImage("1.jpg");
  size(800, 600);
  noStroke();
  frameRate(25);
  ellipseMode(RADIUS);
  // Set the starting position of the shape
  xpos = width/8;
  ypos = height/2;
}

void draw() 
{
  
  if (!gameStarted) {
    // Show start up image
    image(img1, 0, 0);
  }
  
  else if (gameStarted && !userNameInput) {
    background(0);
    // Get user input 
    textSize(36);
    text("WHIZZBALL",300,40);
    
    
    textSize(28);
    text("Please write your name and hit enter to start playing. ", 30, 100);
    
    
    text(userName,300,150);
    fill(0,255,0);
    
  }
  
  else if (gameStarted && userNameInput) {
    
          background(255, 0, 0);
          for (int i = 0; i < 10; i++) {
            float x = random(width);
            float y = random(height);
            text("TUT group 12", x*2, y*2);
          }
         
          if (frameCount % 10 == 2) println(frameRate);
      
          // Update the position of the shape
          xpos = xpos + ( (xspeed) * (xdirection) );
          ypos = ypos + ( (yspeed) * (ydirection) );
      
        // Test to see if the shape exceeds the boundaries of the screen
        // If it does, reverse its direction by multiplying by -1
        if (xpos > width-rad || xpos < rad) {
          xdirection *= -1;
        } else {
          fill(255);
        }
        
        
        if (ypos > height-rad || ypos < rad) {
          ydirection *= -1;
        }
      
        // Draw the shape
        stroke(0);
        ellipse(xpos, ypos, rad, rad);
        stroke(0);
        ellipse(xpos-15, ypos-8, rad/5, rad/4);
        stroke(0);
        ellipse(xpos+15, ypos-8, rad/5, rad/4);
        stroke(0);
        ellipse(xpos, ypos+15, rad/2, rad/6);
  }
     
   

  
}

void keyPressed() {
  print("press");
  if (!gameStarted ) {
    if (key == '\n') {
      gameStarted = true;
    }
       
  } else if (!userNameInput) {
     // Keep on taking user input until enter is pressed
     if (key != '\n') {
       userName = userName + key;
     }
     
     else {
       userNameInput = true;
     }
  }
}

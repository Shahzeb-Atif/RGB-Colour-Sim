//RGB Colour Simulator//
//Shahzeb Atif//
//ICS4UI//

//Must have controlP5 library by Andreas Schlegel downloaded//
//import controlP5 library and controlP5 object//
import controlP5.*;
ControlP5 controlP5; 

//Array and Variables//
color [] colour = new color[3];

//these variables: red, green, and blue, all serve as a third party/middle-man that help generate the mixed colour later in the code//
int red;
int green;
int blue;
int fillColour;
int fillColour2;
int fillColour3;
int mixColour;

//x is used to shorten a variable used later in the code//
float x;

//Setup//
void setup() {
  
//Background//
  size(1000,600);
  background(0);    
  controlP5 = new ControlP5(this);

//Parameters: name, minimum value, maximum value, default value, x, y, diameter
//Knobs//  
  controlP5.addKnob("RED",0,255,0,50,400,125);
  controlP5.addKnob("GREEN",0,255,0,240,400,125);
  controlP5.addKnob("BLUE",0,255,0,425,400,125);
  controlP5.addKnob("MIXED",0,255,0,845,400,125);

//Buttons//

//SAVE//
  controlP5.addButton("SAVE 1",1,425,255,75,25);
  controlP5.addButton("SAVE 2",1,425,285,75,25);
  controlP5.addButton("SAVE 3",1,425,315,75,25);

//RESET//  
  controlP5.addButton("RESET",1,512,285,75,25);

//DELETE//  
  controlP5.addButton("DELETE 1",1,671,210,55,15);
  controlP5.addButton("DELETE 2",1,671,360,55,15);
  controlP5.addButton("DELETE 3",1,671,510,55,15);
  
//Remove All//  
  controlP5.addButton("REMOVE ALL",1,665,555,75,25);
}

//Draw//  
void draw() {
  
//Titles//  
  fill(255);
  textSize(30);
  text("RGB Colour Simulator", 150,50);
  textSize(20);
  text("SAVE(S)", 665,50);
  text("Black/White", 850,50);
  
//Instructions//
  textSize(15);
  text("Instructions",20,255);
  textSize(12);
  text("Spin the three knobs",20,275);
  text("Watch the colours change",20,290);
  text("Hit 'SAVE' to keep/compare",20,305);
  text("Hit 'DELETE' to remove save",20,320);
  text("Hit 'RESET' to restart",20,335);

//Names that change colour//

//RED//
  fill(red);
  textSize(15);
  text("RED",85,90);
  
//GREEN//
  fill(green);
  text("GREEN",275,90);
  
//BLUE//
  fill(blue);
  text("BLUE",480,90);
  
//MIXED//  
  fill(red + green + blue);
  text("MIXED",275,240);

//Creating boxes that will change colour//
Box redBox = new Box(colour[0], 50, 100, 100, 100);
Box greenBox = new Box(colour[1], 250, 100, 100, 100);
Box blueBox = new Box(colour[2], 450, 100, 100, 100);
Box mixedBox = new Box(colour[0] + colour[1] + colour[2], 200, 250, 200, 100);

//Red Box//  
    stroke(255);
    redBox.drawBox();
    
//Green Box//
    greenBox.drawBox();
    
//Blue Box//
    blueBox.drawBox();

//Passing RGB values into the variables as mentioned before//
red = colour[0];
green = colour[1];
blue = colour[2];

//Mixed Colour Box//
    stroke(255);
    mixedBox.drawBox();
    
//Lines//
    fill(255);
    rect(600,0,2,600);
    rect(800,0,2,600);

//Saves//    
    fill(fillColour);
    square(650,100,100);
    fill(fillColour2);
    square(650,250,100);
    fill(fillColour3);
    square(650,400,100);

//White, gray, black simulator//    
    fill(mixColour);
    rect(850,100,100,250);
}

//Controller Event// 
void controlEvent(ControlEvent theEvent) {
  
  if(theEvent.isController()) {
    
//Displays change on the console rather than the GUI or screen//
    print(theEvent.getController().getName());
    println(" now has a value of "+theEvent.getController().getValue());
    
//Reset Button//
    if(theEvent.getController().getName()=="RESET") {
     colour[0] = color(theEvent.getController().getValue() - theEvent.getController().getValue(),0,0);
     colour[1] = color(0,theEvent.getController().getValue() - theEvent.getController().getValue(),0);
     colour[2] = color(0,0,theEvent.getController().getValue() - theEvent.getController().getValue());
   }       
   
//Save Buttons//   
   if(theEvent.getController().getName()=="SAVE 1") {
     fillColour = (red + green + blue);
   }
   
   if(theEvent.getController().getName()=="SAVE 2") {
     fillColour2 = (red + green + blue);
   }
   
   if(theEvent.getController().getName()=="SAVE 3") {
     fillColour3 = (red + green + blue);
   }
   
//Delete Buttons//   
   if(theEvent.getController().getName()=="DELETE 1") {
     fillColour = fillColour - fillColour;
   }
   
   if(theEvent.getController().getName()=="DELETE 2") {
     fillColour2 = fillColour2 - fillColour2;
   }
   
   if(theEvent.getController().getName()=="DELETE 3") {
     fillColour3 = fillColour3 - fillColour3;
   }
   
//Remove//
    if(theEvent.getController().getName()=="REMOVE ALL") {
     fillColour = fillColour - fillColour;
     fillColour2 = fillColour2 - fillColour2;
     fillColour3 = fillColour3 - fillColour3;
   }
   
//Red Value//    
    if(theEvent.getController().getName()=="RED") {
     colour[0] = color(theEvent.getController().getValue(),0,0);
    }

//Mixed//    
    if(theEvent.getController().getName()=="MIXED") {
       x = theEvent.getController().getValue();
       mixColour = color(x,x,x);
    }

//Green Value//
    if(theEvent.getController().getName()=="GREEN") {
      colour[1] = color(0,theEvent.getController().getValue(),0);
    }

//Blue Value//    
    if(theEvent.getController().getName()=="BLUE") {
      colour[2] = color(0,0,theEvent.getController().getValue());
  }
 }
}

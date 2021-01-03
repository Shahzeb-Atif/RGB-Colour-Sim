class Box {

//Variables  
  color fillColor;
  int boxLength;
  int boxWidth;
  int startX;
  int startY;

//Object statements//  
  Box(color fillColor, int startX, int startY, int boxLength, int boxWidth){
    this.fillColor = fillColor;
    this.boxLength = boxLength;
    this.boxWidth = boxWidth;
    this.startX = startX;
    this.startY = startY;
  }

//Draw Box//  
  void drawBox(){
    fill(this.fillColor);
    rect(this.startX, this.startY, this.boxLength, this.boxWidth);
 }
}

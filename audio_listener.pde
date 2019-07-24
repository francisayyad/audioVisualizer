// imports needed
import ddf.minim.analysis.*;
import ddf.minim.*;
 
Minim minim;
AudioPlayer jingle;
//needed yo access mic
AudioInput input;
//analyzes the sound
FFT fft;
int[][] colo=new int[300][3];
//AudioIn in;
 
void setup()
{
  size(480, 320);
   //fullScreen();
  noCursor();
 
 
  minim = new Minim(this);
 
 
  input = minim.getLineIn();
 
  fft = new FFT(input.bufferSize(), input.sampleRate());
 
 // textFont(createFont("Arial", 16));
 
 // windowName = "None";
}
 
void draw()
{
  background(0,0,120);
  stroke(255);
 
  fft.forward(input.mix);
//512 values below --> this loop is called 25 times per second
//try getting the highest value and making a shape based on that value
//maybe change color based on the size of the value?




  for(int i = 0; i < fft.specSize(); i++)
  {
    
    
    int c1 = (int) (Math.random() * 255);
    int c2 = (int) (Math.random() * 255);
    int c3 = (int) (Math.random() * 255);
   
    fill(c1,c2,c3);
    
      float high = 0;
      float spot = 0;
    
    if(fft.getBand(i)>high){
      high = fft.getBand(i);
      spot = i;
      
      // visaulizes the audios through an ellipse
      // I multiplied high by 50 to show the frequencis with a greater magnitude. 
     ellipse (spot *20, 175, 7, high *50);
     rect (spot * 50, 300 , 7, high*-30);
     rect (spot * 50, 50 , 7, high* 30);
    }
 
    // fft.getBand(i); //this is float which is very much like a double
 
 
}
 
  // keep us informed about the window being used
 // text("The window being used is: " + windowName, 5, 20);
}

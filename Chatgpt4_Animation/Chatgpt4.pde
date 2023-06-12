import oscP5.*;
import netP5.*;
OscP5 oscP5;
NetAddress dest;

float mood_happy = 0; //0 to 500 ; 132
float mood_sad = 0; // 0 to 500 ; 50
float mood_neutral = 0; //0 to 500; 200


Particle[] particles;
color[] cols1 = {  #E0BDA5, #7E4B29,#1C1B1B };//#0D4030,#394B45,#000000
color[] cols2 = { #D3F4D5, #A6CAAB,#83A78A,#1C1B1B}; 
color[] cols3 = { #7492A6, #BECDDB, #61A0A5,#144E76};

color[] currentColors;

void setup() {
  oscP5 = new OscP5(this,12000); //listen for OSC messages on port 12000 (Wekinator default)


  size(700, 900);
  background(#121210);
  
  noiseSeed(7);
  randomSeed(3);

  particles = new Particle[10000];
  currentColors = cols1;

  for (int i = 0; i < particles.length; i++) {
    particles[i] = new Particle();
  }
  
}

void draw() {

  for (int i = 0; i < particles.length; i++) {
    particles[i].update();
    particles[i].display();
  }
  update();
}  

void update() {
  if (mood_happy > 0.8) {
    //background(0);
    currentColors = cols1;
    //clearParticles();
  } else if (mood_sad > 0.8) {
     //background(0);
    currentColors = cols2;
    //clearParticles();
  } else if (mood_neutral > 0.8) {
    //background(0);
    currentColors = cols3;
    //clearParticles();
  }
}


void clearParticles() {
  for (int i = 0; i < particles.length; i++) {
    particles[i].reset();
    particles[i].changeColor(currentColors);
  }
}



void oscEvent(OscMessage theOscMessage) {
 if (theOscMessage.checkAddrPattern("/wek/outputs")==true) {
     if(theOscMessage.checkTypetag("fff")) { //Now looking for 2 parameters
        float receivedModulation = theOscMessage.get(0).floatValue(); //get this parameter
        mood_happy = receivedModulation;
        
        float receivedAmount = theOscMessage.get(1).floatValue(); //get 2nd parameter
        mood_sad = receivedAmount;
        
        float receivedOffset = theOscMessage.get(2).floatValue(); //get third parameters

        mood_neutral = receivedOffset;
        
        //Now use these params
        
        println("Received new params value from Wekinator");  
      } else {
        println("Error: unexpected params type tag received by Processing");
      }
 }
}

  

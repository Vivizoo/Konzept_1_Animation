
Particle[] particles;
color[] cols1 = {  #E0BDA5, #7E4B29,#1C1B1B };//#0D4030,#394B45,#000000
color[] cols2 = { #D3F4D5, #A6CAAB,#83A78A,#1C1B1B}; 
color[] cols3 = { #7492A6, #BECDDB, #61A0A5,#144E76};

color[] currentColors;

void setup() {
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
}  

void keyPressed() {
  if (key == 'w' || key == 'W') {
    background(0);
    currentColors = cols1;
    clearParticles();
  } else if (key == 'a' || key == 'A') {
     //background(0);
    currentColors = cols2;
    clearParticles();
  } else if (key == 's' || key == 'S') {
    //background(0);
    currentColors = cols3;
    clearParticles();
  }
}


void clearParticles() {
  for (int i = 0; i < particles.length; i++) {
    particles[i].reset();
    particles[i].changeColor(currentColors);
  }
}


  

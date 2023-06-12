class Particle {
  float x;
  float y;
  float size;
  float speed;
  color col;
  float noiseScale = 900;
  float noiseStrength = 30;

Particle() {
    x = random(width);
    y = random(height);
    size = random(0.5, 2);
    speed = random(0.01, 1);
    col = currentColors[int(random(currentColors.length))];
  }

  void display() {
    strokeWeight(size);
    stroke(col, 90);
    point(x, y);
  }

  void update() {
    float angle = noise(x / noiseScale, y / noiseScale) * noiseStrength;
    x += cos(angle) * speed;
    y += sin(angle) * speed;
    if (x < 0 || x > width || y < 0 || y > height) {
      reset();
      changeColor(currentColors);
    }
  }

  void changeColor(color[] colors) {
    col = colors[int(random(colors.length))];
  }

  void reset() {
    x = random(width);
    y = random(height);
  }
}

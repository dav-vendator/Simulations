
//damping = some non-integer between 0 and 1

//begin loop 
//    for every non-edge element:
//    loop
//        Buffer2(x, y) = (Buffer1(x-1,y)
//                         Buffer1(x+1,y)
//                         Buffer1(x,y+1)
//                         Buffer1(x,y-1)) / 2 - Buffer2(x,y)

//        Buffer2(x,y) = Buffer2(x,y) * damping
//    end loop

//    Display Buffer2
//    Swap the buffers 

//end loop


float damping = 0.9999999999;
float [][] previousBuffer;
float [][] currentBuffer;
int rows;
int cols;

void setup() {
  size(400, 400);
  rows = height;
  cols = width;
  previousBuffer = new float[rows][cols];
  currentBuffer = new float[rows][cols];
}

void mouseDragged(){
  previousBuffer[(mouseX < 0 ? -mouseX : mouseX)%rows][(mouseY < 0 ? -mouseY : mouseY)%cols] = 500;
}

void draw() {
  //background(0);
  //if (random(1) < 0.3) {
  //  previousBuffer[(int)random(width)][(int)random(height)] = 500;
  //}
  loadPixels();
  for (int x=1; x < cols-1; x++) {
    for (int y=1; y < rows-1; y++) {
      currentBuffer[x][y] = (previousBuffer[x-1][y]+
        previousBuffer[x+1][y]+
        previousBuffer[x][y+1]+
        previousBuffer[x][y-1]) / 2 - currentBuffer[x][y];
      currentBuffer[x][y] *= damping;
      pixels[x+y*cols] = color(currentBuffer[x][y], currentBuffer[y][x], 1.5);
    }
  }
  updatePixels();

  float [][] temp = currentBuffer;
  currentBuffer = previousBuffer;
  previousBuffer = temp;
}

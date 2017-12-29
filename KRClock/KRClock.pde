PFont f;
void setup() {
  f = createFont("monaco", 20, true);
  size(600, 600);
  background(0);
  //stroke(255);
  noStroke();
}

float angle1 = 0;
float angle2 = 0;
float r = 100;

color sec = color(255, 0, 0);
color mint = color(0, 255, 0);
color hr = color(0, 0, 255);
color back = color(0, 15);
color dav = color(255, 200, 0);

void draw() {
 // saveFrame("frame/
  // background(0);
  //float x = r*map(sin(angle),-1,1,0,width);
  //float y = r*map(cos(angle),1,-1,0,height);
  fill(back);
  rect(0, 0, width, height);
  translate(width/2, height/2);
  //float x1 = r*cos(angle1);
  //float y1 = r*cos(angle2);
  //ellipse(x1,y1,10,10);
  //fill(255,0,0);
  fill(sec);
  float secx = map(second(), 0, 60, 0, r*sin(angle1));
  float secy = map(second(), 0, 60, 0, r*sin(angle2));//r*sin(angle2);
  ellipse(secx, secy*3, 10, 10);

  fill(mint);
  float minx = map(minute(), 0, 60, 0, r*sin(angle1));
  float miny = map(minute(), 0, 60, 0, r*sin(angle2));//r*sin(angle2);
  ellipse(minx, miny*3, 10, 10);

  fill(hr);
  float hrx = map(hour(), 0, 24, 0, r*sin(angle1));
  float hry = map(hour(), 0, 24, 0, r*sin(angle2));//r*sin(angle2);
  ellipse(hrx, hry*3, 10, 10);
  textFont(f, 25);

  //rect(-15,-210,30,30);
  //rect(-15,210,30,30);
  // stroke(255);
  //fill(sec,15);
  //ellipseMode(CENTER);
  //ellipse(0,0,secx,secy);

  //fill(mint,10);
  //ellipseMode(CENTER);
  //ellipse(0,0,minx,miny);



  fill(hr);
  text(hour()+":", -50-200, height/2);

  fill(mint);
  text(minute()+":", -5-200, height/2);

  fill(sec);
  text(second(), 40-200, height/2);
  //+":"+minute()+":"+second()
  textFont(f, 15);
  fill(dav);
  text("By Dav Vendator(streamofbytes.blogspot.in)", -width/2, -height/2+20);
  angle2+=0.01;
  angle1+=0.02;
}

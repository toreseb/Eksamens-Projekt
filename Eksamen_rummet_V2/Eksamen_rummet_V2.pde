import g4p_controls.*;
Plan planet;
Sat sat;
Moon moon;


int satAmount = 1000;
int satSpeedx = 64;
int satSpeedy = 0;
int satR = 40;
int moonSpeedx=19;
int moonSpeedy=0;
int moonHeight = 600;
int moonR=30;
boolean moonG;
boolean Color;
boolean removeSat;
float planetg;
float moong;
int scale = 20;
float PlanetR = (12742/3.5)/scale;
float time;


ArrayList<Sat> satList = new ArrayList<Sat>();


void setup(){
  size(1920,1080,JAVA2D);
  createGUI();
  
  for (int i = 0;i < satAmount;i++){
    satList.add(new Sat());
  }
  
  ellipseMode(CENTER);
  ellipseMode(RADIUS);
  frameRate(60);
  sat = new Sat();
  planet = new Plan();
  moon = new Moon();
}
void draw(){
  customGUI();
  clear();
  planet.planetDraw();
  moon.Set();
  moon.Draw();
  
  for(int i = 0; i < satList.size();i++){
    Sat s = satList.get(i);
    s.Set(satSpeedx*16/scale,satSpeedy*16/scale);
    s.Draw();
    s.sensor(i,moonR,removeSat);
  }
}

public void customGUI(){
  if (checkbox1.isSelected() == true) {
  moonG = true;
  }else{
  moonG = false; 
  }
  if (checkbox2.isSelected() == true) {
  Color = true;
  }else{
  Color = false; 
  }
  if (checkbox3.isSelected() == true) {
  removeSat = true;
  }else{
  removeSat = false; 
  }
  planetg = int(textfield1.getText());
  moong = int(textfield2.getText());
  time = int(textfield4.getText());
}

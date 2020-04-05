class Moon{
  float rot;
  PVector place = new PVector();
  PVector speed = new PVector();
  PVector accel = new PVector();
  boolean set = false;
  void Draw(){
    rot = atan2(height/2-place.y, width/2-place.x);
    accel.x = planetg*sin((rot)-PI/2)/10;
    accel.y = planetg*cos((rot)+PI/2)/10;
    speed.x = -accel.x/time+speed.x;
    speed.y = -accel.y/time+speed.y;
    place.x = speed.x/time+place.x;
    place.y = speed.y/time+place.y;
    ellipse(place.x,place.y,moonR*16/scale,moonR*16/scale);
  }
  void Set(){
    if (!set){
      rot = random(0,2*PI);
      int ypos = moonHeight*16/scale;
      place.y = height/2-((ypos*16/scale)*sin(rot));
      place.x = width/2-((ypos*16/scale)*cos(rot));
      speed.x = moonSpeedx*cos(rot-PI/2)+moonSpeedy*cos(rot+PI/2);
      speed.y = moonSpeedx*sin(rot-PI/2)+moonSpeedy*sin(rot+PI/2);
      set = true;
    }
  }
}

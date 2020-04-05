class Sat{
  int r;
  int g;
  int b;
  float rot;
  float rotM;
  PVector place = new PVector();
  PVector speed = new PVector();
  PVector accel = new PVector();
  boolean set = false;
  void Draw(){
    rot = atan2(height/2-place.y, width/2-place.x);
    rotM = atan2(moon.place.y-this.place.y, moon.place.x-this.place.x);
    if (moonG){
    accel.x = (planetg*sin((rot)-PI/2))+(moong*sin((rotM)-PI/2));
    accel.y = (planetg*cos((rot)+PI/2))+(moong*cos((rotM)+PI/2));
    }else{
      accel.x = (planetg*sin((rot)-PI/2));
      accel.y = (planetg*cos((rot)+PI/2));
    }
    speed.x = -accel.x/time+speed.x;
    speed.y = -accel.y/time+speed.y;
    place.x = speed.x/time+place.x;
    place.y = speed.y/time+place.y;
    if (Color){
      fill(r,g,b);
    }else{
      fill(255);
    }
    ellipse(place.x,place.y,satR/scale,satR/scale);
  }
  void Set(int xspeed, int yspeed){
    if (!set){
      r = (int)random(0,255);
      b= (int)random(0,255);
      g= (int)random(0,255);
      rot = random(0,2*PI);
      int ypos = round(random((PlanetR+200)*16/scale,(PlanetR+350)*16/scale));
      place.y = height/2-((ypos*16/scale)*sin(rot));
      place.x = width/2-((ypos*16/scale)*cos(rot));
      speed.x = xspeed*cos(rot-PI/2)+yspeed*cos(rot+PI/2);
      speed.y = xspeed*sin(rot-PI/2)+yspeed*sin(rot+PI/2);
      set = true;
    }
  }
  void sensor(int i,int moonR, boolean removeAst){
    if (((dist(width/2,height/2,this.place.x,this.place.y)<PlanetR)||(dist(moon.place.x,moon.place.y,this.place.x,this.place.y)<(moonR*16/scale))) && removeAst){
      satList.remove(i);
    }
  }
}

class satellite{

   int index;
   String type;
   float pos_x, pos_y;
   float orbit = 0;
   
   float radius = random(2,20);
   float angle = random(0,360);
   float speed = random(0.001, 0.01);

   satellite(int indexTemp, String typeTemp){
     index = indexTemp;
     type = typeTemp;
     if (type == "sun"){
      orbit = 0;      
     }
     if (type == "planet"){
       orbit = 100*index+random(0,30);
     }
     if (type == "moon"){
       orbit = 10*index+random(5,30);
       radius = random(2,5);
     }
   }
     
   void displayOrbit(float center_x, float center_y){
    noFill();
    stroke(98);
    ellipse(center_x, center_y, orbit, orbit);
   }
   
   void displaySatelit(float center_x, float center_y){
     noStroke();
     fill(255); 
     ellipse(x(center_x), y(center_y), radius, radius);
   }
   
   float x(float center_x){
     return pos_x = center_x + cos(angle) * orbit/2;
   }
   
   float y(float center_y){
    return pos_y = center_y + sin(angle) * orbit/2;
   }
   
   float center_x(){
     return pos_x;
   }
   
   float center_y(){
     return pos_y;
   }

   void display(float center_x, float center_y){
    angle += speed;
    x(center_x);
    y(center_y);
    displayOrbit(center_x, center_y);
    displaySatelit(center_x, center_y);
   }
}

satellite[] p;
satellite[] m;
int[] planet;

void setup(){
  fullScreen();
  frameRate(60);
  
  p = new satellite[10];
  m = new satellite[15];
  
  p[0] = new satellite(0, "sun");
  
  for (int i = 1; i < p.length; i++){
    p[i] = new satellite(i, "planet");  
  }
  
  for (int i = 0; i < m.length; i++){
    m[i] = new satellite(i, "moon");
  }
  
  planet = new int[m.length];
  
  for (int i = 0; i < m.length; i++){
    planet[i] = floor(random(1, p.length));
  }
}

void draw(){
  background(0);
  
  int center_x = width / 2;
  int center_y = height / 2;
    
  p[0].display(center_x, center_y);
  
  for (int i = 1; i < p.length; i++){
    p[i].display(center_x, center_y);
  }
  
  for (int i = 0; i < m.length; i++){
    m[i].display(p[planet[i]].center_x(), p[planet[i]].center_y()); 
  }
}
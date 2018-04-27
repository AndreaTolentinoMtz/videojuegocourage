class Personaje {
  String nombre;
  int ataque;
  int vida;
  int data;


  Personaje (String nombre_, int ataque_,int vida_, int data_){
    nombre = nombre_;
    ataque = ataque_;
    vida = vida_;
    data = data_; 
  }
  
  void display() {
    if (data==1){
      Courage();
    }
    
    if (data==2){
      Shirley();
    }
    
    if (data==3){
      Clown();
    }
    
    if (data==4){
      Katz();
    }
    
    if (data==5){
      Ramses();
    }
    }
}


Personaje Courage;
Personaje Shirley;
Personaje Clown;
Personaje Katz;
Personaje Ramses;

Personaje jugador1;
Personaje jugador2;


void setup(){
  size(840,590);
  img = loadImage("pantalla-intro.jpg");
  img2 = loadImage("pantalla-historia.jpg");
  img3 = loadImage("pantalla-seleccion.jpg");
  img4 = loadImage("courage.png");
  img5= loadImage("Shirley.png");
  img6= loadImage("Katz.png");
  img7= loadImage("evil-clown.png");
  img8= loadImage("King_Ramses.png");


  Courage = new Personaje ("Courage",10,50,1);
  Shirley = new Personaje ("Shirley",10,50,2);
  Clown = new Personaje ("Clown",10,50,3);
  Katz = new Personaje ("Katz",10,50,4);
  Ramses = new Personaje ("Ramses",10,50,5);
}

PImage img,img2,img3,img4,img5,img6,img7,img8;
int pantalla = 0;
int turno = 1;
//int turnoDeSeleccion = 1;
char sj1;
char sj2;
int ganador;


void draw (){
  switch (pantalla){
    case 0:
    intro();
    break;
    
    case 1:
    historia();
    break;
    
    case 2:
    seleccion();
    break;
    
    case 3:
    seleccion2();
    break;
    
    case 4:
    pelea();
    break;
    
    case 5:
    fin();
    break;
    
  }
}

void keyPressed(){
  switch(pantalla){
    case 0: //intro
    if (key == ENTER || key == ENTER){
      pantalla=1;
    }
    break;  
    
    case 1:  //historia
    if ((key == 'O'|| key == 'o')){
      pantalla=2;
    }
    break;
    
    case 2:  //seleccion
    sj1 = key;
    
    switch(sj1){
      case 'c':
      jugador1 = new Personaje("Courage",10,50,1);
      pantalla=3;
      break;
      
      case 's':
      jugador1 = new Personaje("Shirley",10,50,2);
      pantalla=3;
      break;
      
      case 'w':
      jugador1 = new Personaje("Clown",10,50,3);
      pantalla=3;
      break;
      
      case 'k':
      jugador1 = new Personaje("Katz",10,50,4);
      pantalla=3;
      break;
      
      case 'r':
      jugador1 = new Personaje("Ramses",10,50,5);
      pantalla=3;
      break;
    }
    break;
    
    case 3:
    sj2 = key;
    
    switch(sj2){
      case 'c':
      jugador2 = new Personaje("Courage",10,50,1);
      pantalla=4;
      break;
      
      case 's':
      jugador2 = new Personaje("Shirley",10,50,2);
      pantalla=4;
      break;
      
      case 'w':
      jugador2 = new Personaje("Clown",10,50,3);
      pantalla=4;
      break;
      
      case 'k':
      jugador2 = new Personaje("Katz",10,50,4);
      pantalla=4;
      break;
      
      case 'r':
      jugador2 = new Personaje("Ramses",10,50,5);
      pantalla=4;
      break;
    }
    break;
    
    case 4:  //pelea
    if (key == 'A' || key == 'a'){
      if (turno == 1){
        jugador2.vida = jugador2.vida - jugador1.ataque;
        fill(255,0,0);
        rect(140,350,100,20);
        turno = 2;
      }
    }
    if (key == 'Ñ' || key == 'ñ'){
      if(turno == 2){
        jugador1.vida = jugador1.vida - jugador2.ataque;
        fill(255,0,0);
        rect(720,350,100,20);
        turno = 1;
      }
    }
    
    if (key == 'F' || key == 'f'){
      pantalla = 0;
      sj1 = 0;
      sj2 = 0;
      turno = 1;
      //turnoDeSeleccion = 1;
      ganador = 0;
    }
    break;
    
    case 5:  //fin
    if (key == ENTER){
      pantalla = 2;
      sj1 = 0;
      sj2 = 0;
      turno = 1;
      //turnoDeSeleccion = 1;
      ganador = 0;
    }
    break;
  }
}



void intro(){
  println("pantalla " + pantalla);
  background(0);
  fill(0,255,0);
  image(img,0,0);

}


void historia(){
  println("pantalla " + pantalla);
  background(0);
  image(img2,0,0);
}


void seleccion(){
  println("pantalla " + pantalla);
  background(255);
  image(img3,0,0);
  fill(255);
  textSize(20);
  text("Jugador 1 presiona la letra que representa al personaje",100,50);
  Courage.display();
  Shirley.display();
  
}

void seleccion2(){
  background(255);
  image(img3,0,0);
  fill(255);
  textSize(20);
  text("Jugador 2 presiona la letra que representa al personaje",100,50);
  Courage.display();
  Shirley.display();
}

void pelea(){
  background(0,255,0);
  /*fill(0,255,0);
  
  rect(100,20,140,350);
  
  if(jugador1.vida <= 20){
    fill(255,0,0);
    rect(100,20,140,350);
  }
  
  rect(100,20,720,350);
  
  if(jugador2.vida <=20){
    fill(255,0,0);
    rect(100,20,720,350);
  }*/
  jugador1.display();
  jugador2.display();
  textSize(30);
    text("Presiona Ñ para atacar",650,50);
    fill(#24FAFF);
    text("Presiona A para atacar",10,50);
    text("Presiona F para abandonar la pelea",250,550);
  
  if (jugador1.vida <= 0){
    ganador = 2;
    pantalla = 5;
  }
  
  if (jugador2.vida <= 0){
    ganador = 1;
    pantalla = 5;
  }
}


void fin(){
  background(0); 
    text("Presiona ENTER para jugar de nuevo", 100, 450);
  if(ganador == 1){
    text("Jugador1 gana", 100, 300);
    jugador1.display();
  }
  
  if (ganador == 2){
    text("Jugador2 gana", 100, 300);
    jugador2.display();
  }
}

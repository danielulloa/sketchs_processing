import controlP5.*;
import processing.serial.*;
import java.util.*;

Serial Arduino;
String puerta;
ControlP5 cp5;
List l;
int baudrate = 9600;

void setup() {
  size(600, 250);
  PFont font = createFont("arial",14);
  cp5 = new ControlP5(this);
  l = Arrays.asList(Serial.list());
  
  
  cp5.addScrollableList("dropdown")
     .setPosition(100, 100)
     .setSize(150, 120)
     .setBarHeight(25)
     .setFont(font)
     .setItemHeight(25)
     .addItems(l)
     //.setType(ScrollableList.LIST) // currently supported DROPDOWN and LIST
     .setOpen(false)
     .setLabel("Elija puerto...")
     ;  
  cp5.get(ScrollableList.class, "dropdown").removeItem("COM1");
  
  cp5.addIcon("actualizar",10)
    .setPosition(255,85)
    .setSize(50,50)
    .setRoundedCorners(20)
    .setFont(createFont("fontawesome-webfont.ttf", 40))
    .setFontIcon(#00f021)
    .setColorBackground(color(255,100))
    .hideBackground()
    ;
    
  cp5.addIcon("seronoser",10)
    .setPosition(295,85)
    .setSize(70,50)
    .setRoundedCorners(20)
    .setFont(createFont("fontawesome-webfont.ttf", 40))
    .setFontIcons(#00f205,#00f204)
    .setSwitch(true)
    .setColorBackground(color(255,100))
    .hideBackground()
    ;
}

void draw() {
  background(240);
}

void dropdown(int n){
  puerta = cp5.get(ScrollableList.class, "dropdown").getItem(n).get("name").toString();
  println(puerta);
}

void actualizar(){
  cp5.get(ScrollableList.class, "dropdown").clear();
  l = Arrays.asList(Serial.list());
  cp5.get(ScrollableList.class, "dropdown").setItems(l);
  cp5.get(ScrollableList.class, "dropdown").removeItem("COM1");
}

void seronoser(boolean estado) {
  // falta agregar checkeo de eleccion del puerto
  if (estado==true){
    println("abro puerto "+puerta);
    Arduino = new Serial(this,puerta,baudrate);
    Arduino.bufferUntil(10);
  }
  else{
    println("cierro puerto "+puerta);
    actualizar();
    Arduino.clear();
    Arduino.stop();
  }
}

import controlP5.*;
import processing.serial.*;
import java.util.*;

Serial myPort;
String puerta;
ControlP5 cp5;

void setup() {
  size(400, 400);
  cp5 = new ControlP5(this);
  List l = Arrays.asList(Serial.list());
  cp5.addScrollableList("dropdown")
     .setPosition(100, 100)
     .setSize(200, 100)
     .setBarHeight(20)
     .setItemHeight(20)
     .addItems(l)
     //.setType(ScrollableList.LIST) // currently supported DROPDOWN and LIST
     .setOpen(false)
     .setLabel("Elegir puerto...")
     ;  
  
}

void draw() {
  background(240);
}

void dropdown(int n){
  /*
  con esta funcion se puede encontrar las propiedades del elemento de
  la lista dropdown, para almacenar la variable del puerto usamos "name"
  
  println(cp5.get(ScrollableList.class, "dropdown").getItem(n));

  {view=controlP5.ScrollableList$1@399234fb,
  color=bg (0,45,90),
  fg (0,116,217),
  active (0,170,255),
  captionlabel (255,255,255),
  valuelabel (255,255,255),
  name=COM3,
  text=COM3,
  state=false,
  value=1}
  */
  puerta = cp5.get(ScrollableList.class, "dropdown").getItem(n).get("name");
  println(puerta);
}
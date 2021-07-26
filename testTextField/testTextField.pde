import controlP5.*;

ControlP5 cp5;

void setup() {
    size(1000,650);           // Configura resolucion interfaz
    background(#202020);

    PFont font = createFont("arial",40);

    cp5 = new ControlP5(this);

    cp5.addTextfield("puerto")
        .setPosition(200,55)
        .setSize(100, 30)
        .setLabel("")
    ;

    cp5.addTextfield("velocidad")
        .setPosition(400,55)
        .setSize(100, 30)
    ;

    cp5.addTextfield("velocity")
        .setPosition(400,55)
        .setSize(100, 30)
        .setLabel("velocidad")
    ;    

    textFont(font); 
}

void draw() {
  fill(255);
}
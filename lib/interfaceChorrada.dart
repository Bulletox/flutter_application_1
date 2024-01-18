//variables y tipos de datos
import 'dart:ffi';

void main(){
  String nombre = 'Juan';
  int edad = 23;
  double estatura = 1.80;
  bool esDeveloper = true;

  // imprimir por consola
  print("$nombre tine la edad $edad y su estatura es $estatura u es desarrollador $esDeveloper");
  // llamar a la funcion "saludar"
  saludar(nombre, edad);
}
//funiones: declarar funcion y llamarla
 void saludar(String nombre , int edad){
   print("hola $nombre");
 }
 void main2(){
  saludar("Juan", 23);
 }


 //estructuras de control
 void main3(){
  int numero = 10;
  if(numero % 2 == 0){
    print("el numero $numero es par");
  } else {
    print("el numero $numero es impar");
  }

  for(int i = 0; i < 3; i++){
    print("el valor de i es $i");
  }
 }

//declaracion de clases, objetos, metodos y constructores
//declaramos la clase e indicamos el constructor y el metodo de emplio
 class Persona{
   String nombre;
   int edad;
   //constructor
   Persona(this.nombre, this.edad);
   void saludar(){
     print("hola soy $nombre");
   }
 }
 // Aplicacion de la clase y el metodo 
  void main4(){
    //instanciamos la clase
    Persona juan = Persona("Juan", 23);
    juan.saludar();
  }
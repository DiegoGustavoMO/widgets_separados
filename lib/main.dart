//siempre hay que importar la libreria de material para flutter
import 'package:flutter/material.dart';

//la clase main principal que ejecuta la aplicacion al inciar es
//en este casso MyApp , debe tener la primera letra en mayuscula
void main() => runApp(const MyApp());
//con este main estoy indicando que ejecute la aplicacion principal

//con la ayuda del los plugins usamos statlessW o StatefulW
//la diferencia entre estos es que en el full podemos sobre escribir

//se crea el primer widget (clase) de la aplicacion
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //este es un contructor (build) donde se construye el widget y que retorna
  //un widget

  @override
  Widget build(BuildContext context) {
    //devolvemos un MaterialApp , Material es un patron de diseño de google
    //material tiene ciertos parametros como title,home,etc
    //title define el titulo de la aplicacion
    //home lo que aparece en el inicio de la aplicacion
    return const MaterialApp(
      //Para quitar el banner de debug usamos debugshow..
      debugShowCheckedModeBanner: false,
      title: "Mi App",
      home: Inicio(),
    );
  }
}

//como en home colocamos que llame a un widget (clase) llamado Inicio()
//debemos crearlo

//creamos el widget Inicio() de tipo stateful
class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    //debemos retornar un widget usado en aplicaciones tradicionales
    //llamado Scaffold()
    //debemos recordar que hay widgets que son contenedores de otros widgets
    //por eso se ve como si fuera una clase dentro de otra clase

    return Scaffold(
      //si quiero quitarle el titulo a la pagina del aplicativo quito el appbar
      //appBar: AppBar(
      // title: const Text("Widgets"),
      //),
      //el widget comlum sirve para organizar los demas widgets en columnas
      //el limitante es que al agregar contenido dependiendo de la pantalla
      //no muestra todo a menos que se configure propiedad de tamaño
      //si lo que se quiere mostrar es una lista en forma de columna
      //entonces se puede usar el widget ListView

      //en el body (cuerpo) podemos poner cualquier widget
      //en el body en este caso se llama al widget cuerpo y por ende su contenido
      body: cuerpo(),
    );
  }
}

//para evitar incluir widget dentro de otros widgets y que esten con columnas o
//filas y al mismo tiempo estas tengan otros widgets , simplemente hay que
//separarlos

//en este caso se crea un widget(cuerpo) que retorna un Widget
//en este caso retorna un container o contenedor
Widget cuerpo() {
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
          image: NetworkImage(
            "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg",
            scale: 1,
          ),
          fit: BoxFit.cover),
    ),
    //al poner el child en un center entonces nos centra el contenido
    child: Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        nombre(),
        campoUsuario(),
        campoContra(),
        //sizedbox para generar un espacio
        const SizedBox(
          height: 15,
        ),
        botonEntrar(),
      ],
    )),
  );
}

//se crean los widgets de cada campo aparte y se agregar al widget principal
//que se llama cuerpo  y este a su vez es llamado en el body de la aplicacion

//este widget es para mostrar un mensaje de inicio en este caso para el login
Widget nombre() {
  return const Text("Registrate",
      style: TextStyle(
          color: Colors.white, fontSize: 35.0, fontWeight: FontWeight.bold));
}

//este widget genera un container con el campo de texto para ingresar un usuario
Widget campoUsuario() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    child: const TextField(
      decoration: InputDecoration(
        hintText: "Usuario",
        fillColor: Colors.white,
        filled: true,
      ),
    ),
  );
}

//este widget genera un campo para la parte de al contraseña
Widget campoContra() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    child: const TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: "Constraseña",
        fillColor: Colors.white,
        filled: true,
      ),
    ),
  );
}

//este widget genera el boton para el ingreso
Widget botonEntrar() {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: Colors.blue,
      onPrimary: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 20.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      side: const BorderSide(color: Colors.white, width: 1.0),
      minimumSize: const Size(10.0, 10.0),
    ),
    onPressed: () {},
    child: const Text('Ingresar',
        style: TextStyle(fontSize: 25.0, color: Colors.white)),
  );
}

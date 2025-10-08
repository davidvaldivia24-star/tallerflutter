
class Usuarios {
  String nombre;
  int edad;

  Usuarios(this.nombre, this.edad);

  void Saludar() {
    print("Hola soy $nombre");
  }

  void MisDatosPersonales() {
    print("Hola soy $nombre y tengo $edad años");
  }
}

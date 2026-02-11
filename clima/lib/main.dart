import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// Widget principal de la aplicación
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clima App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Colors.red,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.red,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

/// ===============================
/// PANTALLA PRINCIPAL
/// ===============================
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clima Actual'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.red],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Nombre de la ciudad
            const Text(
              'Quito',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 25),

            /// Icono del clima
            const Icon(
              Icons.cloud,
              size: 110,
              color: Colors.red,
            ),

            const SizedBox(height: 25),

            /// Temperatura simulada
            const Text(
              '18 °C',
              style: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 40),

            /// Botón para ir a la pantalla de detalles
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(
                    horizontal: 30, vertical: 15),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DetailScreen(),
                  ),
                );
              },
              child: const Text(
                'Ver Detalles',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ===============================
/// PANTALLA DE DETALLES
/// ===============================
class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles del Clima - Quito'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Información adicional
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  /// Humedad
                  Column(
                    children: [
                      Icon(Icons.water_drop, color: Colors.red),
                      SizedBox(height: 5),
                      Text(
                        'Humedad',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        '75%',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),

                  /// Viento
                  Column(
                    children: [
                      Icon(Icons.air, color: Colors.red),
                      SizedBox(height: 5),
                      Text(
                        'Viento',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        '12 km/h',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            /// Título del pronóstico
            const Text(
              'Pronóstico semanal',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 10),

            /// Lista con TODOS los días de la semana
            Expanded(
              child: ListView(
                children: [
                  pronosticoItem('Lunes', '19 °C', Icons.cloud),
                  pronosticoItem('Martes', '18 °C', Icons.beach_access),
                  pronosticoItem('Miércoles', '17 °C', Icons.cloud),
                  pronosticoItem('Jueves', '18 °C', Icons.wb_cloudy),
                  pronosticoItem('Viernes', '19 °C', Icons.cloud),
                  pronosticoItem('Sábado', '20 °C', Icons.wb_sunny),
                  pronosticoItem('Domingo', '18 °C', Icons.beach_access),
                ],
              ),
            ),
          ],
        ),
      ),

      /// Botón flotante para regresar
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  /// Widget reutilizable para los días del pronóstico
  Widget pronosticoItem(String dia, String temp, IconData icono) {
    return Card(
      color: Colors.grey[900],
      child: ListTile(
        leading: Icon(icono, color: Colors.red),
        title: Text(
          dia,
          style: const TextStyle(color: Colors.white),
        ),
        trailing: Text(
          temp,
          style: const TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}

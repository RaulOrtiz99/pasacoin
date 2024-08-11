import 'package:flutter/material.dart';
import '../create_group_screen/create_group_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pasanaku'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // Acción para abrir el perfil del usuario
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWideScreen = constraints.maxWidth > 600;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Mis Grupos',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 16),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isWideScreen ? 3 : 2, // Cambia la cantidad de columnas según el tamaño de la pantalla
                      crossAxisSpacing: 10, // Espacio horizontal entre las tarjetas
                      mainAxisSpacing: 10, // Espacio vertical entre las tarjetas
                      childAspectRatio: isWideScreen ? 4 / 3 : 3 / 2, // Ajusta la relación de aspecto según el tamaño de la pantalla
                    ),
                    itemCount: 6, // Aquí debes colocar la cantidad de grupos
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 4,
                        color: Theme.of(context).cardColor, // Usa el color de tarjeta del tema
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: InkWell(
                          onTap: () {
                            // Acción al tocar el grupo
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.groups_2_rounded,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      'Grupo $index',
                                      style: TextStyle(
                                        fontSize: isWideScreen ? 20 : 18,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface, // Usa el color sobre la superficie
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Flexible(
                                  child: Text(
                                    'Descripción del grupo que puede ser muy larga y necesita adaptarse al tamaño del contenedor.',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium, // Usa el estilo de texto global
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 4,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showCreateJoinGroupBottomSheet(context);
        },
        child: Icon(Icons.add),
        tooltip: 'Crear nuevo grupo',
      ),
    );
  }

  void _showCreateJoinGroupBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Elige una opción',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CreateGroupScreen()));
                },
                icon: Icon(Icons.group_add),
                label: Text('Crear Grupo'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Theme.of(context).colorScheme.primary,
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
              ),
              SizedBox(height: 8),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                  // Acción para unirse a un grupo
                },
                icon: Icon(Icons.group),
                label: Text('Unirse a un Grupo'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Theme.of(context).colorScheme.secondary,
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}

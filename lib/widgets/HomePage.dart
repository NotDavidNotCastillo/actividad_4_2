import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar - Cabecera de la aplicación
      appBar: AppBar(
        title: const Text('Mis Citas Médicas'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 4, 
      ),
      
      body: SingleChildScrollView(
        // SingleChildScrollView permite hacer scroll cuando el contenido es muy grande
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
              // Seccion 1 - Perfil del usuario 
              _buildProfileSection(context),
              
              const SizedBox(height: 20), 
              
              // Seccion 2 - Proxima cita 
              _buildNextAppointment(context),
              
              const SizedBox(height: 20),
              
              // Seccion 3 - Notificaciones importantes
              _buildNotificationsSection(),
              
              const SizedBox(height: 20),
              
              // Seccion 4 - Acciones principales
              _buildMainActions(context),
              
              const SizedBox(height: 20),
              
              // Seccion 5: Historial de citas
              _buildAppointmentHistory(context),
            ],
          ),
        ),
      ),
    );
  }

  // Widget para la seccion de perfil
  Widget _buildProfileSection(BuildContext context) {
    return Container(
      // Container con decoracoin 
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.shade200),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle, 
            ),
            child: const Center(
              child: Text(
                'JD',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16), 
          // Expanded permite que este contenido ocupe el espacio restante
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Juan Pérez',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'juan.perez@email.com',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          
          // Botón de perfil 
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios),
            onPressed: () {
              // Simula navegar a perfil
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Ir a perfil')),
              );
            },
          ),
        ],
      ),
    );
  }

  // Widget para la próxima cita 
  Widget _buildNextAppointment(BuildContext context) {
    return Container(
      // Container con sombra para destacar la información importante
      width: double.infinity, // Ocupa todo el ancho disponible
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue, Colors.blue.shade900],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'PRÓXIMA CITA',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Dr. María González - Cardiología',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: const [
              Icon(Icons.calendar_today, color: Colors.white70, size: 16),
              SizedBox(width: 4),
              Text(
                '15 de Noviembre, 2025 - 10:30 AM',
                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.start, // Botones a la derecha
            children: [
              TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Reprogramar cita')),
                  );
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.white.withOpacity(0.2),
                ),
                child: const Text('REPROGRAMAR'),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Ver detalles')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.blue,
                  backgroundColor: Colors.white,
                ),
                child: const Text('VER DETALLES'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Widget para notificaciones
  Widget _buildNotificationsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Notificaciones Importantes',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        
        // Stack para superponer el badge de "nuevo"
        Stack(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.orange.shade200),
              ),
              child: Row(
                children: [
                  Icon(Icons.notification_important, color: Colors.orange.shade700),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Recordatorio de cita',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Tienes una cita mañana a las 9:00 AM',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Badge de "nuevo" usando Positioned
            const Positioned(
              top: 8,
              right: 8,
              child: CircleAvatar(
                radius: 8,
                backgroundColor: Colors.red,
                child: Text(
                  '1',
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Widget para acciones principales
  Widget _buildMainActions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Acciones Rápidas',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        
        GridView.count(
          shrinkWrap: true, // Necesario cuando GridView está dentro de Column
          physics: const NeverScrollableScrollPhysics(), // Deshabilita scroll interno
          crossAxisCount: 2, 
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            _buildActionButton(
              context: context,
              icon: Icons.add_circle,
              label: 'Nueva Cita',
              color: Colors.green,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Agendar nueva cita')),
                );
              },
            ),
            _buildActionButton(
              context: context,
              icon: Icons.history,
              label: 'Historial',
              color: Colors.blue,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Ver historial')),
                );
              },
            ),
            _buildActionButton(
              context: context,
              icon: Icons.calendar_month,
              label: 'Calendario',
              color: Colors.purple,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Ver calendario')),
                );
              },
            ),
            _buildActionButton(
              context: context,
              icon: Icons.medical_services,
              label: 'Mis Doctores',
              color: Colors.orange,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Ver doctores')),
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required BuildContext context,
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(color: color, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  // Widget para historial de citas
  Widget _buildAppointmentHistory(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Citas Recientes',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        
        // Lista de citas pasadas
        _buildHistoryItem(
          doctor: 'Dr. Carlos Ruiz',
          specialty: 'Medicina General',
          date: '10 Nov 2025',
          icon: Icons.check_circle,
          color: Colors.green,
        ),
        const Divider(), 
        _buildHistoryItem(
          doctor: 'Dra. Laura Méndez',
          specialty: 'Dermatología',
          date: '25 Oct 2025',
          icon: Icons.check_circle,
          color: Colors.green,
        ),
        const Divider(),
        _buildHistoryItem(
          doctor: 'Dr. Roberto Sánchez',
          specialty: 'Odontología',
          date: '15 Oct 2025',
          icon: Icons.cancel,
          color: Colors.red,
        ),
        
        // Botón "Ver más"
        Center(
          child: TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Ver historial completo')),
              );
            },
            child: const Text('VER MÁS CITAS'),
          ),
        ),
      ],
    );
  }

  Widget _buildHistoryItem({
    required String doctor,
    required String specialty,
    required String date,
    required IconData icon,
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctor,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  specialty,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
          Text(
            date,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
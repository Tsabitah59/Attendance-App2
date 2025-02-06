import 'package:attendence_app/ui/attend/attendance_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Makesure buat kembali. Untuk memastikan data tersimpan
    return PopScope(
      canPop: false,
      // ignore: deprecated_member_use
      onPopInvoked: (didPop) {
        if (didPop) {
          return;
        }
        _onWillPop;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Column(
              spacing: 40,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildMenuItem(
                  context, 
                  imagePath: 'assets/images/ic_permission.png', 
                  label: 'Attendance Report', 
                  destination: AttendanceScreen()
                ),
                
                _buildMenuItem(
                  context, 
                  imagePath: 'assets/images/ic_attendance_history.png', 
                  label: 'Attendance History', 
                  destination: HomeScreen()
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context,{
      required String imagePath,
      required String label,
      required Widget destination,

    }
  ) {
    return Container(
                margin: EdgeInsets.all(10),
                child: Expanded(
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => destination ));
                      // TODO - Ubah PLSSS hfjkahfjka
                    },
                    child: Column(
                      spacing: 10,
                      children: [
                        // Jika tidak mau melakukan perubahan
                        // Image.asset(name)

                        // Jika mau modifikasi image
                        Image(
                          image: AssetImage(imagePath),
                          height: 100,
                          width: 100,
                        ),
                        Text(
                          label,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ],
                    ),
                  ),
                ),
              );
  }

  Future<bool> _onWillPop(BuildContext context) async {
    return (await showDialog(
      barrierDismissible: true,
      context: context, 
      builder: (context) => AlertDialog(
        title: Text(
          "INFORMATION",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        content: Text(
          "Do you wanna exit?",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        actions: [

          // Biar tetap di aplikasi
          TextButton(
            onPressed: () => Navigator.of(context).pop(false), 
            child: Text(
              "No",
              style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.red),
            )
          ),

          // Buat keluar dari aplikas
          TextButton(
            onPressed: () => Navigator.of(context).pop(), 
            child: Text(
              "Yes",
              style: Theme.of(context).textTheme.labelLarge,
            )
          ),
        ],
      )
    )) ?? false;
    // Supaya aler dialog tidak diesekusi
  }
}
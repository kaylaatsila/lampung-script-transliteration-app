import 'package:get/get.dart';

class UserController extends GetxController {
  final String title = 'Profil Pengguna';

  final selectedOccupation = ''.obs;
  final selectedDomicile = ''.obs;

  List<String> occupationList = ['Pelajar', 'Mahasiswa', 'Guru', 'Praktisi'];
  List<String> domicileList = ['Lampung', 'Sumatera Selatan'];  
}
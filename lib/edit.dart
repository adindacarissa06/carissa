import 'dart:convert';

import 'package:biodata/form_biodata.dart';
import 'package:flutter/material.dart';

import 'package:biodata/models/api.dart';
import 'package:biodata/models/msiswa.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class Edit extends StatefulWidget {
  final SiswaModel sw;

  const Edit({super.key, required this.sw});

  @override
  EditState createState() => EditState();
}

class EditState extends State<Edit> {
  final formkey = GlobalKey<FormState>();

  late TextEditingController nisController, namaController, tpController,
      tgController, kelaminController, agamaController, alamatController;



  Future editSw() async {
    return await http.post(
      Uri.parse(BaseUrl.edit),
      body: {
        "id": widget.sw.id.toString(),
        "nis": nisController.text,
        "nama": namaController.text,
        "tplahir": tpController.text,
        "tglahir": tgController.text,
        "kelamin": kelaminController.text,
        "agama": agamaController.text,
        "alamat": alamatController.text
      },
    );
  }

  pesan() {
    Fluttertoast.showToast(
      msg: "Perubahan Data Berhasil disimpan",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.white,
      fontSize: 16.0);
  }

  void _onConfirm(context) async {
    http.Response response = await editSw();
    final data = json.decode(response.body);
    if (data['success']) {
      pesan();
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
    }
  }

  @override
  void initState() {
    nisController = TextEditingController(text: widget.sw.nis);
    namaController = TextEditingController(text: widget.sw.nama);
    tpController = TextEditingController(text: widget.sw.tplahir);
    tgController = TextEditingController(text: widget.sw.tglahir);
    kelaminController = TextEditingController(text: widget.sw.kelamin);
    agamaController = TextEditingController(text: widget.sw.agama);
    alamatController = TextEditingController(text: widget.sw.alamat);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Siswa"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.green,
            textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          onPressed: () {
            _onConfirm(context);
          },
          child: const Text("Update"),
        ),
      ),
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Center(
          child: BiodataForm(
            formkey: formkey,
            nisController: nisController,
            namaController: namaController,
            tpController: tpController,
            tgController: tgController,
            kelaminController: kelaminController,
            agamaController: agamaController,
            alamatController: alamatController,
          ),
        ),
      ),
    );
  }

}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';

class BiodataForm extends StatefulWidget {
  const BiodataForm({super.key, required GlobalKey<FormState> formkey,
    required TextEditingController kelaminController,
    required TextEditingController alamatController,
    required TextEditingController agamaController,
    required TextEditingController nisController,
    required TextEditingController namaController,
    required TextEditingController tpController,
    required TextEditingController tgController,
  });

  @override
  _BiodataFormState createState() => _BiodataFormState();
}

class _BiodataFormState extends State<BiodataForm> {
  final GlobalKey<FormState> _formkey =
      GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _alamat = '';
  String _tplahir = '';
  String? _kelamin = '';
  String _agama = '';
  String? selectecValue;
  DateTime tglahir = DateTime.now();

  void _submitForm() {
    if(_formkey.currentState!.validate()) {
      _formkey.currentState!.save();

      print('Name: $_name');
      print('Email: $_email');
      print('Kelamin: $_kelamin');
      print('Tempat Lahir: $_tplahir');
      print('Tanggal Lahir: $_tplahir');
      print('Agama: $_agama');
      print('Alamat: $_alamat');
      print('Agama: $selectecValue');

    }
  }
final _dateController = TextEditingController();
final _status = ["Laki-laki", "Perempuan"];
final List<String> items = [
  "Islam"
  "Katolik"
  "Kristen"
  "Hindu"
  "Budha"
  "Khonghucu"
];

@override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Form Biodata'),
    ),
    body: Form(
      key: _formkey,
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            tbNama(),
            tbTempat(),
            tbTanggal(),
            tbAgama(),
            tbKelamin(),
            tbAlamat(),
            tbEmail(),
            SizedBox(height: 20.0),
            tblSimpan(),
          ],
        ),
      )
      ,
    ),
  );
}

  tbNama() {
  return TextFormField(
    decoration: InputDecoration(
      labelText: 'Nama',
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ),
    validator: (value) {
      if (value!.isEmpty) {
        return 'Masukkan Nama Anda.';
      }
      return null;
    },
    onSaved: (value) {
      _name = value!;
    },
  );
  }

  tbTempat() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Tempat Lahir',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Masukkan Kota Kelahiran Anda.';
        }
        return null;
      },
      onSaved: (value) {
        _tplahir = value!;
      },
    );
  }

  tbTanggal() {
  return TextFormField(
    readOnly: true,
    controller: _dateController,
    decoration: InputDecoration(
      labelText: 'Tanggal Lahir',
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
      ),
  ),
    onTap: () async {
      await showDatePicker(
          context: context,
        initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 150),
        lastDate: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day),
        ).then((tglahir) {
        if (tglahir != null) {
          _dateController.text = DateFormat('yyyy-MM-dd').format(tglahir);
        }
      });
    },
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter date.';
      }
      return null;
    },
  );
  }

  tbAlamat() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Alamat',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Silahkan Masukkan Alamat Anda.';
        }
        return null;
      },
      onSaved: (value) {
        _alamat = value!;
      },
    );
  }

  tbEmail() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      validator: (value) {
        if (!value!.contains('@')) {
          return 'Silahkan Masukkan Email Anda.';
        }
        return null;
      },
      onSaved: (value) {
        _email = value!;
      },
    );
  }

  tbKelamin() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        //labelText: 'Alamat',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      value: _kelamin,
      hint: Text('Jenis Kelamin'),
      onChanged: (String? newValue) {
        setState(() {
          _kelamin = newValue!;
        });
      },
      validator: (String? value) {
        if(value == null || value.isEmpty) {
          return 'Silahkan Pilih Jenis Kelamin Anda';
        }
        return null;
      },
      items: _status.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  tbAgama() {
  return DropdownButtonFormField2<String>(
    isExpanded: true,
    decoration: InputDecoration(
      labelText: "Agama",
      contentPadding: const EdgeInsets.symmetric(vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ),
    hint: const Text(
        'Pilih Agama',
      style: TextStyle(fontSize: 14),
    ),
    items: items
      .map((items) => DropdownMenuItem(
        value: items,
        child: Text(
          items,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.blue,
          ),
        ),
  ))
    .toList(),
    validator: (value) {
      if (value == null) {
        return 'Silakan Pilih Agama.';
      }
      return null;
    },
    onChanged: (value) {
    },
    onSaved: (value) {
      selectecValue = value.toString();
      _agama = value.toString();
    },
    buttonStyleData: const ButtonStyleData(
    padding: EdgeInsets.only(right: 8),
    ),
    iconStyleData: const IconStyleData(
    icon: Icon(
      Icons.arrow_drop_down,
      color: Colors.black45,
    ),
      iconSize: 24,
    ),
    dropdownStyleData: DropdownStyleData(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
    ),
    menuItemStyleData: const MenuItemStyleData(
      padding: EdgeInsets.symmetric(horizontal: 16),
    ),
    );
  }

  tblSimpan() {
  return ElevatedButton(
      onPressed: _submitForm,
      child: Text('Submit'),
  );
  }

}
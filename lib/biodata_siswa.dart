import 'package:flutter/material.dart';

class BiodataView extends StatefulWidget {
  const BiodataView({super.key});

  @override
  State<BiodataView> createState() => _BiodataViewState();
}

class _BiodataViewState extends State<BiodataView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('Profile User'),
        centerTitle: true,
        leading: const BackButton(),
        actions: [
          PopupMenuButton(itemBuilder: (BuildContext context) {
            return <PopupMenuEntry>[
              PopupMenuItem(
                child:
                const Text('Edit Profile', style: TextStyle(color: Colors.blue)),
                onTap: () {},
              ),
            ];
          }),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Column(
                children: [
                  const Stack(
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 64,
                            backgroundImage: NetworkImage("https://www.google.com/imgres?q=logo%20profil&imgurl=https%3A%2F%2Fstatic.vecteezy.com%2Fsystem%2Fresources%2Fthumbnails%2F007%2F461%2F014%2Fsmall%2Fprofile-gradient-logo-design-template-icon-vector.jpg&imgrefurl=https%3A%2F%2Fwww.vecteezy.com%2Ffree-vector%2Fprofile-logo&docid=BJa5oBBmsPAcoM&tbnid=9r3qf3QtEix7wM&vet=12ahUKEwi71cKNj4CIAxV88jgGHWJMNbgQM3oECEAQAA..i&w=200&h=200&hcb=2&ved=2ahUKEwi71cKNj4CIAxV88jgGHWJMNbgQM3oECEAQAA"),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color.fromARGB(150, 191, 242, 255),
                    ),
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        const SizedBox(height: 15),
                        TextField(
                          controller:
                          TextEditingController(text: "Adinda Carissa"),
                          readOnly: true,
                          decoration: const InputDecoration(
                            labelText: "Name",
                            prefix: Icon(Icons.account_circle),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextField(
                          controller:
                          TextEditingController(text: "Adinda"),
                          readOnly: true,
                          decoration: const InputDecoration(
                            labelText: "Nickname",
                            prefix: Icon(Icons.account_circle),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color.fromARGB(150, 191, 242, 255),
                    ),
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        const SizedBox(height: 15),
                        TextField(
                          controller:
                          TextEditingController(text: "Kota Malang"),
                          readOnly: true,
                          decoration: const InputDecoration(
                            labelText: "Address",
                            prefix: Icon(Icons.home),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextField(
                          controller:
                          TextEditingController(text: "10 Juni 2024"),
                          readOnly: true,
                          decoration: const InputDecoration(
                            labelText: "Birth",
                            prefix: Icon(Icons.calendar_today),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextField(
                          controller:
                          TextEditingController(text: "Gemini"),
                          readOnly: true,
                          decoration: const InputDecoration(
                            labelText: "Zodiak",
                            prefix: Icon(Icons.transgender),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
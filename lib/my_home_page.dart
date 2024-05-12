import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> ques = [
    'ques 1',
    'ques 2',
    'ques 3',
    'ques 4',
  ];

  // List data = [
  //   {"name": "ronak", "isPresent": false},
  //   {"name": "ravi", "isPresent": false},
  //   {"name": "ronakj", "isPresent": false}
  // ];
  //
  List<Map<String, dynamic>> updatedData = [];

  void addDetails(String? text, bool isPresent) {
    Map<String, dynamic> udata = {'marks': text, 'isPresent': isPresent};
    updatedData.add(udata);
    print('updated data : -$udata');
  }

  List<dynamic> textController = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  List<bool> booldata = [false, false, false, false];

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Align(
        alignment: Alignment.centerRight,
        child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
              child: ListView.builder(
                  itemCount: textController.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        TextFormField(
                          controller: textController[index],
                          enabled: !booldata[index],
                          decoration: const InputDecoration(
                              border: OutlineInputBorder()),
                          onChanged: (v) {
                            textController[index].text = v;
                            print(v);
                            addDetails(v, false);
                          },
                          validator: (v) {
                            if (v!.isEmpty && booldata[index] == false) {
                              return "please enter something";
                            }
                            return null;
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Checkbox(
                                value: booldata[index],
                                onChanged: (v) {
                                  setState(() {
                                    booldata[index] = v!;
                                    textController[index].clear();
                                    addDetails(null, v);
                                    print('value is $v');
                                  });
                                }),
                            const Text("is absent")
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    );
                  }),
            )),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              print("form is successfully submitted");
            }
          },
          child: const Text("submit"),
        ),
      ),
    );
  }
}

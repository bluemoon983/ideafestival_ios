import 'package:flutter/material.dart';
import 'package:iosgsmarket/src/model/sample.dart';
import 'package:iosgsmarket/src/repo/sql_shopping_crud.dart';
import 'package:iosgsmarket/src/util/data.dart';

class DetailView extends StatefulWidget {
  final Sample sample;
  const DetailView({super.key, required this.sample});

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  Future<Sample?> _loadSampleOne() async {
    return SqlSampleCrud.getSempleOneList(widget.sample.id!);
  }

  void update(Sample sample) async {
    double value = Data.randomValue();
    var updateSample = sample.clone(value: value, yn: value.toInt() % 2 == 0);
    await SqlSampleCrud.update(updateSample);
    setState(() {});
  }

  void delet(Sample sample) async {
    await SqlSampleCrud.delete(sample.id!);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.sample.toString())),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: FutureBuilder<Sample?>(
          future: _loadSampleOne(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Not Found Data by ${widget.sample.id}"),
              );
            }

            if (snapshot.hasData) {
              var data = snapshot.data!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "name: 대상혁 ${data.name}",
                    style: const TextStyle(fontSize: 15),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Y/N : GOAT ${data.yn}',
                    style: const TextStyle(fontSize: 15),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'value : 4 ${data.value}',
                    style: const TextStyle(fontSize: 15),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "CreatedAt: ${data.createdAt}",
                    style: const TextStyle(fontSize: 15),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    onPressed: () {
                      update(data);
                    },
                    child: const Text(
                      'Update',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () {
                      delet(data);
                    },
                    child: const Text(
                      'Delete',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}

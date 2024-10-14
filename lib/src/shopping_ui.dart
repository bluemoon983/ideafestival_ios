import 'package:flutter/material.dart';
import 'package:iosgsmarket/src/detail_view.dart';
import 'package:iosgsmarket/src/model/sample.dart';
import 'package:iosgsmarket/src/repo/sql_sample_crud.dart';
import 'package:iosgsmarket/src/util/data.dart';

class ShoppingUi extends StatefulWidget {
  const ShoppingUi({super.key});

  @override
  State<ShoppingUi> createState() => _MainScreensState();
}

class _MainScreensState extends State<ShoppingUi> {
  void createdRandomSample() async {
    var value = Data.randomValue();
    var sample = Sample(
      createdAt: DateTime.now(),
      name: Data.makeUUID(),
      value: value,
      yn: value % 2 == 0,
    );

    await SqlSampleCrud.create(sample);
    update();
  }

  void update() => setState(() {});

  Widget _sampleOne(Sample sample) {
    return GestureDetector(
      onTap: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailView(sample: sample),
          ),
        );
        update();
      },
      child: Container(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: sample.yn ? Colors.green : Colors.red,
                  ),
                ),
                const SizedBox(
                  width: 7,
                ),
                Text(sample.name),
              ],
            ),
            const SizedBox(height: 7),
            Text(
              sample.createdAt.toIso8601String(),
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<List<Sample>> _loadSampleList() async {
    return await SqlSampleCrud.getList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SQFlite Sample"),
      ),
      body: FutureBuilder<List<Sample>>(
        future: _loadSampleList(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            // 오류 발생 시 오류 메시지를 화면에 출력
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          if (snapshot.hasData) {
            var datas = snapshot.data;
            return ListView(
              children: List.generate(
                  datas!.length, (index) => _sampleOne(datas[index])),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createdRandomSample,
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.add,
          color: Color.fromARGB(255, 243, 221, 20),
        ),
      ),
    );
  }
}

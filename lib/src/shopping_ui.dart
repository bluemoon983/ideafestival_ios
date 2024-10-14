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
        color: Colors.white,
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Padding(
          padding: EdgeInsets.only(top: 30.0, bottom: 20), // 왼쪽 패딩 추가
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "중고 거래",
              style: TextStyle(fontSize: 39),
            ),
          ),
        ),
      ),
      body: FutureBuilder<List<Sample>>(
        future: _loadSampleList(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
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
        onPressed: createdRandomSample, // 샘플 추가 버튼
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.add,
          color: Colors.black, // 아이콘 색상
        ),
      ),
    );
  }
}

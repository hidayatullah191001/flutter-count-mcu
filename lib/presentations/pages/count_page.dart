part of 'pages.dart';

class CountPage extends StatefulWidget {
  final PesertaModel data;
  const CountPage({super.key, required this.data});

  @override
  State<CountPage> createState() => _CountPageState();
}

class _CountPageState extends State<CountPage> {
  DatabaseReference ref = FirebaseDatabase.instance.ref();
  var data = {};

  @override
  void initState() {
    super.initState();
    getVollyCount();
  }

  getVollyCount() {
    ref.child('Volly').onValue.listen((DatabaseEvent event) {
      DataSnapshot snapshot = event.snapshot;
      if (snapshot.value != null) {
        setState(() {
          data = snapshot.value as Map;
        });
      }
    });
  }

  resetCount() {
    DatabaseReference _databaseRef = FirebaseDatabase.instance.ref();

    Map<String, dynamic> newData = {
      'Masuk': '0',
      'Keluar': '0',
    };
    _databaseRef.child('Volly').set(newData);
  }

  saveData() {
    context.read<CountBloc>().add(
          CountTes(
            CountFormModel(
              totalMasuk: data['Masuk'].toString(),
              totalKeluar: data['Keluar'].toString(),
            ),
            widget.data.uid.toString(),
          ),
        );
    DatabaseReference _databaseRef = FirebaseDatabase.instance.ref();

    Map<String, dynamic> newData = {
      'Masuk': '0',
      'Keluar': '0',
    };
    _databaseRef.child('Volly').set(newData);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background1Color,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              header(context),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: greenColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Jumlah Masuk'),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${data['Masuk'] ?? 0}',
                          style: const TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: alertColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Jumlah Keluar'),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${data['Keluar'] ?? 0}',
                          style: const TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              CustomButtons(
                onPressed: saveData,
                title: 'Simpan Hasil Tes',
              ),
              CustomButtons(
                onPressed: resetCount,
                title: 'Reset Tes',
                marginTop: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget header(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      child: Row(
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: primaryTextColor,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tes Peserta',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: bold,
                ),
              ),
              Text(
                'Berisi informasi tes peserta',
                style: subtitleTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

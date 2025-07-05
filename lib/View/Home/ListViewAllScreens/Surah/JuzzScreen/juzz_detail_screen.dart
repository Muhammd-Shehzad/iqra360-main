import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class JuzDetailScreen extends StatefulWidget {
  final int juzNumber;

  const JuzDetailScreen({super.key, required this.juzNumber});

  @override
  State<JuzDetailScreen> createState() => _JuzDetailScreenState();
}

class _JuzDetailScreenState extends State<JuzDetailScreen> {
  List<Map<String, dynamic>> ayahs = [];
  Map<int, String> translations = {};
  Set<int> showTranslationFor = {};
  bool isLoading = true;
  bool hasError = false;
  String currentSurah = "";
  String surahType = ""; // مکی / مدنی

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    fetchData();
    _scrollController.addListener(handleScroll);
  }

  Future<void> fetchData() async {
    try {
      await Future.wait([fetchArabicAyahs(), fetchUrduTranslation()]);
      currentSurah = ayahs.first['surah'];
      setState(() => isLoading = false);
    } catch (_) {
      setState(() {
        hasError = true;
        isLoading = false;
      });
    }
  }

  Future<void> fetchArabicAyahs() async {
    final url =
        'https://api.alquran.cloud/v1/juz/${widget.juzNumber}/quran-uthmani';
    final response = await http.get(Uri.parse(url));
    final json = jsonDecode(response.body);

    if (json['code'] == 200) {
      final List ayahList = json['data']['ayahs'];

      ayahs =
          ayahList
              .where((ayah) {
                final cleanText = ayah['text'].replaceAll(RegExp(r'\s+'), '');
                final isBismillah =
                    cleanText == 'بِسْمِاللّٰهِالرَّحْمٰنِالرَّحِیْمِ';
                final isSurahFatiha = ayah['surah']['number'] == 1;
                final isAyahOne = ayah['numberInSurah'] == 1;
                return !isBismillah || (isSurahFatiha && isAyahOne);
              })
              .map((ayah) {
                return {
                  'number': ayah['number'],
                  'text': ayah['text'],
                  'surah': ayah['surah']['name'],
                  'ayahNumber': ayah['numberInSurah'],
                  'revelationType': ayah['surah']['revelationType'],
                };
              })
              .toList();

      final type = ayahs.first['revelationType'];
      surahType = type == "Meccan" ? "مَكِّيّ" : "مَدَنِيّ";
    } else {
      throw Exception("Failed to load Arabic Ayahs");
    }
  }

  Future<void> fetchUrduTranslation() async {
    final url =
        'https://api.alquran.cloud/v1/juz/${widget.juzNumber}/ur.jalandhry';
    final response = await http.get(Uri.parse(url));
    final json = jsonDecode(response.body);

    if (json['code'] == 200) {
      final List ayahList = json['data']['ayahs'];
      for (var ayah in ayahList) {
        translations[ayah['number']] = ayah['text'];
      }
    } else {
      throw Exception("Failed to load Urdu Translation");
    }
  }

  Future<void> fetchTafseer(int ayahNumber) async {
    try {
      final response = await http.get(
        Uri.parse('https://api.alquran.cloud/v1/ayah/$ayahNumber/ur.jalandhry'),
      );
      final json = jsonDecode(response.body);

      if (json['code'] == 200) {
        final tafseer = json['data']['text'];
        showTafseerBottomSheet(tafseer);
      } else {
        showTafseerBottomSheet('تفسیر حاصل نہیں ہو سکی');
      }
    } catch (_) {
      showTafseerBottomSheet('انٹرنیٹ کا مسئلہ ہے یا تفسیر دستیاب نہیں');
    }
  }

  void showTafseerBottomSheet(String tafseer) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
      ),
      backgroundColor: const Color(0xFF1E3A8A),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: SingleChildScrollView(
              child: Text(
                tafseer,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                  fontFamily: 'NotoNastaliq',
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void toggleTranslation(int ayahNumber) {
    setState(() {
      if (showTranslationFor.contains(ayahNumber)) {
        showTranslationFor.remove(ayahNumber);
      } else {
        showTranslationFor.add(ayahNumber);
      }
    });
  }

  void handleScroll() {
    final double offset = _scrollController.offset;
    for (int i = 0; i < ayahs.length - 1; i++) {
      final itemOffset = i * 150;
      if (offset < itemOffset) {
        setState(() {
          currentSurah = ayahs[i]['surah'];
        });
        break;
      }
    }
  }

  String getCircularArabicNumber(int number) {
    final arabicDigits = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    final digits = number.toString().split('');
    final arabic = digits.map((d) => arabicDigits[int.parse(d)]).join();
    return '۝$arabic';
  }

  bool isBismillahAyah(Map<String, dynamic> ayah) {
    final cleanText = ayah['text'].replaceAll(RegExp(r'\s+'), '');
    return cleanText == 'بِسْمِاللّٰهِالرَّحْمٰنِالرَّحِیْمِ';
  }

  @override
  void dispose() {
    _scrollController.removeListener(handleScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const themeColor = Color(0xFF0D47A1);
    const cardColor = Color(0xFF1E3A8A);

    return Scaffold(
      backgroundColor: themeColor,
      appBar: AppBar(
        backgroundColor: themeColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              surahType.isNotEmpty ? surahType : '',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'NotoNastaliq',
              ),
            ),
            Text(
              currentSurah,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
      ),
      body:
          isLoading
              ? const Center(
                child: CircularProgressIndicator(color: Colors.white),
              )
              : hasError
              ? const Center(
                child: Text(
                  "Failed to load data",
                  style: TextStyle(color: Colors.white),
                ),
              )
              : ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.all(12),
                itemCount: ayahs.length,
                itemBuilder: (context, index) {
                  final ayah = ayahs[index];
                  final ayahNumber = ayah['number'];
                  final translation = translations[ayahNumber];
                  final isBismillah = isBismillahAyah(ayah);
                  final ayahNumberText =
                      (!isBismillah ||
                              (ayah['surah'] == 'سُورَةُ ٱلْفَاتِحَةِ'))
                          ? getCircularArabicNumber(ayah['ayahNumber'])
                          : '';

                  return Card(
                    elevation: 6,
                    shadowColor: Colors.black45,
                    color: cardColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: themeColor,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 6,
                                  ),
                                ),
                                onPressed: () => toggleTranslation(ayahNumber),
                                child: const Text("Translation"),
                              ),
                              const SizedBox(width: 12),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white24,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 6,
                                  ),
                                ),
                                onPressed: () => fetchTafseer(ayahNumber),
                                child: const Text("Tafseer"),
                              ),
                              const SizedBox(width: 12),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white24,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 6,
                                  ),
                                ),
                                onPressed: () {},
                                child: Icon(Icons.play_arrow),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Center(
                            child: Text(
                              ayah['text'] + " " + ayahNumberText,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontFamily: 'Kitab',
                              ),
                            ),
                          ),
                          if (showTranslationFor.contains(ayahNumber) &&
                              translation != null)
                            Padding(
                              padding: const EdgeInsets.only(top: 12.0),
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: Center(
                                  child: Text(
                                    translation,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.white70,
                                      fontFamily: 'NotoNastaliq',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
    );
  }
}

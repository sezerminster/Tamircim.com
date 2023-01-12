import 'package:flutter/material.dart';
import 'package:tamircim/anasayfa.dart';
class hakkimizda extends StatelessWidget {
  const hakkimizda({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: const NavigationDrawer(),
        appBar: AppBar(
          title: Text('Hakkımızda'),
        ),
        backgroundColor: Colors.lightBlueAccent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                child: Image.asset('assets/about.jpg'),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "TAMİRCİM 2022 yılında kurulmuş ve insanlara kolaylık sağlamayı amaçlayan bir sitedir."
                      "Kuruluş amacı kullanıcıların sitede yer alan ilanları gezerek kendine en uygun ilanı en doğru zamanda bulabilmesidir.Firmalar sitemize başvuru yapaktadır."
                      "Ve bu doğrultuda ilanları sitemizde sizlerin bakabilmesi için yer almaktadır.sitemizde ilanlarımızı gezebilir,filtreleyebilir ve kendine uygun ilanı seçebilirsiniz."
                      "Aynı zamanda firma başvurusu yapabilir ve firmanızın sayfamızda yer alan ilanlardan biri olmasını sağlayabilirsiniz.İletişim formundan bizimle iletişime geçebilirsiniz.Ayrıca sitemizde var olan konumuza yakın olan tamirci ilanlarını görebilir ve acil durumlarda en kısa zamanda kendinize uygun tamirciden hizmet alabilirsiniz. "
                      "TAMİRCİM.com her şeyden önce kullanıcı memnuniyetini 1.sıraya koyar."
                      "TAMİRCİM.com, teknolojiyi yakından izleyerek Türkiye' nin tüm kullanıcılarının ihtiyaçlarını karşılamayı,"
                      " genç, dinamik ve uzman kadrosuyla güvenilir ve faydalı ilanları kullanıcıya sunmakta ve kullanıcının en doğru seçimi yapmasında yardımcı olmaktadır.",
                  style: TextStyle(fontSize: 13, color: Colors.brown[900]),
                ),
              ),
            ],
          ),
        ),
      );
}

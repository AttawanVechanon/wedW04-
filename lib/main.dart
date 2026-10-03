import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// =======================================================
// 1. Model: โครงสร้างข้อมูล (มีคุณสมบัติ 6 อย่าง)
// =======================================================
class Movie {
  final String title;       // ชื่อเรื่อง
  final String genre;       // แนวหนัง
  final int releaseYear;    // ปีที่ฉาย
  final String director;    // ผู้กำกับ
  final double rating;      // คะแนน
  final String synopsis;    // เรื่องย่อ
  final String imageUrl;    // รูปภาพ

  Movie({
    required this.title,
    required this.genre,
    required this.releaseYear,
    required this.director,
    required this.rating,
    required this.synopsis,
    required this.imageUrl,
  });
}

// =======================================================
// 2. Data: ข้อมูลจำลองจำนวน 5 รายการ
// =======================================================
final List<Movie> movieList = [
  Movie(
    title: 'Interstellar',
    genre: 'Sci-Fi / Adventure',
    releaseYear: 2014,
    director: 'Christopher Nolan',
    rating: 8.6,
    synopsis: 'ทีมนักบินอวกาศเดินทางผ่านรูหนอนเพื่อค้นหาบ้านเกิดแห่งใหม่ให้กับมนุษยชาติที่กำลังเผชิญกับวิกฤตการขาดแคลนอาหาร',
    imageUrl: 'https://images.unsplash.com/photo-1451187580459-43490279c0fa?q=80&w=600&auto=format&fit=crop',
  ),
  Movie(
    title: 'The Dark Knight',
    genre: 'Action / Crime',
    releaseYear: 2008,
    director: 'Christopher Nolan',
    rating: 9.0,
    synopsis: 'แบทแมนต้องเผชิญหน้ากับศัตรูตัวฉกาจอย่าง โจ๊กเกอร์ อาชญากรโรคจิตที่ต้องการสร้างความโกลาหลให้กับเมืองก็อตแธม',
    imageUrl: 'https://images.unsplash.com/photo-1509347528160-9a9e33742cdb?q=80&w=600&auto=format&fit=crop',
  ),
  Movie(
    title: 'Parasite',
    genre: 'Thriller / Drama',
    releaseYear: 2019,
    director: 'Bong Joon Ho',
    rating: 8.5,
    synopsis: 'เรื่องราวของครอบครัวยากจนที่ค่อยๆ แฝงตัวเข้าไปทำงานในบ้านของครอบครัวเศรษฐี จนนำไปสู่เหตุการณ์ที่ไม่มีใครคาดคิด',
    imageUrl: 'https://images.unsplash.com/photo-1601004890684-d8cbf643f5f2?q=80&w=600&auto=format&fit=crop',
  ),
  Movie(
    title: 'Spirited Away',
    genre: 'Animation / Fantasy',
    releaseYear: 2001,
    director: 'Hayao Miyazaki',
    rating: 8.6,
    synopsis: 'เด็กหญิงวัย 10 ขวบหลงเข้าไปในโลกของวิญญาณและเทพเจ้า เธอต้องทำงานในโรงอาบน้ำของแม่มดเพื่อหาทางช่วยพ่อแม่ที่ถูกสาป',
    imageUrl: 'https://images.unsplash.com/photo-1534447677768-be436bb09401?q=80&w=600&auto=format&fit=crop',
  ),
  Movie(
    title: 'The Matrix',
    genre: 'Sci-Fi / Action',
    releaseYear: 1999,
    director: 'The Wachowskis',
    rating: 8.7,
    synopsis: 'แฮ็กเกอร์หนุ่มค้นพบความจริงว่าโลกที่เขาอาศัยอยู่เป็นเพียงโปรแกรมจำลองที่ถูกสร้างขึ้นโดยเครื่องจักรจักรกล',
    imageUrl: 'https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?q=80&w=600&auto=format&fit=crop',
  ),
];

// =======================================================
// 3. แอปพลิเคชันหลัก
// =======================================================
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Favorite Movies',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
        ),
      ),
      home: const MovieListScreen(),
    );
  }
}

// =======================================================
// 4. หน้าจอแรก: หน้ารวมรายการ (List Screen)
// =======================================================
class MovieListScreen extends StatelessWidget {
  const MovieListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('รายชื่อภาพยนตร์ที่น่าสนใจ'),
      ),
      body: ListView.builder(
        itemCount: movieList.length,
        itemBuilder: (context, index) {
          final movie = movieList[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  movie.imageUrl,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                movie.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('${movie.genre} • ปี ${movie.releaseYear}'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // กดแล้วเปลี่ยนไปหน้า Detail
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDetailScreen(movie: movie),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// =======================================================
// 5. หน้าจอที่สอง: หน้าแสดงข้อมูลเฉพาะ (Detail Screen)
// =======================================================
class MovieDetailScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              movie.imageUrl,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        '${movie.rating} / 10',
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        'ปี: ${movie.releaseYear}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  _buildInfoRow(Icons.movie_creation, 'แนวภาพยนตร์:', movie.genre),
                  const SizedBox(height: 8),
                  _buildInfoRow(Icons.person, 'ผู้กำกับ:', movie.director),
                  const SizedBox(height: 20),
                  const Text(
                    'เรื่องย่อ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    movie.synopsis,
                    style: const TextStyle(fontSize: 16, height: 1.5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey[700], size: 20),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
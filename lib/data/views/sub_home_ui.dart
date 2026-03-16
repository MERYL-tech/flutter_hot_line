import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hot_line/data/hotline.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class SubHomeUI extends StatelessWidget {
  final String categoryTitle;
  final List<Hotline> hotlineList;
  final Color themeColor;
  final VoidCallback? onInfoPressed;

  const SubHomeUI({
    super.key,
    required this.categoryTitle,
    required this.hotlineList,
    required this.themeColor,
    this.onInfoPressed,
  });

  // โทนสี
  final Color _backgroundColor = const Color.fromARGB(255, 219, 218, 217);
  final Color _textColorMain = Colors.deepOrangeAccent;
  final Color _cardColor = const Color.fromARGB(255, 255, 255, 254);

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(0, 209, 18, 18),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'สายด่วน THAILAND',
          style: GoogleFonts.kanit(
            color: Color.fromARGB(223, 241, 5, 5),
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
        ),
        actions: [
          IconButton(
            onPressed: onInfoPressed,
            icon:
                Icon(Icons.info_outline, color: _textColorMain.withAlpha(200)),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 12),

              /// ===== Carousel ด้านบน =====
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: CarouselSlider.builder(
                  itemCount: listslider.length,
                  options: CarouselOptions(
                    height: 200,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 2),
                    viewportFraction: 0.9,
                    enlargeCenterPage: true,
                  ),
                  itemBuilder: (context, index, realIndex) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: AssetImage(listslider[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 16),

              /// ===== หัวข้อหมวดหมู่ =====
              Text(
                categoryTitle,
                style: GoogleFonts.kanit(
                  color: _textColorMain,
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 16),

              /// ===== Banner/พื้นที่สอดแทรก (ถ้ายังไม่มี คงที่ว่างไว้) =====
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 0, // ยังไม่ใช้ ใส่ 0 ไว้ก่อน หรือเอาออกได้
              ),

              const SizedBox(height: 16),

              /// ===== รายการสายด่วน =====
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: hotlineList.length,
                itemBuilder: (context, index) {
                  final item = hotlineList[index];
                  return Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    decoration: BoxDecoration(
                      color: _cardColor,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: _textColorMain.withAlpha(15), width: 1.0),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      leading: _buildLogo(item),
                      title: Text(
                        item.name,
                        style: GoogleFonts.kanit(
                          color: _textColorMain,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text(
                        item.number,
                        style: GoogleFonts.kanit(
                          color: themeColor,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      trailing: _buildCallButton(item, themeColor),
                    ),
                  );
                },
              ),

              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }

  /// logo วงกลม
  Widget _buildLogo(Hotline item) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(color: _textColorMain.withAlpha(15)),
      ),
      // ใช้ ClipOval เพื่อให้ภาพโค้งตามกรอบได้เนียน
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: ClipOval(
          child: Image.asset(
            item.imagePath,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) => Icon(
              Icons.image_not_supported,
              size: 20,
              color: _textColorMain.withAlpha(50),
            ),
          ),
        ),
      ),
    );
  }

  /// ปุ่มโทร
  Widget _buildCallButton(Hotline item, Color themeColor) {
    return InkWell(
      onTap: () => _makePhoneCall(item.number),
      borderRadius: BorderRadius.circular(24),
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: themeColor.withAlpha(20),
          shape: BoxShape.circle,
          border: Border.all(color: themeColor, width: 1.5),
        ),
        child: Icon(Icons.call, color: themeColor, size: 22),
      ),
    );
  }
}

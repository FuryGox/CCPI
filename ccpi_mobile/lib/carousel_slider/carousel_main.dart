import 'package:ccpi_mobile/app_config/Tcolor.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class MyCarouselSlider extends StatelessWidget {
  // Danh sách các đối tượng CarouselDataCard
  final List<CarouselDataCard> dataList = [
    CarouselDataCard(
      name: "Product 1",
      price: 29.99,
      changePrice: -2.4,
      changePercent: -0.5,
      utcTime: "10:00 UTC",
      currentTime: "15:00 Local",
    ),
    CarouselDataCard(
      name: "Product 2",
      price: 59.99,
      changePrice: -2.4,
      changePercent: -0.5,
      utcTime: "12:00 UTC",
      currentTime: "17:00 Local",
    ),
    CarouselDataCard(
      name: "Product 3",
      price: 99.99,
      changePrice: 2.4,
      changePercent: 0.5,
      utcTime: "14:00 UTC",
      currentTime: "19:00 Local",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CarouselSlider(
          options: CarouselOptions(
            height: 150.0,
            enlargeCenterPage: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            enableInfiniteScroll: true,
            viewportFraction: 0.7,
          ),
          items: dataList.map((data) => _buildCard(data)).toList(),
        ),
    );
  }

  // Hàm xây dựng một card chứa thông tin từ CarouselDataCard
  Widget _buildCard(CarouselDataCard data) {
    return Container(
      margin: EdgeInsets.all(10.0),
      width: 500,
      height: 120,
      decoration: BoxDecoration(
        color: TColor.white, // Màu nền của thẻ
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: const [
          BoxShadow(
              color: Colors.black26,
              blurRadius: 5.0,
              spreadRadius: 1.0,
              offset: Offset(0, 3),
        ),

        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Name: ${data.name}',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: TColor.coinName,
                  ),
                ),
              ),
              const SizedBox(height: 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Price: \$${data.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14.0,
                      color: TColor.primaryTextLight,
                    ),
                  ),
                  const SizedBox(width: 25 ,),
                  FaIcon(
                    data.changePrice < 0 ? FontAwesomeIcons.arrowDown : FontAwesomeIcons.arrowUp,
                    size: 14,
                    color: data.changePrice < 0 ? TColor.red : TColor.green,
                  ),
                  const SizedBox(width: 5,),
                  Text(
                    'Price: ${data.changePrice.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: data.changePrice < 0 ? TColor.red : TColor.green,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 7),
              Center(
                child: Column(
                  children: [
                    Text(
                      'UTC Time: ${data.utcTime}',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: TColor.primaryTextLight,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Current Time: ${data.currentTime}',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: TColor.primaryTextLight,
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}






// Change to data folder later
class CarouselDataCard {
  String name;
  double price;
  double changePrice;
  double changePercent;
  String utcTime;
  String currentTime;

  CarouselDataCard({
    required this.name,
    required this.price,
    required this.changePrice,
    required this.changePercent,
    required this.utcTime,
    required this.currentTime,
  });
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopRestaurant extends StatelessWidget {
  const TopRestaurant({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*.7,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                child: Stack(
                  children: [
                    SizedBox(
                      height: 200,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network('https://images.deliveryhero.io/image/fd-kh/LH/t2um-hero.jpg'),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight:Radius.circular(50),
                              bottomRight: Radius.circular(50)),
                          color: Colors.black87,
                        ),
                        child: const Padding(
                            padding: EdgeInsets.all(5),
                            child: Text("Top restaurant",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),)),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                        ),
                        child: const Padding(
                            padding: EdgeInsets.all(5),
                            child: Text("15 min",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87
                              ),)),
                      ),
                    ),
                  ],
                )
            ),
            const Text("Staburks Fun Mall TK",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),),
            const Text("\$\$\$ Tea & Coffee, American, Bervera,",
              maxLines: 1,),
            const Text("\$ 0.27 delivery fee",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),),
          ],
        ),
      ),
    );
  }
}
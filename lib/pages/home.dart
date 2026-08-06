import 'package:flutter/material.dart';
import '../widgets/app_bar.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: 'The Book Nook'),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height:20),
            WelcomeBanner(),
            SizedBox(height:20),
            FeaturedSection(),
            SizedBox(height:20),
            BestSellerSection(),
          ],
        ),
      ),
    );
    
  }

}

class WelcomeBanner extends StatelessWidget {
  const WelcomeBanner({super.key});

  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),

        gradient: const LinearGradient(
          colors: [
            Color(0xff3949AB),
            Color(0xff5C6BC0),
          ],
        )
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Text(
            "Welcome",
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Discover new books",
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ],        
      ),
    );
  }
}

class FeaturedSection extends StatelessWidget {

  const FeaturedSection({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        const Text(
          "Featured Books",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 15),

        SizedBox(

          height: 260,

          child: ListView.builder(

            scrollDirection: Axis.horizontal,

            itemCount: 5,

            itemBuilder: (context, index) {

              return Container(

                width: 160,

                margin: const EdgeInsets.only(right: 15),

                child: Card(

                  elevation: 4,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: Padding(

                    padding: const EdgeInsets.all(12),

                    child: Column(

                      children: [

                        Expanded(

                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset( 'books/book1.jpg', fit: BoxFit.cover, width: double.infinity, ), ),
                        ),

                        const SizedBox(height: 12),

                        const Text( "People We Meet On Vacation", maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle( fontWeight: FontWeight.bold), ),
                        const Text( "Emily Henry", style: TextStyle( color: Colors.grey, ), ),

                        const SizedBox(height: 5),

                        const Text( "Kes1500", style: TextStyle( fontWeight: FontWeight.bold, color: Colors.indigo, ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class BestSellerSection extends StatelessWidget {
  const BestSellerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

        children:[

          const Text(
            "Best Sellers",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height:15),
          ListTile(
            leading: Container(
              width:60,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              )
            ),
            title: const Text("Project Hail Mary"),

            subtitle: const Text("Morgan Housel"),

            trailing: const Text(
              "Kes1800",
              style:TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
    );
  }
}
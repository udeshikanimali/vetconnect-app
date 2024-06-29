import 'package:flutter/material.dart';

class CatTips extends StatefulWidget {
  const CatTips({super.key});

  @override
  State<CatTips> createState() => _CatTipsState();
}

class _CatTipsState extends State<CatTips> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cat Care Tips'),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          CatTip(
            title: 'Schedule Regular Vet Visits',
            content:
                'Cats require annual check-ups, and we recommend cats over 7 years old see one of our veterinarians twice a year. These visits can help catch any health issues early and prevent them from becoming more severe.',
          ),
          CatTip(
            title: 'Provide a Nutritious Diet',
            content:
                'A well-balanced and nutritious diet is vital for maintaining your cat’s health. Ensure that their diet includes high-quality protein, healthy fats, and essential nutrients. We also recommend that cats eat mostly canned food. This provides a healthier balance of carbohydrates and moisture when compared to dry food diets.',
          ),
          CatTip(
            title: 'Keep Your Cat Hydrated',
            content:
                'Water is essential for your cat’s health, and dehydration can lead to urinary tract and/or kidney problems. Provide fresh, clean water and encourage your cat to drink more water by keeping their bowls clean or even trying cat water fountains.',
          ),
          CatTip(
            title: 'Regular Exercise',
            content:
                'Regular exercise helps maintain a healthy weight and keeps your cat active. Encourage playtime, provide toys and scratching posts, and allow access to climbing structures for fun activity.',
          ),
          CatTip(
            title: 'Groom Regularly',
            content:
                'Grooming your cat helps to prevent hairballs, matting, and skin infections. Brushing their coat regularly, trimming their nails, and cleaning their teeth are all part of good grooming practices. This interaction with you also helps your cat feel more enriched and happier overall.',
          ),
          CatTip(
            title: 'Keep Litter Boxes Clean',
            content:
                'Regularly cleaning the litter box helps prevent urinary tract issues and promotes good hygiene for both your cat and your home. Be sure to scoop the litter 1-2 times per day and do a thorough scrubbing of the box at least once a month.',
          ),
          CatTip(
            title: 'Prevent Parasites',
            content:
                'Fleas, ticks, and other parasites can cause serious health issues. Speak to your vet about safe and effective preventative products to protect your cat from these unwanted pests. These preventative measures are important for any cat that goes outside even for brief periods, but also for indoor cats that live with other pets who spend time outdoors.',
          ),
          CatTip(
            title: 'Vaccinate Your Cat',
            content:
                'Vaccinations are essential for preventing common cat diseases such as Feline Leukemia, Rabies, and Distemper. Speak to your vet about the recommended vaccination schedule for your particular cat.',
          ),
          CatTip(
            title: 'Provide Mental Stimulation',
            content:
                'Mental stimulation is crucial for your cat’s overall well-being. Encourage playtime with laser pointers or hand-held cat toys, provide puzzle toys or hide food in different locations around the house. Some indoor cats will even tolerate a harness so you can safely take them on a walk outside.',
          ),
          CatTip(
            title: 'Be Alert to Behavioral Changes',
            content:
                'Cats are notorious for hiding signs of illness. However, if you notice any changes in behavior or routine, it’s crucial to seek veterinary care immediately. Some signs would include hiding, decreased appetite and changes in social or litterbox habits.',
          ),
        ],
      ),
    );
  }
}

class CatTip extends StatelessWidget {
  final String title;
  final String content;

  const CatTip({
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: screenWidth * 0.015 + 12,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          Text(
            content,
            style: TextStyle(fontSize: screenWidth * 0.015 + 10),
          ),
          const Divider(
            color: Colors.grey,
            height: 32,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class DogTips extends StatefulWidget {
  const DogTips({super.key});

  @override
  State<DogTips> createState() => _DogTipsState();
}

class _DogTipsState extends State<DogTips> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dog Care Tips'),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          DogTip(
            title: 'Wellness visits.',
            content:
                'Annual visits to your veterinarian are an important part of making sure your dog is healthy. Just as it’s important for humans to visit the doctor for an annual physical, taking your dog for an annual trip to the vet will allow your vet to get to know your dog and allows you the opportunity to discuss any changes in health.',
          ),
          DogTip(
            title: 'Monthly preventatives.',
            content:
                'Heartworm disease is a serious and potentially fatal disease in dogs. Fleas and ticks carry zoonotic diseases – diseases that can infect both us and our dogs. Talk to your veterinarian about which monthly preventatives are necessary in your region to keep your dog safe.',
          ),
          DogTip(
            title: 'Exercise daily.',
            content:
                'Dogs who exercise daily are happy dogs. Whether your routine is a walk, a run, or some quality time in the back yard playing fetch or another game, you’ll both benefit from the time together and from physical activity.',
          ),
          DogTip(
            title: 'Vaccinations.',
            content:
                'Keep your dog up-to-date on his vaccinations and boosters. Speak with your veterinarian about vaccinations like Leptospirosis which is not a core vaccine, but recommended in some geographical areas. Just like monthly preventatives, keeping your dog up-to-date on his vaccinations will help prevent diseases and the spread of disease.',
          ),
          DogTip(
            title: 'Socialize.',
            content:
                'Consider having your dog take the Canine Good Citizen test (CGC) where dogs are rewarded for having good manners at home and in the community. Monitor and encourage your dog to have friendly interaction/play with other dogs at a dog park or with friends who also have dogs.',
          ),
          DogTip(
            title: 'Maintain a healthy weight.',
            content:
                'Obesity is one of the top issues seen by veterinarians in their clinics. When left untreated, obesity can lead to many other health issues in your dog. Proper exercise and a well-balanced diet are keys to keeping your dog fit and trim.',
          ),
          DogTip(
            title: 'Brush those teeth.',
            content:
                'Often overlooked, dental and gum health is just as important for our dogs as it is for humans. Poor oral hygiene in dogs can lead to other health problems. Use a toothpaste specially designed for dogs and consider a professional cleaning if necessary.',
          ),
          DogTip(
            title: 'Pet-Proof your house.',
            content:
                'Become familiar with potential toxins inside and outside your home – plants, medications, cleaning supplies, foods, etc. Be aware of items your dog might like to chew on and potentially ingest. Dogs are curious, and just like toddlers, sometimes they get into things they aren’t supposed to. Set boundaries and make sure hazards are out of reach. Keep the numbers to the Pet Poison Hotline and an emergency veterinarian handy.',
          ),
          DogTip(
            title: 'Identification.',
            content:
                'Be sure your dog is microchipped or wears tags in case she is separated from you. Microchipping is the best way to ensure your dog can be identified and returned to you.',
          ),
          DogTip(
            title: 'Love.',
            content:
                'Dogs enjoy being a part of the family and love us unconditionally. Include your dog in as many activities as you can -- both around the house and on the road. Hug and play with your dog every day. It’s good for both of you!',
          ),
        ],
      ),
    );
  }
}

class DogTip extends StatelessWidget {
  final String title;
  final String content;

  const DogTip({
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
              color: Colors.green,
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

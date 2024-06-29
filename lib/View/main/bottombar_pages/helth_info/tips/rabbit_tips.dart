import 'package:flutter/material.dart';

class RabbitTips extends StatefulWidget {
  const RabbitTips({super.key});

  @override
  State<RabbitTips> createState() => _RabbitTipsState();
}

class _RabbitTipsState extends State<RabbitTips> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rabbit Care Tips'),
        backgroundColor: Colors.purple,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          RabbitTip(
            title: 'Annual vet check-up',
            content:
                'Rabbits are experts at hiding pain and discomfort, so it’s not uncommon for a bunny owner to realize there’s a problem when it’s too late to fix. One way around this is to arrange annual healthcare checks so that any potential problems are diagnosed earlier. During their annual vet visit, your bunny’s weight will be checked, their teeth evaluated, and any health tests necessary can be run. Prevention is always better than cure when it comes to bunny health care. If treatment is administered early, they’re more likely to remain healthy.',
          ),
          RabbitTip(
            title: 'Maintain a healthy weight',
            content:
                'Any sudden decrease in weight is likely to indicate a health issue and you should visit a vet. On the other hand, an overweight rabbit is at much higher risk of developing health issues like cardiovascular problems such as heart disease. Obesity can also result in the development of arthritis and other joint issues. This combination of issues will mean they cannot groom themselves resulting in matted fur which is unhygienic and causes discomfort. To help prevent these health issues, it’s important to monitor your rabbit’s weight and seek veterinary advice if they’re overweight or underweight.',
          ),
          RabbitTip(
            title: 'Grooming routine',
            content:
                'A rabbit’s coat should be thick and shiny. If they have dandruff, which can mean your rabbit has mites or fleas, your vet can advise a safe treatment. Important: Never use a cat flea collar on your rabbits, as this can be fatal with the incorrect treatment dosage. To keep your rabbit’s coat nice and healthy, groom them regularly with a soft brush- particularly if you have a long-haired rabbit. When rabbits are moulting, a few times a year, they’re likely to require additional brushing. Claw maintenance is an important part of your rabbit’s grooming routine as their nails are likely to need clipping regularly (about once every six to eight weeks). Your vet can show you how to do this properly, as it is easy to do it incorrectly and cut through the sensitive tissue in the claw, causing bleeding and a lot of pain. Paving stones, or similar, placed where your rabbits will regularly travel over can help reduce trim their nails naturally.',
          ),
          RabbitTip(
            title: 'Appropriate housing',
            content:
                'Rabbits are very active animals and so they need lots of space to stretch, hop, reach up and run. When picking a hutch or living area for your rabbits, it’s very important to make sure they have plenty of room. As a general rule, they need access to an area of space that is at least 3m x 2m x 1m, at all times.',
          ),
          RabbitTip(
            title: 'Keep the hutch clean',
            content:
                'Keeping your bunny’s cage clean is vital to their long-term health. Not only is the odour of a dirty cage harmful to the sensitive bunny noses, but the unsanitary conditions can also lead to many health problems. We recommend that you spot clean your rabbit’s enclosure daily to remove faeces, urine or unwanted food, and thoroughly clean the enclosure each week. A ‘full clean’ involves removing and disposing of all substrate and lining, clean the walls, doors and flooring with an animal friendly detergent - plus wash all bowls and water facilities before replacing them with fresh supplies. A reminder that water bowls and bottles should be cleaned in warm water daily then refilled to prevent algae build-up.',
          ),
          RabbitTip(
            title: 'Provide companionship',
            content:
                'Rabbits are social animals and live together in large groups in the wild for warmth, comfort, protection and companionship. The company of other rabbits helps reduce their anxiety and stress, keeping them happier and healthier. If rabbits are alone, they can feel socially isolated and become bored, frustrated, destructive, and anxious. We recommend keeping rabbits in a bonded pair, ideally a neutered male and neutered female, or small group. Rabbits should never be kept together with other species of animal, such as guinea pigs. Not only do they have very different needs, they also can’t communicate with each other or provide the social support they need.',
          ),
        ],
      ),
    );
  }
}

class RabbitTip extends StatelessWidget {
  final String title;
  final String content;

  const RabbitTip({
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
              color: Colors.purple,
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

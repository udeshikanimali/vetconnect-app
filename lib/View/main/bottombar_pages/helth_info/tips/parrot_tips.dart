import 'package:flutter/material.dart';

class ParrotTips extends StatefulWidget {
  const ParrotTips({super.key});

  @override
  State<ParrotTips> createState() => _ParrotTipsState();
}

class _ParrotTipsState extends State<ParrotTips> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parrot Care Tips'),
        backgroundColor: Colors.orange,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          ParrotTip(
            title: 'Parrot Housing',
            content:
                'Parrots live exciting and active lives in the wild, so replicating an enriching environment in the home is a must to keep your parrot happy and healthy. If kept outside, supervision is a must and birds need to be brought in or kept in a safe, sealed enclosure at night that has no access for predators; the recommendation is to always bring birds inside though for safety and ability to control the environment they’re in. Time spent out of your birds enclosure or dedicated bird-safe room if not caged should be supervised, as parrots are great at getting into trouble around the house! They should have time spent out of the cage at a minimum of once a day for exercise, enrichment, and socialization.',
          ),
          ParrotTip(
            title: 'Choosing a Parrot Cage',
            content:
                'The size of your parrot cage is the first thing to research, as a small budgerigar will require a much smaller cage than a Hyacinth Macaw! When choosing a cage, you should ensure that your bird will be able to stretch out both wings fully without touching either side of the cage, as well as not having the tail touch the bottom of the cage. Birds should also be able to fly from one to another. This will help ensure that your bird will have adequate space for safety and mental health purposes. Another consideration is the material that the cage is made out of. Birds should not be kept in decorative cages that were not designed to be safe for birds, as these cages are often not able to withstand the powerful bite of a parrot beak or are made with materials that are toxic to birds. Cages to avoid include cages with a removable coating over the bars due to likelihood of ingestion by your parrots, as well as avoiding cages made of lead and zinc, or cages with very small, thin wires with small gaps in between to prevent injury.',
          ),
          ParrotTip(
            title: 'Parrot Cage Set up & Maintenance',
            content:
                'Cleaning Maintenance: In the wild, birds are able to make a mess with their food, eat, defecate and then fly far away from it. Parrots are very sensitive to waste products, molds, and anything that can cause airway irritation. Dumping food and water daily and washing bowls before replacing food is a key part in preventing mold exposure to your parrot. Putting in smaller amounts of food at a time based on how much your bird eats a day is a great way to minimize waste while keeping the cage as clean as possible. Water dishes should be changed as often as necessary to ensure your bird’s water bowl is always full with clean water.',
          ),
          ParrotTip(
            title: 'Parrot Enrichment and Exotic Bird Toys',
            content:
                'A variety of perches should be made available in at least 3 different sizes and varying materials as well. Allowing a bird to have options helps them to not only have preferences and be exposed to variations in their daily life, but also encourage birds to exercise and orient themselves differently based on which perch they are on. Some birds may also prefer certain perches for different activities; they may like chewing on one perch, grooming their beak on another, but are most comfortable just spending time on a different material perch. Toys help keep a bird busy, help with mental health and enrichment, and keep a bird entertained and happy. Toys should be made of only natural materials such as bird-safe paper, untreated wood, and raffia. Toys made of metal, rubber, or plastic should be avoided as they are easily destroyed and potentially ingested, and these materials often can expose a bird to lead or zinc toxicity from the materials of the toy. These toxicities often make a bird very sick, and can sometimes be fatal.',
          ),
          ParrotTip(
            title: 'Cage Placement',
            content:
                'When choosing where to place a cage in your home, a few places should be avoided. Keeping cages away from the kitchen is important, especially for individuals who cook often. The kitchen is full of dangers for birds; parrots love to explore what their owners are doing, and can get caught on hot stoves, fall into pots of water, try to use utensils as toys, or inhale fumes toxic to birds such as those emitted from non-stick/Teflon pots or pants. Teflon toxicity can very quickly become fatal in birds, and smoke from heavy cooking can also lead to respiratory tract issues. Avoiding being directly next to a window is also important to ensure that your bird is not trapped in hot sun rays or caught in a drafty area. Cages should not be kept in laundry rooms or in areas that are likely to have molds or heavy aerosol or perfume usage.',
          ),
          ParrotTip(
            title: 'Parrot Temperature and Humidity',
            content:
                'Parakeets were first introduced as pets into the United States in the 1940s, but as more was learned about larger parrots, they increased in popularity as house pets as well. Parrots are widespread throughout the world and can be found on every continent with the exception of Antarctica. Knowing that they are found in areas of ambient to warm temperatures means that cage placement also plays a role in your parrot’s daily life and considerations when adding one to your family. Keeping parrots in areas of the home that are not affected by rapid, drastic temperature fluctuations are important, and keeping temperatures in their area ambient or warmer based on where your parrot species is native too, but a good start if unsure is keeping your parrot’s area above 70 degrees Fahrenheit. Remember that using a space heater in your birds area can be a toxicity risk to your parrot if you do not purchase a bird-safe heater; some materials used in heaters are toxic to birds such as Teflon. While temperature is one consideration, humidity is also important to maintain for parrot owners. Parrots are able to freely bathe in the wild, are often in the rain, and many species come from humid tropical climates. Adequate humidity plays a role in skin and feather health and appearance, and also affect a birds respiratory tract so opportunities to periodically bathe are important in a bird’s routine. Misting birds with just water, offering a bowl or sink with just water for a bath, and bringing your bird in the bathroom while you shower so they can enjoy the warm water steam are all great ways to make sure your bird has adequate humidity and some enrichment too! If you notice feather abnormalities such as feather dropping, the presence of stress bars, or feather picking and plucking, a visit to an avian specialty vet is warranted as soon as possible. These changes can have many different causes and an avian pet vet can help.',
          ),
        ],
      ),
    );
  }
}

class ParrotTip extends StatelessWidget {
  final String title;
  final String content;

  const ParrotTip({
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
              color: Colors.orange,
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

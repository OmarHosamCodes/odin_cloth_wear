import '/library.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> chipLabels = <String>[
      'Shirts',
      'Pants',
      'Shoes',
      'Hats',
      'Accessories',
    ];
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text('My App'),
              background: Placeholder(
                fallbackHeight: 200,
                color: Colors.blue,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(48),
              child: Wrap(
                children: chipLabels
                    .map(
                      (String label) => Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Chip(
                          label: Text(label),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),

          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: width * .15),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.75,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    color: Colors.blue,
                    child: Center(
                      child: Text('Item $index'),
                    ),
                  );
                },
                childCount: 10,
              ),
            ),
          ),
          //add screen wide block that containes contact info
          SliverToBoxAdapter(
            child: Container(
              height: 200,
              color: Colors.red,
              child: const Center(
                child: Text('Contact Info'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

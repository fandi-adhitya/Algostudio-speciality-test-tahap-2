part of 'screen.dart';


class MemesScreen extends StatefulWidget {
  const MemesScreen({Key? key}) : super(key: key);

  @override
  State<MemesScreen> createState() => _MemesScreenState();
}

class _MemesScreenState extends State<MemesScreen> {
  late Memes _memesList;
  late Future<void> _initMemesData;

  @override
  void initState() {
    super.initState();
    _initMemesData =_initMemes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("MimGenerator", style: TextStyle(color: Colors.blueGrey)),
      ),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: FutureBuilder(
            future: _initMemesData,
            builder: (_, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                case ConnectionState.active:
                  {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                default:
                  {
                    if( snapshot.hasError ) {
                      return Center(
                        child: Text('Something wrong!'),
                      );
                    } else {
                      return RefreshIndicator(
                          onRefresh: _onRefreshMemes,
                          child: GridView.builder(
                              shrinkWrap: true,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                  childAspectRatio: 1,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 8
                            ),
                            itemCount: _memesList.data?.memes?.length,
                            itemBuilder: (_, index) {
                              return MemesCard(
                                  memes: _memesList.data!.memes[index],
                                  onTap:() {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MemesDetailScreen(memesData: _memesList.data!.memes[index])
                                        )
                                    );
                              });
                            }
                            ),
                      );
                    }
                  }
              }
            }
        ),
      ),
    );
  }

  Future<void> _initMemes() async {
    final result = await MemesService().findAll();
    _memesList = result;
  }

  Future<void> _onRefreshMemes() async {
    final result = await MemesService().findAll();

    setState(() {
      _memesList = result;
    });
  }

}

part of 'screen.dart';

class MemesDetailShareScreen extends StatefulWidget {
  final String generateFileText;

  const MemesDetailShareScreen({
    required this.generateFileText
  });

  @override
  State<MemesDetailShareScreen> createState() => _MemesDetailShareScreenState();
}

class _MemesDetailShareScreenState extends State<MemesDetailShareScreen> {
  late final tempDir;

  @override
  void initState() {
    super.initState();
  }

  void shareFile() async {
    final path = widget.generateFileText.split('/').last;
    await Share.shareFiles([widget.generateFileText]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("MimGenerator", style: TextStyle(color: Colors.blueGrey)),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.blueGrey,),
        ),
      ),
      body: WillPopScope(
        onWillPop: () {
          Navigator.pop(context);
          return Future<bool>.value(false);
        },
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 40.0, horizontal: 10.0),
            child: Column(
              children: [
                Image(
                  image: Image.file(File(widget.generateFileText)).image,
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    child:Text('Share to Facebook', style: TextStyle(fontWeight: FontWeight.bold)),
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor: MaterialStateProperty.all(Colors.blueGrey)
                    ),
                    onPressed: (){
                      shareFile();
                    },
                  ),
                ),
                SizedBox(height: 5),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    child:Text('Share to Twitter', style: TextStyle(fontWeight: FontWeight.bold)),
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor: MaterialStateProperty.all(Colors.blueGrey)
                    ),
                    onPressed: () async {
                      shareFile();
                    },
                  ),
                ),
              ],
            )
          ),
        ),
      )
    );
  }
}

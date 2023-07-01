import 'dart:io';

import 'package:customar_app/util/index_path.dart';

class PreviewPage extends StatefulWidget {
  final List<XFile>  picture;

  const PreviewPage({Key? key, required this.picture}) : super(key: key);

  @override
  State<PreviewPage> createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {

  var controller= Get.put(CamerasController());

  Future deleteImage(int index) async {

    try {
      controller.photo.removeAt(index);
    }
    catch(e){
      print(e.toString());
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          child: IconButton(
            icon: SvgPicture.asset(
              AppIcons.CAMERA,
              color: kWhiteColor,
            ),
            onPressed: controller.takePicture,
          ),
        ),
        appBar: AppBar(title: const Text('Preview Page')),
        body:Obx(()=>GridView.builder(
          itemCount: controller.photo.length,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 100,
            mainAxisExtent: 100,
          ),
          itemBuilder: (BuildContext context, int index){
            return Stack(children: [
              Image.file(File(controller.photo[index].path),),
              Positioned(
                  top: 10,
                  right: 10,
                  child: InkWell(
                    onTap: () => deleteImage(index),
                    child: ClipOval(
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        color: Colors.black.withOpacity(0.4),
                        child: const Icon(
                          Icons.delete_outline,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  )),
            ]);
          },
        ),)
    );
  }
}
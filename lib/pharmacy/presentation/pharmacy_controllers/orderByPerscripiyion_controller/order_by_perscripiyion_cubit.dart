import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'order_by_perscripiyion_state.dart';



class OrderByPerscripiyionCubit extends Cubit<OrderByPerscripiyionStates>
{
  OrderByPerscripiyionCubit(): super(OrderByPerscripiyionInitialState());

  static  OrderByPerscripiyionCubit get(context) => BlocProvider.of(context);

  String? imagePath;

  void pickMedia () async {

    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(file != null){
      imagePath =file.path;
      print('edwfgewqwfffwe${imagePath.toString()}');
      emit(PickImageSuccessState());
    }

  }
  void pickMediaCamera () async {

    XFile? file = await ImagePicker().pickImage(source: ImageSource.camera);
    if(file != null){
      imagePath =file.path;
      print('edwfgewqwfffwe${imagePath.toString()}');
      emit(PickImageSuccessState());
    }

  }


}
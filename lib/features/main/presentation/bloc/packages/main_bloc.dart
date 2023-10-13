import 'package:binance_api/core/error/failures.dart';
import 'package:binance_api/features/main/domain/enities/exchange_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:binance_api/core/usecases/usecase.dart';
import 'package:binance_api/features/main/domain/usecases/get_main_info.dart';
part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  GetMainInfo getMainInfo;

  MainBloc(this.getMainInfo) : super(MainInitialState()) {
    on<GetMainEvent>(_getMain);
  }

  List<ExchangeEntity> exchanges = [];


  void _getMain(GetMainEvent event, Emitter<MainState> emit) async {

    emit(MainLoadingState());
    //Got items
    final gotMain = await getMainInfo.call(NoParams());
    //Check on error
    MainState state = gotMain.fold(
      (error) => errorCheck(error),
      (data) {
        exchanges = data;
        return GotSuccessMainState();
      },
    );
    emit(state);
  }

  MainState errorCheck(Failure failure){
    print('FAIL: $failure');
    if(failure == ConnectionFailure() || failure == NetworkFailure()){
      return MainInternetErrorState();
    }else if(failure is ServerFailure){
      return MainErrorState(message: failure.message.length < 100 ? failure.message : 'Ошибка сервера');
    }else{
      return MainErrorState(message: 'Повторите попытку');
    }
  }
} 

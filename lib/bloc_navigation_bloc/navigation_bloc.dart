
import 'package:bloc/bloc.dart';
import '../thrown_pages/platoon_one_thrown_page.dart';
import '../thrown_pages/camp_corpers_coordinators_thrown_page.dart';
import '../thrown_pages/camp_officials_thrown_page.dart';

enum NavigationEvents {
  MyPlatoonOnePageClickedEvent,
  MyCampCorpersCoordinatorPageClickedEvent,
  MyCampOfficialsPageClickedEvent,
}


abstract class NavigationStates {}


class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {

  NavigationBloc() : super(MyPlatoonOnePage());

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents events) async* {
    switch (events) {
      case NavigationEvents.MyPlatoonOnePageClickedEvent:
        yield MyPlatoonOnePage();
        break;
      case NavigationEvents.MyCampCorpersCoordinatorPageClickedEvent:
        yield MyCampCorpersCoordinatorsPage();
        break;
      case NavigationEvents.MyCampOfficialsPageClickedEvent:
        yield MyCampOfficialsPage();
        break;

    }
  }

}

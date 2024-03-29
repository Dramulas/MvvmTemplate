import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../product/common/_product/_widgets/tours_home_view.dart';
import '../../../product/common/settings/model/settings_dynamic_model.dart';
import '../../../product/common/settings/view/settings_view.dart';
import '../../../product/common/settings/view/subview/settings_dynamic_view.dart';
import '../../../product/exception/navigate_model_not_found.dart';
import '../../../view/authenticate/login/view/login_via_azure_view.dart';
import '../../../view/authenticate/onboard/view/on_board_view.dart';
import '../../../view/esd_app/confirmation_inbox/view/confirmation_inbox_view.dart';
import '../../../view/esd_app/confirmation_inbox/view/subview/confirmation_detail_view.dart';
import '../../../view/esd_app/home/view/home_view.dart';
import '../../../view/moc_app/view/moc_closing_moc_form_view.dart';
import '../../../view/moc_app/view/moc_form_view.dart';
import '../../../view/moc_app/view/moc_technical_opinion_view.dart';
import '../../../view/moc_app/view/subview/moc_closing_moc_form_detail_view.dart';
import '../../../view/moc_app/view/subview/moc_form_detail_view.dart';
import '../../../view/moc_app/view/subview/moc_technical_opinion_detail_view.dart';
import '../../../view/safety_tour_app/planned_tours/edit_planned_tour/view/edit_planned_tour_view.dart';
import '../../../view/safety_tour_app/planned_tours/planned_tour_detail/view/planned_tour_detail_view.dart';
import '../../../view/safety_tour_app/planned_tours/planned_tour_detail/view/subview/add_planned_tour_finding_view.dart';
import '../../../view/safety_tour_app/planned_tours/planned_tour_detail/view/subview/planned_tour_finding_detail.dart';
import '../../../view/safety_tour_app/planned_tours/planned_tours_list/view/planned_tour_list_view.dart';
import '../../../view/safety_tour_app/unplanned_tours/subview/add_unplanned_tour/view/add_unplanned_tour_view.dart';
import '../../../view/safety_tour_app/unplanned_tours/subview/edit_unplanned_tour/view/edit_unplanned_tour_view.dart';
import '../../../view/safety_tour_app/unplanned_tours/subview/unplanned_tour_detail/subview/add_unplanned_tour_finding/add_unplanned_tour_finding_view.dart';
import '../../../view/safety_tour_app/unplanned_tours/subview/unplanned_tour_detail/subview/unplanned_tour_finding_detail/unplanned_tour_finding_detail_view.dart';
import '../../../view/safety_tour_app/unplanned_tours/subview/unplanned_tour_detail/view/unplanned_tour_detail_view.dart';
import '../../../view/safety_tour_app/unplanned_tours/view/unplanned_tour_list_view.dart';
import '../../components/card/not_found_navigation_widget.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.HOME_VIEW:
        return normalNavigate(HomeView());

      case NavigationConstants.TOURS_HOME_VIEW:
        return navigateWithData(ToursHomeView(), args.arguments);

      case NavigationConstants.ONBOARD:
        return normalNavigate(OnBoardView());

      case NavigationConstants.LOGIN_VIA_AZURE_VIEW:
        return normalNavigate(LoginViaAzureView());

      case NavigationConstants.SETTINGS_VIEW:
        return normalNavigate(SettingsView());

      case NavigationConstants.ADD_PLANNED_TOUR_FINDING:
        return navigateWithData(AddPlannedTourFindingView(), args.arguments);

      case NavigationConstants.PLANNED_TOUR_LIST_VIEW:
        return normalNavigate(PlannedTourListView());

      case NavigationConstants.PLANNED_TOUR_DETAIL_VIEW:
        return navigateWithData(PlannedTourDetailView(), args.arguments);

      case NavigationConstants.UNPLANNED_TOUR_LIST_VIEW:
        return normalNavigate(UnPlannedTourListView());

      case NavigationConstants.ADD_UNPLANNED_TOUR_VIEW:
        return normalNavigate(AddUnPlannedTourView());

      case NavigationConstants.CONFIRMATION_INBOX_VIEW:
        return normalNavigate(ConfirmationInboxView());

      case NavigationConstants.CONFIRMATION_DETAIL_VIEW:
        return navigateWithData(ConfirmationDetailView(), args.arguments);

      case NavigationConstants.EDIT_PLANNED_TOUR_VIEW:
        return navigateWithData(EditPlannedTourView(), args.arguments);

      case NavigationConstants.EDIT_UNPLANNED_TOUR_VIEW:
        return navigateWithData(EditUnPlannedTourView(), args.arguments);

      case NavigationConstants.ADD_UNPLANNED_TOUR_FINDING:
        return navigateWithData(AddUnPlannedTourFindingView(), args.arguments);

      case NavigationConstants.UNPLANNED_TOUR_DETAIL_VIEW:
        return navigateWithData(UnPlannedTourDetailView(), args.arguments);

      case NavigationConstants.UNPLANNED_TOUR_FINDING_DETAIL_VIEW:
        return navigateWithData(
            UnplannedTourFindingDetailView(), args.arguments);

      case NavigationConstants.PLANNED_TOUR_FINDING_DETAIL_VIEW:
        return navigateWithData(PlannedTourFindingDetailView(), args.arguments);

      case NavigationConstants.MOC_FORM_VIEW:
        return normalNavigate(MocFormView());

      case NavigationConstants.MOC_FORM_DETAIL_VIEW:
        return navigateWithData(MocFormDetailView(), args.arguments);

      case NavigationConstants.TECH_OPINION_VIEW:
        return normalNavigate(TechnicalOpinionView());

      case NavigationConstants.TECH_OPINION_DETAIL_VIEW:
        return navigateWithData(TechnicalOpinionDetailView(), args.arguments);

      case NavigationConstants.CLOSING_MOC_FORM_VIEW:
        return normalNavigate(ClosingMocFormView());

      case NavigationConstants.CLOSING_MOC_FORM_DETAIL_VIEW:
        return navigateWithData(ClosingMocFormDetailView(), args.arguments);

      case NavigationConstants.SETTINGS_WEB_VIEW:
        final model = args.arguments as SettingsDynamicModel;

        // case NavigationConstants.CHANGE_PASSWORD_VIEW:
        //   return normalNavigate(ChangePasswordView());

        // case NavigationConstants.PROFILE_VIEW:
        //   return normalNavigate(ProfileView());

        if (args.arguments is SettingsDynamicModel) {
          return normalNavigate(SettingsDynamicView(model: model));
        }
        throw NavigateException<SettingsDynamicModel>(args.arguments);

      case NavigationConstants.SETTINGS_WEB_PROJECT_VIEW:
        final model = args.arguments as SettingsDynamicModel;

        if (args.arguments is SettingsDynamicModel) {
          return normalNavigate(SettingsDynamicView(model: model));
        }
        throw NavigateException<SettingsDynamicModel>(args.arguments);

      default:
        return MaterialPageRoute(
          builder: (context) => NotFoundNavigationWidget(),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }

  MaterialPageRoute navigateWithData(Widget widget, dynamic data) {
    return MaterialPageRoute(
        builder: (context) => widget, settings: RouteSettings(arguments: data));
  }
}

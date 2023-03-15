import 'package:accswift/services/api_service.dart';
import 'package:accswift/services/authentication_service.dart';
import 'package:accswift/services/implementations/api_service_impl.dart';
import 'package:accswift/services/implementations/authentication_service_impl.dart';
import 'package:accswift/services/implementations/invoice_service_impl.dart';
import 'package:accswift/services/implementations/navigator_service_impl.dart';
import 'package:accswift/services/implementations/purchase_service_impl.dart';
import 'package:accswift/services/implementations/sales_service_impl.dart';
import 'package:accswift/services/implementations/shared_preference_service_impl.dart';
import 'package:accswift/services/implementations/stats_service_impl.dart';
import 'package:accswift/services/implementations/user_service_impl.dart';
import 'package:accswift/services/invoice_service.dart';
import 'package:accswift/services/navigator_service.dart';
import 'package:accswift/services/purchase_service.dart';
import 'package:accswift/services/sales_service.dart';
import 'package:accswift/services/shared_preference_service.dart';
import 'package:accswift/services/stats_service.dart';
import 'package:accswift/services/user_service.dart';
import 'package:accswift/views/dashboard/dashboard_viewmodel.dart';
import 'package:accswift/views/dashboard/fragments/invoice/invoice_viewmodel.dart';
import 'package:accswift/views/dashboard/fragments/invoice/more/more_viewmodel.dart';
import 'package:accswift/views/dashboard/fragments/stats/stats_viewmodel.dart';
import 'package:accswift/views/dashboard/fragments/transactions/reports/ledger/ledger_view.dart';
import 'package:accswift/views/dashboard/fragments/transactions/transactions_viewmodel.dart';
import 'package:accswift/views/journal/journal_viewmodel.dart';
import 'package:accswift/views/login/login_viewmodel.dart';
import 'package:accswift/views/purchase/purchase_viewmodel.dart';
import 'package:accswift/views/reset_password/reset_password_viewmodel.dart';
import 'package:accswift/views/sales/sales_viewmodel.dart';
import 'package:accswift/views/start_up/start_up_viewmodel.dart';
import 'package:accswift/views/write_invoice/write_invoice_viewmodel.dart';
import 'package:get_it/get_it.dart';
import 'package:accswift/views/dashboard/fragments/transactions/reports/ledger/ledger_view_model.dart';
import 'package:accswift/services/ledger_service.dart';
import 'package:accswift/services/implementations/ledger_service_impl.dart';
import 'package:accswift/services/journal_service.dart';
import 'package:accswift/services/implementations/journal_service_impl.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  // Services
  locator.registerLazySingleton<NavigatorService>(() => NavigatorServiceImpl());
  locator.registerLazySingleton<StatsService>(() => StatsServiceImpl());
  locator.registerLazySingleton<ApiService>(() => ApiServiceImplementation());
  locator.registerLazySingleton<AuthenticationService>(
      () => AuthenticationServiceImpl());
  locator.registerLazySingleton<UserService>(() => UserServiceImpl());
  locator.registerLazySingleton<SharedPreferenceService>(
      () => SharedPreferenceServiceImpl());
  locator
      .registerLazySingleton<SalesService>(() => SalesServiceImplementation());
  locator.registerLazySingleton<InvoiceService>(() => InvoiceServiceImpl());
  locator.registerLazySingleton<PurchaseService>(() => PurchaseServiceImpl());
  locator.registerLazySingleton<LedgerService>(
      () => LedgerServiceImplementation());
  locator.registerLazySingleton<JournalService>(
      () => JournalServiceImplementation());

  // Killable Viewmodels
  locator.registerFactory(() => StartUpViewModel());
  locator.registerFactory(() => LoginViewModel());
  locator.registerFactory(() => ResetPasswordViewModel());
  locator.registerFactory(() => DashboardViewModel());
  locator.registerFactory(() => WriteInvoiceViewModel());
  locator.registerFactory(() => LedgerViewModel());

  // Unkillable Viewmodels
  locator.registerLazySingleton(() => StatsViewModel());
  locator.registerLazySingleton(() => TransactionViewModel());
  locator.registerLazySingleton(() => InvoiceViewModel());
  locator.registerLazySingleton(() => MoreViewModel());
  locator.registerLazySingleton(() => SalesViewModel());
  locator.registerLazySingleton(() => PurchaseViewModel());
  locator.registerLazySingleton(() => JournalViewModel());
}

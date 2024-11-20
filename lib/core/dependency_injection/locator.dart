import 'package:get_it/get_it.dart';
import 'package:olgoo_mobile/features/data/auth/impl/auth_impl_repository.dart';
import 'package:olgoo_mobile/features/data/management/impl/company.impl.dart';
import 'package:olgoo_mobile/features/data/management/src/company.api.dart';
import 'package:olgoo_mobile/features/domain/profile/repository/compay.repository.dart';
import 'package:olgoo_mobile/features/domain/profile/usecase/company.usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/data/auth/src/remote/auth.api.dart';
import '../../features/domain/auth/repository/auth.repository.dart';
import '../../features/domain/auth/usecase/auth.usecase.dart';

GetIt locator = GetIt.instance ;

locatorSetup()async{

  //!local storage--------------------------------------------------------------
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  locator.registerSingleton<SharedPreferences>(sharedPreferences);
  locator.registerSingleton<AuthApiProvider>(AuthApiProvider());  
  locator.registerSingleton<CompanyApiProvider>(CompanyApiProvider());
  //! repositoreis--------------------------------------------------------------
    locator.registerSingleton<AuthRepository>(
      AuthIMPLRepository(apiProvider: locator()));    
    locator.registerSingleton<CompanyRepository>(
      CompanyImplementRepository(locator())); 
  //!usecase--------------------------------------------------------------------
    locator
      .registerSingleton<AuthUseCases>(AuthUseCases(locator()));      
    locator
      .registerSingleton<CompanyUseCases>(CompanyUseCases(locator()));  

      
}

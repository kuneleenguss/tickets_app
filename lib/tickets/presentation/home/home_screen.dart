import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tickets_app/common/colors.dart';
import 'package:tickets_app/common/typography.dart';
import 'package:tickets_app/common/widgets/input_field.dart';
import 'package:tickets_app/tickets/domain/usecase/usecase.dart';
import 'package:tickets_app/tickets/presentation/home/cubit/home_cubit.dart';
import 'package:tickets_app/tickets/presentation/search/cubit/search_cubit.dart';
import 'modal/modal_screen.dart';

part 'home_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: BasicColors.black,
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 28),
              child: _HomeLabel(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 36, left: 16, right: 16),
              child: MultiBlocProvider(
                providers: [
                  BlocProvider<SearchCubit>(
                    lazy: false,
                    create: (context) => SearchCubit(
                        useCase: context.read<LoadTicketOffersUseCase>()),
                  ),
                  BlocProvider(
                    create: (context) => SubjectBloc(),
                  ),
                ],
                child: _HomeInput(),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 32, left: 16),
              child: _HomeOfferListLabel(),
            ),
            BlocProvider(
              lazy: false,
              create: (context) =>
                  HomeCubit(useCase: context.read<LoadOffersUseCase>()),
              child: Padding(
                padding: EdgeInsets.only(left: 12, top: 25),
                child: _HomeOfferList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

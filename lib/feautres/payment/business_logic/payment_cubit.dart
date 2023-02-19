import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());
  static PaymentCubit get(context) => BlocProvider.of(context);
  Future<void> startPayment(Map<String, dynamic> paymentData) async{
    //use  Pay.startGooglePayPayment to start payment
    void onGooglePayResult(paymentResult) {}
  }

}

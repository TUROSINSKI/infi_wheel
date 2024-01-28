import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:infi_wheel/core/utils/colors.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8)),
                        gradient: LinearGradient(
                            colors: [AppColors.kPlatinum, AppColors.kOrangeWeb],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight)),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 40.0.h, left: 20.0.w),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: FloatingActionButton(
                              onPressed: () {
                                GoRouter.of(context).go('/');
                              },
                              elevation: 2.0,
                              shape: const CircleBorder(),
                              child: const Icon(
                                Icons.arrow_back,
                                color: AppColors.kOxfordBlue,
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.0),
                          child: Text('Terms and Conditions',
                              style: TextStyle(
                                  fontSize: 32, fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: AppColors.kPlatinum, width: 2.0))),
                    child: RichText(
                        text: const TextSpan(children: [
                      TextSpan(
                          text: '1. Introduction\n',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.kOxfordBlue)),
                      TextSpan(
                          text:
                              'Welcome to InfiWheel! These Terms and Conditions govern your use of the InfiWheel P2P car-sharing service and application.',
                          style:
                              TextStyle(fontSize: 16, color: AppColors.kOxfordBlue))
                    ])),
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: AppColors.kPlatinum, width: 2.0))),
                    child: RichText(
                        text: const TextSpan(children: [
                      TextSpan(
                          text: '2. Acceptance of Terms\n',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.kOxfordBlue)),
                      TextSpan(
                          text:
                              'By using InfiWheel, you agree to be bound by these Terms and Conditions and our Privacy Policy.',
                          style:
                              TextStyle(fontSize: 16, color: AppColors.kOxfordBlue))
                    ])),
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: AppColors.kPlatinum, width: 2.0))),
                    child: RichText(
                        text: const TextSpan(children: [
                      TextSpan(
                          text: '3. Service Description\n',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.kOxfordBlue)),
                      TextSpan(
                          text:
                              'InfiWheel is a peer-to-peer car-sharing platform that allows registered users to rent vehicles from other registered users.',
                          style:
                              TextStyle(fontSize: 16, color: AppColors.kOxfordBlue))
                    ])),
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: AppColors.kPlatinum, width: 2.0))),
                    child: RichText(
                        text: const TextSpan(children: [
                      TextSpan(
                          text: '4. User Obligations\n',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.kOxfordBlue)),
                      TextSpan(
                          text:
                              'Age and Driving License: You must be at least 21 years old and possess a valid driving license.\nAccount Registration: You must provide accurate and complete information during account registration.\nVehicle Usage: Vehicles must be used in accordance with all traffic laws and cannot be used for illegal purposes.',
                          style:
                              TextStyle(fontSize: 16, color: AppColors.kOxfordBlue))
                    ])),
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: AppColors.kPlatinum, width: 2.0))),
                    child: RichText(
                        text: const TextSpan(children: [
                      TextSpan(
                          text: '5. Vehicle Listing Requirements\n',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.kOxfordBlue)),
                      TextSpan(
                          text:
                              'Ownership: You must legally own or have the right to rent out the vehicle you list.\nVehicle Condition: The vehicle must be in safe, drivable condition and meet all legal requirements for operation.',
                          style:
                              TextStyle(fontSize: 16, color: AppColors.kOxfordBlue))
                    ])),
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: AppColors.kPlatinum, width: 2.0))),
                    child: RichText(
                        text: const TextSpan(children: [
                      TextSpan(
                          text: '6. Rental Terms\n',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.kOxfordBlue)),
                      TextSpan(
                          text:
                              'Rental Agreement: Each vehicle rental is subject to a separate rental agreement between the owner and renter.Insurance: InfiWheel provides insurance coverage for each rental period, subject to the policy terms and conditions.',
                          style:
                              TextStyle(fontSize: 16, color: AppColors.kOxfordBlue))
                    ])),
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: AppColors.kPlatinum, width: 2.0))),
                    child: RichText(
                        text: const TextSpan(children: [
                      TextSpan(
                          text: '7. Fees and Payments\n',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.kOxfordBlue)),
                      TextSpan(
                          text:
                              'Rental Fees: Renters agree to pay rental fees as listed on the vehicles profile.Payment Processing: Payments are processed through a secure third-party payment system.',
                          style:
                              TextStyle(fontSize: 16, color: AppColors.kOxfordBlue))
                    ])),
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: AppColors.kPlatinum, width: 2.0))),
                    child: RichText(
                        text: const TextSpan(children: [
                      TextSpan(
                          text: '8. Cancellations and Refunds\n',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.kOxfordBlue)),
                      TextSpan(
                          text:
                              'Cancellation Policy: Cancellations are subject to the cancellation policy outlined in the rental agreement.Refunds: Refunds, if applicable, will be processed according to the terms of the rental agreement.',
                          style:
                              TextStyle(fontSize: 16, color: AppColors.kOxfordBlue))
                    ])),
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: AppColors.kPlatinum, width: 2.0))),
                    child: RichText(
                        text: const TextSpan(children: [
                      TextSpan(
                          text: '9. Limitation of Liability\n',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.kOxfordBlue)),
                      TextSpan(
                          text:
                              'InfiWheel is not responsible for any loss or damage arising from your use of the service, except as expressly provided in these terms.',
                          style:
                              TextStyle(fontSize: 16, color: AppColors.kOxfordBlue))
                    ])),
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: AppColors.kPlatinum, width: 2.0))),
                    child: RichText(
                        text: const TextSpan(children: [
                      TextSpan(
                          text: '10. Termination\n',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.kOxfordBlue)),
                      TextSpan(
                          text:
                              'InfiWheel reserves the right to terminate your account or restrict access to the service for breach of these terms.',
                          style:
                              TextStyle(fontSize: 16, color: AppColors.kOxfordBlue))
                    ])),
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: AppColors.kPlatinum, width: 2.0))),
                    child: RichText(
                        text: const TextSpan(children: [
                      TextSpan(
                          text: '11. Changes to Terms\n',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.kOxfordBlue)),
                      TextSpan(
                          text:
                              'InfiWheel may modify these Terms and Conditions at any time, with changes becoming effective upon posting to the website or app.',
                          style:
                              TextStyle(fontSize: 16, color: AppColors.kOxfordBlue))
                    ])),
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: AppColors.kPlatinum, width: 2.0))),
                    child: RichText(
                        text: const TextSpan(children: [
                      TextSpan(
                          text: '12. Governing Law\n',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.kOxfordBlue)),
                      TextSpan(
                          text:
                              'These terms shall be governed by the laws of the jurisdiction in which InfiWheel operates.',
                          style:
                              TextStyle(fontSize: 16, color: AppColors.kOxfordBlue))
                    ])),
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: AppColors.kPlatinum, width: 2.0))),
                    child: RichText(
                        text: const TextSpan(children: [
                      TextSpan(
                          text: '13. Contact Information\n',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.kOxfordBlue)),
                      TextSpan(
                          text:
                              'For any questions about these Terms and Conditions, please contact us at [email address].',
                          style:
                              TextStyle(fontSize: 16, color: AppColors.kOxfordBlue))
                    ])),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:app_transport/app/helpers/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            SizedBox(
              height: 65,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(
                        context,
                      );
                    },
                    icon: SvgPicture.asset(
                      'assets/arrow-left.svg',
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 80,
              width: double.infinity,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 32,
                          backgroundImage: NetworkImage(
                            'https://scontent-bog1-1.xx.fbcdn.net/v/t1.6435-9/171029405_2189985161138468_5120445848392931498_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=zwKRGI5df60AX88ZqH-&_nc_ht=scontent-bog1-1.xx&oh=00_AfAaPE2r243L6tpRoW0OcQ_mj7A9r_CUoMbBD7jzVP12Uw&oe=638D0023',
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Julian. Rodelo',
                              style: kPoppinsSemibold.copyWith(
                                color: kBlack,
                                fontSize: 24,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 24,
                              width: 66,
                              decoration: BoxDecoration(
                                color: const Color(0xFFeeeeee),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Icon(
                                    Icons.star,
                                    size: 16,
                                  ),
                                  Text(
                                    '4.75',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Expanded(
              child: SizedBox(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 16,
                          left: 20,
                          right: 20,
                        ),
                        child: Stack(
                          children: [
                            Container(
                              height: 72,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color(0xFFeeeeee),
                                borderRadius: BorderRadius.circular(
                                  20.0,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 24),
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.turned_in,
                                      size: 28,
                                    ),
                                    SizedBox(
                                      width: 24.0,
                                    ),
                                    Text(
                                      'Historial de viajes',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Positioned(
                              top: 26,
                              right: 30,
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 16,
                          left: 20,
                          right: 20,
                        ),
                        child: Stack(
                          children: [
                            Container(
                              height: 72,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color(0xFFeeeeee),
                                borderRadius: BorderRadius.circular(
                                  20.0,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 24),
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.wallet,
                                      size: 28,
                                    ),
                                    SizedBox(
                                      width: 24.0,
                                    ),
                                    Text(
                                      'Forma de pago',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Positioned(
                              top: 26,
                              right: 30,
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 16,
                          left: 20,
                          right: 20,
                        ),
                        child: Stack(
                          children: [
                            Container(
                              height: 72,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color(0xFFeeeeee),
                                borderRadius: BorderRadius.circular(
                                  20.0,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 24),
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.mail,
                                      size: 28,
                                    ),
                                    SizedBox(
                                      width: 24.0,
                                    ),
                                    Text(
                                      'Mensajes',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Positioned(
                              top: 26,
                              right: 30,
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 16,
                          left: 20,
                          right: 20,
                        ),
                        child: Stack(
                          children: [
                            Container(
                              height: 72,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color(0xFFeeeeee),
                                borderRadius: BorderRadius.circular(
                                  20.0,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 24),
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.work,
                                      size: 28,
                                    ),
                                    SizedBox(
                                      width: 24.0,
                                    ),
                                    Text(
                                      'Trabaja con nosotros',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Positioned(
                              top: 26,
                              right: 30,
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 16,
                          left: 20,
                          right: 20,
                        ),
                        child: Stack(
                          children: [
                            Container(
                              height: 72,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color(0xFFeeeeee),
                                borderRadius: BorderRadius.circular(
                                  20.0,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 24),
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.support,
                                      size: 28,
                                    ),
                                    SizedBox(
                                      width: 24.0,
                                    ),
                                    Text(
                                      'Ayuda',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Positioned(
                              top: 26,
                              right: 30,
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 16,
                          left: 20,
                          right: 20,
                        ),
                        child: Stack(
                          children: [
                            Container(
                              height: 72,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color(0xFFeeeeee),
                                borderRadius: BorderRadius.circular(
                                  20.0,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 24),
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.settings_rounded,
                                      size: 28,
                                    ),
                                    SizedBox(
                                      width: 24.0,
                                    ),
                                    Text(
                                      'Configuraciones',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Positioned(
                              top: 26,
                              right: 30,
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 16,
                          left: 20,
                          right: 20,
                        ),
                        child: Stack(
                          children: [
                            Container(
                              height: 72,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color(0xFFeeeeee),
                                borderRadius: BorderRadius.circular(
                                  20.0,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 28),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/log-out.svg',
                                      color: Colors.black,
                                    ),
                                    const SizedBox(
                                      width: 24.0,
                                    ),
                                    const Text(
                                      'Cerrar sesión',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Positioned(
                              top: 26,
                              right: 30,
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

part of flutter.recipes.ui.view;

class StartView extends StatelessWidget {
  const StartView({Key? key}) : super(key: key);
  static const String route = '/';

  @override
  Widget build(BuildContext context) {
    return BlocListener<DashboardController, DashboardState>(
      listenWhen: (DashboardState previous, DashboardState current) =>
          previous.dashboardLoadStatus != current.dashboardLoadStatus,
      listener: (BuildContext listenerContext, DashboardState state) {
        if (state.dashboardLoadStatus != null) {
          if (state.dashboardLoadStatus == RequestStatus.done) {
            Navigator.of(listenerContext)
                .pushReplacementNamed(DashboardView.route);
          }
        }
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: <Widget>[
            Image.asset('assets/start_background.png'),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Colors.transparent,
                    Colors.black,
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 48,
              child: Column(
                children: <Widget>[
                  Text(
                    'Lets get\nCooking',
                    style: Bold.bold.copyWith(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Find the best recipes for cooking',
                    style: Regular.p.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 32,
                      ),
                    ),
                    onPressed: () => context
                        .read<DashboardController>()
                        .getDashboard(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Start cooking',
                          style: Bold.p.copyWith(color: Colors.white),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.arrow_right_alt),
                      ],
                    ),
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

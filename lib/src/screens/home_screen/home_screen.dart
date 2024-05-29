import 'package:flutter/material.dart';
import 'package:flutter_dio_request_cancel/src/screens/home_screen/state/provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProvider>(context, listen: false);
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Request Cancel'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Consumer<HomeProvider>(builder: (context, ref, child) {
              return Container(
                padding: const EdgeInsets.all(16),
                height: 200,
                width: mediaQuery.size.width,
                decoration: BoxDecoration(
                    color: theme.colorScheme.onSurface.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(24)),
                child: Center(
                  child: ref.loading
                      ? const CircularProgressIndicator()
                      : SingleChildScrollView(
                          child: Text(ref.data?.toString() ?? 'No Data')),
                ),
              );
            }),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
                onPressed: () {
                  if(provider.loading){
                    provider.cancelRequest();
                  }else{
                    provider.getData();
                  }
                },
                child: const Text('Make Request')),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
                onPressed: () {
                  provider.cancelRequest();
                }, child: const Text('Cancel Request')),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:management_states/library/blocs/states/list_states_bloc/list_states_bloc.dart';
import 'package:management_states/library/blocs/states/list_states_bloc/list_states_state.dart';

class ListStates extends StatefulWidget {
  const ListStates({super.key});

  @override
  State<ListStates> createState() => _ListStatesState();
}

class _ListStatesState extends State<ListStates> {
  late ListStatesBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = ListStatesBloc();
    bloc.getStatesPersonal();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<ListStatesBloc, ListStatesState>(
            bloc: bloc,
            builder: (context, state) {
              if (state.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                itemCount: bloc.statesPersonal.length,
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    title: Text(bloc.statesPersonal[index].stateType),
                    subtitle: Text(
                        "${bloc.statesPersonal[index].name} (${bloc.statesPersonal[index].id})"),
                    leading: SizedBox(
                      width: 35,
                      child: bloc.statesPersonal[index].deleting
                          ? const CircularProgressIndicator()
                          : IconButton(
                              onPressed: () {
                                bloc.deleteStatePersonal(
                                    bloc.statesPersonal[index]);
                              },
                              icon: const Icon(
                                Icons.delete,
                              ),
                              color: Colors.red),
                    ),
                  ),
                ),
              );
            }));
  }
}

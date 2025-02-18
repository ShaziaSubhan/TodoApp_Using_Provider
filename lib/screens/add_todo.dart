import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_using_provider/provider/save_task_provider.dart';
import 'package:todo_app_using_provider/provider/task_provider.dart';

class AddTodo extends StatelessWidget {
  AddTodo({super.key});
  final controller = TextEditingController();
 

  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Todo")
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextField(
              controller: controller,
              autofocus: true,
              decoration: const InputDecoration(
                hintText: 'Tittle'

              ),
            ),
            const SizedBox(height: 15,),
            ElevatedButton(onPressed: (){
              context.read<SaveTask>().addTask(
                Task(title: controller.text,
                isCompleted: false
                
                ),
              );
              controller.clear();
              Navigator.of(context).pop(); 

            },
             child: const Text("Add"),
            )


          ],
        ),
        ),
    );
  }
}
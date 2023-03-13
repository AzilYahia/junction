import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import 'widgets/fieldtext.dart';

class NewPod extends StatefulWidget {
  const NewPod({Key? key}) : super(key: key);

  @override
  State<NewPod> createState() => _NewPodState();
}

// ListView.builder(
// scrollDirection: Axis.vertical,
// shrinkWrap: true,
// physics: BouncingScrollPhysics(),
// itemCount: monthModel.length,
// itemBuilder: (BuildContext context, int index) {
// return _buildPlayerModelList(monthModel[index]);
// },
// ),

class _NewPodState extends State<NewPod> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kwhitelikangrey,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: Center(child: Text("Add new Pod")),
          backgroundColor: kwhitelikangrey,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              SizedBox(
                height: 70,
              ),


              Text(
                'Name Pod',
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                      color: kbluelikanwhite,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: 15,),
              const Fieldtext(
                hint: "Name",

                // controller: passwordController,
                // obsec: controller.isVisible ? true : false,

                //   inp: controller.isVisible
                //   ? IconButton(
                //       icon: const Icon(Icons.visibility_off,
                //       color: Colors.black),
                //   onPressed: () => controller.visibility(),
                // )
                //     : IconButton(
                // icon: const Icon(Icons.visibility,
                // color: Colors.black),
                // onPressed: () => controller.visibility(),
                // ),
          //       validator: (value) {
          // if (value.toString().length < 8) {
          // return "password should be longer or equal to 8 characters";
          // } else {
          // return null;
          // }
          //       }
              ),
              const SizedBox(
                height: 30,
              ),
                  Text(
                    'ID Pod',
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                          color: kbluelikanwhite,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(height: 15,),
                  const Fieldtext(
                    hint: "ID Pod",

                    // controller: passwordController,
                    // obsec: controller.isVisible ? true : false,

                    //   inp: controller.isVisible
                    //   ? IconButton(
                    //       icon: const Icon(Icons.visibility_off,
                    //       color: Colors.black),
                    //   onPressed: () => controller.visibility(),
                    // )
                    //     : IconButton(
                    // icon: const Icon(Icons.visibility,
                    // color: Colors.black),
                    // onPressed: () => controller.visibility(),
                    // ),
                    // validator: (value) {
                    // if (value.toString().length < 8) {
                    // return "password should be longer or equal to 8 characters";
                    // } else {
                    // return null;
                    // }
                    // },
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  Text(
                    'Key Pod',
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                          color: kbluelikanwhite,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(height: 15,),
                  const Fieldtext(
                    hint: "Key Pod",

                    // controller: passwordController,
                    // obsec: controller.isVisible ? true : false,

                    //   inp: controller.isVisible
                    //   ? IconButton(
                    //       icon: const Icon(Icons.visibility_off,
                    //       color: Colors.black),
                    //   onPressed: () => controller.visibility(),
                    // )
                    //     : IconButton(
                    // icon: const Icon(Icons.visibility,
                    // color: Colors.black),
                    // onPressed: () => controller.visibility(),
                    // ),
                    // validator: (value) {
                    // if (value.toString().length < 8) {
                    // return "password should be longer or equal to 8 characters";
                    // } else {
                    // return null;
                    // }
                    // },
                  ),
                  const SizedBox(
                    height: 30,
                  ),

              SizedBox(height: 80,),
              Center(
                child: TextButton(onPressed: () {
                },
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      height: 64,
                      width: 300,
                      decoration:  BoxDecoration(
                          color: knewred,
                          borderRadius: BorderRadius.all(Radius.circular(55))),
                      child: Center(
                          child: Text("Add",style: GoogleFonts.poppins(
                              color: kbluelikanwhite,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),)),
                    ),
                  ),),
              ),
            ]),
          ),
        ));
  }
}

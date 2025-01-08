import 'package:curd/utils/utils.dart';
import 'package:curd/view/donerViewPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:curd/controller/dataprovider.dart';

class RequestPage extends StatefulWidget {
  const RequestPage({super.key});

  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  @override
  void initState() {
    Provider.of<Dataprovider>(context, listen: false).getData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: ()async {
          Provider.of<Dataprovider>(context,listen: false).getData();
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  )),
              title: Text(
                "Find Donor",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              backgroundColor: Constants.mainColor,
              collapsedHeight: 80,
              expandedHeight: 400,
              pinned: true,
              floating: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 100),
                          const Text(
                            "Blood donors around you",
                            style: TextStyle(
                              color: Constants.CommontextColor,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "Choose blood group",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Constants.CommontextColor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 40.0),
                            child: Container(
                              width: double.infinity,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Constants.CommontextColor,
                              ),
                              child: Consumer<Dataprovider>(
                                builder: (context, dropdown, child) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DropdownButton(
                                    iconSize: 40,
                                    isExpanded: true,
                                    value: dropdown.newValue,
                                    hint: const Text("Select a value"),
                                    items: dropdown.bloodGroupList.map((item) {
                                      return DropdownMenuItem(
                                        value: item,
                                        child: Text(item),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      dropdown.setDropdownValue(value!);
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "Location",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Constants.CommontextColor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 40),
                            child: SizedBox(
                              height: 60,
                              child: TextField(
                                controller: Provider.of<Dataprovider>(context,
                                        listen: false)
                                    .locationController,
                                onSubmitted: (value) {
                                  Provider.of<Dataprovider>(context,
                                          listen: false)
                                      .serchDoners();
                                },
                                decoration: InputDecoration(
                                    fillColor: Constants.CommontextColor,
                                    filled: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: GestureDetector(
                              onTap: () {
                                Provider.of<Dataprovider>(context, listen: false)
                                    .serchDoners();
                              },
                              child: Container(
                                width: 180,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Constants.CommontextColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.search),
                                    SizedBox(width: 20),
                                    Text("Search"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Consumer<Dataprovider>(
              builder: (context, value, child) => value.filterList.isEmpty
                  ? Consumer<Dataprovider>(
                      builder: (context, value, child) => SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final data = value.dataList[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Donerviewpage(
                                                image: data.image,
                                                age: data.age,
                                                bloodGruop: data.group,
                                                gender: data.gender,
                                                location: data.location,
                                                name: data.name,
                                                phone: data.phone,
                                              )));
                                },
                                child: Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.black54)),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Container(
                                              width: 90,
                                              height: 110,
                                              decoration: BoxDecoration(
                                                color: const Color.fromARGB(
                                                    255, 250, 230, 237),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Center(
                                                  child: Text(
                                                data.group ?? '',
                                                style: TextStyle(
                                                    color: Constants.mainColor,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 25),
                                              )),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          spacing: 10,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${data.gender ?? ''} ,  ${data.age ?? '0'} yr old",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Row(
                                              spacing: 10,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(CupertinoIcons.person),
                                                Text(
                                                  data.name ?? '',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              spacing: 10,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(CupertinoIcons.phone),
                                                Text(
                                                  data.phone ?? '',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              spacing: 10,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(CupertinoIcons.location),
                                                Text(
                                                  data.location ?? '',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          childCount: value.dataList.length,
                        ),
                      ),
                    )
                  : SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            "Found ${value.filterList.length} doners around you"),
                      ),
                    ),
            ),
            Consumer<Dataprovider>(
              builder: (context, value, child) => SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final data = value.filterList[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                           Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Donerviewpage(
                                                image: data.image,
                                                age: data.age,
                                                bloodGruop: data.group,
                                                gender: data.gender,
                                                location: data.location,
                                                name: data.name,
                                                phone: data.phone,
                                              )));
                        },
                        child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black54)),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 90,
                                      height: 110,
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 250, 230, 237),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                          child: Text(
                                        data.group ?? '',
                                        style: TextStyle(
                                            color: Constants.mainColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25),
                                      )),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  spacing: 10,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${data.gender ?? ''} ,  ${data.age ?? '0'} yr old",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      spacing: 10,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Icon(CupertinoIcons.person),
                                        Text(
                                          data.name ?? '',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      spacing: 10,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Icon(CupertinoIcons.phone),
                                        Text(
                                          data.phone ?? '',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      spacing: 10,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Icon(CupertinoIcons.location),
                                        Text(
                                          data.location ?? '',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  childCount: value.filterList.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

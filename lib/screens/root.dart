import 'package:flutter/material.dart';
import 'package:flutter_skeleton/store/store.dart';
import 'package:provider/provider.dart';
import 'consts.dart';
import 'home.dart';
import 'settings.dart';

class RootScreen extends StatefulWidget{
  int tab; //currently selected tab

  @override
  RootState createState() => RootState();

  RootScreen({this.tab});
}

class RootState extends State<RootScreen> with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin<RootScreen>{
  
  TabController tabController;
  Store store;

  @override
  void initState(){
    super.initState();
    tabController = TabController(length: NUM_TABS, vsync: this);
    if (widget.tab != null){
      tabController.index = widget.tab;
    }
  }

  @override
  void dispose(){
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    store = Provider.of<Store>(context);
    return Scaffold(
      body: createBody(store),
      bottomNavigationBar: Material(
        child: TabBar(
          tabs: <Tab>[
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.settings))
          ],
          controller: tabController,
          //labelColor: Theme.of(context).accentColor
        ),
        type: MaterialType.canvas
      )
    );  
  }


  //use informaiton from the store/state to construct the body of the screen
  Widget createBody(Store store){
    if (store.isLoading()){
      return Container(
        child: CircularProgressIndicator(
          value: null,
          semanticsLabel: 'Loading...',
        ),
      );
    } else {
      return TabBarView(
        children: [
          HomeScreen(), SettingsScreen()
        ]
      );
    }
    
  }
  
  @override
  bool get wantKeepAlive => true;

}
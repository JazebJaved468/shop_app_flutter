/* 
DropdownButton( value: Dropdown.deliveryDropDownDefaultValue,
 items: Dropdown.deliveryDropDownItems.map((String address){
                        return DropdownMenuItem( value: address, child: Text(address),);
                      }).toList(), onChanged:(String? newValue) { 
                setState(() {
                  Dropdown.deliveryDropDownDefaultValue = newValue!;
                });})



 // bottom navigation
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            // canvasColor: GlobalColors.bottomNavbar,

            // Set canvasColor to transparent
          ),
          child: ClipRRect(
            clipBehavior: Clip.hardEdge,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: BottomNavigationBar(
              iconSize: 20,
              useLegacyColorScheme: false,
              selectedItemColor: const Color(0xffE0B420),
              unselectedItemColor: GlobalColors.secondaryBackground,
              currentIndex: selectedIndex,
              unselectedFontSize: 12,
              onTap: (value) {
                // ignore: avoid_print
                print(value);
                selectedIndex = value;
                setState(() {});
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.grid_view_rounded,
                  ),
                  label: "Categories",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite_outlined,
                  ),
                  label: "Favourites",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.library_books_sharp,
                  ),
                  label: "Orders",
                ),
              ],
            ),
          ),
        ),

































*/
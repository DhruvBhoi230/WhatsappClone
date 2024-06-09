
InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 
                  "Chatpage");
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.asset(
                            "assets/images/profile $i.jpg",
                            height: 65,
                            width: 65,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Flutter Example",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  " Hey!! i am devied",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                              ]),
                        ),
                        Column(
                          children: [
                            Text(
                              "10.00",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff0fce5e),
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: 27,
                              height: 27,
                              decoration: BoxDecoration(
                                color: Color(0xff0fce5e),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Text(
                                "2",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
          
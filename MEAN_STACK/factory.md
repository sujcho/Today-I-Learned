# factory
팩토리와 컨스트럭터가 다른 점: 팩토리는 오브젝트를 리턴한다.
팩토리의 예:
```JavaScript
function myFactory(name, address){
    var myObj ={};
    myObj.name=name;
    myObj.address = address;

    if(age > 21){
        myObj.adult = true;
    }else{
        myObj.adult =false;
    }
    return myObj
}

var myObj1 = myFactory("John","Mogan Hill");
```

컨스트럭터:
컨스트럭터는 사용할 때 new를 사용한다.
```JavaScript
function myConstruct(name, address){
    this.name = name;
    this.address = address;
}

var myObj3 = new myConstruct("Doe","San Rafael");
```

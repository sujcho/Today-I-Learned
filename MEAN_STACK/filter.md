# intro to filter
    framework comes with many pre-defined filter.

## 사용하기
```html
<head>
    <title>Angular Filter:CASE</title>
    <script src="../bower_components/angular/angular.min.js"></script>
    <script>
        angular.module('filterAppCase', []).controller('MyFilterDemoCtrl', function ($scope) {


            //Data like this would typically come back from a request to a web service or a database,
            // but we only want some sample data, so that we can learn about AngularJS filters without
            // the additional distraction of data access code.
            // This fictitious data, captured in a JavaScript object we have named someData ,
            // represents some customer details. We will use this data as the chapter progresses,
            // starting now with a first look at the AngularJS filter syntax.

            var someData = {
                firstName: 'JENNA',
                surname: 'GRANT',
                dateJoined: new Date(2010, 2, 23),
                consumption: 123.659855,
                plan: 'super-basic-plan'
            };
            $scope.data = someData;

        });

    </script>

</head>
<body ng-app="filterAppCase" ng-controller="MyFilterDemoCtrl">

<p>
    <!-- Unfiltered data -->
    <strong>First Name</strong>: {{data.firstName}}<br/>
    <strong>Surname:</strong> {{data.surname}}
</p>

<p>
    <!-- Filtered data -- The first filter we will look at will address the issue
    of the firstName and surname appearing in uppercase.
    To improve this slightly, we will change it to lowercase.
    To achieve this, the main thing to know is that you use the | (pipe) character,
    to invoke a filter. -->
    <!-- 데이터 자체를 바꾸지않지만 바꿔보여줌. -->
    <strong>First Name</strong>: {{data.firstName | lowercase}}<br/>
    <strong>Surname:</strong> {{data.surname | lowercase }}<br/>
</p>

</body>
```

## ng-repeat
for in 과 같은 역할을 함.
어레이를 돌면서 하나씩 태그를 적용하는 데 사용한다.
인덱스는 $index는 in_build로 들어있는 데 0부터 시작하므로 1을 더해줌.
```html
<h2 ng-repeat="name in names">{{name}}</h2>
```

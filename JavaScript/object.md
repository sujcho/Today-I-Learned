#value for object
Object.prototype.valueOf returns a primitive value.
```javascript
myNumberType.prototype.valueOf = function() { return customPrimitiveValue; };
```

toString returns a string representation of the Object
so it is recommended to provide a meaningful explanation for toString..

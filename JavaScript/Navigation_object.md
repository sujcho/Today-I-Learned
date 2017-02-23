#Navigation Object
네비게이션 오브젝트는 클라이언트 사이드의 정보 (브라우저 정보)를 담고 있다.

```
window.navigator
Navigator
appCodeName: "Mozilla"
appName: "Netscape"appVersion: "5.0 (Macintosh; Intel Mac OS X 10_12_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36"
bluetooth: BluetoothcookieEnabled: true
credentials: CredentialsContainer
doNotTrack: null
geolocation: Geolocation
hardwareConcurrency: 4
language: "en-US"
languages: Array[3]
maxTouchPoints: 0
mediaDevices: MediaDevices
mimeTypes: MimeTypeArray
onLine: true
permissions: Permissions
platform: "MacIntel"
plugins: PluginArray
presentation: Presentation
product: "Gecko"
productSub: "20030107"
serviceWorker: ServiceWorkerContainer
storage: StorageManager
userAgent: "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36"vendor: "Google Inc."vendorSub: ""webkitPersistentStorage: DeprecatedStorageQuotawebkitTemporaryStorage: DeprecatedStorageQuota__proto__: Navigator
```
특히 스마트폰의 경우에는 상당히 유용하게 쓸 수가 있는 데 getBattery 같은 함수를 이용해서 배터리가 얼마나 남았는 지 같은 유용한 정보를 가져올 수 있다.

##Geolocation
네비게이터 오브젝트를 통해서 getCurrentPosition으로 로케이션을 얻을 수 있다.

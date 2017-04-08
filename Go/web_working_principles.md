# Web working principles
브라우저를 열 때마다 URL을 입력하고 Enter 키를 누르면 화면에 아름다운 웹 페이지가 나타납니다. 그러나이 간단한 행동들 뒤에 무엇이 일어나고 있는지 아십니까?
일반적으로 브라우저는 클라이언트입니다. URL을 입력하면 URL의 호스트 부분을 가져와 호스트의 IP 주소를 얻기 위해 DNS 서버로 보냅니다. 그런 다음 IP 주소에 연결하고 TCP 연결을 설정하도록 요청합니다. 브라우저는 연결을 통해 HTTP 요청을 보냅니다. 서버는 웹 페이지를 처리하고 웹 페이지를 구성하는 컨텐트를 포함하는 HTTP 응답으로 응답합니다. 마지막으로 브라우저는 웹 페이지의 본문을 렌더링하고 서버와의 연결을 끊습니다.

## HTTP protocol
HTTP 프로토콜은 웹 서비스의 핵심 부분입니다. 웹의 작동 방식을 이해하기 전에 HTTP 프로토콜이 무엇인지 파악하는 것이 중요합니다.
HTTP는 브라우저와 웹 서버 간의 통신을 용이하게하는 데 사용되는 프로토콜입니다. TCP 프로토콜을 기반으로하며 일반적으로 웹 서버 측에서 포트 80을 사용합니다. 요청 - 응답 모델 - 클라이언트가 요청을 보내고 서버가 응답하는 프로토콜을 사용합니다. HTTP 프로토콜에 따르면 클라이언트는 항상 새 연결을 설정하고 서버에 HTTP 요청을 보냅니다. 서버는 사전에 클라이언트에 연결하거나 콜백 연결을 설정할 수 없습니다. 클라이언트와 서버 간의 연결은 양쪽에서 닫을 수 있습니다. 예를 들어 다운로드 요청 및 HTTP 연결을 취소 할 수 있으며 다운로드를 완료하기 전에 브라우저가 서버와의 연결이 끊어집니다.
HTTP 프로토콜은 상태 비 저장이므로 두 클라이언트가 동일한 클라이언트 일지라도 두 연결 간의 관계에 대해 서버는 알지 못합니다. 이 문제를 해결하기 위해 웹 응용 프로그램은 쿠키를 사용하여 연결 상태를 유지합니다.
HTTP 프로토콜은 TCP 프로토콜을 기반으로하기 때문에 모든 TCP 공격은 서버의 HTTP 통신에 영향을 미칩니다. 이러한 공격의 예는 SYN 플러딩, DoS 및 DDoS 공격입니다.

## HTTP request package (browser information)
요청 패키지에는 요청 줄, 요청 헤더 및 본문의 세 부분이 있습니다. 머리글과 본문 사이에 빈 줄이 하나 있습니다.

```
GET /domains/example/ HTTP/1.1      // request line: request method, URL, protocol and its version
Host：www.iana.org             // domain name
User-Agent：Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.4 (KHTML, like Gecko) Chrome/22.0.1229.94 Safari/537.4            // browser information
Accept：text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8    // mime that clients can accept
Accept-Encoding：gzip,deflate,sdch     // stream compression
Accept-Charset：UTF-8,*;q=0.5      // character set in client side
// blank line
// body, request resource arguments (for example, arguments in POST)
```
**We can see that GET does not have a request body, unlike POST, which does.**
HTTP로 서버와 통신하는 데 사용할 수있는 여러 가지 방법이 있습니다. GET, POST, PUT 및 DELETE는 우리가 일반적으로 사용하는 4 가지 기본 방법입니다. URL은 네트워크의 자원을 나타내므로이 네 가지 메소드는 이러한 자원에 대해 작동 할 수있는 쿼리, 변경, 추가 및 삭제 작업을 정의합니다. GET 및 POST는 HTTP에서 매우 일반적으로 사용됩니다. GET은 URL에 쿼리 매개 변수를 추가 할 수 있습니까? EditPosts.aspx? name = test1 & id = 123456과 같이 URL과 매개 변수를 구분하고 인수 사이에 &를 분리하십시오. POST는 URL이 브라우저를 통해 길이 제한을 구현하기 때문에 요청 본문에 데이터를 저장합니다. 따라서 POST는 GET보다 훨씬 많은 데이터를 제출할 수 있습니다. 또한 사용자 이름과 암호를 제출할 때 이러한 종류의 정보가 URL에 나타나기를 원하지 않으므로 POST를 사용하여 보이지 않게합니다.

## HTTP response package (server information)
응답 패키지에 어떤 정보가 들어 있는지 봅시다.
```
HTTP/1.1 200 OK                     // status line
Server: nginx/1.0.8                 // web server software and its version in the server machine
Date:Date: Tue, 30 Oct 2012 04:14:25 GMT        // responded time
Content-Type: text/html             // responded data type
Transfer-Encoding: chunked          // it means data were sent in fragments
Connection: keep-alive              // keep connection
Content-Length: 90                  // length of body
// blank line
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"... // message body
```
첫 번째 행을 상태 행이라고합니다. HTTP 버전, 상태 코드 및 상태 메시지를 제공합니다.
상태 코드는 클라이언트에게 HTTP 서버의 응답 상태를 알려줍니다. HTTP / 1.1에서는 5 종류의 상태 코드가 정의되었습니다.
```
- 1xx Informational
- 2xx Success
- 3xx Redirection
- 4xx Client Error
- 5xx Server Error
```

# Process
프로세스란 실행되고 있는 프로그램의 인스턴스이다.

## 프로세스는 어떻게 만들어지는 가
- *fork()*  사용: fork() runs a copy of some program. fork()는 새로운 명령어를 실행할 때 많이 쓰인다.
fork()를 하면 child 프로세스가 생긴다.
fork()가 0을 리턴하면 그게 차일드이다.
- *clone()*

## 프로그램 또는 명령어가 어떻게 실행되는 가
- *exec()* : exec() allows execution of the command
ex) $ls를 bash에서 실행하는 경우, 먼저 fork()가 호출된다. 그후 만들어진 프로세스에서 exec()를 호출해서 실행된다.

- *execve()* : 다른패스에서 실행하고 그 패스에서 리턴하지않는 다. 따라서 이 이후에 코드는 수행될 수 없다.



## 프로세스에 argument를 넘겨주는 방법
- cmd line argument : argc, argv
- env variable

### 환경변수
프로그램이 실행될 때 다음과 같이 암묵적으로 현재 환경변수를 받을 수 있다.
메인의 구조는 다음과 같이 되어있음.
```
int main(int argc, char **argv, char **env){

}
```
환경변수는 다음과 같이 불러올 수 있다.
PERM이라는 환경변수를 불러오기
```
char *var;
 var = getEnv("PERM")
```



## 프로세스 터미네이션 (termination)
- parent waiting for child to exit
프로세스를 종료할때 exit()이 아니라 언더스코어 exit() 콜을 사용하면 프로세스에 딸린 부가적인 리소스를 다 종료시킨다. 예를 들어 차일드 프로세스 및 컨텍스트 등.
waitpid(), wait() : 차일드의 상태를 받아올 수 있다.  wait에는 옵션을 줄 수 있어서 주기적으로 차일드를 감시하거나 할 수 있다.


- parent exits before child : orphan Process
- child exits before parent (w/o parent waiting) zombie process
좀비 프로세스: 프로세스가 벌써 종료되었지만, 필요에 의해서 로그와 PID가 남지만 다른거는 컨텍스트는 없어진다.
생기는 이유는 차일드가 패런트전에 종료될 때 생성된다. 패런트가 차일드를 완전히 클린업할때까지 좀비 프로세스가 된다.

# demon 프로세스
백그라운드 프로세스
- 데몬 프로세스를 생성하는 법:
1. fork()
2. 새로운 sid를 생성한다 (setsid)
3. 현재 디렉토리를 바꾼다
4. 모든 시스템 인, 시스템 아웃, 시스템 에러를 리포인팅한다.

# 중요한점
1. process map
2. char * rfn
3. FILE * vs fd
4. fopen()
5. fd * fdtable
6. stdin (0), stdout (1) & stderr (2)
-> printf 를 사용할 때 뉴라인 캐릭터가 있어야만 버퍼에서 플러쉬가 되서 화면에 표시될 수 있다.
fflush를 사용하면 버퍼를 flush 한다. fflush(stdout)

7. fflush, fpurge

# fopen
fopen으로 w 로 열면 권한은 644.  하지만 umask 셋팅에 따라 달라질 수 있다. umask는 파일을 처음에 만들때 무슨 권한을 줄 것이지를 결정한다.

# example
```
#include <stdio.h>

char *rfn = "my.txt"
int main(){
    FILE *rfp;

    rfp = fopen(rfn, "w");
    fclose(rfp);
}
```

# strace
시스템 트레이스
trace the execution of any process
시스템 트레이스를 해보면  getchar는 내부에서 stdin을 read()를 사용해서 읽어보는 것을 알 수 있다.
printf 는  stdout을 write()을 사용해서 쓰는 것을 알 수 있다.

# time
프로그램 실행시간에서 real, user, sys 에서 걸리는 시간을 보여준다.

# .
current directory
stores inode and file name

# ..
parent directory

# dup
duplicate fd

# getting inode information
stat() : 아이노드 정보
lastat() : 심볼릭 링크 정보

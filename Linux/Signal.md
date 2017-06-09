# setjump()/ longjump()
실행하던 곳으로 다시 돌아가기 위해서 스택 레퍼런스를 저장한다. 예를 들어서 인터럽트 시그널이 뜬 후에서
핸들러가 종료된 후 원래 코드로 돌아가기 위한 스텍레퍼런스를 저장한다.
setjump: set 스택 컨택스트
longjump: returns using above stack context.

# permission

s : setuid root만 권한이 있는 파일을 각 유저가 루트 권한없이 사용할 수 있다.
S: file is "really" not executable.
t: sticky bit, . No other user has the needed privileges to delete the file created by some other user.

# softlink vs hardlink
+ hardlink : reference to the same inode. hardlink cannot traverse the file system.
+ softlink : embbed only the name of the file. can be used across the file system because it stores a path

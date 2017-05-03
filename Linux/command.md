# select and poll
will be on final exam.

select() and pselect() allow a program to monitor multiple file
    descriptors, waiting until one or more of the file descriptors become
    "ready" for some class of I/O operation (e.g., input possible).  A
    file descriptor is considered ready if it is possible to perform a
    corresponding I/O operation (e.g., read(2) without blocking, or a
    sufficiently small write(2)).

    select() can monitor only file descriptors numbers that are less than
    FD_SETSIZE; poll(2) does not have this limitation.  See BUGS.

    

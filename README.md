# Memory monitoring shell script
We write a simple shell script for monitoring the resident memory used by a
process as a function of time.

## Measuring resident memory usage
As seen in the linux documentation, the location `/proc/[pid]/statm`
holds data about the memory usage of the process. The second number is the
number of pages used as resident memory. To get the size of a page in bytes:
`getconf PAGESIZE`.
It is unclear for me what the update step of the information in `/proc` is.

## References
  * https://stackoverflow.com/questions/10400751/how-do-vmrss-and-resident-set-size-match
  * http://man7.org/linux/man-pages/man5/proc.5.html

# Memory monitoring shell script
We write a simple shell script for monitoring the resident memory used by a
process as a function of time.

## Usage
'mem-monitor.sh' outputs a text file monitoring the resident memory usage of a
process.
```
mem-monitor pid length interval fileout
```
With:
  - **pid**: The pid of the process to monitor.
  - **length**: The length of time during which the process is monitored.
                In *seconds*.
  - **interval**: The time sampling step. In *seconds*.
  - **fileout**: The path to output file. The provided file is superseded if it
                 already exists.

## Example 1

## Example 2

## Measuring resident memory usage
As seen in the linux documentation, the location `/proc/[pid]/statm`
holds data about the memory usage of the process. The second number is the
number of pages used as resident memory. To get the size of a page in bytes:
`getconf PAGESIZE`.

## Tests
Passes:
```
shellcheck -s sh -S style mem-monitor.sh
```

## References
  * https://stackoverflow.com/questions/10400751/how-do-vmrss-and-resident-set-size-match
  * http://man7.org/linux/man-pages/man5/proc.5.html

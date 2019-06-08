# Memory monitoring shell script
We write a simple shell script for monitoring the resident memory used by a
process as a function of time.

## Usage
'mem-monitor.sh' outputs a text file monitoring the resident memory usage of a
process.
```sh
mem-monitor pid length interval fileout
```
With:
  - **pid**: The pid of the process to monitor.
  - **length**: The length of time during which the process is monitored.
                In *seconds*.
  - **interval**: The time sampling step. In *seconds*.
  - **fileout**: The path to output file. The provided file is superseded if it
                 already exists.

The output is two columns, separated by spaces, with a header.
For n sample points:
```
time res-mem
time-1 res-mem-1
time-2 res-mem-2
...
time-n res-mem-n
```
With:
  * *time-i*: The series of **dates**, in *milliseconds* since beginning of
              script.
  * *res-mem-i*: The amount of **resident memory** the process takes up.
                 In *KB*.
## Example 1
The command:
```sh
mem-monitor $(pidof firefox | cut -d" " -f1) 1 0.1 ~/repos/mem-monitor/test.txt
```
Generates the file:
```text
time res-mem
2 378016
105 378016
209 378016
312 378016
415 378016
519 378016
622 378016
726 378016
830 378016
933 378016
1037 378016
```
## Example 2

## Measuring resident memory usage
As seen in the linux documentation, the location `/proc/[pid]/statm`
holds data about the memory usage of the process. The second number is the
number of pages used as resident memory. To get the size of a page in bytes:
`getconf PAGESIZE`.

## Tests
Passes:
```sh
shellcheck -s sh -S style mem-monitor.sh
```
## Relevance
While it was a good exercise to piece together this script, it seems that there
must be some existing basic UNIX utility for doing this. A full-fledged utility
would have proper error handling and input sanitization that would make it
safer to use. If you know then please tell me.
## References
  * https://stackoverflow.com/questions/10400751/how-do-vmrss-and-resident-set-size-match
  * http://man7.org/linux/man-pages/man5/proc.5.html

Mobile benchmark tool for iOS (mobibench)
================================

* Maintainer :  
* Contributor : Jongwon Lee (leejongtang@naver.com), and Namwoo Kim (sky901291@naver.com), and Seongjin Lee (jamesbrother@gmail.com)

### Reference: 
 * Report on Mobibench for iOS 
<http://dmclab.hanyang.ac.kr/wikidata/졸업프로젝트/2014_final_reports/01_mobibench_for_ios.hwp>


### Release
#####Version 1
 * Available file test modes are sequential and random read/write I/O with buffered I/O, fsync(), and nocache.
 * Available journal modes on SQLite is WAL, DELETE, TRUNCATE, PERSIST, MEMORY, and OFF mode.


MobiBench (Application version)
-----------------------------------
Mobibench for iOS allows to measure IO performance and SQLite and file system of mobile devices that uses iOS, and also allows to measure user specified set of tests. 


Avaliable Benchmark Settings
-------------
### File size
 Changes the size of file size in File IO test. Since write to a NAND Flash media is slower compared to read operation, we use different default file size for write and read operation. Default file size is 32MB. You can chose from 32MB, 64MB, and 128MB.
      
### IO Size
 Changes the size of IO issued in File IO benchmark. Default size is 256KB. You can chose from 256KB, 512KB, and 768KB.
      
### Mode(File IO)
 Changes synchronization mode for File IO benchmark. Default mode run in buffered I/O mode. List of synchronization modes available are as follows.
  * Normal: Buffered IO
  * fsync: Each write() call is synchronously written to the storage device via fsync() system call.
  * F_NOCACHE: It turns cache off, and works like Direct I/O

                  
### Transaction(SQLite)
 Sets number of SQLite transactions, where default number of transactions is 100. Maximum number of transaction is 1,000. 
                  

                          
### Journal(SQLite)
 Changes SQLite journal mode. Default mode of SQLite is TRUNCATE mode. For detailed explanation of each mode please refer to SQLite homepage.
  * DELETE: Delete mode
  * TRUNCATE: Truncate mode
  * PERSIST: Persist mode
  * WAL: Write Ahead Logging mode
  * MEMORY: Memory mode
  * OFF: Off mode
                                      
                                      



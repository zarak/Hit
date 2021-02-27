# Hit

[Building git](https://shop.jcoglan.com/building-git/) in Haskell.

### Test zlib compression  
  ```bash
  $ alias inflate=dist-newstyle/build/x86_64-linux/ghc-8.10.4/Hit-0.1.0.0/x/Hit/build/Hit/Hit
  $ cat git-simple-commit/.git/objects/ce/013625030ba8dba906f756967f9e9ca394464a | inflate
  blob 6hello

  $ cat git-simple-commit/.git/objects/ce/013625030ba8dba906f756967f9e9ca394464a | inflate | wc -c
  13
  ```

### View hexdump of a blob  
  There is a null byte between the length header and the blob content.

  ```bash
  $ cat git-simple-commit/.git/objects/ce/013625030ba8dba906f756967f9e9ca394464a | inflate | hexdump -C
  # non-ascii chars are displayed as .
  00000000  62 6c 6f 62 20 36 00 68  65 6c 6c 6f 0a           |blob 6.hello.|
  0000000d # total size of file
  ```

### View hexdump of a tree  
  ```bash
  $ cat git-simple-commit/.git/objects/88/e38705fdbd3608cddbe904b67c731f3234c45b | inflate | hexdump -C
  # Store a tree as: string of mode, space, filename, null, and id as binary
  00000000  74 72 65 65 20 37 34 00  31 30 30 36 34 34 20 68  |tree 74.100644 h| # length is 74
  00000010  65 6c 6c 6f 2e 74 78 74  00 ce 01 36 25 03 0b a8  |ello.txt...6%...|
  00000020  db a9 06 f7 56 96 7f 9e  9c a3 94 46 4a 31 30 30  |....V......FJ100| # 100644 is filemode
  00000030  36 34 34 20 77 6f 72 6c  64 2e 74 78 74 00 cc 62  |644 world.txt..b|
  00000040  8c cd 10 74 2b ae a8 24  1c 59 24 df 99 2b 5c 01  |...t+..$.Y$..+\.|
  00000050  9f 71                                             |.q|
  00000052 # total size of file
  ```

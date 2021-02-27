# Hit

[Building git](https://shop.jcoglan.com/building-git/) in Haskell.

1. Test zlib compression  
  ```bash
  $ alias inflate=dist-newstyle/build/x86_64-linux/ghc-8.10.4/Hit-0.1.0.0/x/Hit/build/Hit/Hit
  $ cat git-simple-commit/.git/objects/ce/013625030ba8dba906f756967f9e9ca394464a | inflate
  blob 6hello

  $ cat git-simple-commit/.git/objects/ce/013625030ba8dba906f756967f9e9ca394464a | inflate | wc -c
  13
  ```

2. View hexdump  
  There is a null byte between the length header and the blob content.

  ```bash
  $ cat git-simple-commit/.git/objects/ce/013625030ba8dba906f756967f9e9ca394464a | inflate | hexdump -C
  00000000  62 6c 6f 62 20 36 00 68  65 6c 6c 6f 0a           |blob 6.hello.|
  0000000d
  ```

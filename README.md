### lftp--file--upload | Creates  directory in remote server the  same  as  in the local and get the files into them instead of uploading all files in same directory.

#### Script USAGE: 
"For MAN page use -m [help command]"  
./lftp_file_uplader.sh -u Username -p 'Password' -h Host -f path_to_remotefile.txt"

#### LFTP USAGE:
`lftp -f script_file`

```
 mput [-c] [-d] [-a] [-E] [-e] [-P N] [-O base] files

       Upload  files  with  wildcard  expansion.  By  default it uses the base name of local name as
       remote one. This can be changed by `-d' option.

            -c          continue, reput
            -d          create directories the same as in file names and put  the  files  into  them
                        instead of current directory
            -E          delete source files after successful transfer (dangerous)
            -e          delete target file before the transfer
            -a          use ascii mode (binary is the default)
            -P N        upload N files in parallel
            -O <base>   specifies base directory or URL where files should be placed
```

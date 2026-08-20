Disclaimer.
Sometimes there is a situation when you need to download some torrent file, but you don't want to install the client for this. In this case, you can use this container. Of course, CTorrent is a fairly old project, but it is very good for downloading 1 giveaway. Especially if you need to download 1 large file.

# cTorrent command line help
Enhanced CTorrent dnh3.3.2   Original code Copyright: YuHong(992126018601033)                                                                                                        [7/323]
WARNING: THERE IS NO WARRANTY FOR CTorrent. USE AT YOUR OWN RISK!!!

## General Options:
-h/-H           Show this message
-x              Decode metainfo (torrent) file only, don't download
-c              Check pieces only, don't download
-v              Verbose output (for debugging)

## Download Options:
-e int          Exit while seed <int> hours later (default 72 hours)
-E num          Exit after seeding to <num> ratio (UL:DL)
-i ip           Listen for connections on specific IP address (default all/any)
-p port         Listen port (default 2706 -> 2106)
-I ip           Specify public/external IP address for peer connections
-u num or URL   Use an alternate announce (tracker) URL
-s filename     Download ("save as") to a different file or directory
-C cache_size   Cache size, unit MB (default 16MB)
-f              Force saved bitfield or seed mode (skip initial hash check)
-b filename     Specify bitfield save file (default is torrent+".bf")
-M max_peers    Max peers count (default 100)
-m min_peers    Min peers count (default 1)
-z slice_size   Download slice/block size, unit KB (default 16, max 128)
-n file_list    Specify file number(s) to download
-D rate         Max bandwidth down (unit KB/s)
-U rate         Max bandwidth up (unit KB/s)
-P peer_id      Set Peer ID prefix (default "-CD0303-")
-A user_agent   Set User-Agent header (default "Enhanced-CTorrent/dnh3.3.2")
-S host:port    Use CTCS server at host:port
-a              Preallocate files on disk
-T              Convert foreign filenames to printable text
-X command      Run command upon download completion ("user exit")
-d              Daemon mode (fork to background)
-dd             Daemon mode with I/O redirection

## Make metainfo (torrent) file options:
-t              Create a new torrent file
-u URL          Tracker's URL
-l piece_len    Piece length (default 262144)
-s filename     Specify metainfo file name
-p              Private (disable peer exchange)
-c comment      Include a comment/description

## Example:
ctorrent -s new_filename -e 12 -C 32 -p 6881 example.torrent
ctorrent -p 2700 file.torrent


## Links
home page: http://ctorrent.sourceforge.net/
see also: http://www.rahul.net/dholmes/ctorrent/

# Hat Geomorphs

This is a modification of Craig S. Kaplan's [hatviz][hatviz] application to work
as a geomorph-based dungeon generator, similar in concept to [Dave's Mapper][daves]

The difference is that the individual geomorphs are the ["hat" tile][hat],
from [Smith et. al. 2023][hat-paper]. Aside from making the maps look a bit
weird, this does two things:

* The dungeon maps can never repeat, because the Hat is an aperiodic tile.
  This isn't super relevant for D&D since we don't usually play on infinite
  maps, and the details _within_ the geomorphs repeat anyway. But,

* More interestingly, the dungeons have a large-scale structure.

  Smith et. al. point out in the paper that the more-commmon non-reflected hat
  tiles sometimes, but not always, arrange themselves into lines linking the
  rare reflected tiles.

  I've added a blue stripe to the non-reflected tiles that will run along these
  long-range lines without connecting to the rest of the dungeon. The reflected
  tiles use different geomorphs (currently just one), which connect these blue
  "canals" to the rest of the dungeon.

This means adventurers and monsters who want to travel quickly can use the
canal system as a shortcut, rather than crawling through the more maze-y
dungeon layer. But that also makes canals ideal lairs for the toughest
monsters.

This isn't a new idea; the ["halls" of Cogmind levels][cogmind-halls] are something
similar. But it's not something I've seen as much in D&D maps, possibly because it
only really works in quite large dungeons.


[hatviz] https://cs.uwaterloo.ca/~csk/hat/app.html
[daves] https://davesmapper.com
[hat-paper] https://arxiv.org/abs/2303.10798
[cogmind-halls] https://www.gridsagegames.com/blog/2014/06/mapgen-tunneling-algorithm/

### hatviz

The sketch is built using the [P5js](https://p5js.org/) library.  You can run it by pointing your browser at `app.html`.  That file references an online copy of the file.  You can also run it with a local copy of the library; download `P5.min.js` from the [P5js download page](https://p5js.org/download/), put it in the same directory as `hat.js` and `app.html`, and modify `app.html` to reference it instead of the online version.

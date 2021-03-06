About
================

A CALayer class to help doing frame animation quickly by using a sliding window (or door?) technique.  This avoids something slower like calling drawInContext frequently.  So far it seems to perform pretty well with several sprites on screen, both on iPhone & OS X.

A super simple example is included that has a basic cube rotating, animating via a timer.

More Infomation
================

The sliding window/door technique is done by turning on masksToBounds and putting a large layer in the sublayers which contains all the frames in 1 image.  The masking of the sprite layer hides everything else, showing only the sprite frame you want to show at the time.  Tie this in with a timer like in the example and you have a looping animation.

This was an attempt to try to use CoreAnimation for a 2D game where there would be a lot more frame animation than just one.  The idea to try CoreAnimation for a game came from the CoreAnimation Asteroids posts from [Cocoa With Love](http://cocoawithlove.com/).

Asteroids in CoreAnimation posts:

* [An Asteroids-style game in CoreAnimation, Part One.](http://cocoawithlove.com/2009/02/asteroids-style-game-in-coreanimation.html)
* [An Asteroids-style game in CoreAnimation, Part Two.](http://cocoawithlove.com/2009/02/asteroids-style-game-in-coreanimation_22.html)
* [An Asteroids-style game in CoreAnimation, Part Three.](http://cocoawithlove.com/2009/03/asteroids-style-game-in-coreanimation.html)
* [An Asteroids-style game in CoreAnimation, Part Four.](http://cocoawithlove.com/2009/03/asteroids-style-game-in-coreanimation_08.html)

His example only had 1 sprite I believe that animated frames instead of just movement & rotation.  Once I had a lot more on the screen, all calling drawInContext to update their frame would cause pretty poor performance.

Todo
=================

* Support non-symmetrically laid out charsets/tilesets like seen in some 8-bit sprite sets
* Support non-square sprite sheets (though square might be best? at least thought so for GL)
* Ability to have a sprite change its frame based upon its own time setting, see updateWithTimeInterval & age in the cocoa with love posts
* I haven't thought about what would aid animating things like characters where they have different actions that might all loop a certain subset of frames

Feel free to contact me with ideas, send patches, or fork and send pull requests.

License
==========
Copyright (c) 2009, Jeremy Knope
All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

 * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 * Neither the name of the Buttered Cat Software nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

//here, we're assuming that framebase is always 60.

//format: hhh:mm:ss:dddd, where d = (subtick/update_rate)*1000

//we know that 60 ticks equals a second, as far as the observer is concerned.
//following that, 3600 ticks equals a minute.
//216000 ticks is one hour. We're not bothered with anything else after that.

var _ss=bound_clock.framebase; //this many ticks per second
var _mm=_ss*60; //this many seconds per minute
var _hh=_mm*60; //this many minutes per hour
var _dd=_hh*24; //this many hours per day

total_ticks=bound_clock.ticks;
d=total_ticks div _dd;
total_ticks-=d*_dd;
h=total_ticks div _hh;
total_ticks-=h*_hh;
m=total_ticks div _mm;
total_ticks-=m*_mm;
s=total_ticks div _ss;
total_ticks-=s*_ss;

//subticks are mainly for visual interpolation
//and as such are subject to constant, chaotic change.
//they shouldn't be used as a time-taking measure
//because of floating-point precision errors!


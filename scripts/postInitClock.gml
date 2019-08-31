//take all the tickers, check if they're bound to you,
//and if they are, make them perform a subtick update-related
//draw_x and draw_y updates.
//just to set their initial on-screen positions and whatnot.

calculateWandI(); //initial interpolation calculation

var me_me_i_am_the_clock_me=id;

with (objTicker)
    {
    if (bound_clock==me_me_i_am_the_clock_me)
        {
        updateInterpolatedValues();
        tickerEnqueue();
        }
    }

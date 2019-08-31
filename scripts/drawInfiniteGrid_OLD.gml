///drawInfiniteGrid_OLD(cellSize)
//decide how many vertical and horizontal lines
//for that, we need to know zoom level

var drw_width=round(view_wview[0]); //general approach
var drw_height=round(view_hview[0]);

var powwie;
powwie[0]=0;

//come up with a table of powers
//for later use

for (var p=0; p<=6; p++)
{
powwie[p]=power(argument[0],(p));
}

var accentuate;
accentuate[0]=0;

    if (global.zoom_level<-2)
        {
        base_unit=powwie[0];
        
        accentuate[0]=powwie[2];
        accentuate[1]=powwie[1];
        accentuate[2]=powwie[0];
        }
    else if (global.zoom_level<0)
        {
        base_unit=powwie[1];
        
        accentuate[0]=powwie[3];
        accentuate[1]=powwie[2];
        accentuate[2]=powwie[1];
        }
    else if (global.zoom_level<2)
        {
        base_unit=powwie[2];
        
        accentuate[0]=powwie[4];
        accentuate[1]=powwie[3];
        accentuate[2]=powwie[2];
        }    
    else if (global.zoom_level<4)
        {
        base_unit=powwie[3];
        
        accentuate[0]=powwie[5];
        accentuate[1]=powwie[4];
        accentuate[2]=powwie[3];
        }
    else if (global.zoom_level==4)
        {
        base_unit=powwie[4];
        
        accentuate[0]=powwie[6];
        accentuate[1]=powwie[5];
        accentuate[2]=powwie[4];
        }

var x_lines=(drw_width div base_unit)+2;
var y_lines=(drw_height div base_unit)+2;


//1 loop will do
var g;
var maxi=max(x_lines,y_lines);

var x_add=-(round(view_xview[0]) mod base_unit);
var y_add=-(round(view_yview[0]) mod base_unit);

//draw_set_color(c_white);
draw_set_alpha(1);

for (g=0; g<maxi; g+=1)
    {
    var newx1=round(view_xview[0]+x_add+g*base_unit);    
    var newy1=round(view_yview[0]+y_add+g*base_unit);
    
    //special case: 0
    if (newx1==0)
    draw_set_color(c_green);
    else    
    if (modulo_euclidian(newx1, accentuate[0])==0)
        draw_set_color(c_ltgray);
    else if (modulo_euclidian(newx1, accentuate[1])==0)
        draw_set_color(c_gray);
    else
        draw_set_color(c_dkgray);
    
    draw_line(-1+newx1,-1+view_yview[0],-1+newx1,-1+view_yview[0]+view_hview);    

    if (newy1==0)
    draw_set_color(c_maroon);
    else      
    if (modulo_euclidian(newy1, accentuate[0])==0)
        draw_set_color(c_ltgray);
    else if (modulo_euclidian(newy1, accentuate[1])==0)
        draw_set_color(c_gray);
    else
        draw_set_color(c_dkgray);
    
    draw_line(-1+view_xview[0],-1+newy1,-1+view_xview[0]+view_wview,-1+newy1);        
    }

draw_set_alpha(1);
    /*
    draw_set_color(c_dkgray);
    
    if (g<=x_lines)
        {
        
        //accentuate second order of magnitude
        if (modulo_euclidian(round(newx1), squarro)==magni+1)
            draw_set_color(c_gray);
        
        //basic. only draw when magni is less than or equal 2
        
        if (magni<=2)
        draw_line(newx1,view_yview[0],newx1,view_yview[0]+view_hview);
        }
    
    draw_set_color(c_dkgray);        
    
    if (g<=y_lines)
        {

        
        if (modulo_euclidian(round(newy1), squarro)=magni+1)
            draw_set_color(c_gray);
        
        if (magni<=2)        
        draw_line(view_xview[0],newy1,view_xview[0]+view_wview,newy1);
        }
    
    } */

///explode_string(string,delimiter);
//returns a ds_list containing separated elements
/*
original script by
**  GMLscripts.com

only slightly modified to accomodate for ds_list returns instead of arrays
*/
{
    var listie=ds_list_create();    

    var sep,dat,len,ind,pos;
    
    sep = argument[1];
    dat = argument[0] + sep;
    len = string_length(sep);
    ind = 0;
    repeat (string_count(sep,dat))
    {
        pos = string_pos(sep,dat)-1;
        ds_list_add(listie,string_copy(dat,1,pos));
        dat = string_delete(dat,1,pos+len);
        ind += 1;
    }
    return listie; //don't forget to destroy it after use!
}


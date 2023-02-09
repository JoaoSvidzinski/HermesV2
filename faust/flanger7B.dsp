import("stdfaust.lib");

//flfreq = vslider("h:flanger/flfreq", 0.01, 0.01, 20, 0.01) : si.smoo;
//fldepth = vslider("h:flanger/fldepth", 500, 1, 100, 0.01): si.smoo;
floffset = vslider("h:flanger/floffset", 5, 2, 100, 0.01): si.smoo;


//*(ma.SR / 1000.0)

flanger(index) = par(i,index, de.fdelay(1048576, (os.osci(vslider("flfreq%i", 0.05, 0.1, 10, 0.01) : si.smoo) : +(1) : *(0.5) : *(vslider("fldepth%i", 500, 1, 3000, 0.01): si.smoo) : +(floffset))*(ma.SR / 1000.0)));


process= flanger(7);

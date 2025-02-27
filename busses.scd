(

~makeBusses = {

	~bus = Dictionary.new;
	~bus.add(\nappes -> Bus.audio(s,2));
	~bus.add(\pitch -> Bus.audio(s, 1));
	~bus.add(\fftBrick -> Bus.audio(s, 1));
	~bus.add(\delay -> Bus.audio(s, 1));
	~bus.add(\satura -> Bus.audio(s, 1));
	//copie du bus 1
	~bus.add(\pitch_2 -> Bus.audio(s, 1));
	~bus.add(\fftBrick_2 -> Bus.audio(s, 1));
	~bus.add(\delay_2 -> Bus.audio(s, 1));
	~bus.add(\satura_2 -> Bus.audio(s, 1));

	~bus.add(\mono_drame -> Bus.audio(s, 1));

	~bus.add(\masterSamples -> Bus.audio(s,4)); //4 pour spat
	~bus.add(\masterSamples_2 -> Bus.audio(s,4)); //4 pour spat

	~bus.add(\radioBus -> Bus.audio(s, 1));
	~bus.add(\ptrBus -> Bus.audio(s, 1));
//gran samples
	~bus.add(\sampBus -> Bus.audio(s, 1));
	~bus.add(\ptrBusSamp -> Bus.audio(s, 1));


	~bus.add(\masterNappes -> Bus.audio(s,4)); //4 pour spat
	~bus.add(\masterNappes_bspat -> Bus.audio(s,4));
	~bus.add(\masterTransi -> Bus.audio(s,4)); //4 pour spat
	~bus.add(\masterSpat -> Bus.audio(s,4)); //4 pour spat
	~bus.add(\gran_radio -> Bus.audio(s,4)); //4 pour spat
	~bus.add(\expend -> Bus.audio(s, 2));
	~bus.add(\rec_nappes -> Bus.audio(s, 2));
	~bus.add(\rec_samples -> Bus.audio(s, 2));
	~bus.add(\rec_gran -> Bus.audio(s, 2));
};

)

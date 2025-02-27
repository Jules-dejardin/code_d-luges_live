(
~makeNodes = {

	s.bind({
		~mainGrp = Group.new;
		~radioGrp = Group.after(~mainGrp);
		~ptrGrp = Group.after(~radioGrp);
		~recGrp = Group.after(~ptrGrp);
		~granGrp = Group.after(~recGrp);

		~saturationGrp = Group.after(~granGrp);
		~brickWallGrp = Group.after(~saturationGrp);
		~delayGrp = Group.after(~brickWallGrp);
		~pitchGrp = Group.after(~delayGrp);

		~delayValhGrp = Group.after(~pitchGrp);
		~massiveValhGrp = Group.after(~delayValhGrp);
		~arrache = Group.after(~massiveValhGrp);

		~masterGrp = Group.after(~arrache);
		~masterGrp_bspat = Group.after(~masterGrp);
		~masterGrpSpat = Group.after(~masterGrp_bspat);


		~radio_expend_zero = Synth.new(
			\radio_expend,
			[
				\amp1, 0,
				\amp2, 0,
				\amp3, 0,
				\amp4, 0,
				\in, ~bus[\expend],
				\out, 0,
				\out2, 2,
			],
			~masterGrp
		);

		//~vstMassiveSynth.close;
		~saturator = Synth.new(
			\satu,
			[
				\amp, 0,
				\saturation, 15,
				\freqLpf, 10000,
				\in, ~bus[\satura],
				\out, ~bus[\fftBrick],
			],
			~saturationGrp
		);

		~saturator_2 = Synth.new(
			\satu,
			[
				\amp, 0,
				\saturation, 15,
				\freqLpf, 10000,
				\in, ~bus[\satura_2],
				\out, ~bus[\fftBrick_2],
			],
			~saturationGrp
		);

		/*~saturator_3 = Synth.new(
			\satu,
			[
				\amp, 0,
				\saturation, 15,
				\freqLpf, 10000,
				\in, ~bus[\satura_3],
				\out, ~bus[\fftBrick_3],
			],
			~saturationGrp
		);
		~saturator_4 = Synth.new(
			\satu,
			[
				\amp, 0,
				\saturation, 15,
				\freqLpf, 10000,
				\in, ~bus[\satura_4],
				\out, ~bus[\fftBrick_4],
			],
			~saturationGrp
		);*/

		~brickWallSynth = Synth.new(
			\brickWall,
			[
				\amp, -3,
				\wipe, -0.99,
				\in, ~bus[\fftBrick],
				\out, ~bus[\delay],
			],
			~brickWallGrp
		);

		~brickWallSynth_2 = Synth.new(
			\brickWall,
			[
				\amp, -3,
				\wipe, -0.99,
				\in, ~bus[\fftBrick_2],
				\out, ~bus[\delay_2],
			],
			~brickWallGrp
		);

/*		~brickWallSynth_3 = Synth.new(
			\brickWall,
			[
				\amp, -3,
				\wipe, -0.99,
				\in, ~bus[\fftBrick_3],
				\out, ~bus[\delay_3],
			],
			~brickWallGrp
		);

		~brickWallSynth_4 = Synth.new(
			\brickWall,
			[
				\amp, -3,
				\wipe, -0.99,
				\in, ~bus[\fftBrick_4],
				\out, ~bus[\delay_4],
			],
			~brickWallGrp
		);*/

		~delaySynth = Synth.new(
			\delay,
			[
				\amp, 0,
				\decay, 3,
				\mix, 0,
				\min, 0.3,
				\in, ~bus[\delay],
				\out, ~bus[\pitch],
			],
			~delayGrp
		);

		~delaySynth_2 = Synth.new(
			\delay,
			[
				\amp, 0,
				\decay, 3,
				\mix, 0,
				\min, 0.3,
				\in, ~bus[\delay_2],
				\out, ~bus[\pitch_2],
			],
			~delayGrp
		);

/*		~delaySynth_3 = Synth.new(
			\delay,
			[
				\amp, 0,
				\decay, 3,
				\mix, 0,
				\min, 0.3,
				\in, ~bus[\delay_3],
				\out, ~bus[\pitch_3],
			],
			~delayGrp
		);

		~delaySynth_4 = Synth.new(
			\delay,
			[
				\amp, 0,
				\decay, 3,
				\mix, 0,
				\min, 0.3,
				\in, ~bus[\delay_4],
				\out, ~bus[\pitch_4],
			],
			~delayGrp
		);*/

		~pitchSynth = Synth.new(
			\pitch,
			[
				\amp, -3,
				\mix, 0,
				\in, ~bus[\pitch],
				\out, ~bus[\masterSamples],
			],
			~pitchGrp
		);

		~pitchSynth_2 = Synth.new(
			\pitch,
			[
				\amp, -3,
				\mix, 0,
				\in, ~bus[\pitch_2],
				\out, ~bus[\masterSamples_2],
			],
			~pitchGrp
		);

/*		~pitchSynth_3 = Synth.new(
			\pitch,
			[
				\amp, -3,
				\mix, 0,
				\in, ~bus[\pitch_3],
				\out, ~bus[\masterSamples_3],
			],
			~pitchGrp
		);

		~pitchSynth_4 = Synth.new(
			\pitch,
			[
				\amp, -3,
				\mix, 0,
				\in, ~bus[\pitch_4],
				\out, ~bus[\masterSamples_4],
			],
			~pitchGrp
		);*/

		~masterSamples = Synth.new(
			\master,
			[
				\amp, 0,
				\width,4.0,
				\pos,0.2,
				\in, ~bus[\masterSamples],
				\out, ~bus[\masterSpat],//normalement master
			],
			~masterGrp
		);

		~masterSamples_2 = Synth.new(
			\master,
			[
				\amp, 0,
				\width,4.0,
				\pos,0.2,
				\in, ~bus[\masterSamples_2],
				\out, ~bus[\masterSpat],//normalement master
			],
			~masterGrp
		);

/*		~masterSamples_3 = Synth.new(
			\master,
			[
				\amp, 0,
				\width,4.0,
				\pos,0.2,
				\in, ~bus[\masterSamples_3],
				\out, ~bus[\masterSpat],//normalement master
			],
			~masterGrp
		);


		~masterSamples_4 = Synth.new(
			\master,
			[
				\amp, 0,
				\width,4.0,
				\pos,0.2,
				\in, ~bus[\masterSamples_4],
				\out, ~bus[\masterSpat],//normalement master
			],
			~masterGrp
		);*/

		~masterTransi = Synth.new(
			\master,
			[
				\amp, 0,
				\in, ~bus[\masterTransi],
				\out, ~bus[\masterSpat],
			],
			~masterGrp
		);

		~masterGranRadio = Synth.new(
			\master_spat,
			[
				\amp, 0,
				\hpf, 50,
				\in, ~bus[\gran_radio],
				\out, ~bus[\masterSpat],
			],
			~granGrp
		);

		~masterNappes = Synth.new(
			\master,
			[
				\amp, 0,
				\in, ~bus[\masterNappes],
				\out, ~bus[\masterNappes_bspat], //normalement master
			],
			~masterGrp
		);
		//master 4 caneaux nappes
		~masterNappes_bspat = Synth.new(
			\master_spat,
			[
				\amp, 0,
				\in, ~bus[\masterNappes_bspat],
				\out, ~bus[\masterSpat]
			],
			~masterGrp_bspat
		);
		///tous les master se réunissent ici
		~master = Synth.new(
			\master_spat,
			[
				\amp, 0,
				\in, ~bus[\masterSpat], //normalement masterspat
				\out, 0,
			],
			~masterGrpSpat
		);
		//une fraude pour le rec
		// ~master2 = Synth.new(
		// 	\radio_expend,
		// 	[
		// 		\amp, 0,
		// 		\in, ~bus[\rec_nappes], //normalement masterspat
		// 		\out, 0,
		// 	],
		// 	~masterGrpSpat
		// );
		// ~master3 = Synth.new(
		// 	\radio_expend,
		// 	[
		// 		\amp, 0,
		// 		\in, ~bus[\rec_gran], //normalement masterspat
		// 		\out, 0,
		// 	],
		// 	~masterGrpSpat
		// );
		/// pour le rec de l'album
/*	~rec_samples = Synth.new(
			\radio_expend,
			[
				\amp, 0,
				\in, ~bus[\rec_samples],
				\out, 4,
			],
			~masterGrpSpat
		);
	~rec_nappes = Synth.new(
			\radio_expend,
			[
				\amp, 0,
				\in, ~bus[\rec_nappes],
				\out, 6,
			],
			~masterGrpSpat
		);

		~rec_gran = Synth.new(
			\radio_expend,
			[
				\amp, 0,
				\in, ~bus[\rec_gran],
				\out, 8,
			],
			~masterGrpSpat
		);*/
	});
};
)


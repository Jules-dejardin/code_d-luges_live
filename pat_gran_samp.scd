~gs.do({ arg n; n.set(\gate, 0, \rel, 1) });
~gs.do({ arg n; n.set(\rate,10) });
~gs.do({ arg n; n.set(\rel,0.2) });
~gs.do({ arg n; n.set(\atk,0.2) });
(
			~recBuff_samp.zero;
			~gs =  3.collect({
				arg n;
				Synth(\granRadio, [
					\amp, -6,
					\buf, ~recBuff*_samp,
					\out, 0,
					\out2,0,
					\atk, 0.01,
					\rel, 0.3,
					\gate, 1,
					\sync, 1,
					\dens, exprand(30,50),
					\baseDur, exprand(0.02, 0.3),
					\durRand, 1,
					\rate, 1,
					\rateRand, 2.midiratio,
					// \bufIndex, ~bufenv[0].bufnum,
					\grainEnv, ~bufenv[0],
					\ptrBus, ~bus[\ptrBusSamp],
					\ptrSampleDelay, n.linlin(0,4,20000,s.sampleRate*2),
					\ptrRandSamples, 10000,
					\minPtrDelay, 2000
				],~masterGrp);
			});
		)
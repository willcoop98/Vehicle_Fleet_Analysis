component {

	/*
		vindecoder.cfc

		Description: Component for basic VIN decoding

		References:
		http://en.wikipedia.org/wiki/Vehicle_identification_number
		http://www.ecfr.gov/cgi-bin/retrieveECFR?gp=&SID=f73e7f39fe062586f0a95d147b0d98df&r=PART&n=pt49.6.565#sp49.6.565.b

	*/

  // Regular expressions:
  reVIN = '^[A-HJ-NPR-Z0-9]{17}$'; // Basic VIN
  reVIN_NA = '^[A-HJ-NPR-Z0-9]{8}[X0-9][A-HJ-NPR-TV-Y1-9][A-HJ-NPR-Z0-9]{7}$'; // North American VIN

	// Decoding data:
	_wmi = {
		regions : [
			{ regionCode : '[A-H]'
				, regionName : 'Africa'
				, countries : [
					{ code : 'A[A-H]', name : 'South Africa' }
					, { code : 'A[J-N]', name : 'Ivory Coast' }
					, { code : 'A[P-Z1-90]', name : '(not assigned)'}
					, { code : 'B[A-E]', name : 'Angola' }
					, { code : 'B[F-K]', name : 'Kenya' }
					, { code : 'B[L-R]', name : 'Tanzania' }
					, { code : 'B[S-Z1-90]', name : '(not assigned)' }
					, { code : 'C[A-E]', name : 'Benin' }
					, { code : 'C[F-K]', name : 'Madagascar' }
					, { code : 'C[L-R]', name : 'Tunisia' }
					, { code : 'C[S-Z1-90]', name : '(not assigned)' }
					, { code : 'D[A-E]', name : 'Egypt' }
					, { code : 'D[F-K]', name : 'Morocco' }
					, { code : 'D[L-R]', name : 'Zambia' }
					, { code : 'D[S-Z1-90]', name : '(not assigned)' }
					, { code : 'E[A-E]', name : 'Ethiopia' }
					, { code : 'E[F-K]', name : 'Mozambique' }
					, { code : 'E[L-Z1-90]', name : '(not assigned)' }
					, { code : 'F[A-E]', name : 'Ghana' }
					, { code : 'F[F-K]', name : 'Nigeria' }
					, { code : 'F[L-Z1-90]', name : '(not assigned)' }
					, { code : 'G[A-Z1-90]', name : '(not assigned)' }
					, { code : 'H[A-Z1-90]', name : '(not assigned)' }
				]
			}
			, { regionCode : '[J-R]'
				, regionName : 'Asia'
				, countries : [
					{ code : 'J[A-Z1-90]', name : 'Japan' }
					, { code : 'K[A-E]', name : 'Sri Lanka' }
					, { code : 'K[F-K]', name : 'Israel' }
					, { code : 'K[L-R]', name : 'Korea (South)' }
					, { code : 'K[S-Z1-90]', name : 'Kazakhstan' }
					, { code : 'L[A-Z1-90]', name : 'China' }
					, { code : 'M[A-E]', name : 'India' }
					, { code : 'M[F-K]', name : 'Indonesia' }
					, { code : 'M[L-R]', name : 'Thailand' }
					, { code : 'M[S-Z1-90]', name : '(not assigned)' }
					, { code : 'N[A-E]', name : 'Iran' }
					, { code : 'N[F-K]', name : 'Pakistan' }
					, { code : 'N[L-R]', name : 'Turkey' }
					, { code : 'N[S-Z1-90]', name : '(not assigned)' }
					, { code : 'P[A-E]', name : 'Philippines' }
					, { code : 'P[F-K]', name : 'Singapore' }
					, { code : 'P[L-R]', name : 'Malaysia' }
					, { code : 'P[S-Z1-90]', name : '(not assigned)' }
					, { code : 'R[A-E]', name : 'United Arab Emirates' }
					, { code : 'R[F-K]', name : 'Taiwan' }
					, { code : 'R[L-R]', name : 'Vietnam' }
					, { code : 'R[S-Z1-90]', name : 'Saudi Arabia' }
				]
			}
			, { regionCode : '[S-Z]'
				, regionName : 'Europe'
				, countries : [
					{ code : 'S[A-M]', name : 'United Kingdom' }
					, { code : 'S[N-T]', name : 'East Germany' }
					, { code : 'S[U-Z]', name : 'Poland' }
					, { code : 'S[1-4]', name : 'Latvia' }
					, { code : 'S[5-90]', name : '(not assigned)' }
					, { code : 'T[A-H]', name : 'Switzerland' }
					, { code : 'T[J-P]', name : 'Czech Republic' }
					, { code : 'T[R-V]', name : 'Hungary' }
					, { code : 'T[W-Z1]', name : 'Portugal' }
					, { code : 'T[2-90]', name : '(not assigned)' }
					, { code : 'U[A-G]', name : '(not assigned)' }
					, { code : 'U[H-M]', name : 'Denmark' }
					, { code : 'U[N-T]', name : 'Ireland' }
					, { code : 'U[U-Z]', name : 'Romania' }
					, { code : 'U[1-4]', name : '(not assigned)' }
					, { code : 'U[5-7]', name : 'Slovakia' }
					, { code : 'U[890]', name : '(not assigned)' }
					, { code : 'V[A-E]', name : 'Austria' }
					, { code : 'V[F-R]', name : 'France' }
					, { code : 'V[S-W]', name : 'Spain' }
					, { code : 'V[X-Z12]', name : 'Serbia' }
					, { code : 'V[345]', name : 'Croatia' }
					, { code : 'V[6-90]', name : 'Estonia' }
					, { code : 'W[A-Z1-90]', name : 'West Germany' }
					, { code : 'X[A-E]', name : 'Bulgaria' }
					, { code : 'X[F-K]', name : 'Greece' }
					, { code : 'X[L-R]', name : 'Netherlands' }
					, { code : 'X[S-W]', name : 'USSR' }
					, { code : 'X[X-Z12]', name : 'Luxembourg' }
					, { code : 'X[3-90]', name : 'Russia' }
					, { code : 'Y[A-E]', name : 'Belgium' }
					, { code : 'Y[F-K]', name : 'Finland' }
					, { code : 'Y[L-R]', name : 'Malta' }
					, { code : 'Y[S-W]', name : 'Sweden' }
					, { code : 'Y[X-Z12]', name : 'Norway' }
					, { code : 'Y[345]', name : 'Belarus' }
					, { code : 'Y[6-90]', name : 'Ukraine' }
					, { code : 'Z[A-R]', name : 'Italy' }
					, { code : 'Z[S-W]', name : '(not assigned)' }
					, { code : 'Z[X-Z12]', name : 'Slovenia' }
					, { code : 'Z[345]', name : 'Lithuania' }
					, { code : 'Z[6-90]', name : '(not assigned)' }
				]
			}
			, { regionCode : '[1-5]'
				, regionName : 'North America'
				, countries : [
					{ code : '1[A-Z1-90]', name : 'United States' }
					, { code : '2[A-Z1-90]', name : 'Canada' }
					, { code : '3[A-Z1-7]', name : 'Mexico' }
					, { code : '3[89]', name : 'Cayman Islands' }
					, { code : '4[A-Z1-90]', name : 'United States' }
					, { code : '5[A-Z1-90]', name : 'United States' }
				]
			}
			, { regionCode : '[67]'
				, regionName : 'Oceania'
				, countries : [
					{ code : '6[A-W]', name : 'Australia' }
					, { code : '6[X-Z1-90]', name : '(not assigned)' }
					, { code : '7[A-E]', name : 'New Zealand' }
					, { code : '7[F-Z1-90]', name : '(not assigned)' }
				]
			}
			, { regionCode : '[89]'
				, regionName : 'South America'
				, countries : [
					{ code : '8[A-E]', name : 'Argentina' }
					, { code : '8[F-K]', name : 'Chile' }
					, { code : '8[L-R]', name : 'Ecuador' }
					, { code : '8[S-W]', name : 'Peru' }
					, { code : '8[X-Z12]', name : 'Venezuela' }
					, { code : '8[3-90]', name : '(not assigned)' }
					, { code : '9[A-E]', name : 'Brazil' }
					, { code : '9[F-K]', name : 'Colombia' }
					, { code : '9[L-R]', name : 'Paraguay' }
					, { code : '9[S-W]', name : 'Uruguay' }
					, { code : '9[X-Z12]', name : 'Trinidad & Tobago' }
					, { code : '9[3–9]', name : 'Brazil' }
					, { code : '90', name : '(not assigned)' }
				]
			}
		]
		, manufacturers : [
			// IN PROGRESS: provide 'short' names, where appropriate
		  { code : 'AAV',   shortName : 'Volkswagen', name : 'Volkswagen South Africa' }
		  , { code : 'AC5', shortName : 'Hyundai', name : 'Hyundai South Africa' }
		  , { code : 'ADD', shortName : 'Hyundai', name : 'Hyundai South Africa' }
		  , { code : 'AFA', shortName : 'Ford', name : 'Ford South Africa' }
		  , { code : 'AHT', shortName : 'Toyota', name : 'Toyota South Africa' }
		  , { code : 'JA3', name : 'Mitsubishi' }
		  , { code : 'JA4', name : 'Mitsubishi' }
		  , { code : 'JA',  name : 'Isuzu' }
		  , { code : 'JD',  name : 'Daihatsu' }
		  , { code : 'JF',  name : 'Fuji Heavy Industries (Subaru)' }
		  , { code : 'JH[L-M]',  name : 'Honda' }
		  , { code : 'JK',  shortName : 'Kawasaki', name : 'Kawasaki (motorcycles)' }
		  , { code : 'JL5', shortName : 'Mitsubishi', name : 'Mitsubishi Fuso' }
		  , { code : 'JMB', shortName : 'Mitsubishi', name : 'Mitsubishi Motors' }
		  , { code : 'JMY', shortName : 'Mitsubishi', name : 'Mitsubishi Motors' }
		  , { code : 'JMZ', name : 'Mazda' }
		  , { code : 'JN',  name : 'Nissan' }
		  , { code : 'JS',  name : 'Suzuki' }
		  , { code : 'JT',  name : 'Toyota' }
		  , { code : 'JY',  shortName : 'Yamaha', name : 'Yamaha (motorcycles)' }
		  , { code : 'KL',  shortName : 'Daewoo', name : 'Daewoo General Motors South Korea' }
		  , { code : 'KM',  shortName : 'Hyundai', name : 'Hyundai' }
		  , { code : 'KMY', shortName : 'Daelim', name : 'Daelim (motorcycles)' }
		  , { code : 'KM1', shortName : 'Hyosung', name : 'Hyosung (motorcycles)' }
		  , { code : 'KN',  name : 'Kia' }
		  , { code : 'KNM', shortName : 'Renault', name : 'Renault Samsung' }
		  , { code : 'KPA', name : 'SsangYong' }
		  , { code : 'KPT', name : 'SsangYong' }
		  , { code : 'LAN', name : 'Changzhou Yamasaki Motorcycle' }
		  , { code : 'LBB', name : 'Zhejiang Qianjiang Motorcycle (Keeway/Generic)' }
		  , { code : 'LBE', name : 'Beijing Hyundai' }
		  , { code : 'LBM', name : 'Zongshen Piaggio' }
		  , { code : 'LBP', name : 'Chongqing Jainshe Yamaha (motorcycles)' }
		  , { code : 'LB2', name : 'Geely Motorcycles' }
		  , { code : 'LCE', name : 'Hangzhou Chunfeng Motorcycles (CFMOTO)' }
		  , { code : 'LDC', name : 'Dong Feng Peugeot Citroen (DPCA), China' }
		  , { code : 'LDD', name : 'Dandong Huanghai Automobile' }
		  , { code : 'LDN', name : 'SouEast Motor' }
		  , { code : 'LDY', name : 'Zhongtong Coach, China' }
		  , { code : 'LET', name : 'Jiangling-Isuzu Motors, China' }
		  , { code : 'LE4', name : 'Beijing Benz, China' }
		  , { code : 'LFB', name : 'FAW, China (busses)' }
		  , { code : 'LFG', name : 'Taizhou Chuanl Motorcycle Manufacturing' }
		  , { code : 'LFP', name : 'FAW, China (passenger vehicles)' }
		  , { code : 'LFT', name : 'FAW, China (trailers)' }
		  , { code : 'LFV', name : 'FAW-Volkswagen, China' }
		  , { code : 'LFW', name : 'FAW JieFang, China' }
		  , { code : 'LFY', name : 'Changshu Light Motorcycle Factory' }
		  , { code : 'LGB', name : 'Dong Feng (DFM), China' }
		  , { code : 'LGH', name : 'Qoros (formerly Dong Feng (DFM)), China' }
		  , { code : 'LGX', name : 'BYD Auto, China' }
		  , { code : 'LHB', name : 'Beijing Automotive Industry Holding' }
		  , { code : 'LH1', name : 'FAW-Haima, China' }
		  , { code : 'LJC', shortName : 'JAC', name : 'JAC, China' }
		  , { code : 'LJ1', shortName : 'JAC', name : 'JAC, China' }
		  , { code : 'LKL', name : 'Suzhou King Long, China' }
		  , { code : 'LL6', name : 'Hunan Changfeng Manufacture Joint-Stock' }
		  , { code : 'LL8', name : 'Linhai (ATV)' }
		  , { code : 'LMC', name : 'Suzuki Hong Kong (motorcycles)' }
		  , { code : 'LPR', shortName : 'Yamaha', name : 'Yamaha Hong Kong (motorcycles)' }
		  , { code : 'LSG', name : 'Shanghai General Motors, China' }
		  , { code : 'LSJ', name : 'MG Motor UK Limited - SAIC Motor, Shanghai, China' }
		  , { code : 'LSV', shortName : 'Volkswagen', name : 'Shanghai Volkswagen, China' }
		  , { code : 'LSY', shortName : 'Brilliance', name : 'Brilliance Zhonghua' }
		  , { code : 'LTV', shortName : 'Toyota', name : 'Toyota Tian Jin' }
		  , { code : 'LUC', name : 'Guangqi Honda, China' }
		  , { code : 'LVS', shortName : 'Ford', name : 'Ford Chang An' }
		  , { code : 'LVV', name : 'Chery, China' }
		  , { code : 'LVZ', name : 'Dong Feng Sokon Motor Company (DFSK)' }
		  , { code : 'LZM', shortName : 'MAN', name : 'MAN China' }
		  , { code : 'LZE', name : 'Isuzu Guangzhou, China' }
		  , { code : 'LZG', name : 'Shaanxi Automobile Group, China' }
		  , { code : 'LZP', name : 'Zhongshan Guochi Motorcycle (Baotian)' }
		  , { code : 'LZY', name : 'Yutong Zhengzhou, China' }
		  , { code : 'LZZ', name : 'Chongqing Shuangzing Mech & Elec (Howo)' }
		  , { code : 'L4B', name : 'Xingyue Group (motorcycles)' }
		  , { code : 'L5C', name : 'KangDi (ATV)' }
		  , { code : 'L5K', name : 'Zhejiang Yongkang Easy Vehicle' }
		  , { code : 'L5N', name : 'Zhejiang Taotao, China (ATV & motorcycles)' }
		  , { code : 'L5Y', name : 'Merato Motorcycle Taizhou Zhongneng' }
		  , { code : 'L85', name : 'Zhejiang Yongkang Huabao Electric Appliance' }
		  , { code : 'L8X', name : 'Zhejiang Summit Huawin Motorcycle' }
		  , { code : 'MAB', shortName : 'Mahindra', name : 'Mahindra & Mahindra' }
		  , { code : 'MAC', shortName : 'Mahindra', name : 'Mahindra & Mahindra' }
		  , { code : 'MAJ', shortName : 'Ford', name : 'Ford India' }
		  , { code : 'MAK', name : 'Honda Siel Cars India' }
		  , { code : 'MAL', name : 'Hyundai' }
		  , { code : 'MAT', shortName : 'Tata', name : 'Tata Motors' }
		  , { code : 'MA1', shortName : 'Mahindra', name : 'Mahindra & Mahindra' }
		  , { code : 'MA3', shortName : 'Suzuki', name : 'Suzuki India (Maruti)' }
		  , { code : 'MA6', shortName : 'GMC', name : 'GM India' }
		  , { code : 'MA7', shortName : 'Mitsubishi', name : 'Mitsubishi India (formerly Honda)' }
		  , { code : 'MBH', shortName : 'Suzuki', name : 'Suzuki India (Maruti)' }
		  , { code : 'MBJ', shortName : 'Toyota', name : 'Toyota India' }
		  , { code : 'MBR', shortName : 'Mercedez-Benz', name : 'Mercedes-Benz India' }
		  , { code : 'MB1', name : 'Ashok Leyland' }
		  , { code : 'MCA', shortName : 'Fiat', name : 'Fiat India' }
		  , { code : 'MCB', name : 'GM India' }
		  , { code : 'MC2', shortName : 'Volvo', name : 'Volvo Eicher commercial vehicles limited.' }
		  , { code : 'MDH', shortName : 'Nissan', name : 'Nissan India' }
		  , { code : 'MD2', name : 'Bajaj Auto' }
		  , { code : 'MEE', shortName : 'Renault', name : 'Renault India' }
		  , { code : 'MEX', shortName : 'Volkswagen', name : 'Volkswagen India' }
		  , { code : 'MHF', shortName : 'Toyota', name : 'Toyota Indonesia' }
		  , { code : 'MHR', shortName : 'Honda', name : 'Honda Indonesia' }
		  , { code : 'MLC', shortName : 'Suzuki', name : 'Suzuki Thailand' }
		  , { code : 'MLH', shortName : 'Honda', name : 'Honda Thailand' }
		  , { code : 'MMB', shortName : 'Mitsubishi', name : 'Mitsubishi Thailand' }
		  , { code : 'MMC', shortName : 'Mitsubishi', name : 'Mitsubishi Thailand' }
		  , { code : 'MMM', shortName : 'Chevrolet', name : 'Chevrolet Thailand' }
		  , { code : 'MMT', shortName : 'Mitsubishi', name : 'Mitsubishi Thailand' }
		  , { code : 'MM8', shortName : 'Mazda', name : 'Mazda Thailand' }
		  , { code : 'MNB', shortName : 'Ford', name : 'Ford Thailand' }
		  , { code : 'MNT', shortName : 'Nissan', name : 'Nissan Thailand' }
		  , { code : 'MPA', shortName : 'Isuzu', name : 'Isuzu Thailand' }
		  , { code : 'MP1', shortName : 'Isuzu', name : 'Isuzu Thailand' }
		  , { code : 'MRH', shortName : 'Honda', name : 'Honda Thailand' }
		  , { code : 'MR0', shortName : 'Toyota', name : 'Toyota Thailand' }
		  , { code : 'NLA', shortName : 'Honda', name : 'Honda Turkiye' }
		  , { code : 'NLE', shortName : 'Mercedez-Benz', name : 'Mercedes-Benz Turk Truck' }
		  , { code : 'NLH', shortName : 'Hyundai', name : 'Hyundai Assan' }
		  , { code : 'NM0', shortName : 'Ford', name : 'Ford Turkey' }
		  , { code : 'NM4', name : 'Tofas Turk' }
		  , { code : 'NMT', shortName : 'Toyota', name : 'Toyota Turkiye' }
		  , { code : 'PE1', shortName : 'Ford', name : 'Ford Phillipines' }
		  , { code : 'PE3', shortName : 'Mazda', name : 'Mazda Phillipines' }
		  , { code : 'PL1', name : 'Proton, Malaysia' }
		  , { code : 'PNA', name : 'NAZA, Malaysia (Peugeot)' }
		  , { code : 'RFB', name : 'Kymco, Taiwan' }
		  , { code : 'RFG', name : 'Sanyang SYM, Taiwan' }
		  , { code : 'RFL', name : 'Adly, Taiwan' }
		  , { code : 'RFT', name : 'CPI, Taiwan' }
		  , { code : 'RF3', name : 'Aeon Motor, Taiwan' }
		  , { code : 'SAL', name : 'Land Rover' }
		  , { code : 'SAJ', name : 'Jaguar' }
		  , { code : 'SAR', name : 'Rover' }
		  , { code : 'SB1', shortName : 'Toyota', name : 'Toyota UK' }
		  , { code : 'SBM', name : 'McLaren' }
		  , { code : 'SCA', name : 'Rolls Royce' }
		  , { code : 'SCB', name : 'Bentley' }
		  , { code : 'SCC', name : 'Lotus Cars' }
		  , { code : 'SCE', name : 'DeLorean Motor Cars N. Ireland (UK)' }
		  , { code : 'SCF', name : 'Aston' }
		  , { code : 'SDB', name : 'Peugeot UK (formerly Talbot)' }
		  , { code : 'SED', shortName : 'GMC', name : 'General Motors Luton Plant' }
		  , { code : 'SEY', name : 'LDV' }
		  , { code : 'SFA', shortName : 'Ford', name : 'Ford UK' }
		  , { code : 'SFD', name : 'Alexander Dennis UK' }
		  , { code : 'SHH', shortName : 'Honda', name : 'Honda UK' }
		  , { code : 'SHS', shortName : 'Honda', name : 'Honda UK' }
		  , { code : 'SJN', shortName : 'Nissan', name : 'Nissan UK' }
		  , { code : 'SKF', name : 'Vauxhall' }
		  , { code : 'SLP', name : 'JCB Research UK' }
		  , { code : 'SMT', name : 'Triumph Motorcycles' }
		  , { code : 'SUF', shortName : 'Fiat', name : 'Fiat Auto Poland' }
		  , { code : 'SUL', name : 'FSC (Poland)' }
		  , { code : 'SUP', shortName : 'Daewoo', name : 'FSO-Daewoo (Poland)' }
		  , { code : 'SUU', name : 'Solaris Bus & Coach (Poland)' }
		  , { code : 'TCC', name : 'Micro Compact Car AG (smart 1998-1999)' }
		  , { code : 'TDM', name : 'QUANTYA Swiss Electric Movement (Switzerland)' }
		  , { code : 'TMA', shortName : 'Hyundai', name : 'Hyundai Motor Manufacturing Czech' }
		  , { code : 'TMB', name : 'Skoda (Czech Republic)' }
		  , { code : 'TMK', name : 'Karosa (Czech Republic)' }
		  , { code : 'TMP', name : 'Skoda trolleybuses (Czech Republic)' }
		  , { code : 'TMT', name : 'Tatra (Czech Republic)' }
		  , { code : 'TM9', name : 'Skoda trolleybuses (Czech Republic)' }
		  , { code : 'TNE', name : 'TAZ' }
		  , { code : 'TN9', name : 'Karosa (Czech Republic)' }
		  , { code : 'TRA', name : 'Ikarus Bus' }
		  , { code : 'TRU', name : 'Audi Hungary' }
		  , { code : 'TSE', name : 'Ikarus Egyedi Autobuszgyar, (Hungary)' }
		  , { code : 'TSM', shortName : 'Suzuki', name : 'Suzuki Hungary' }
		  , { code : 'TW1', shortName : 'Toyota', name : 'Toyota Caetano Portugal' }
		  , { code : 'TYA', shortName : 'Mitsubishi', name : 'Mitsubishi Trucks Portugal' }
		  , { code : 'TYB', shortName : 'Mitsubishi', name : 'Mitsubishi Trucks Portugal' }
		  , { code : 'UU1', shortName : 'Renault', name : 'Renault Dacia, (Romania)' }
		  , { code : 'UU3', name : 'ARO' }
		  , { code : 'UU6', shortName : 'Daewoo', name : 'Daewoo Romania' }
		  , { code : 'U5Y', name : 'Kia Motors Slovakia' }
		  , { code : 'U6Y', name : 'Kia Motors Slovakia' }
		  , { code : 'VAG', name : 'Magna Steyr Puch' }
		  , { code : 'VAN', shortName : 'MAN', name : 'MAN Austria' }
		  , { code : 'VBK', name : 'KTM (Motorcycles)' }
		  , { code : 'VF1', name : 'Renault' }
		  , { code : 'VF2', name : 'Renault' }
		  , { code : 'VF3', name : 'Peugeot' }
		  , { code : 'VF4', name : 'Talbot' }
		  , { code : 'VF6', shortName : 'Renault', name : 'Renault (Trucks & Buses)' }
		  , { code : 'VF7', name : 'Citroen' }
		  , { code : 'VF8', name : 'Matra' }
		  , { code : 'VF9/795', name : 'Bugatti' }
		  , { code : 'VG5', name : 'MBK (motorcycles)' }
		  , { code : 'VLU', shortName : 'Scania', name : 'Scania France' }
		  , { code : 'VN1', name : 'SOVAB (France)' }
		  , { code : 'VNE', name : 'Irisbus (France)' }
		  , { code : 'VNK', shortName : 'Toyota', name : 'Toyota France' }
		  , { code : 'VNV', shortName : 'Renault', name : 'Renault-Nissan' }
		  , { code : 'VSA', shortName : 'Mercedez-Benz', name : 'Mercedes-Benz Spain' }
		  , { code : 'VSE', shortName : 'Suzuki', name : 'Suzuki Spain (Santana Motors)' }
		  , { code : 'VSK', shortName : 'Nissan', name : 'Nissan Spain' }
		  , { code : 'VSS', name : 'SEAT' }
		  , { code : 'VSX', shortName : 'Opel', name : 'Opel Spain' }
		  , { code : 'VS6', shortName : 'Ford', name : 'Ford Spain' }
		  , { code : 'VS7', shortName : 'Citroen', name : 'Citroen Spain' }
		  , { code : 'VS9', name : 'Carrocerias Ayats (Spain)' }
		  , { code : 'VTH', name : 'Derbi (motorcycles)' }
		  , { code : 'VTT', shortName : 'Suzuki', name : 'Suzuki Spain (motorcycles)' }
		  , { code : 'VV9', name : 'TAURO Spain' }
		  , { code : 'VWA', shortName : 'Nissan', name : 'Nissan Spain' }
		  , { code : 'VWV', shortName : 'Volkswagen', name : 'Volkswagen Spain' }
		  , { code : 'VX1', name : 'Zastava / Yugo Serbia' }
		  , { code : 'WAG', name : 'Neoplan' }
		  , { code : 'WAU', name : 'Audi' }
		  , { code : 'WA1', shortName : 'Audi', name : 'Audi SUV' }
		  , { code : 'WBA', name : 'BMW' }
		  , { code : 'WBS', shortName : 'BMW', name : 'BMW M' }
		  , { code : 'WDA', name : 'Daimler' }
		  , { code : 'WDB', name : 'Mercedes-Benz' }
		  , { code : 'WDC', name : 'DaimlerChrysler' }
		  , { code : 'WDD', name : 'Mercedes-Benz' }
		  , { code : 'WDF', shortName : 'Mercedez-Benz', name : 'Mercedes-Benz (commercial vehicles)' }
		  , { code : 'WEB', name : 'Evobus GmbH (Mercedes-Bus)' }
		  , { code : 'WJM', name : 'Iveco Magirus' }
		  , { code : 'WF0', shortName : 'Ford', name : 'Ford Germany' }
		  , { code : 'WMA', shortName : 'MAN', name : 'MAN Germany' }
		  , { code : 'WME', name : 'smart' }
		  , { code : 'WMW', name : 'MINI' }
		  , { code : 'WMX', name : 'Mercedes-AMG' }
		  , { code : 'WP0', name : 'Porsche' }
		  , { code : 'WP1', shortName : 'Porsche', name : 'Porsche SUV' }
		  , { code : 'W0L', name : 'Opel' }
		  , { code : 'WUA', name : 'quattro GmbH' }
		  , { code : 'WVG', shortName : 'Volkswagen', name : 'Volkswagen MPV/SUV' }
		  , { code : 'WVW', name : 'Volkswagen' }
		  , { code : 'WV1', shortName : 'Volkswagen', name : 'Volkswagen Commercial Vehicles' }
		  , { code : 'WV2', shortName : 'Volkswagen', name : 'Volkswagen Bus/Van' }
		  , { code : 'WV3', shortName : 'Volkswagen', name : 'Volkswagen Trucks' }
		  , { code : 'XLB', shortName : 'Volvo', name : 'Volvo (NedCar)' }
		  , { code : 'XLE', shortName : 'Scania', name : 'Scania Netherlands' }
		  , { code : 'XLR', name : 'DAF (trucks)' }
		  , { code : 'XL9/363', name : 'Spyker' }
		  , { code : 'XMC', shortName : 'Mitsubishi', name : 'Mitsubishi (NedCar)' }
		  , { code : 'XTA', name : 'Lada/AutoVaz (Russia)' }
		  , { code : 'XTT', name : 'UAZ/Sollers (Russia)' }
		  , { code : 'XUF', shortName : 'GMC', name : 'General Motors Russia' }
		  , { code : 'XUU', name : 'AvtoTor (Russia, General Motors SKD)' }
		  , { code : 'XW8', shortName : 'Volkswagen', name : 'Volkswagen Group Russia' }
		  , { code : 'XWB', shortName : 'Daewoo', name : 'UZ-Daewoo (Uzbekistan)' }
		  , { code : 'XWE', name : 'AvtoTor (Russia, Hyundai-Kia SKD)' }
		  , { code : 'X4X', name : 'AvtoTor (Russia, BMW SKD)' }
		  , { code : 'X7L', shortName : 'Renault', name : 'Renault AvtoFramos (Russia)' }
		  , { code : 'X7M', shortName : 'Hyundai', name : 'Hyundai TagAZ (Russia)' }
		  , { code : 'YBW', shortName : 'Volkswagen', name : 'Volkswagen Belgium' }
		  , { code : 'YCM', shortName : 'Mazda', name : 'Mazda Belgium' }
		  , { code : 'YE2', shortName : 'Van Hool', name : 'Van Hool (buses)' }
		  , { code : 'YK1', shortName : 'Saab', name : 'Saab-Valmet Finland' }
		  , { code : 'YS2', shortName : 'Scania', name : 'Scania AB' }
		  , { code : 'YS3', name : 'Saab' }
		  , { code : 'YS4', shortName : 'Scania', name : 'Scania Bus' }
		  , { code : 'YTN', shortName : 'Saab', name : 'Saab NEVS' }
		  , { code : 'YT9/007', name : 'Koenigsegg' }
		  , { code : 'YU7', shortName : 'Husaberg', name : 'Husaberg (motorcycles)' }
		  , { code : 'YV1', shortName : 'Volvo', name : 'Volvo Cars' }
		  , { code : 'YV4', shortName : 'Volvo', name : 'Volvo Cars' }
		  , { code : 'YV2', shortName : 'Volvo', name : 'Volvo Trucks' }
		  , { code : 'YV3', shortName : 'Volvo', name : 'Volvo Buses' }
		  , { code : 'Y6D', name : 'Zaporozhets/AvtoZAZ (Ukraine)' }
		  , { code : 'ZAA', name : 'Autobianchi' }
		  , { code : 'ZAM', name : 'Maserati' }
		  , { code : 'ZAP', name : 'Piaggio/Vespa/Gilera' }
		  , { code : 'ZAR', name : 'Alfa Romeo' }
		  , { code : 'ZBN', name : 'Benelli' }
		  , { code : 'ZCG', name : 'Cagiva SpA / MV Agusta' }
		  , { code : 'ZCF', name : 'Iveco' }
		  , { code : 'ZDM', name : 'Ducati Motor Holdings SpA' }
		  , { code : 'ZDF', name : 'Ferrari Dino' }
		  , { code : 'ZD0', shortName : 'Yamaha', name : 'Yamaha Italy' }
		  , { code : 'ZD3', name : 'Beta Motor' }
		  , { code : 'ZD4', name : 'Aprilia' }
		  , { code : 'ZFA', name : 'Fiat' }
		  , { code : 'ZFC', shortName : 'Fiat', name : 'Fiat V.I.' }
		  , { code : 'ZFF', name : 'Ferrari' }
		  , { code : 'ZGU', name : 'Moto Guzzi' }
		  , { code : 'ZHW', name : 'Lamborghini' }
		  , { code : 'ZJM', name : 'Malaguti' }
		  , { code : 'ZJN', name : 'Innocenti' }
		  , { code : 'ZKH', shortName : 'Husqvarna', name : 'Husqvarna Motorcycles Italy' }
		  , { code : 'ZLA', name : 'Lancia' }
		  , { code : 'ZOM', name : 'OM' }
		  , { code : 'Z8M', shortName : 'Marussia', name : 'Marussia (Russia)' }
		  , { code : '1B3', name : 'Dodge' }
		  , { code : '1C3', name : 'Chrysler' }
		  , { code : '1C6', name : 'Chrysler' }
		  , { code : '1D3', name : 'Dodge' }
		  , { code : '1FA', shortName : 'Ford', name : 'Ford Motor Company' }
		  , { code : '1FB', shortName : 'Ford', name : 'Ford Motor Company' }
		  , { code : '1FC', shortName : 'Ford', name : 'Ford Motor Company' }
		  , { code : '1FD', shortName : 'Ford', name : 'Ford Motor Company' }
		  , { code : '1FM', shortName : 'Ford', name : 'Ford Motor Company' }
		  , { code : '1FT', shortName : 'Ford', name : 'Ford Motor Company' }
		  , { code : '1FU', name : 'Freightliner' }
		  , { code : '1FV', name : 'Freightliner' }
		  , { code : '1F9', name : 'FWD Corp.' }
		  , { code : '1G',  shortName : 'GMC', name : 'General Motors USA' }
		  , { code : '1GC', shortName : 'Chevrolet', name : 'Chevrolet Truck USA' }
		  , { code : '1GT', shortName : 'GMC', name : 'GMC Truck USA' }
		  , { code : '1G1', shortName : 'Chevrolet', name : 'Chevrolet USA' }
		  , { code : '1G2', shortName : 'Pontiac', name : 'Pontiac USA' }
		  , { code : '1G3', shortName : 'Oldsmobile', name : 'Oldsmobile USA' }
		  , { code : '1G4', shortName : 'Buick', name : 'Buick USA' }
		  , { code : '1G6', shortName : 'Cadillac', name : 'Cadillac USA' }
		  , { code : '1G8', shortName : 'Saturn', name : 'Saturn USA' }
		  , { code : '1GM', shortName : 'Pontiac', name : 'Pontiac USA' }
		  , { code : '1GY', shortName : 'Cadillac', name : 'Cadillac USA' }
		  , { code : '1H',  shortName : 'Honda', name : 'Honda USA' }
		  , { code : '1HD', name : 'Harley-Davidson' }
		  , { code : '1J4', name : 'Jeep' }
		  , { code : '1L',  shortName : 'Lincoln', name : 'Lincoln USA' }
		  , { code : '1ME', shortName : 'Mercury', name : 'Mercury USA' }
		  , { code : '1M1', shortName : 'Mack', name : 'Mack Truck USA' }
		  , { code : '1M2', shortName : 'Mack', name : 'Mack Truck USA' }
		  , { code : '1M3', shortName : 'Mack', name : 'Mack Truck USA' }
		  , { code : '1M4', shortName : 'Mack', name : 'Mack Truck USA' }
		  , { code : '1M9', name : 'Mynatt Truck & Equipment' }
		  , { code : '1N',  shortName : 'Nissan', name : 'Nissan USA' }
		  , { code : '1NX', name : 'NUMMI USA' }
		  , { code : '1P3', shortName : 'Plymouth', name : 'Plymouth USA' }
		  , { code : '1R9', name : 'Roadrunner Hay Squeeze USA' }
		  , { code : '1VW', shortName : 'Volkswagen', name : 'Volkswagen USA' }
		  , { code : '1XK', shortName : 'Kenworth', name : 'Kenworth USA' }
		  , { code : '1XP', shortName : 'Peterbilt', name : 'Peterbilt USA' }
		  , { code : '1YV', shortName : 'Mazda', name : 'Mazda USA (AutoAlliance International)' }
		  , { code : '1ZV', shortName : 'Ford', name : 'Ford (AutoAlliance International)' }
		  , { code : '2A4', shortName : 'Chrysler', name : 'Chrysler Canada' }
		  , { code : '2B3', shortName : 'Dodge', name : 'Dodge Canada' }
		  , { code : '2B7', shortName : 'Dodge', name : 'Dodge Canada' }
		  , { code : '2C3', shortName : 'Chrysler', name : 'Chrysler Canada' }
		  , { code : '2CN', name : 'CAMI' }
		  , { code : '2D3', shortName : 'Dodge', name : 'Dodge Canada' }
		  , { code : '2FA', shortName : 'Ford', name : 'Ford Motor Company Canada' }
		  , { code : '2FB', shortName : 'Ford', name : 'Ford Motor Company Canada' }
		  , { code : '2FC', shortName : 'Ford', name : 'Ford Motor Company Canada' }
		  , { code : '2FM', shortName : 'Ford', name : 'Ford Motor Company Canada' }
		  , { code : '2FT', shortName : 'Ford', name : 'Ford Motor Company Canada' }
		  , { code : '2FU', name : 'Freightliner' }
		  , { code : '2FV', name : 'Freightliner' }
		  , { code : '2FZ', name : 'Sterling' }
		  , { code : '2G',  shortName : 'GMC', name : 'General Motors Canada' }
		  , { code : '2G1', shortName : 'Chevrolet', name : 'Chevrolet Canada' }
		  , { code : '2G2', shortName : 'Pontiac', name : 'Pontiac Canada' }
		  , { code : '2G3', shortName : 'Oldsmobile', name : 'Oldsmobile Canada' }
		  , { code : '2G4', shortName : 'Buick', name : 'Buick Canada' }
		  , { code : '2HG', shortName : 'Honda', name : 'Honda Canada' }
		  , { code : '2HK', shortName : 'Honda', name : 'Honda Canada' }
		  , { code : '2HJ', shortName : 'Honda', name : 'Honda Canada' }
		  , { code : '2HM', shortName : 'Hyundai', name : 'Hyundai Canada' }
		  , { code : '2MG', shortName : 'MCI', name : 'Motor Coach Industries Limited' }
		  , { code : '2NV', shortName : 'Nova Bus', name : 'Nova Bus Canada' }
		  , { code : '2P3', shortName : 'Plymouth', name : 'Plymouth Canada' }
		  , { code : '2T',  shortName : 'Toyota', name : 'Toyota Canada' }
		  , { code : '2V4', shortName : 'Volkswagen', name : 'Volkswagen Canada' }
		  , { code : '2V8', shortName : 'Volkswagen', name : 'Volkswagen Canada' }
		  , { code : '2WK', name : 'Western Star' }
		  , { code : '2WL', name : 'Western Star' }
		  , { code : '2WM', name : 'Western Star' }
		  , { code : '3C4', shortName : 'Chrysler', name : 'Chrysler Mexico' }
		  , { code : '3D3', shortName : 'Dodge', name : 'Dodge Mexico' }
		  , { code : '3FA', shortName : 'Ford', name : 'Ford Motor Company Mexico' }
		  , { code : '3FE', shortName : 'Ford', name : 'Ford Motor Company Mexico' }
		  , { code : '3G',  shortName : 'GMC', name : 'General Motors Mexico' }
		  , { code : '3H',  shortName : 'Honda', name : 'Honda Mexico' }
		  , { code : '3JB', name : 'BRP Mexico (all-terrain vehicles)' }
		  , { code : '3MZ', shortName : 'Mazda', name : 'Mazda Mexico' }
		  , { code : '3N',  shortName : 'Nissan', name : 'Nissan Mexico' }
		  , { code : '3P3', shortName : 'Plymouth', name : 'Plymouth Mexico' }
		  , { code : '3VW', shortName : 'Volkswagen', name : 'Volkswagen Mexico' }
		  , { code : '4F',  shortName : 'Mazda', name : 'Mazda USA' }
		  , { code : '4JG', shortName : 'Mercedez-Benz', name : 'Mercedes-Benz USA' }
		  , { code : '4RK', shortName : 'Nova Bus', name : 'Nova Bus USA' }
		  , { code : '4S',  name : 'Subaru-Isuzu Automotive' }
		  , { code : '4T',  name : 'Toyota' }
		  , { code : '4T9', name : 'Lumen Motors' }
		  , { code : '4UF', name : 'Arctic Cat Inc.' }
		  , { code : '4US', shortName : 'BWM', name : 'BMW USA' }
		  , { code : '4UZ', name : 'Frt-Thomas Bus' }
		  , { code : '4V1', name : 'Volvo' }
		  , { code : '4V2', name : 'Volvo' }
		  , { code : '4V3', name : 'Volvo' }
		  , { code : '4V4', name : 'Volvo' }
		  , { code : '4V5', name : 'Volvo' }
		  , { code : '4V6', name : 'Volvo' }
		  , { code : '4VL', name : 'Volvo' }
		  , { code : '4VM', name : 'Volvo' }
		  , { code : '4VZ', name : 'Volvo' }
		  , { code : '538', name : 'Zero Motorcycles (USA)' }
		  , { code : '5F',  shortName : 'Honda', name : 'Honda USA-Alabama' }
		  , { code : '5L',  name : 'Lincoln' }
		  , { code : '5N1', shortName : 'Nissan', name : 'Nissan USA' }
		  , { code : '5NP', shortName : 'Hyundai', name : 'Hyundai USA' }
		  , { code : '5T',  shortName : 'Toyota', name : 'Toyota USA - trucks' }
		  , { code : '5YJ', shortName : 'Tesla', name : 'Tesla Motors' }
		  , { code : '6AB', shortName : 'MAN', name : 'MAN Australia' }
		  , { code : '6F4', shortName : 'Nissan', name : 'Nissan Motor Company Australia' }
		  , { code : '6F5', shortName : 'Kenworth', name : 'Kenworth Australia' }
		  , { code : '6FP', shortName : 'Ford', name : 'Ford Motor Company Australia' }
		  , { code : '6G1', name : 'General Motors-Holden (post Nov 2002)' }
		  , { code : '6G2', shortName : 'Pontiac', name : 'Pontiac Australia (GTO & G8)' }
		  , { code : '6H8', name : 'General Motors-Holden (pre Nov 2002)' }
		  , { code : '6MM', shortName : 'Mitsubishi', name : 'Mitsubishi Motors Australia' }
		  , { code : '6T1', shortName : 'Toyota', name : 'Toyota Motor Corporation Australia' }
		  , { code : '6U9', name : 'Privately Imported car in Australia' }
		  , { code : '8AD', shortName : 'Peugeot', name : 'Peugeot Argentina' }
		  , { code : '8AF', shortName : 'Ford', name : 'Ford Motor Company Argentina' }
		  , { code : '8AG', shortName : 'Chevrolet', name : 'Chevrolet Argentina' }
		  , { code : '8AJ', shortName : 'Toyota', name : 'Toyota Argentina' }
		  , { code : '8AK', shortName : 'Suzuki', name : 'Suzuki Argentina' }
		  , { code : '8AP', shortName : 'Fiat', name : 'Fiat Argentina' }
		  , { code : '8AW', shortName : 'Volkswagen', name : 'Volkswagen Argentina' }
		  , { code : '8A1', shortName : 'Renault', name : 'Renault Argentina' }
		  , { code : '8GD', shortName : 'Peugeot', name : 'Peugeot Chile' }
		  , { code : '8GG', shortName : 'Chevrolet', name : 'Chevrolet Chile' }
		  , { code : '935', shortName : 'Citroen', name : 'Citroen Brazil' }
		  , { code : '936', shortName : 'Peugeot', name : 'Peugeot Brazil' }
		  , { code : '93H', shortName : 'Honda', name : 'Honda Brazil' }
		  , { code : '93R', shortName : 'Toyota', name : 'Toyota Brazil' }
		  , { code : '93U', shortName : 'Audi', name : 'Audi Brazil' }
		  , { code : '93V', shortName : 'Audi', name : 'Audi Brazil' }
		  , { code : '93X', shortName : 'Mitsubishi', name : 'Mitsubishi Motors Brazil' }
		  , { code : '93Y', shortName : 'Renault', name : 'Renault Brazil' }
		  , { code : '94D', shortName : 'Nissan', name : 'Nissan Brazil' }
		  , { code : '9BD', shortName : 'Fiat', name : 'Fiat Brazil' }
		  , { code : '9BF', shortName : 'Ford', name : 'Ford Motor Company Brazil' }
		  , { code : '9BG', shortName : 'Chevrolet', name : 'Chevrolet Brazil' }
		  , { code : '9BM', shortName : 'Mercedez-Benz', name : 'Mercedes-Benz Brazil' }
		  , { code : '9BR', shortName : 'Toyota', name : 'Toyota Brazil' }
		  , { code : '9BS', shortName : 'Scania', name : 'Scania Brazil' }
		  , { code : '9BW', shortName : 'Volkswagen', name : 'Volkswagen Brazil' }
		  , { code : '9FB', shortName : 'Renault', name : 'Renault Colombia' }
		]
	};

	/* Methods: */
  public numeric function validate(required string v) {
    var s = 0;

    if (Len(v) == 17) {
      s = 1; // Length is valid

      if (reFind(reVIN, v) == 1) {
        s += 10; // Overall composition looks OK
			}
      if (reFind(reVIN_NA, v) == 1) {
        s += 10; // More restrictive check for a North American VIN with a check digit and model year encoding that both seem OK
			}

      if (compareNoCase(Mid(v, 9, 1), calculateCheckDigit(v)) == 0) {
        s += 100; // Check-digit matches
      }
    }
    return s;
  }

  public string function calculateCheckDigit(required string v) {
    var s = '?';

    // Transliteration key:
    var k =             'ABCDEFGHJKLMNPRSTUVWXYZ0123456789';
    var t = listToArray('123456781234579234567890123456789', '');

    // Positional weights:
    var w = [ 8, 7, 6, 5, 4, 3, 2, 10, 0, 9, 8, 7, 6, 5, 4, 3, 2 ];

    // Make sure this thing even makes sense to try to work with:
    if (reFind(reVIN, v) == 1) {
      var c = listToArray(v, '');
      var p = 0;
      for (var i = 1; i <= Len(v); i++) {
        p += w[i] * t[find(c[i], k)];
      }
      s = p % 11;
      if (s == 10) {
        s = 'X';
      }
    }

    return s;
  }

	public string function wmi(required string v) {
    if (v.len() >= 3) {
      if (v.len() >= 14) {
        if (v.left(3).right(1) == 9) {
          return '#v.left(3)##v.left(12).right(1)##v.left(13).right(1)##v.left(14).right(1)#';
        }
        else {
          return v.left(3);
        }
      }
      else {
        return v.left(3);
      }
    }
    else {
      return '?';
    }
	}

	public string function vds(required string v) {
		return (v.len() >= 9) ? v.left(9).right(6) : '?';
	}

	public string function vis(required string v) {
		return (v.len() >= 17) ? v.left(17).right(8) : '?';
	}

	public string function region(required string v) {
		var s = '?';

		if (v.len() > 0) {
			s = v.left(1);
			for (var r = 1; r <= _wmi.regions.len(); r++) {
				if (reFind(_wmi.regions[r].regionCode, s) == 1) {
					s = _wmi.regions[r].regionName;
					break;
				}
			}
			if (s.len() == 1) s = '?';
		}

		return s;
	}

	public string function country(required string v) {
		var s = '?';

		if (v.len() > 1) {
			s = v.left(2);
			for (var r = 1; r <= _wmi.regions.len(); r++) {
				if (reFind(_wmi.regions[r].regionCode, s.left(1)) == 1) {
					for (var c = 1; c <= _wmi.regions[r].countries.len(); c++) {
						if (reFind(_wmi.regions[r].countries[c].code, s) == 1) {
							s = _wmi.regions[r].countries[c].name;
							break;
						}
					}
				}
			}
			if (s.len() == 2) s = '?';
		}
		return s;
	}

	public string function manufacturer(required string v) {
		var s = '?';
		var l = _wmi.manufacturers.len();

		for (var m = 1; m <= l; m++) {
			// TODO: deal with manufacturer codes like 'YT9/007' where we have two parts!
			if (compare(v.left(_wmi.manufacturers[m].code.len()), _wmi.manufacturers[m].code) == 0) {
				s = structKeyExists(_wmi.manufacturers[m], 'shortName') ? _wmi.manufacturers[m].shortName : _wmi.manufacturers[m].name;
				break;
			}
		}

		return s;
	}

	public string function modelYear(required string v) {
		var s = '?';
		if (v.len() > 9) {
			var k = 'ABCDEFGHJKLMNPRSTVWXY123456789';
			var y = year(now()) + 2;

			k = reverse(k & k.left(y - 2009));
			s = mid(v, 10, 1); // Year designator from VIN

			var p = find(s, k);
			s = (p > 0) ? y - p + 1 : '?';
		}
		return s;
	}

	public string function checkDigit(required string v) {
		return (v.len() > 8) ? v.mid(9, 1) : '?';
	}

  // Talk with our VPIC API for a little extra decoding
  public struct function vpic(required string v, numeric y = 0) {
    str = {};
    searchKeys = 'make,manufacturer name,error code,model,model year,vehicle type,body class,gross vehicle weight rating,drive type,fuel type - primary,fuel type - secondary,bus length (feet),bus type,other bus info,';
    var u = 'https://vpic.nhtsa.dot.gov/api/vehicles/DecodeVIN/#v#?format=json' & ((Val(y) > 0) ? '&modelyear=#y#' : '');
    cfhttp(url = u, method = 'get', timeout = '3600000', resolveurl = 'false', redirect = 'false', result = 'result');

    // Insert json into database
    if (result.filecontent != 'Connection Failure') {
      r = deserializeJSON(result.filecontent);
      searchKeys = ListToArray(searchKeys, ',');
      for (var j = 1; j <= ArrayLen(searchKeys); j++) {
        p = r.results.find(function(i) { return CompareNoCase(i.variable, searchKeys[j]) == 0; });
        if ((p > 0) && (StructKeyExists(r.results[p], "value")) && (len(r.results[p].value) > 0)) {
        StructInsert(str, r.results[p].variable, trim(r.results[p].value), true);
        }
      }
    }
    return str;
  }



  public struct function decode(required string v, numeric y = 0) {
    var s = {
      check : 0
      , vin : v

			// Basic chunks:
      , wmi : '?'
      , vds : '?'
      , vis : '?'

			// Detail from North American VINs:
      , region : '?'
      , country : '?'
      , checkDigit : '?'
      , modelYear : '?'
      , plantCode : '?'
      , manufacturer : '?'
      , sequentialNumber : '?'
      , vpic : { }

			// Additional manufacturer-specific decoding information:
			, additionalInfo : { }
    };

    s.check = validate(v);
		if (s.check > 0) {
			// We at least know it is the right length...
			s.wmi = wmi(v);
			s.vds = vds(v);
			s.vis = vis(v);
			s.region = region(v);
			s.country = country(v);
			s.checkDigit = checkDigit(v);
			s.manufacturer = manufacturer(v);
			s.modelYear = modelYear(v);
      s.vpic = vpic(v, y);

			// TODO: Check for (and use) manufacturer-specific method for additional information
		}

    return s;
  }

}

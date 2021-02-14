
offroad(niva,1).
offroad(landrover_discovery,1).
offroad(nissan_patrol,1).
offroad(lexus_lx570,1).
offroad(bmw_x5,1).
offroad(ssangyong_action,1).
offroad(jeep_wrangler,1).
offroad(toyota_lc200,1).
offroad(lada_granta,2).
offroad(porshe_panamera,2).
offroad(audi_rs5,2).
offroad(audi_a3,2).
offroad(toyota_alphard,2).
offroad(ford_mustang,2).
offroad(skoda_oktavia,2).
offroad(mersedes_benz_V,2).
offroad(infinity_qx80,1).
offroad(toyota_corolla,2).
offroad(reno_duster,1).
offroad(hyundai_solaris,2).
offroad(porsche_cayenne,1).
offroad(gazelle,2).




travel_family(niva,3).
travel_family(landrover_discovery,2).
travel_family(nissan_patrol,2).
travel_family(lexus_lx570,0).
travel_family(bmw_x5,2).
travel_family(ssangyong_action,2).
travel_family(jeep_wrangler,2).
travel_family(toyota_lc200,0).
travel_family(lada_granta,2).
travel_family(porshe_panamera,2).
travel_family(audi_rs5,2).
travel_family(audi_a3,2).
travel_family(toyota_alphard,0).
travel_family(ford_mustang,3).
travel_family(skoda_oktavia,2).
travel_family(mersedes_benz_V,0).
travel_family(infinity_qx80,0).
travel_family(toyota_corolla,2).
travel_family(reno_duster,2).
travel_family(hyundai_solaris,2).
travel_family(porsche_cayenne,2).
travel_family(gazelle,0).


fuel(niva,1).
fuel(landrover_discovery,0).
fuel(nissan_patrol,0).
fuel(lexus_lx570,0).
fuel(bmw_x5,0).
fuel(ssangyong_action,1).
fuel(jeep_wrangler,0).
fuel(toyota_lc200,1).
fuel(lada_granta,1).
fuel(porshe_panamera,1).
fuel(audi_rs5,0).
fuel(audi_a3,1).
fuel(toyota_alphard,1).
fuel(ford_mustang,0).
fuel(skoda_oktavia,1).
fuel(mersedes_benz_V,0).
fuel(infinity_qx80,1).
fuel(toyota_corolla,1).
fuel(reno_duster,1).
fuel(hyundai_solaris,1).
fuel(porsche_cayenne,0).
fuel(gazelle,0).


foreingh(niva,1).
foreingh(landrover_discovery,0).
foreingh(nissan_patrol,0).
foreingh(lexus_lx570,0).
foreingh(bmw_x5,0).
foreingh(ssangyong_action,0).
foreingh(jeep_wrangler,0).
foreingh(toyota_lc200,0).
foreingh(lada_granta,1).
foreingh(porshe_panamera,0).
foreingh(audi_rs5,0).
foreingh(audi_a3,0).
foreingh(toyota_alphard,0).
foreingh(ford_mustang,0).
foreingh(skoda_oktavia,0).
foreingh(mersedes_benz_V,0).
foreingh(infinity_qx80,0).
foreingh(toyota_corolla,0).
foreingh(reno_duster,0).
foreingh(hyundai_solaris,0).
foreingh(porsche_cayenne,0).
foreingh(gazelle,1).


spec(niva,0).
spec(landrover_discovery,1).
spec(nissan_patrol,3).
spec(lexus_lx570,2).
spec(bmw_x5,1).
spec(ssangyong_action,0).
spec(jeep_wrangler,1).
spec(toyota_lc200,2).
spec(lada_granta,0).
spec(porshe_panamera,1).
spec(audi_rs5,1).
spec(audi_a3,3).
spec(toyota_alphard,2).
spec(ford_mustang,1).
spec(skoda_oktavia,2).
spec(mersedes_benz_V,1).
spec(infinity_qx80,2).
spec(toyota_corolla,3).
spec(reno_duster,0).
spec(hyundai_solaris,0).
spec(porsche_cayenne,1).
spec(gazelle,0).



price(niva,2).
price(landrover_discovery,0).
price(nissan_patrol,1).
price(lexus_lx570,0).
price(bmw_x5,0).
price(ssangyong_action,2).
price(jeep_wrangler,0).
price(toyota_lc200,0).
price(lada_granta,1).
price(porshe_panamera,0).
price(audi_rs5,0).
price(audi_a3,1).
price(toyota_alphard,1).
price(ford_mustang,0).
price(skoda_oktavia,2).
price(mersedes_benz_V,0).
price(infinity_qx80,0).
price(toyota_corolla,2).
price(reno_duster,2).
price(hyundai_solaris,2).
price(porsche_cayenne,0).
price(gazelle,2).











question1(X1):-	write("����� ����� ������ ��� ����������?"),nl,
				write("1. ����������� "),nl,
				write("2. ���������-�������������"),nl,
				read(X1).

question2(X2):-	write("����� ��������� ����������� ��������������?"),nl,
				write("0. ������� (5-7 ���.)"),nl,
				write("1. �������(3-5) ���."),nl,
                                write("2. �����(1-2) ���."),nl,
				read(X2).

question3(X3):-	write("����� �� ������ �������?"),nl,
				write("1. ��"),nl,
				write("0. ���"),nl,
				read(X3).

question4(X4):-	write("������������� �������� ��� �������������?"),nl,
				write("0. ��������"),nl,
				write("1. �������������"),nl,
				read(X4).

question5(X5):-	write("�� ����� ����������� ������ �����?"),nl,
                                write("3. ������� ��������"),nl,
				write("2. �������� � �������"),nl,
				write("1. ������� �������"),nl,
				write("0. ���� �� ������)"),nl,
				read(X5).

question6(X6):-	write("����� ������ ������...����...?"),nl,
				write("2. ������������ ���������, �� 1��� ���."),nl,
				write("1. ������� ����, 1.5-3���.���"),nl,
				write("0. �������, ���� 3 ���. ���."),nl,
				read(X6).





pr:-	question1(X1),question2(X2),question3(X3),question4(X4),
		question5(X5),question6(X6),								offroad(X,X1),travel_family(X,X2),fuel(X,X3),foreingh(X,X4),
                spec(X,X5),price(X,X6),								write(X).

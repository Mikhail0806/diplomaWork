Процедура ЗаполнитьГрафик(ДатаНачала, ДатаОкончания, ВыходныеДни, ГрафикРаботы) Экспорт 
	
	Набор = РегистрыСведений.ВКМ_ГрафикиРаботы.СоздатьНаборЗаписей();
	Набор.Отбор.ГрафикРаботы.Установить(ГрафикРаботы);
	
	Набор.Прочитать();
	
	ЧислоСекундВСутках = 86400;
	
	Дат = ДатаНачала;
	Для к = 0 По Набор.Количество()-1 Цикл
		
		Запись = Набор[к];
		Если Запись.Дата < ДатаНачала Тогда
		    Продолжить;
		ИначеЕсли Запись.Дата =Дат Тогда
			Если Найти(ВыходныеДни, Строка(ДеньНедели(Дат))) Тогда  
				Запись.РабочихДней = 0;
				Запись.РабочихЧасов = 0;
			Иначе
				Запись.РабочихДней = 1;
				Запись.РабочихЧасов = 8;
			КонецЕсли;
			Дат = Дат + ЧислоСекундВСутках;
		Иначе
			Пока Дат < Мин(Запись.Дата, ДатаОкончания) Цикл
				НоваяЗапись = Набор.Добавить();
				НоваяЗапись.Дата = Дат;
				НоваяЗапись.ГрафикРаботы = ГрафикРаботы;
				
				Если Найти(ВыходныеДни, Строка(ДеньНедели(Дат))) Тогда
					НоваяЗапись.РабочихЧасов = 0;
					НоваяЗапись.РабочихДней = 0;
					
				Иначе
					НоваяЗапись.РабочихДней = 1;
					НоваяЗапись.РабочихЧасов = 8;
				КонецЕсли; 
				Дат = Дат + ЧислоСекундВСутках;
			КонецЦикла; 
			Если Запись.Дата > ДатаОкончания Тогда
				Прервать;
			Иначе
				Если Найти(ВыходныеДни, Строка(ДеньНедели(Дат))) Тогда
					Запись.РабочихЧасов = 0;
					Запись.РабочихДней = 0;
				Иначе
					Запись.РабочихДней = 1;
					Запись.РабочихЧасов = 8;
				КонецЕсли;
			КонецЕсли;
			Дат = Дат + ЧислоСекундВСутках;
		КонецЕсли; 
	КонецЦикла;
	Набор.Записать();
	
	Пока Дат <= ДатаОкончания Цикл
		Запись = Набор.Добавить();
		Запись.Дата = Дат;
		Запись.ГрафикРаботы = ГрафикРаботы;
		Если Найти(ВыходныеДни, Строка(ДеньНедели(Дат))) Тогда
			Запись.РабочихЧасов = 0;
			Запись.РабочихДней = 0;
		Иначе
			Запись.РабочихДней = 1;
			Запись.РабочихЧасов = 8;
		КонецЕсли; 
		Дат = Дат + ЧислоСекундВСутках;
	КонецЦикла; 
	Набор.Записать();
КонецПроцедуры

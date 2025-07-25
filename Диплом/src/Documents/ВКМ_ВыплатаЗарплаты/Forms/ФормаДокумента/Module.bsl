
#Область СлужебныеПроцедурыИФункции

&НаКлиенте
Процедура ЗаполнитьОстатками(Команда)
	
	Если Объект.Проведен Тогда 
		Сообщение = "Необходимо снять с проведения документ";
		ОбщегоНазначенияКлиент.СообщитьПользователю(Сообщение);
		Возврат;
	КонецЕсли;
	
	ЗаполнитьОстаткамиНаСервере();
	
КонецПроцедуры

&НаСервере
Процедура ЗаполнитьОстаткамиНаСервере()
	
	Объект.Сотрудники.Очистить();
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
	"ВЫБРАТЬ
	|	ВКМ_ВзаиморасчетыССотрудникамиОстатки.Сотрудник КАК Сотрудник,
	|	ВКМ_ВзаиморасчетыССотрудникамиОстатки.СуммаОстаток КАК Сумма
	|ИЗ
	|	РегистрНакопления.ВКМ_ВзаиморасчетыССотрудниками.Остатки(&Период, ) КАК ВКМ_ВзаиморасчетыССотрудникамиОстатки";
	
	Запрос.УстановитьПараметр("Период", Новый Граница(КонецМесяца(Объект.Дата),ВидГраницы.Включая));
	
	РезультатЗапроса = Запрос.Выполнить();
	
	Выборка = РезультатЗапроса.Выбрать();
	
	Пока Выборка.Следующий() Цикл
		
		НоваяСтрока = Объект.Сотрудники.Добавить();
		ЗаполнитьЗначенияСвойств(НоваяСтрока,Выборка);
		
	КонецЦикла;
	
	
КонецПроцедуры
#КонецОбласти

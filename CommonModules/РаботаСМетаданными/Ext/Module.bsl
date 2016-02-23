﻿
Функция ИдентификаторПеречисленияПоСсылке(ЗначениеПеречисления) Экспорт
	
	ИмяПеречисления = ЗначениеПеречисления.Метаданные().Имя;
	ИндексЗначенияПеречисления = Перечисления[ИмяПеречисления].Индекс(ЗначениеПеречисления);
	Возврат Метаданные.Перечисления[ИмяПеречисления].ЗначенияПеречисления[ИндексЗначенияПеречисления].Имя;

КонецФункции

// Взято из БСП 2.3. Заменены некоторые строковые функции, появившиеся в 8.3.6
Функция СтроковоеПредставлениеТипа(Тип) Экспорт
	
	Представление = "";
	
	Если ЭтоСсылка(Тип) Тогда
	
		ПолноеИмя = Метаданные.НайтиПоТипу(Тип).ПолноеИмя();
		//ИмяОбъекта = СтрРазделить(ПолноеИмя, ".")[1];
		ИмяОбъекта = РазложитьСтрокуВМассивПодстрок(ПолноеИмя, ".")[1];
		
		Если Справочники.ТипВсеСсылки().СодержитТип(Тип) Тогда
			Представление = "СправочникСсылка";
		
		ИначеЕсли Документы.ТипВсеСсылки().СодержитТип(Тип) Тогда
			Представление = "ДокументСсылка";
		
		ИначеЕсли БизнесПроцессы.ТипВсеСсылки().СодержитТип(Тип) Тогда
			Представление = "БизнесПроцессСсылка";
		
		ИначеЕсли ПланыВидовХарактеристик.ТипВсеСсылки().СодержитТип(Тип) Тогда
			Представление = "ПланВидовХарактеристикСсылка";
		
		ИначеЕсли ПланыСчетов.ТипВсеСсылки().СодержитТип(Тип) Тогда
			Представление = "ПланСчетовСсылка";
		
		ИначеЕсли ПланыВидовРасчета.ТипВсеСсылки().СодержитТип(Тип) Тогда
			Представление = "ПланВидовРасчетаСсылка";
		
		ИначеЕсли Задачи.ТипВсеСсылки().СодержитТип(Тип) Тогда
			Представление = "ЗадачаСсылка";
		
		ИначеЕсли ПланыОбмена.ТипВсеСсылки().СодержитТип(Тип) Тогда
			Представление = "ПланОбменаСсылка";
		
		ИначеЕсли Перечисления.ТипВсеСсылки().СодержитТип(Тип) Тогда
			Представление = "ПеречислениеСсылка";
		
		КонецЕсли;
		
		Результат = ?(Представление = "", Представление, Представление + "." + ИмяОбъекта);
		
	Иначе
		
		Результат = Строка(Тип);
		
	КонецЕсли;
	
	Возврат Результат;
	
КонецФункции
Функция РазложитьСтрокуВМассивПодстрок(Знач Строка, Знач Разделитель = ",", Знач ПропускатьПустыеСтроки = Неопределено, СокращатьНепечатаемыеСимволы = Ложь) Экспорт
	
	Результат = Новый Массив;
	
	// Для обеспечения обратной совместимости.
	Если ПропускатьПустыеСтроки = Неопределено Тогда
		ПропускатьПустыеСтроки = ?(Разделитель = " ", Истина, Ложь);
		Если ПустаяСтрока(Строка) Тогда 
			Если Разделитель = " " Тогда
				Результат.Добавить("");
			КонецЕсли;
			Возврат Результат;
		КонецЕсли;
	КонецЕсли;
	//
	
	//Позиция = СтрНайти(Строка, Разделитель);
	Позиция = Найти(Строка, Разделитель);
	Пока Позиция > 0 Цикл
		Подстрока = Лев(Строка, Позиция - 1);
		Если Не ПропускатьПустыеСтроки Или Не ПустаяСтрока(Подстрока) Тогда
			Если СокращатьНепечатаемыеСимволы Тогда
				Результат.Добавить(СокрЛП(Подстрока));
			Иначе
				Результат.Добавить(Подстрока);
			КонецЕсли;
		КонецЕсли;
		Строка = Сред(Строка, Позиция + СтрДлина(Разделитель));
		//Позиция = СтрНайти(Строка, Разделитель);
		Позиция = Найти(Строка, Разделитель);
	КонецЦикла;
	
	Если Не ПропускатьПустыеСтроки Или Не ПустаяСтрока(Строка) Тогда
		Если СокращатьНепечатаемыеСимволы Тогда
			Результат.Добавить(СокрЛП(Строка));
		Иначе
			Результат.Добавить(Строка);
		КонецЕсли;
	КонецЕсли;
	
	Возврат Результат;
	
КонецФункции
Функция ЭтоСсылка(Тип) Экспорт
	
	Возврат Тип <> Тип("Неопределено") 
		И (Справочники.ТипВсеСсылки().СодержитТип(Тип)
		ИЛИ Документы.ТипВсеСсылки().СодержитТип(Тип)
		ИЛИ Перечисления.ТипВсеСсылки().СодержитТип(Тип)
		ИЛИ ПланыВидовХарактеристик.ТипВсеСсылки().СодержитТип(Тип)
		ИЛИ ПланыСчетов.ТипВсеСсылки().СодержитТип(Тип)
		ИЛИ ПланыВидовРасчета.ТипВсеСсылки().СодержитТип(Тип)
		ИЛИ БизнесПроцессы.ТипВсеСсылки().СодержитТип(Тип)
		ИЛИ БизнесПроцессы.ТипВсеСсылкиТочекМаршрутаБизнесПроцессов().СодержитТип(Тип)
		ИЛИ Задачи.ТипВсеСсылки().СодержитТип(Тип)
		ИЛИ ПланыОбмена.ТипВсеСсылки().СодержитТип(Тип));
	
КонецФункции


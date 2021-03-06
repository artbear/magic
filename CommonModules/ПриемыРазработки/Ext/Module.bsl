﻿
Процедура ВыполнитьКодИзФайла(Путь)
	
	Файл = Новый Файл(Путь);
	Если Не Файл.Существует() Тогда
		Сообщить(НСтр("ru = 'Доступ к файлу не возможен!'"), СтатусСообщения.Внимание);
		Возврат;
	КонецЕсли; 

	ТекстовыйФайл = Новый ТекстовыйДокумент;
	ТекстовыйФайл.Прочитать(Файл.ПолноеИмя, КодировкаТекста.UTF8);
		
	Попытка		
		Выполнить(ТекстовыйФайл.ПолучитьТекст()); // !!! ВЫПОЛНЯЕМ КОД ИЗ ФАЙЛА !!!
	Исключение
		Сообщить(НСтр("ru = '"+ОписаниеОшибки()+"'"), СтатусСообщения.Внимание);
	КонецПопытки;	
	
КонецПроцедуры


// Замер времени
Функция ЗамерВремениНачало() 
	__СкриптКонтрол = Новый COMОбъект("MSScriptControl.ScriptControl");
	__СкриптКонтрол.Language = "javascript";

	Возврат Новый Структура("Скрипт,ЗамерВремениНачало",__СкриптКонтрол.eval("new Date().getTime()"), __СкриптКонтрол);

КонецФункции

Функция ЗамерВремениКонец(Параметры)
	__СкриптКонтрол = Параметры.Скрипт;
	ЗамерВремениОкончание = __СкриптКонтрол.eval("new Date().getTime()");	

	Миллисекунды		= ЗамерВремениОкончание-Параметры.ЗамерВремениНачало;
	// Часы
	КолВоЧасов			= Цел(Миллисекунды/(60*60*1000));
	Остаток				= Миллисекунды-КолВоЧасов*60*60*1000;	
	// Минуты
	КолВоМинут			= Цел(Остаток/(60*1000));
	Остаток				= Остаток-КолВоМинут*60*1000;	
	// Секунды,миллисекунды
	КолВоСекунд			= Цел(Остаток/1000);
	КолВоМиллисекунд	= Остаток-КолВоСекунд*1000;
		
	Возврат НСтр("ru = 'Время выполнения: " + Формат(КолВоЧасов,"ЧЦ=3;ЧН=;ЧВН=")+":"+Формат(КолВоМинут,"ЧЦ=2;ЧН=;ЧВН=")+":"+Формат(КолВоСекунд,"ЧЦ=2;ЧН=;ЧВН=")+":"+Формат(КолВоМиллисекунд,"ЧЦ=3;ЧН=;ЧВН=") + " мс.'");
КонецФункции
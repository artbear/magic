﻿
Процедура ПриКомпоновкеРезультата(ДокументРезультат, ДанныеРасшифровки, СтандартнаяОбработка)
	
	СтандартнаяОбработка = Ложь; 
	
	ПрограммнаяРаботаССКД.ВывестиСКДВТабличныйДокумент(СхемаКомпоновкиДанных, ДокументРезультат, КомпоновщикНастроек);
	ПрограммнаяРаботаСТабличнымиДокументами.ОбъединтьЯчейкиВТабличномДокументе(ДокументРезультат, "{ОБЪЕДИНИТЬ}");
	ПрограммнаяРаботаСТабличнымиДокументами.ЗаменитьТекстВТабличномДокументе(ДокументРезультат, "{ОБЪЕДИНИТЬ}", "");
	ПрограммнаяРаботаСТабличнымиДокументами.СкрытьСтрокиВТабличномДокументе(ДокументРезультат, "{СКРЫТЬСТРОКУ}");
	
КонецПроцедуры


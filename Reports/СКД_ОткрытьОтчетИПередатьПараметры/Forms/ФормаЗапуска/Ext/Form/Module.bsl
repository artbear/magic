﻿
&НаКлиенте
Процедура ОткрытьОтчетСПараметрами(Команда)
	ПараметрыОтчета = Новый Структура;
	Отбор = Новый Структура;
	Отбор.Вставить("Поле1", 1);
	
	ПараметрыОтчета.Вставить("Отбор", Отбор);
	ПараметрыОтчета.Вставить("СформироватьПриОткрытии", Истина);
	
	ОткрытьФорму("Отчет.СКД_ОткрытьОтчетИПередатьПараметры.Форма.ФормаОтчета", ПараметрыОтчета);
	
КонецПроцедуры

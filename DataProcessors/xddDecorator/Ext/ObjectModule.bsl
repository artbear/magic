﻿
Перем мБраузерТестирования;
Перем мИнструменты;
Перем мСтрокаДереваТестов;


#Область _// КОНСТРУКТОР

Процедура Инициализация(ФормаБраузера) Экспорт
	
	мБраузерТестирования = ФормаБраузера.ЭтотОбъект;
	мБраузерТестирования.SetHandlerObject(ЭтотОбъект);
	мБраузерТестирования.УстановитьКонтекст(ЭтотОбъект, "Декоратор");
	
	
КонецПроцедуры

Процедура ДобавитьИнструмент(ИмяИнструмента, ИнструментОбъект) Экспорт
	
	Если мИнструменты = Неопределено Тогда
		мИнструменты = Новый Структура();
	КонецЕсли;
	
	мИнструменты.Вставить(ИмяИнструмента, ИнструментОбъект);
	
КонецПроцедуры

#КонецОбласти


#Область _// СОБЫТИЯ ОТ БРАУЗЕРА

Процедура ВывестиСообщение(ТекстСообщения) Экспорт
	
	Сообщить("СООБЩЕНИЕ: "+ТекстСообщения);
	//Оповестить("xddМониторТестирования", ТекстСообщения, "Программная ошибка");
	
КонецПроцедуры

Процедура TestPassed(Параметр) Экспорт
	
	мБраузерТестирования.мСписокОшибок.Очистить();
	
КонецПроцедуры

Процедура TestFailed(Параметр) Экспорт
	
	мБраузерТестирования.мСписокОшибок.Очистить();
	
КонецПроцедуры

Процедура TestStart(Параметр) Экспорт
	мСтрокаДереваТестов = Параметр;
КонецПроцедуры

Процедура TestLoaded(Параметр) Экспорт
КонецПроцедуры

#КонецОбласти


#Область _// МЕТОДЫ ПРОВЕРКИ ЗНАЧЕНИЙ (DECORATOR)

Процедура Проверить(_Истина, ДопСообщениеОшибки = "") Экспорт
	мБраузерТестирования.Проверить(_Истина, ДопСообщениеОшибки);
КонецПроцедуры

Процедура ПроверитьИстину(_Истина, ДопСообщениеОшибки = "") Экспорт
	мБраузерТестирования.Проверить(_Истина, ДопСообщениеОшибки);
КонецПроцедуры

Процедура ПроверитьЛожь(_Ложь, ДопСообщениеОшибки = "") Экспорт
	мБраузерТестирования.ПроверитьЛожь(_Ложь, ДопСообщениеОшибки);
КонецПроцедуры

Процедура ПроверитьДату(_Дата, _Период, ДопСообщениеОшибки = "") Экспорт
	мБраузерТестирования.ПроверитьДату(_Дата, _Период, ДопСообщениеОшибки);
КонецПроцедуры

Процедура ПроверитьРавенствоДатСТочностью2Секунды(_Дата, _Дата2, ДопСообщениеОшибки = "") Экспорт
	мБраузерТестирования.ПроверитьРавенствоДатСТочностью2Секунды(_Дата, _Дата2, ДопСообщениеОшибки);
КонецПроцедуры

Процедура ПроверитьРавенство(_1, _2, ДопСообщениеОшибки = "") Экспорт
	мБраузерТестирования.ПроверитьРавенство(_1, _2, ДопСообщениеОшибки);
КонецПроцедуры

Процедура ПроверитьНеРавенство(_1, _2, ДопСообщениеОшибки = "") Экспорт
	мБраузерТестирования.ПроверитьНеРавенство(_1, _2, ДопСообщениеОшибки);
КонецПроцедуры

Процедура ПроверитьБольше(_Больше, _Меньше, ДопСообщениеОшибки = "") Экспорт
	мБраузерТестирования.ПроверитьБольше(_Больше, _Меньше, ДопСообщениеОшибки);
КонецПроцедуры

Процедура ПроверитьБольшеИлиРавно(_Больше, _Меньше, ДопСообщениеОшибки = "") Экспорт
	мБраузерТестирования.ПроверитьБольшеИлиРавно(_Больше, _Меньше, ДопСообщениеОшибки);
КонецПроцедуры

Процедура ПроверитьМеньше(проверяемоеЗначение1, проверяемоеЗначение2, СообщениеОбОшибке = "") Экспорт
	мБраузерТестирования.ПроверитьМеньше(проверяемоеЗначение1, проверяемоеЗначение2, СообщениеОбОшибке);
КонецПроцедуры

Процедура ПроверитьМеньшеИлиРавно(проверяемоеЗначение1, проверяемоеЗначение2, СообщениеОбОшибке = "") Экспорт
	мБраузерТестирования.ПроверитьМеньшеИлиРавно(проверяемоеЗначение1, проверяемоеЗначение2, СообщениеОбОшибке); 
КонецПроцедуры

Процедура ПроверитьВыполнилось(Знач СтрокаАлгоритм, ПараметрыИлиДопСообщениеОшибки = Неопределено, Знач ДопСообщениеОшибки = "") Экспорт
	мБраузерТестирования.ПроверитьВыполнилось(СтрокаАлгоритм, ПараметрыИлиДопСообщениеОшибки, ДопСообщениеОшибки);
КонецПроцедуры

Процедура ПроверитьМетодВыполнился(Объект, Знач ИмяМетода, ПараметрыИлиДопСообщениеОшибки = Неопределено, Знач ДопСообщениеОшибки = "") Экспорт
	мБраузерТестирования.ПроверитьМетодВыполнился(Объект, ИмяМетода, ПараметрыИлиДопСообщениеОшибки, ДопСообщениеОшибки);
КонецПроцедуры

Процедура ПроверитьНеВыполнилось(Знач СтрокаАлгоритм, ПараметрыИлиОжидаемоеОписаниеОшибки, Знач ОжидаемоеОписаниеОшибкиИлиДопСообщениеОшибки = "", Знач ДопСообщениеОшибки = "") Экспорт
	мБраузерТестирования.ПроверитьНеВыполнилось(СтрокаАлгоритм, ПараметрыИлиОжидаемоеОписаниеОшибки, ОжидаемоеОписаниеОшибкиИлиДопСообщениеОшибки, ДопСообщениеОшибки);
КонецПроцедуры

Процедура ПроверитьМетодНеВыполнился(Объект, ИмяМетода, ПараметрыИлиОжидаемоеОписаниеОшибки, Знач ОжидаемоеОписаниеОшибкиИлиДопСообщениеОшибки = "", Знач ДопСообщениеОшибки = "") Экспорт
	мБраузерТестирования.ПроверитьМетодНеВыполнился(Объект, ИмяМетода, ПараметрыИлиОжидаемоеОписаниеОшибки, ОжидаемоеОписаниеОшибкиИлиДопСообщениеОшибки, ДопСообщениеОшибки);
КонецПроцедуры

// проверка идет через ЗначениеЗаполнено, но мутабельные значение всегда считаем заполненными
Процедура ПроверитьЗаполненность(ПроверяемоеЗначение, ДопСообщениеОшибки = "") Экспорт
	мБраузерТестирования.ПроверитьЗаполненность(ПроверяемоеЗначение, ДопСообщениеОшибки); 
КонецПроцедуры

Процедура ПроверитьНеЗаполненность(ПроверяемоеЗначение, ДопСообщениеОшибки = "") Экспорт
	мБраузерТестирования.ПроверитьНеЗаполненность(ПроверяемоеЗначение, ДопСообщениеОшибки); 
КонецПроцедуры

Процедура ПроверитьТип(значение, ТипИлиИмяТипа, ДопСообщениеОшибки = "") Экспорт
	мБраузерТестирования.ПроверитьТип(значение, ТипИлиИмяТипа, ДопСообщениеОшибки);
КонецПроцедуры

Процедура ПроверитьВхождение(строка, подстрокаПоиска, ДопСообщениеОшибки = "") Экспорт
	мБраузерТестирования.ПроверитьВхождение(строка, подстрокаПоиска, ДопСообщениеОшибки);
КонецПроцедуры

//Коллекция - Массив, Структура, Соответствие, ФиксированныйМассив, ФиксированнаяСтруктура, ФиксированноеСоответствие, СписокЗначений
Процедура ПроверитьВхождениеВКоллекцию(Элемент, Коллекция, ДопСообщениеОшибки = "") Экспорт
	мБраузерТестирования.ПроверитьВхождениеВКоллекцию(Элемент, Коллекция, ДопСообщениеОшибки);
КонецПроцедуры

Процедура ПроверитьВалидностьЗапросаСКД(ТекстЗапроса, ДопСообщениеОшибки = "") Экспорт
	мБраузерТестирования.ПроверитьВалидностьЗапросаСКД(ТекстЗапроса, ДопСообщениеОшибки);
КонецПроцедуры // ПроверитьВалидностьЗапросаСКД()

Процедура ПроверитьНаличиеОбъектаИБ(ссылка, ДопСообщениеОшибки = "") Экспорт
	мБраузерТестирования.ПроверитьНаличиеОбъектаИБ(ссылка, ДопСообщениеОшибки);
КонецПроцедуры

// Проеряет равенство файлов
// Параметры:
//  ПутьФайла1, ПутьФайла2 - полные пути к фалйам
//  ПарамСравнениеФайлов - структура с ключами:
//                ИгнорироватьПустоеПространство
//                СпособСравнения
//                УчитыватьРазделителиСтрок
//                УчитыватьРегистр
//  ПоказатьРазличия - в случае ошибки появляется окно сравнеия (для отладки)
Процедура ПроверитьРавенствоФайлов(ПутьФайла1, ПутьФайла2, ДопСообщениеОшибки = "", ПарамСравнениеФайлов = Неопределено, ПоказатьРазличия = Ложь) Экспорт
	мБраузерТестирования.ПроверитьРавенствоФайлов(ПутьФайла1, ПутьФайла2, ДопСообщениеОшибки, ПарамСравнениеФайлов, ПоказатьРазличия);
КонецПроцедуры



Процедура ПроверитьРавенствоТаблиц(Таблица1, Таблица2, Сообщение = "") Экспорт
	
	СводнаяТаблица = Таблица1.Скопировать();
	
	ИменаКолонокГруппировки = "";
	Для каждого Колонка из СводнаяТаблица.Колонки Цикл
		ИменаКолонокГруппировки = ИменаКолонокГруппировки + нрег(Колонка.Имя) + ",";
	КонецЦикла;
	ИменаКолонокГруппировки = Лев(ИменаКолонокГруппировки, СтрДлина(ИменаКолонокГруппировки)-1);
	
	ИмяКолонкиСуммирования = "___СВЕРКА___";
	СводнаяТаблица.Колонки.Вставить(0,ИмяКолонкиСуммирования, Новый ОписаниеТипов("Число"));
	СводнаяТаблица.ЗаполнитьЗначения(-1, ИмяКолонкиСуммирования);
	
	Для каждого Строка из Таблица2 Цикл
		НоваяСтрока = СводнаяТаблица.Добавить();
		ЗаполнитьЗначенияСвойств(НоваяСтрока, Строка);
		НоваяСтрока[ИмяКолонкиСуммирования] = 1;
	КонецЦикла;
	
	СводнаяТаблица.Свернуть(ИменаКолонокГруппировки, ИмяКолонкиСуммирования);
	Отбор = Новый Структура(ИмяКолонкиСуммирования, 0);
	Если СводнаяТаблица.НайтиСтроки(Отбор).Количество() = СводнаяТаблица.Количество() Тогда
		Возврат;
	КонецЕсли;
	
	ПроверитьРавенствоТаблиц_ИллюстрацияОшибки(СводнаяТаблица);
	
	ВызватьИсключение "Таблицы различны: " + Сообщение;
КонецПроцедуры

Процедура ПроверитьРавенствоСтруктур(Структура1, Структура2, Сообщение = "") Экспорт
	СравнениеСтруктур = Новый ТаблицаЗначений;
	СравнениеСтруктур.Колонки.Добавить("Ключ");
	СравнениеСтруктур.Колонки.Добавить("Значение");
	СравнениеСтруктур.Колонки.Добавить("Сверка", Новый ОписаниеТипов("Число"));
	
	Для каждого КлючИЗначение из Структура1 Цикл
		НоваяСтрока = СравнениеСтруктур.Добавить();
		НоваяСтрока.Ключ = КлючИЗначение.Ключ;
		НоваяСтрока.Значение = КлючИЗначение.Значение;
		НоваяСтрока.Сверка = -1;
	КонецЦикла;
	
	Для каждого КлючИЗначение из Структура2 Цикл
		НоваяСтрока = СравнениеСтруктур.Добавить();
		НоваяСтрока.Ключ = КлючИЗначение.Ключ;
		НоваяСтрока.Значение = КлючИЗначение.Значение;
		НоваяСтрока.Сверка = 1;
	КонецЦикла;
	
	СравнениеСтруктур.Свернуть("Ключ,Значение","Сверка");
	Отбор = Новый Структура("Сверка", 0);
	Если СравнениеСтруктур.НайтиСтроки(Отбор).Количество() = СравнениеСтруктур.Количество() Тогда
		Возврат;
	КонецЕсли;
	
	ВызватьИсключение "Структуры различны: " + Сообщение;
КонецПроцедуры

Процедура ПроверитьРавенствоМассивов(Массив1, Массив2, Сообщение = "") Экспорт
	СравнениеМассивов = Новый ТаблицаЗначений;
	СравнениеМассивов.Колонки.Добавить("Элемент");
	СравнениеМассивов.Колонки.Добавить("Сверка", Новый ОписаниеТипов("Число"));
	
	Для каждого Элемент из Массив1 Цикл
		НоваяСтрока = СравнениеМассивов.Добавить();
		НоваяСтрока.Элемент = Элемент;
		НоваяСтрока.Сверка = -1;
	КонецЦикла;
	
	Для каждого Элемент из Массив2 Цикл
		НоваяСтрока = СравнениеМассивов.Добавить();
		НоваяСтрока.Элемент = Элемент;
		НоваяСтрока.Сверка = 1;
	КонецЦикла;
	
	СравнениеМассивов.Свернуть("Элемент","Сверка");
	Отбор = Новый Структура("Сверка", 0);
	Если СравнениеМассивов.НайтиСтроки(Отбор).Количество() = СравнениеМассивов.Количество() Тогда
		Возврат;
	КонецЕсли;
	
	ВызватьИсключение "Массивы различны: " + Сообщение;
	
КонецПроцедуры

Процедура ПроверитьНаличиеСвойства(Объект, ИмяСвойства, Сообщение = "") Экспорт
	
	Гуид = Новый УникальныйИдентификатор;
	Буфер = Новый Структура(ИмяСвойства, Гуид);
	
	ЗаполнитьЗначенияСвойств(Буфер, Объект);
	
	Если Буфер[ИмяСвойства] = Гуид Тогда
		ВызватьОшибкуПроверки("У объекта [" + Объект + "] не найдено свойство ["+ИмяСвойства+"]. А должно было быть найдено" ) ;
	КонецЕсли;
	
КонецПроцедуры

Процедура СериализоватьИПроверитьРавенство(_1, _2, Сообщение = "") Экспорт
	
	Строка1 = СериализоватьОбъект(_1);
	Строка2 = СериализоватьОбъект(_2);
	
	Если Строка1 = Строка2 Тогда
		Возврат;
	КонецЕсли;
	
	
	ВызватьИсключение "Значения различны: " + Сообщение;
	
КонецПроцедуры
Функция СериализоватьОбъект(СериализуемыйОбъект)
	// возвращает строку
	
	Сериализатор = Новый СериализаторXDTO(ФабрикаXDTO);
	ОбъектXDTO = Сериализатор.ЗаписатьXDTO(СериализуемыйОбъект);
	
	ЗаписьXML = Новый ЗаписьXML; 
	ЗаписьXML.УстановитьСтроку("UTF-8"); 
	ЗаписьXML.ЗаписатьОбъявлениеXML();
	ФабрикаXDTO.ЗаписатьXML(ЗаписьXML, ОбъектXDTO,,,,НазначениеТипаXML.Явное); 
	
	Возврат ЗаписьXML.Закрыть();
	
КонецФункции

Процедура ВызватьОшибкуПроверки(СообщениеОшибки)
	
	Префикс = "["+ мБраузерТестирования.СтатусыРезультатаТестирования.ОшибкаПроверки + "]";
	ВызватьИсключение Префикс + " " + СообщениеОшибки;
	
КонецПроцедуры

Процедура ПроверитьРавенствоТаблиц_ИллюстрацияОшибки(СводнаяТаблица)
	
	НайденныеСтроки = СводнаяТаблица.НайтиСтроки(Новый Структура("___СВЕРКА___", 0));
	
	Для каждого Строка из НайденныеСтроки Цикл
		СводнаяТаблица.Удалить(Строка);
	КонецЦикла;
	
	ТабличныйДокумент = ПолучитьТабличныйДокументПоТаблицеЗначений(СводнаяТаблица);
	
	Для сч = 2 по ТабличныйДокумент.ВысотаТаблицы Цикл
		
		Область = ТабличныйДокумент.Область(сч, 1);
		Если Область.Текст = "-1" Тогда
			Область.ЦветФона = WebЦвета.НейтральноЗеленый;
		Иначе
			Область.ЦветФона = WebЦвета.ЛососьСветлый;
		КонецЕсли;
		
	КонецЦикла;
	
	Оповестить("xddМониторТестирования", ТабличныйДокумент, "Различие таблиц");
	
КонецПроцедуры

#КонецОбласти

#Область _// ПРОЦЕДУРЫ ДЛЯ ВЫЗОВА ИЗ ТЕСТОВ

Функция ТекущийТест() Экспорт
	
	ИмяТестовойОбработки = мСтрокаДереваТестов.ТестовыйСлучайОбъектМетаданныхИмя;
	Если мСтрокаДереваТестов.ЭтоВнутренняяОбработка Тогда
		Тест = мБраузерТестирования.СоздатьОбъектОбработкиКонфигурации(ИмяТестовойОбработки);
	Иначе
		Тест = мБраузерТестирования.СоздатьОбъектВнешнейОбработкиОтключаяБезопасныйРежим(ИмяТестовойОбработки);
	КонецЕсли;
	
	Возврат Тест;
	
КонецФункции

Функция ТестовыеДанные(ПутьКДанным, Макет = Неопределено) Экспорт
	// ПутьКДанным (Строка) = ИмяМакетаВТесте.ИмяТаблицы
	
	Если Макет = Неопределено Тогда
		ПутьКДаннымПоСтрокам = СтрЗаменить(ПутьКДанным, ".", Символы.ПС);
		ИмяМакета = СтрПолучитьСтроку(ПутьКДаннымПоСтрокам, 1);
		Макет = ТекущийТест().ПолучитьМакет(ИмяМакета);
	Иначе
		ИмяМакета = "-";
	КонецЕсли;
	
	ТестовыеДанные = мИнструменты.xddDataGenerator.СоздатьДанныеПоТабличномуДокументу(Макет);
	
	Гуид = Строка(Новый УникальныйИдентификатор);
	Команда = СтрЗаменить(Гуид + ПутьКДанным, Гуид + ИмяМакета, "ТестовыеДанные");
	Команда = СтрЗаменить(Команда, Гуид, "");
	Возврат Вычислить(Команда);
	
КонецФункции

Процедура ВызватьИзТеста(СтрокаВызова, Параметр) Экспорт
КонецПроцедуры

Процедура ОткрытьФормуОбъекта(Объект) Экспорт
	
	Если НЕ ОткрыватьФормуОбъекта Тогда
		Возврат;
	КонецЕсли;
	
	Форма = Объект.ПолучитьФорму();
	Если Форма = Неопределено Тогда
		ИмяОбработки = Объект.Метаданные().Имя;
	КонецЕсли;
	
	Если ЗначениеЗаполнено(ИмяОбработки) Тогда
		Форма = Обработки[ИмяОбработки].ПолучитьФорму();
		ЗначениеВДанныеФормы(Объект, Форма.Объект);
	КонецЕсли;
	
	Форма.ОткрытьМодально();
	
	Если ЗначениеЗаполнено(ИмяОбработки) Тогда
		НовыйОбъект = ДанныеФормыВЗначение(Форма.Объект, Тип("ОбработкаОбъект."+ИмяОбработки));
		
		ЗаполнитьЗначенияСвойств(Объект, НовыйОбъект);
		
		Для каждого ТабличнаяЧасть из Объект.Метаданные().ТабличныеЧасти Цикл
			ИмяТабличнойЧасти = ТабличнаяЧасть.Имя;
			Объект[ИмяТабличнойЧасти].Загрузить(НовыйОбъект[ИмяТабличнойЧасти].Выгрузить());
		КонецЦикла;
	КонецЕсли;
	
КонецПроцедуры

#КонецОбласти

Функция ПолучитьТабличныйДокументПоТаблицеЗначений(ТаблицаЗначений) Экспорт
	ЛинияГраницы = Новый Линия(ТипЛинииЯчейкиТабличногоДокумента.Сплошная);
	ЦветГраницы = WebЦвета.Серебряный;
	
	ТабличныйДокумент = Новый ТабличныйДокумент;
	Для счКол = 1 по ТаблицаЗначений.Колонки.Количество() Цикл
		ИмяКолонки = ТаблицаЗначений.Колонки[счКол-1].Имя;
		Область = ТабличныйДокумент.Область(1, счКол);
		Область.Текст = ИмяКолонки;
		Область.ШиринаКолонки = 20;
		Область.ГоризонтальноеПоложение = ГоризонтальноеПоложение.Центр;
		Область.ЦветФона = WebЦвета.Серый;
		Область.ЦветТекста = WebЦвета.Белый;
		Область.ГраницаСправа = ЛинияГраницы;
		Область.ЦветРамки = ЦветГраницы;
	КонецЦикла;
	
	Для каждого Строка из ТаблицаЗначений Цикл
		счСтр = ТаблицаЗначений.Индекс(Строка) + 2;
		
		Для счКол = 1 по ТаблицаЗначений.Колонки.Количество() Цикл
			Область = ТабличныйДокумент.Область(счСтр, счКол);
			Область.Текст = Строка[счКол-1];
			Область.ГраницаСправа = ЛинияГраницы;
			Область.ЦветРамки = ЦветГраницы;
		КонецЦикла;
		
	КонецЦикла;
	
	Возврат ТабличныйДокумент;
КонецФункции

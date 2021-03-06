﻿
Функция ПутьККаталогуСоСлешем(ПутьККаталогуСоСлешемИлиБез)
	
	Файл = Новый Файл(ПутьККаталогуСоСлешемИлиБез);
	Возврат Файл.ПолноеИмя + ПолучитьРазделительПути();
	
КонецФункции

// Возвращает путь к каталогу без слеша.
// Если файл существует, то имя файла возвращается с учетом регистра, как в файловой системе
Функция ПолучитьПутьКФайлуВСтандартномФормате(ИсходныйПуть)
	НайденныеФайлы = НайтиФайлы(ИсходныйПуть);
	Если НайденныеФайлы.Количество() Тогда
		Возврат НайденныеФайлы[0].ПолноеИмя;
	КонецЕсли;
	
	Файл = Новый Файл(ИсходныйПуть);
	Возврат Файл.ПолноеИмя;
КонецФункции


// Копирует все файлы в указанном каталоге в другой каталог.
//
// Параметры:
//   Результат - Структура - Результат копирования.
//       * ВозниклаОшибка           - Булево - Истина когда все файлы скопированы.
//       * ИнформацияОбОшибке       - ИнформацияОбОшибке - Информация об ошибке.
//       * ПолноеИмяСбойногоФайла   - Строка - Полное имя файла, при копировании которого возникла ошибка.
//       * СкопированныеФайлыИПапки - Массив - Полные имена файлов и папок приемника.
//       * ОригинальныеФайлыИПапки  - Массив - Полные имена файлов и папок источника.
//   КаталогИсточника  - Строка - прежнее имя каталога.
//   КаталогПриемника  - Строка - новое имя каталога.
// Взято из БСП 2.3 (модуль РаботаСФайламиСлужебныйКлиент)
Процедура КопироватьСодержимоеКаталога(Результат, КаталогИсточника, КаталогПриемника)
	
	Если Не ТипЗнч(Результат) = Тип("Структура") Тогда
		Результат = Новый Структура;
		Результат.Вставить("ВозниклаОшибка",           Ложь);
		Результат.Вставить("ПолноеИмяСбойногоФайла",   "");
		Результат.Вставить("ИнформацияОбОшибке",       "");
		Результат.Вставить("СкопированныеФайлыИПапки", Новый Массив);
		Результат.Вставить("ОригинальныеФайлыИПапки",  Новый Массив);
	КонецЕсли;
	
	КаталогПриемника = ДобавитьКонечныйРазделительПути(КаталогПриемника);
	КаталогИсточника = ДобавитьКонечныйРазделительПути(КаталогИсточника);
	
	СоздатьКаталог(КаталогПриемника);
	
	Результат.СкопированныеФайлыИПапки.Добавить(КаталогПриемника);
	Результат.ОригинальныеФайлыИПапки.Добавить(КаталогИсточника);
	
	ФайлыИсточника = НайтиФайлы(КаталогИсточника, "*");
	
	Для Каждого ФайлИсточника Из ФайлыИсточника Цикл
		
		ФайлИсточникаПолноеИмя = ФайлИсточника.ПолноеИмя;
		ФайлИсточникаИмя       = ФайлИсточника.Имя;
		ФайлПриемникаПолноеИмя = КаталогПриемника + ФайлИсточникаИмя;
		
		Если ФайлИсточника.ЭтоКаталог() Тогда
			
			КопироватьСодержимоеКаталога(Результат, ФайлИсточникаПолноеИмя, ФайлПриемникаПолноеИмя);
			Если Результат.ВозниклаОшибка Тогда
				Возврат;
			КонецЕсли;
			
		Иначе
			
			Результат.ОригинальныеФайлыИПапки.Добавить(ФайлИсточникаПолноеИмя);
			
			ФайлПриемника = Новый Файл(ФайлПриемникаПолноеИмя);
			Если ФайлПриемника.Существует() Тогда
				// Это нужно для обратного копирования - в этом случае файлы уже могут существовать.
				Результат.СкопированныеФайлыИПапки.Добавить(ФайлПриемникаПолноеИмя);
			Иначе
				Попытка
					КопироватьФайл(ФайлИсточникаПолноеИмя, ФайлПриемникаПолноеИмя);
				Исключение
					Результат.ВозниклаОшибка         = Истина;
					Результат.ИнформацияОбОшибке     = ИнформацияОбОшибке();
					Результат.ПолноеИмяСбойногоФайла = ФайлИсточникаПолноеИмя;
					Возврат;
				КонецПопытки;
				Результат.СкопированныеФайлыИПапки.Добавить(ФайлПриемникаПолноеИмя);
			КонецЕсли;
		КонецЕсли;
		
	КонецЦикла;
	
КонецПроцедуры

// Добавляет к переданному пути каталога конечный символ-разделитель, если он отсутствует.
//
// Параметры:
//  ПутьКаталога - Строка - путь к каталогу.
//
// Возвращаемое значение:
//  Строка - путь к каталогу с конечным символом-разделителем.
//
// Примеры использования:
//  Результат = ДобавитьКонечныйРазделительПути("C:\Мой каталог"); // возвращает "C:\Мой каталог\".
//  Результат = ДобавитьКонечныйРазделительПути("C:\Мой каталог\"); // возвращает "C:\Мой каталог\".
//  Результат = ДобавитьКонечныйРазделительПути("%APPDATA%"); // возвращает "%APPDATA%\"
// Взято из БСП 2.3 (модуль ОбщегоНазначенияКлиентСервер)
//
Функция ДобавитьКонечныйРазделительПути(Знач ПутьКаталога, Знач Удалить_Платформа = Неопределено) Экспорт
	Если ПустаяСтрока(ПутьКаталога) Тогда
		Возврат ПутьКаталога;
	КонецЕсли;
	
	ДобавляемыйСимвол = ПолучитьРазделительПути();
	
	Если Прав(ПутьКаталога,1) = ДобавляемыйСимвол Тогда
		Возврат ПутьКаталога;
	Иначе 
		Возврат ПутьКаталога + ДобавляемыйСимвол;
	КонецЕсли;
КонецФункции


﻿

&НаКлиенте
Процедура ОткрытьОбработку(Команда)
    //Помещаем обработку во временном хранилище
    АдресХранилища = "";
    Результат = ПоместитьФайл(АдресХранилища, Объект.ПутьКОбработке, , Ложь);           
    ИмяОбработки = ПодключитьВнешнююОбработку(АдресХранилища);
    
    // Откроем форму подключенной внешней обработки
    ОткрытьФорму("ВнешняяОбработка."+ ИмяОбработки +".Форма");
КонецПроцедуры
&НаСервере
Функция ПодключитьВнешнююОбработку(АдресХранилища)
    Возврат ВнешниеОбработки.Подключить(АдресХранилища); 
КонецФункции 

&НаКлиенте
Процедура ПередЗакрытием(Отказ, СтандартнаяОбработка)
	Отказ = Истина;
КонецПроцедуры

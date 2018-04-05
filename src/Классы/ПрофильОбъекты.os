Перем ТипЭлементов;
Перем Кластер_Агент;
Перем Кластер_Владелец;
Перем Профиль_Владелец;
Перем Элементы;

Перем ПараметрыЭлементов;

Перем МоментАктуальности;
Перем ПериодОбновления;

Процедура ПриСозданииОбъекта(Агент, Кластер, Профиль, Тип)

	Элементы = Неопределено;

	Кластер_Агент = Агент;
	Кластер_Владелец = Кластер;
	Профиль_Владелец = Профиль;

	ТипЭлементов = Тип;

	ПараметрыЭлементов = Новый ПараметрыОбъекта("profile." + ТипЭлементов);

	ПериодОбновления = 60000;
	МоментАктуальности = 0;

КонецПроцедуры // ПриСозданииОбъекта()

// Процедура получает данные от сервиса администрирования кластера 1С
// и сохраняет в локальных переменных
//   
// Параметры:
//   ОбновитьПринудительно 		- Булево	- Истина - принудительно обновить данные (вызов RAC)
//											- Ложь - данные будут получены если истекло время актуальности
//													или данные не были получены ранее
//   
Процедура ОбновитьДанные(ОбновитьПринудительно = Ложь) Экспорт

	Если НЕ ТребуетсяОбновление(ОбновитьПринудительно) Тогда
		Возврат;
	КонецЕсли;

	ПараметрыЗапуска = Новый Массив();
	ПараметрыЗапуска.Добавить(Кластер_Агент.СтрокаПодключения());

	ПараметрыЗапуска.Добавить("profile");
	ПараметрыЗапуска.Добавить("acl");
	ПараметрыЗапуска.Добавить(ТипЭлементов);
	ПараметрыЗапуска.Добавить("list");

	ПараметрыЗапуска.Добавить(СтрШаблон("--name=%1", Профиль_Владелец.Имя()));
	ПараметрыЗапуска.Добавить(СтрШаблон("--cluster=%1", Кластер_Владелец.Ид()));
	ПараметрыЗапуска.Добавить(Кластер_Владелец.СтрокаАвторизации());

	Служебный.ВыполнитьКоманду(ПараметрыЗапуска);
	
	Элементы = Служебный.РазобратьВыводКоманды(Служебный.ВыводКоманды());

	МоментАктуальности = ТекущаяУниверсальнаяДатаВМиллисекундах();

КонецПроцедуры // ОбновитьДанные()

// Процедура добавляет элемент в список
//   
// Параметры:
//   Элемент 	- Произвольный		- добавляемый элемент
//
Процедура Добавить(Элемент) Экспорт

	Элементы.Добавить(Элемент);

КонецПроцедуры // Добавить()

// Функция признак необходимости обновления данных
//   
// Параметры:
//   ОбновитьПринудительно 	- Булево		- Истина - принудительно обновить данные (вызов RAC)
//
// Возвращаемое значение:
//	Булево - Истина - требуется обновитьданные
//
Функция ТребуетсяОбновление(ОбновитьПринудительно = Ложь) Экспорт

	Возврат (ОбновитьПринудительно
		ИЛИ Элементы = Неопределено
		ИЛИ (ПериодОбновления < (ТекущаяУниверсальнаяДатаВМиллисекундах() - МоментАктуальности)));

КонецФункции // ТребуетсяОбновление()

// Функция возвращает коллекцию параметров объекта
//   
// Параметры:
//   ИмяПоляКлюча 		- Строка	- имя поля, значение которого будет использовано
//									  в качестве ключа возвращаемого соответствия
//   
// Возвращаемое значение:
//	Соответствие - коллекция параметров объекта, для получения/изменения значений
//
Функция ПараметрыОбъекта(ИмяПоляКлюча = "ИмяПараметра") Экспорт

	Возврат ПараметрыЭлементов.Получить(ИмяПоляКлюча);

КонецФункции // ПараметрыОбъекта()

// Функция возвращает список объектов кластера
//   
// Параметры:
//   Отбор					 	- Структура	- Структура отбора объектов (<поле>:<значение>)
//   ОбновитьПринудительно 		- Булево	- Истина - принудительно обновить данные (вызов RAC)
//
// Возвращаемое значение:
//	Массив - список объектов кластера 1С
//
Функция Список(Отбор = Неопределено, ОбновитьПринудительно = Ложь) Экспорт

	ОбновитьДанные(ОбновитьПринудительно);

	Результат = Служебный.ПолучитьЭлементыИзМассиваСоответствий(Элементы, Отбор);

	Если Результат.Количество() = 0 Тогда
		Возврат Неопределено;
	Иначе
		Возврат Результат;
	КонецЕсли;

КонецФункции // Список()

// Функция возвращает список объектов кластера
//   
// Параметры:
//   ПоляИерархии			- Строка		- Поля для построения иерархии списка объектов, разделенные ","
//   ОбновитьПринудительно	- Булево		- Истина - принудительно обновить данные (вызов RAC)
//
// Возвращаемое значение:
//	Соответствие - список объектов кластера 1С
//		<имя поля объекта>	- Массив(Соответствие), Соответствие	- список объектов кластера или следующий уровень
//
Функция ИерархическийСписок(Знач ПоляИерархии, ОбновитьПринудительно = Ложь) Экспорт

	ОбновитьДанные(ОбновитьПринудительно);

	Результат = Служебный.ИерархическоеПредставлениеМассиваСоответствий(Элементы, ПоляИерархии);
	
	Возврат Результат;

КонецФункции // ИерархическийСписок()

// Процедура устанавливает значение периода обновления
//   
// Параметры:
//   НовыйПериодОбновления 	- Число		- новый период обновления
//
Процедура УстановитьПериодОбновления(НовыйПериодОбновления) Экспорт

	ПериодОбновления = НовыйПериодОбновления;

КонецПроцедуры // УстановитьПериодОбновления()

// Процедура устанавливает новое значение момента актуальности данных
//   
Процедура УстановитьАктуальность() Экспорт

	МоментАктуальности = ТекущаяУниверсальнаяДатаВМиллисекундах();

КонецПроцедуры // УстановитьАктуальность()

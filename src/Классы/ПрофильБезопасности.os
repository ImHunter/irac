Перем Профиль_Ид;		// profile
Перем Профиль_Имя;		// name
Перем Профиль_Параметры;

Перем Профиль_Каталоги;
Перем Профиль_COMКлассы;
Перем Профиль_ВнешниеКомпоненты;
Перем Профиль_ВнешниеМодули;
Перем Профиль_Приложения;
Перем Профиль_ИнтернетРесурсы;

Перем Кластер_Агент;
Перем Кластер_Владелец;

Перем ПараметрыОбъекта;

Перем ПериодОбновления;
Перем МоментАктуальности;

Перем Лог;

// Конструктор
//   
// Параметры:
//   АгентКластера		- АгентКластера	- ссылка на родительский объект агента кластера
//   Кластер			- Кластер		- ссылка на родительский объект кластера
//   Имя				- Строка		- имя профиля безопасности в кластере 1С
//
Процедура ПриСозданииОбъекта(АгентКластера, Кластер, Имя)

	Если НЕ ЗначениеЗаполнено(Имя) Тогда
		Возврат;
	КонецЕсли;

	Кластер_Агент	= АгентКластера;
	Кластер_Владелец = Кластер;

	Профиль_Имя = Имя;
	
	Профиль_Каталоги			= Новый ОбъектыПрофиля(Кластер_Агент, Кластер_Владелец, ЭтотОбъект,
														Перечисления.ВидыОбъектовПрофиляБезопасности.Каталог);
	Профиль_COMКлассы			= Новый ОбъектыПрофиля(Кластер_Агент, Кластер_Владелец, ЭтотОбъект,
														Перечисления.ВидыОбъектовПрофиляБезопасности.COMКласс);
	Профиль_ВнешниеКомпоненты	= Новый ОбъектыПрофиля(Кластер_Агент, Кластер_Владелец, ЭтотОбъект,
														Перечисления.ВидыОбъектовПрофиляБезопасности.Компонент);
	Профиль_ВнешниеМодули		= Новый ОбъектыПрофиля(Кластер_Агент, Кластер_Владелец, ЭтотОбъект,
														Перечисления.ВидыОбъектовПрофиляБезопасности.Модуль);
	Профиль_Приложения			= Новый ОбъектыПрофиля(Кластер_Агент, Кластер_Владелец, ЭтотОбъект,
														Перечисления.ВидыОбъектовПрофиляБезопасности.Приложение);
	Профиль_ИнтернетРесурсы		= Новый ОбъектыПрофиля(Кластер_Агент, Кластер_Владелец, ЭтотОбъект,
														Перечисления.ВидыОбъектовПрофиляБезопасности.ИнтернетРесурс);
	
	ПараметрыОбъекта = Новый ПараметрыОбъекта("profile");

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

	Если НЕ Служебный.ТребуетсяОбновление(Профиль_Параметры,
			МоментАктуальности, ПериодОбновления, ОбновитьПринудительно) Тогда
		Возврат;
	КонецЕсли;

	ПараметрыЗапуска = Новый Массив();
	ПараметрыЗапуска.Добавить(Кластер_Агент.СтрокаПодключения());

	ПараметрыЗапуска.Добавить("profile");
	ПараметрыЗапуска.Добавить("info");

	ПараметрыЗапуска.Добавить(СтрШаблон("--name=%1", Имя()));
	ПараметрыЗапуска.Добавить(СтрШаблон("--cluster=%1", Кластер_Владелец.Ид()));
	ПараметрыЗапуска.Добавить(Кластер_Владелец.СтрокаАвторизации());

	Кластер_Агент.ВыполнитьКоманду(ПараметрыЗапуска);
	
	МассивРезультатов = Кластер_Агент.ВыводКоманды();

	ТекОписание = МассивРезультатов[0];

	Профиль_Имя = ТекОписание.Получить("name");

	ВремПараметры = ПараметрыОбъекта();

	Профиль_Параметры = Новый Соответствие();

	Для Каждого ТекЭлемент Из ВремПараметры Цикл
		ЗначениеПараметра = Служебный.ПолучитьЗначениеИзСтруктуры(ТекОписание,
																  ТекЭлемент.Значение.ИмяПоляРАК,
																  ТекЭлемент.Значение.ЗначениеПоУмолчанию); 
		Профиль_Параметры.Вставить(ТекЭлемент.Ключ, ЗначениеПараметра);
	КонецЦикла;

	МоментАктуальности = ТекущаяУниверсальнаяДатаВМиллисекундах();

КонецПроцедуры // ОбновитьДанные()

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

	Возврат ПараметрыОбъекта.Получить(ИмяПоляКлюча);

КонецФункции // ПараметрыОбъекта()

// Функция возвращает имя профиля безопасности 1С
//   
// Возвращаемое значение:
//	Строка - имя профиля безопасности 1С
//
Функция Имя() Экспорт

	Возврат Профиль_Имя;

КонецФункции // Имя()

// Функция возвращает список разрешенных виртуальных каталогов
//   
// Возвращаемое значение:
//	ОбъектыПрофиля - список разрешенных виртуальных каталогов
//
Функция Каталоги() Экспорт
	
	Возврат Профиль_Каталоги;
	
КонецФункции // Каталоги()
	
// Функция возвращает список разрешенных COM-классов
//   
// Возвращаемое значение:
//	ОбъектыПрофиля - список разрешенных COM-Классов
//
Функция COMКлассы() Экспорт
	
	Возврат Профиль_COMКлассы;
	
КонецФункции // COMКлассы()
	
// Функция возвращает список разрешенных внешних компонент
//   
// Возвращаемое значение:
//	ОбъектыПрофиля - список разрешенных внешних компонент
//
Функция ВнешниеКомпоненты() Экспорт
	
	Возврат Профиль_ВнешниеКомпоненты;
	
КонецФункции // ВнешниеКомпоненты()
	
// Функция возвращает список разрешенных внешних модулей
//   
// Возвращаемое значение:
//	ОбъектыПрофиля - список разрешенных внешних модулей
//
Функция ВнешниеМодули() Экспорт
	
	Возврат Профиль_ВнешниеМодули;
	
КонецФункции // ВнешниеМодули()
	
// Функция возвращает список разрешенных приложений
//   
// Возвращаемое значение:
//	ОбъектыПрофиля - список разрешенных приложений
//
Функция Приложения() Экспорт
	
	Возврат Профиль_Приложения;
	
КонецФункции // Приложения()
	
// Функция возвращает список разрешенных ресурсов интернет
//   
// Возвращаемое значение:
//	ОбъектыПрофиля - список разрешенных ресурсов интернет
//
Функция ИнтернетРесурсы() Экспорт
	
	Возврат Профиль_ИнтернетРесурсы;
	
КонецФункции // ИнтернетРесурсы()
	
// Функция возвращает значение параметра профиля безопасности кластера 1С
//   
// Параметры:
//   ИмяПоля			 	- Строка		- Имя параметра кластера
//   ОбновитьПринудительно 	- Булево		- Истина - обновить список (вызов RAC)
//
// Возвращаемое значение:
//	Произвольный - значение параметра профиля безопасности кластера 1С
//
Функция Получить(ИмяПоля, ОбновитьПринудительно = Ложь) Экспорт
	
	ОбновитьДанные(ОбновитьПринудительно);

	Если НЕ Найти(ВРЕг("Ид, profile"), ВРег(ИмяПоля)) = 0 Тогда
		Возврат Профиль_Ид;
	ИначеЕсли НЕ Найти(ВРЕг("Имя, name"), ВРег(ИмяПоля)) = 0 Тогда
		Возврат Профиль_Ид;
	КонецЕсли;
	
	ЗначениеПоля = Профиль_Параметры.Получить(ИмяПоля);

	Если ЗначениеПоля = Неопределено Тогда
		
		ОписаниеПараметра = ПараметрыОбъекта("ИмяПоляРАК").Получить(ИмяПоля);

		Если НЕ ОписаниеПараметра = Неопределено Тогда
			ЗначениеПоля = Профиль_Параметры.Получить(ОписаниеПараметра["ИмяПараметра"]);
		КонецЕсли;
	КонецЕсли;

	Возврат ЗначениеПоля;
		
КонецФункции // Получить()
	
// Процедура изменяет режим доступа к объектам профиля (список/полный доступ)
//   
// Параметры:
//   ВидОбъектовПрофиля	 	- Перечисление.			- вид объекта профиля для изменения режима доступа
//							  ВидыОбъектовПрофиляБезопасности
//   РежимДоступа		 	- Перечисление.			- устанавливаемый режим доступа
//							  РежимДоступа
//
Процедура ИзменитьРежимДоступаКОбъектамПрофиля(ВидОбъектовПрофиля, РежимДоступа)

	ПараметрыЗапуска = Новый Массив();
	ПараметрыЗапуска.Добавить(Кластер_Агент.СтрокаПодключения());

	ПараметрыЗапуска.Добавить("profile");
	ПараметрыЗапуска.Добавить("acl");
	ПараметрыЗапуска.Добавить(ВидОбъектовПрофиля);

	ПараметрыЗапуска.Добавить(СтрШаблон("--name=%1", Имя()));
	ПараметрыЗапуска.Добавить(СтрШаблон("--access=%1", РежимДоступа));

	ПараметрыЗапуска.Добавить(СтрШаблон("--cluster=%1", Кластер_Владелец.Ид()));

	ПараметрыЗапуска.Добавить(Кластер_Владелец.СтрокаАвторизации());
		
	Кластер_Агент.ВыполнитьКоманду(ПараметрыЗапуска);
	
	Лог.Информация(Кластер_Агент.ВыводКоманды());

КонецПроцедуры // ИзменитьРежимДоступаКОбъектамПрофиля()

// Процедура изменяет параметры профиля безопасности
//   
// Параметры:
//   ПараметрыПрофиля	 	- Структура		- новые параметры профиля безопасности
//
Процедура Изменить(Знач ПараметрыПрофиля = Неопределено) Экспорт

	Если НЕ ТипЗнч(ПараметрыПрофиля) = Тип("Структура") Тогда
		ПараметрыПрофиля = Новый Структура();
	КонецЕсли;

	ПараметрыЗапуска = Новый Массив();
	ПараметрыЗапуска.Добавить(Кластер_Агент.СтрокаПодключения());

	ПараметрыЗапуска.Добавить("profile");
	ПараметрыЗапуска.Добавить("update");

	ПараметрыЗапуска.Добавить(СтрШаблон("--name=%1", Имя()));
	ПараметрыЗапуска.Добавить(СтрШаблон("--cluster=%1", Кластер_Владелец.Ид()));

	ПараметрыЗапуска.Добавить(Кластер_Владелец.СтрокаАвторизации());
		
	ПараметрыРежимаДоступа = "directory,com,addin,module,app,inet";

	ВремПараметры = ПараметрыОбъекта();

	Для Каждого ТекЭлемент Из ВремПараметры Цикл
		Если НЕ ПараметрыПрофиля.Свойство(ТекЭлемент.Ключ) Тогда
			Продолжить;
		КонецЕсли;
		Если СтрНайти(ПараметрыРежимаДоступа, ТекЭлемент.ИмяПоляРАК) = 0 Тогда
			ПараметрыЗапуска.Добавить(СтрШаблон(ТекЭлемент.ПараметрКоманды + "=%1", ПараметрыПрофиля[ТекЭлемент.Ключ]));
		Иначе
			ИзменитьРежимДоступаКОбъектамПрофиля(ТекЭлемент.ИмяПоляРАК, ПараметрыПрофиля[ТекЭлемент.Ключ]);
		КонецЕсли; 
	КонецЦикла;

	Кластер_Агент.ВыполнитьКоманду(ПараметрыЗапуска);
	
	Лог.Информация(Кластер_Агент.ВыводКоманды());

	ОбновитьДанные();

КонецПроцедуры

Лог = Логирование.ПолучитьЛог("ktb.lib.irac");

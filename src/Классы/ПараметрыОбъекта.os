// Класс хранящий структуру параметров объекта указанного типа
// Доступны типы:
//		cluster			- Кластер
//		admin			- Администратор (агента / кластера)
//		lock			- Блокировка
//		infobase		- ИнформационнаяБаза
//		manager			- МенеджерКластера
//		process			- РабочийПроцесс
//		server			- Сервер
//		service			- Сервис
//		session			- Сеанс
//		connection		- Соединение
//		process-license	- ЛицензияПроцесса
//		session-license	- ЛицензияСеанса
//		rule			- ТребованиеНазначения
//		profile			- ПрофильБезопасности

Перем Параметры;

Перем Лог;

// Конструктор
//   
// Параметры:
//   ИмяТипаОбъекта			- Строка	- имя типа объекта для которого создается структура параметров
//
Процедура ПриСозданииОбъекта(ИмяТипаОбъекта)

	ПроцедурыЗаполнения = Новый Соответствие();
	ПроцедурыЗаполнения.Вставить(ВРег("cluster")			, "ЗаполнитьПараметрыКластера");
	ПроцедурыЗаполнения.Вставить(ВРег("Кластер")			, "ЗаполнитьПараметрыКластера");
	ПроцедурыЗаполнения.Вставить(ВРег("admin")			, "ЗаполнитьПараметрыАдминистратора");
	ПроцедурыЗаполнения.Вставить(ВРег("Администратор")		, "ЗаполнитьПараметрыАдминистратора");
	ПроцедурыЗаполнения.Вставить(ВРег("lock")			, "ЗаполнитьПараметрыБлокировки");
	ПроцедурыЗаполнения.Вставить(ВРег("Блокировка")			, "ЗаполнитьПараметрыБлокировки");
	ПроцедурыЗаполнения.Вставить(ВРег("infobase")			, "ЗаполнитьПараметрыИнформационнойБазы");
	ПроцедурыЗаполнения.Вставить(ВРег("ИнформационнаяБаза")		, "ЗаполнитьПараметрыИнформационнойБазы");
	ПроцедурыЗаполнения.Вставить(ВРег("manager")			, "ЗаполнитьПараметрыМенеджераКластера");
	ПроцедурыЗаполнения.Вставить(ВРег("МенеджерКластера")		, "ЗаполнитьПараметрыМенеджераКластера");
	ПроцедурыЗаполнения.Вставить(ВРег("process")			, "ЗаполнитьПараметрыРабочегоПроцесса");
	ПроцедурыЗаполнения.Вставить(ВРег("РабочийПроцесс")		, "ЗаполнитьПараметрыРабочегоПроцесса");
	ПроцедурыЗаполнения.Вставить(ВРег("server")			, "ЗаполнитьПараметрыСервера");
	ПроцедурыЗаполнения.Вставить(ВРег("Сервер")			, "ЗаполнитьПараметрыСервера");
	ПроцедурыЗаполнения.Вставить(ВРег("service")			, "ЗаполнитьПараметрыСервиса");
	ПроцедурыЗаполнения.Вставить(ВРег("Сервис")			, "ЗаполнитьПараметрыСервиса");
	ПроцедурыЗаполнения.Вставить(ВРег("session")			, "ЗаполнитьПараметрыСеанса");
	ПроцедурыЗаполнения.Вставить(ВРег("Сеанс")			, "ЗаполнитьПараметрыСеанса");
	ПроцедурыЗаполнения.Вставить(ВРег("connection")			, "ЗаполнитьПараметрыСоединения");
	ПроцедурыЗаполнения.Вставить(ВРег("Соединение")			, "ЗаполнитьПараметрыСоединения");
	ПроцедурыЗаполнения.Вставить(ВРег("process-license")		, "ЗаполнитьПараметрыЛицензииПроцесса");
	ПроцедурыЗаполнения.Вставить(ВРег("ЛицензияПроцесса")		, "ЗаполнитьПараметрыЛицензииПроцесса");
	ПроцедурыЗаполнения.Вставить(ВРег("session-license")		, "ЗаполнитьПараметрыЛицензииСеанса");
	ПроцедурыЗаполнения.Вставить(ВРег("ЛицензияСеанса")		, "ЗаполнитьПараметрыЛицензииСеанса");
	ПроцедурыЗаполнения.Вставить(ВРег("rule")			, "ЗаполнитьПараметрыТребованияНазначения");
	ПроцедурыЗаполнения.Вставить(ВРег("ТребованиеНазначения")	, "ЗаполнитьПараметрыТребованияНазначения");
	ПроцедурыЗаполнения.Вставить(ВРег("profile")			, "ЗаполнитьПараметрыПрофиляБезопасности");
	ПроцедурыЗаполнения.Вставить(ВРег("profile.directory")		, "ЗаполнитьПараметрыКаталогаПрофиля");
	ПроцедурыЗаполнения.Вставить(ВРег("Профиль.Каталог")		, "ЗаполнитьПараметрыКаталогаПрофиля");
	ПроцедурыЗаполнения.Вставить(ВРег("profile.com")		, "ЗаполнитьПараметрыCOMКлассаПрофиля");
	ПроцедурыЗаполнения.Вставить(ВРег("Профиль.COMКласс")		, "ЗаполнитьПараметрыCOMКлассаПрофиля");
	ПроцедурыЗаполнения.Вставить(ВРег("profile.addin")		, "ЗаполнитьПараметрыКомпонентыМодуляПрофиля");
	ПроцедурыЗаполнения.Вставить(ВРег("Профиль.Компонент")		, "ЗаполнитьПараметрыКомпонентыМодуляПрофиля");
	ПроцедурыЗаполнения.Вставить(ВРег("profile.module")		, "ЗаполнитьПараметрыКомпонентыМодуляПрофиля");
	ПроцедурыЗаполнения.Вставить(ВРег("Профиль.Модуль")		, "ЗаполнитьПараметрыКомпонентыМодуляПрофиля");
	ПроцедурыЗаполнения.Вставить(ВРег("profile.app")		, "ЗаполнитьПараметрыПриложенияПрофиля");
	ПроцедурыЗаполнения.Вставить(ВРег("Профиль.Приложение")		, "ЗаполнитьПараметрыПриложенияПрофиля");
	ПроцедурыЗаполнения.Вставить(ВРег("profile.inet")		, "ЗаполнитьПараметрыИнтернетРесурсаПрофиля");
	ПроцедурыЗаполнения.Вставить(ВРег("Профиль.ИнтернетРесурс")	, "ЗаполнитьПараметрыИнтернетРесурсаПрофиля");

	ПроцедураЗаполнения = ПроцедурыЗаполнения[ВРег(ИмяТипаОбъекта)];

	Если НЕ ПроцедураЗаполнения = Неопределено Тогда
		Рефлектор = Новый Рефлектор();
		Рефлектор.ВызватьМетод(ЭтотОбъект, ПроцедураЗаполнения, Новый Массив());
	КонецЕсли;

КонецПроцедуры // ПриСозданииОбъекта()

// Функция возвращает коллекцию параметров объекта
//   
// Параметры:
//   ИмяПоляКлюча 		- Строка	- имя поля, значение которого будет использовано
//									  в качестве ключа возвращаемого соответствия
//   
// Возвращаемое значение:
//	Соответствие - коллекция параметров объекта, для получения/изменения значений
//
Функция Получить(ИмяПоляКлюча = "ИмяПараметра") Экспорт
	
	СтруктураПараметров = Новый Соответствие();

	Если НЕ ТипЗнч(Параметры) = Тип("Массив") Тогда
		Возврат СтруктураПараметров;
	КонецЕсли;

	Для Каждого ТекПараметр Из Параметры Цикл
		СтруктураПараметров.Вставить(ТекПараметр[ИмяПоляКлюча], ТекПараметр);
	КонецЦикла;

	Возврат СтруктураПараметров;

КонецФункции // Получить()

// Процедура добавляет описание параметра в массив параметров
//   
// Параметры:
//   ИмяПараметра 			- Строка		- имя параметра объекта
//   ИмяПоляРАК 			- Строка		- имя поля, как оно возвращается утилитой администрирования кластера 1С
//   ЗначениеПоУмолчанию	- Произвольный	- значение поля объекта по умолчанию
//   ПараметрКоманды		- Строка		- строка параметра команды запуска утилиты администрирования кластера 1С
//   
Процедура ДобавитьПараметрОписанияОбъекта(Знач ИмяПараметра
									, Знач ИмяПоляРАК
									, Знач ЗначениеПоУмолчанию = ""
									, Знач ПараметрКоманды = "")

	Если НЕ ТипЗнч(Параметры) = Тип("Массив") Тогда
		Параметры = Новый Массив();
	КонецЕсли;

	ОписаниеПоля = Новый Структура();
	ОписаниеПоля.Вставить("ИмяПараметра"		, ИмяПараметра);
	ОписаниеПоля.Вставить("ИмяПоляРак"			, ИмяПоляРак);
	ОписаниеПоля.Вставить("ПараметрКоманды"		, ПараметрКоманды);
	ОписаниеПоля.Вставить("ЗначениеПоУмолчанию"	, ЗначениеПоУмолчанию);

	Если НЕ ЗначениеЗаполнено(ПараметрКоманды) Тогда
		ОписаниеПоля.ПараметрКоманды = "--" + ОписаниеПоля.ИмяПоляРАК;
	КонецЕсли;

	Параметры.Добавить(ОписаниеПоля);

КонецПроцедуры // ДобавитьПараметрОписанияОбъекта()

// Процедура заполняет массив описаний параметров кластера
//
Процедура ЗаполнитьПараметрыКластера() Экспорт

	ДобавитьПараметрОписанияОбъекта("Ид"							, "cluster"							, , "-");
	ДобавитьПараметрОписанияОбъекта("ИнтервалПерезапуска"			, "lifetime-limit"					, 0);
	ДобавитьПараметрОписанияОбъекта("ДопустимыйОбъемПамяти"			, "max-memory-size"					, 0);
	ДобавитьПараметрОписанияОбъекта("ЗащищенноеСоединение"			, "security-level"					, 0);
	ДобавитьПараметрОписанияОбъекта("УровеньОтказоустойчивости"		, "session-fault-tolerance-level"	, 0);
	ДобавитьПараметрОписанияОбъекта("РежимРаспределенияНагрузки"	, "load-balancing-mode", 
									Перечисления.РежимыРаспределенияНагрузки.ПоПроизводительности);

	ДобавитьПараметрОписанияОбъекта("ИнтервалПревышенияДопустимогоОбъемаПамяти"		, "max-memory-time-limit"	, 0);
	ДобавитьПараметрОписанияОбъекта("ДопустимоеОтклонениеКоличестваОшибокСервера"	, "errors-count-threshold"	, 0);
	ДобавитьПараметрОписанияОбъекта("ПринудительноЗавершатьПроблемныеПроцессы"		, "kill-problem-processes",
									Перечисления.ДаНет.Нет);
	ДобавитьПараметрОписанияОбъекта("ВыключенныеПроцессыОстанавливатьЧерез"			, "expiration-timeout"		, 0);

КонецПроцедуры // ЗаполнитьПараметрыКластера()

// Процедура заполняет массив описаний параметров администратора (агента / кластера)
//
Процедура ЗаполнитьПараметрыАдминистратора() Экспорт

	ДобавитьПараметрОписанияОбъекта("Имя"				, "name"	, "Администратор");
	ДобавитьПараметрОписанияОбъекта("Пароль"			, "pwd"		, "***");
	ДобавитьПараметрОписанияОбъекта("СпособАвторизации"	, "auth"	, Перечисления.СпособыАвторизации.Пароль);
	ДобавитьПараметрОписанияОбъекта("ПользовательОС"	, "os-user"	, "");
	ДобавитьПараметрОписанияОбъекта("Описание"			, "descr"	, "");

КонецПроцедуры // ЗаполнитьПараметрыАдминистратора()

// Процедура заполняет массив описаний параметров блокировки
//
Процедура ЗаполнитьПараметрыБлокировки() Экспорт

	ДобавитьПараметрОписанияОбъекта("Соединение_Ид"		, "connection"	, , "-");
	ДобавитьПараметрОписанияОбъекта("Сеанс_Ид"			, "session"		, , "-");
	ДобавитьПараметрОписанияОбъекта("Объект_Ид"			, "object"		, , "-");
	ДобавитьПараметрОписанияОбъекта("НачалоБлокировки"	, "locked"		, , "-");
	ДобавитьПараметрОписанияОбъекта("Описание"			, "descr"		, , "-");
	
КонецПроцедуры // ЗаполнитьПараметрыБлокировки()

// Процедура заполняет массив описаний параметров информационной базы
//
Процедура ЗаполнитьПараметрыИнформационнойБазы() Экспорт

	ДобавитьПараметрОписанияОбъекта("Ид"									, "infobase", , "-");
	ДобавитьПараметрОписанияОбъекта("ТипСУБД"								, "dbms",
									Перечисления.ТипыСУБД.MSSQLServer);
	ДобавитьПараметрОписанияОбъекта("АдресСервераСУБД"						, "db-server", "localhost");
	ДобавитьПараметрОписанияОбъекта("ИмяБазыСУБД"							, "db-name");
	ДобавитьПараметрОписанияОбъекта("ИмяПользователяБазыСУБД"				, "db-user", "sa");
	ДобавитьПараметрОписанияОбъекта("ПарольПользователяБазыСУБД"			, "db-pwd");
	ДобавитьПараметрОписанияОбъекта("НачалоБлокировкиСеансов"				, "denied-from", '00010101');
	ДобавитьПараметрОписанияОбъекта("ОкончаниеБлокировкиСеансов"			, "denied-to", '00010101');
	ДобавитьПараметрОписанияОбъекта("СообщениеБлокировкиСеансов"			, "denied-message");
	ДобавитьПараметрОписанияОбъекта("ПараметрБлокировкиСеансов"				, "denied-parameter");
	ДобавитьПараметрОписанияОбъекта("КодРазрешения"							, "permission-code");
	ДобавитьПараметрОписанияОбъекта("БлокировкаСеансовВключена"				, "sessions-deny",
									Перечисления.СостоянияВыключателя.Выключено);
	ДобавитьПараметрОписанияОбъекта("БлокировкаРегламентныхЗаданийВключена"	, "scheduled-jobs-deny",
									Перечисления.СостоянияВыключателя.Выключено);
	ДобавитьПараметрОписанияОбъекта("ВыдачаЛицензийСервером"				, "license-distribution",
									Перечисления.ПраваДоступа.Разрешено);
	
	ДобавитьПараметрОписанияОбъекта("ПараметрыВнешнегоУправленияСеансами",
									"external-session-manager-connection-string");
	
	ДобавитьПараметрОписанияОбъекта("ОбязательноеВнешнееУправлениеСеансами"	, "external-session-manager-required",
									Перечисления.ДаНет.Нет);
	ДобавитьПараметрОписанияОбъекта("ПрофильБезопасности"					, "security-profile-name");
	ДобавитьПараметрОписанияОбъекта("ПрофильБезопасностиБезопасногоРежима"	, "safe-mode-security-profile-name");

КонецПроцедуры // ЗаполнитьПараметрыИнформационнойБазы()

// Процедура заполняет массив описаний параметров менеджера кластера
//
Процедура ЗаполнитьПараметрыМенеджераКластера() Экспорт

	ДобавитьПараметрОписанияОбъекта("Ид"			, "manager"	, , "-");
	ДобавитьПараметрОписанияОбъекта("ИдПроцессаОС"	, "pid"		, , "-");
	ДобавитьПараметрОписанияОбъекта("Назначение"	, "using"	, , "-");
	ДобавитьПараметрОписанияОбъекта("АдресСервера"	, "host"	, , "-");
	ДобавитьПараметрОписанияОбъекта("ПортСервера"	, "port"	, , "-");
	ДобавитьПараметрОписанияОбъекта("Описание"		, "descr"	, , "-");

КонецПроцедуры // ЗаполнитьПараметрыМенеджераКластера()

// Процедура заполняет массив описаний параметров рабочего процесса
//
Процедура ЗаполнитьПараметрыРабочегоПроцесса() Экспорт

    ДобавитьПараметрОписанияОбъекта("Ид"							, "process"					, , "-");
	ДобавитьПараметрОписанияОбъекта("АдресСервера"					, "host"					, , "-");
	ДобавитьПараметрОписанияОбъекта("ПортСервера"					, "port"					, , "-");
	ДобавитьПараметрОписанияОбъекта("ИдПроцессаОС"					, "pid"						, , "-");
	ДобавитьПараметрОписанияОбъекта("Активен"						, "is-enable"				, , "-");
	ДобавитьПараметрОписанияОбъекта("Выполняется"					, "running"					, , "-");
	ДобавитьПараметрОписанияОбъекта("ВремяЗапуска"					, "started-at"				, , "-");
	ДобавитьПараметрОписанияОбъекта("Использование"					, "use"						, , "-");
	ДобавитьПараметрОписанияОбъекта("ДоступнаяПроизводительность"	, "available-perfomance"	, , "-");
	ДобавитьПараметрОписанияОбъекта("Емкость"						, "capacity"				, , "-");
	ДобавитьПараметрОписанияОбъекта("КоличествоСоединений"			, "connections"				, , "-");
	ДобавитьПараметрОписанияОбъекта("ЗанятьПамяти"					, "memory-size"				, , "-");
	ДобавитьПараметрОписанияОбъекта("ВремяПревышенияЗанятойПамяти"	, " memory-excess-time"		, , "-");
	ДобавитьПараметрОписанияОбъекта("ОбъемВыборки"					, "selection-size"			, , "-");
	ДобавитьПараметрОписанияОбъекта("ЗатраченоКлиентом"				, "avg-back-call-time"		, , "-");
	ДобавитьПараметрОписанияОбъекта("ЗатраченоВсего"				, "avg-call-time"			, , "-");
	ДобавитьПараметрОписанияОбъекта("ЗатраченоСУБД"					, "avg-db-call-time"		, , "-");
	ДобавитьПараметрОписанияОбъекта("ЗатраченоМенеджеромБлокировок"	, "avg-lock-call-time"		, , "-");
	ДобавитьПараметрОписанияОбъекта("ЗатраченоСервером"				, "avg-server-call-time"	, , "-");
	ДобавитьПараметрОписанияОбъекта("КлиентскихПотоков"				, "avg-threads"				, , "-");

КонецПроцедуры // ЗаполнитьПараметрыРабочегоПроцесса()

// Процедура заполняет массив описаний параметров сервера
//
Процедура ЗаполнитьПараметрыСервера() Экспорт
	
	ДиапазонПортов = 1561;
	КоличествоИБНаПроцесс = 8;
	КоличествоСоединенийНаПроцесс = 128;
	ПортГлавногоМенеджераКластера = 1541;

	ДобавитьПараметрОписанияОбъекта("ДиапазонПортов"					, "port-range"			, ДиапазонПортов);
	
	ДобавитьПараметрОписанияОбъекта("ЦентральныйСервер"					, "using",
									Перечисления.ВариантыИспользованияРабочегоСервера.Главный);
	ДобавитьПараметрОписанияОбъекта("МенеджерПодКаждыйСервис"			, "dedicate-managers",
										Перечисления.ВариантыРазмещенияСервисов.ВОдномМенеджере);

	ДобавитьПараметрОписанияОбъекта("КоличествоИБНаПроцесс"				, "infobases-limit"		, КоличествоИБНаПроцесс);
	ДобавитьПараметрОписанияОбъекта("МаксОбъемПамятиРабочихПроцессов"	, "memory-limit"		, 0);
	
	ДобавитьПараметрОписанияОбъекта("КоличествоСоединенийНаПроцесс"		, "connections-limit",
									КоличествоСоединенийНаПроцесс);
	ДобавитьПараметрОписанияОбъекта("ПортГлавногоМенеджераКластера"		, "cluster-port",
									ПортГлавногоМенеджераКластера);

	ДобавитьПараметрОписанияОбъекта("БезопасныйОбъемПамятиРабочихПроцессов", "safe-working-processes-memory-limit", 0);
	ДобавитьПараметрОписанияОбъекта("БезопасныйРасходПамятиЗаОдинВызов"	, "safe-call-memory-limit"	, 0);

КонецПроцедуры // ЗаполнитьПараметрыСервера()

// Процедура заполняет массив описаний параметров сервиса
//
Процедура ЗаполнитьПараметрыСервиса() Экспорт

	ДобавитьПараметрОписанияОбъекта("Имя"						, "name"			,  , "-");
	ДобавитьПараметрОписанияОбъекта("ТолькоГлавныйМенеджер"		, "main-only"		,  , "-");
	ДобавитьПараметрОписанияОбъекта("Менеджер_Ид"				, "manager"			,  , "-");
	ДобавитьПараметрОписанияОбъекта("Описание"					, "descr"			,  , "-");

КонецПроцедуры // ЗаполнитьПараметрыСервиса()

// Процедура заполняет массив описаний параметров сеанса
//
Процедура ЗаполнитьПараметрыСеанса() Экспорт

	ДобавитьПараметрОписанияОбъекта("Ид"							, "session"							, , "-");
	ДобавитьПараметрОписанияОбъекта("НомерСеанса"					, "session-id"						, , "-");
	ДобавитьПараметрОписанияОбъекта("ИнформационнаяБаза_Ид"			, "infobase"						, , "-");
	ДобавитьПараметрОписанияОбъекта("Соединение_Ид"					, "connection"						, , "-");
	ДобавитьПараметрОписанияОбъекта("Процесс_Ид"					, "process"							, , "-");
	ДобавитьПараметрОписанияОбъекта("Пользователь"					, "user-name"						, , "-");
	ДобавитьПараметрОписанияОбъекта("Компьютер"						, "host"							, , "-");
	ДобавитьПараметрОписанияОбъекта("Приложение"					, "app-id"							, , "-");
	ДобавитьПараметрОписанияОбъекта("Язык"							, "locale"							, , "-");
	ДобавитьПараметрОписанияОбъекта("ВремяНачала"					, "started-at"						, , "-");
	ДобавитьПараметрОписанияОбъекта("ПоследняяАктивность"			, "last-active-at"					, , "-");
	ДобавитьПараметрОписанияОбъекта("Спящий"						, "hibernate"						, , "-");
	ДобавитьПараметрОписанияОбъекта("ЗаснутьЧерез"					, "passive-session-hibernate-time"	, , "-");
	ДобавитьПараметрОписанияОбъекта("ЗавершитьЧерез"				, "hibernate-session-terminate-time", , "-");
	ДобавитьПараметрОписанияОбъекта("ЗаблокированоСУБД"				, "blocked-by-dbms"					, , "-");
	ДобавитьПараметрОписанияОбъекта("ЗаблокированоУпр"				, "blocked-by-ls"					, , "-");
	ДобавитьПараметрОписанияОбъекта("ДанныхВсего"					, "bytes-all"						, , "-");
	ДобавитьПараметрОписанияОбъекта("Данных5мин"					, "bytes-last-5min"					, , "-");
	ДобавитьПараметрОписанияОбъекта("КоличествоВызововВсего"		, "calls-all"						, , "-");
	ДобавитьПараметрОписанияОбъекта("КоличествоВызовов5мин"			, "calls-last-5min"					, , "-");
	ДобавитьПараметрОписанияОбъекта("ДанныхСУБДВсего"				, "dbms-bytes-all"					, , "-");
	ДобавитьПараметрОписанияОбъекта("ДанныхСУБД5мин"				, "dbms-bytes-last-5min"			, , "-");
	ДобавитьПараметрОписанияОбъекта("СоединениеССУБД"				, "db-proc-info"					, , "-");
	ДобавитьПараметрОписанияОбъекта("ЗахваченоСУБД"					, "db-proc-took"					, , "-");
	ДобавитьПараметрОписанияОбъекта("ВремяЗахватаСУБД"				, "db-proc-took-at"					, , "-");
	ДобавитьПараметрОписанияОбъекта("ВремяВызововВсего"				, "duration-all"					, , "-");
	ДобавитьПараметрОписанияОбъекта("ВремяВызововСУБДВсего"			, "duration-all-dbms"				, , "-");
	ДобавитьПараметрОписанияОбъекта("ВремяВызововТекущее"			, "duration-current"				, , "-");
	ДобавитьПараметрОписанияОбъекта("ВремяВызововСУБДТекущее"		, "duration-current-dbms"			, , "-");
	ДобавитьПараметрОписанияОбъекта("ВремяВызовов5мин"				, "duration-last-5min"				, , "-");
	ДобавитьПараметрОписанияОбъекта("ВремяВызововСУБД5мин"			, "duration-last-5min-dbms"			, , "-");
		 
КонецПроцедуры // ЗаполнитьПараметрыСеанса()

// Процедура заполняет массив описаний параметров соединения
//
Процедура ЗаполнитьПараметрыСоединения() Экспорт

	ДобавитьПараметрОписанияОбъекта("Ид"					, "connection"		, , "-");
	ДобавитьПараметрОписанияОбъекта("НомерСоединения"		, "conn-id"			, , "-");
	ДобавитьПараметрОписанияОбъекта("Процесс_Ид"			, "process"			, , "-");
	ДобавитьПараметрОписанияОбъекта("ИнформационнаяБаза_Ид"	, "infobase"		, , "-");
	ДобавитьПараметрОписанияОбъекта("Приложение"			, "application"		, , "-");
	ДобавитьПараметрОписанияОбъекта("НачалоРаботы"			, "connected-at"	, , "-");
	ДобавитьПараметрОписанияОбъекта("НомерСеанса"			, "session-number"	, , "-");
	ДобавитьПараметрОписанияОбъекта("Заблокировано"			, "blocked-by-ls"	, , "-");
		 
КонецПроцедуры // ЗаполнитьПараметрыСоединения()

// Процедура заполняет массив описаний параметров лицензии (общие)
//
Процедура ЗаполнитьПараметрыЛицензииОбщие() Экспорт

	ДобавитьПараметрОписанияОбъекта("ПолноеИмя"				, "full-name"			, , "-");
	ДобавитьПараметрОписанияОбъекта("Серия"					, "series"				, , "-");
	ДобавитьПараметрОписанияОбъекта("ВыданаСервером"		, "issued-by-server"	, , "-");
	ДобавитьПараметрОписанияОбъекта("ТипЛицензии"			, "license-type"		, , "-");
	ДобавитьПараметрОписанияОбъекта("Сетевая"				, "net"					, , "-");
	ДобавитьПараметрОписанияОбъекта("МаксПользователей"		, "max-users-all"		, , "-");
	ДобавитьПараметрОписанияОбъекта("МаксПользователейТек"	, "max-users-cur"		, , "-");
	ДобавитьПараметрОписанияОбъекта("Менеджер_АдресСервера"	, "rmngr-address"		, , "-");
	ДобавитьПараметрОписанияОбъекта("Менеджер_ПортСервера"	, "rmngr-port"			, , "-");
	ДобавитьПараметрОписанияОбъекта("Менеджер_ИдОС"			, "rmngr-pid"			, , "-");
	ДобавитьПараметрОписанияОбъекта("КраткоеПредставление"	, "short-presentation"	, , "-");
	ДобавитьПараметрОписанияОбъекта("ПолноеПредставление"	, "full-presentation"	, , "-");

КонецПроцедуры // ЗаполнитьПараметрыЛицензииПроцесса()

// Процедура заполняет массив описаний параметров лицензии процесса
//
Процедура ЗаполнитьПараметрыЛицензииПроцесса() Экспорт

	ДобавитьПараметрОписанияОбъекта("Процесс_Ид"			, "process"				, , "-");
	ДобавитьПараметрОписанияОбъекта("Процесс_АдресСервера"	, "host"				, , "-");
	ДобавитьПараметрОписанияОбъекта("Процесс_ПортСервера"	, "port"				, , "-");
	ДобавитьПараметрОписанияОбъекта("Процесс_ИдОС"			, "pid"					, , "-");

	ЗаполнитьПараметрыЛицензииОбщие();

КонецПроцедуры // ЗаполнитьПараметрыЛицензииПроцесса()

// Процедура заполняет массив описаний параметров лицензии сеанса
//
Процедура ЗаполнитьПараметрыЛицензииСеанса() Экспорт

	ДобавитьПараметрОписанияОбъекта("Сеанс_Ид"				, "session"				, , "-");
	ДобавитьПараметрОписанияОбъекта("ИмяПользователя"		, "user-name"			, , "-");
	ДобавитьПараметрОписанияОбъекта("АдресМашины"			, "host"				, , "-");
	ДобавитьПараметрОписанияОбъекта("ТипПриложения"			, "app-id"				, , "-");

	ЗаполнитьПараметрыЛицензииОбщие();

КонецПроцедуры // ЗаполнитьПараметрыЛицензииСеанса()

// Процедура заполняет массив описаний параметров требования назначения
//
Процедура ЗаполнитьПараметрыТребованияНазначения() Экспорт

	ДобавитьПараметрОписанияОбъекта("Ид"			, "rule"			, , "-");
	ДобавитьПараметрОписанияОбъекта("ТипОбъекта"	, "object-type",
									Перечисления.ОбъектыНазначенияФункциональности.ЛюбойОбъект);
	ДобавитьПараметрОписанияОбъекта("ИмяИБ"			, "infobase-name"	, "");
	ДобавитьПараметрОписанияОбъекта("ТипНазначения"	, "rule-type"		, Перечисления.ТипыНазначенияФункциональности.Авто);
	ДобавитьПараметрОписанияОбъекта("ДопПараметр"	, "application-ext"	, "");
	ДобавитьПараметрОписанияОбъекта("Приоритет"		, "priority"		, 0);

КонецПроцедуры // ЗаполнитьПараметрыТребованияНазначения()

// Процедура заполняет массив описаний параметров профиля безопасности
//
Процедура ЗаполнитьПараметрыПрофиляБезопасности() Экспорт

	ДобавитьПараметрОписанияОбъекта("Имя"							, "name"								, , "-");
	ДобавитьПараметрОписанияОбъекта("Описание"						, "descr"								, "");
	ДобавитьПараметрОписанияОбъекта("Каталоги"						, "directory"							
									, Перечисления.РежимыДоступа.Список, "-");
	ДобавитьПараметрОписанияОбъекта("COMКлассы"						, "com"
									, Перечисления.РежимыДоступа.Список, "-");
	ДобавитьПараметрОписанияОбъекта("ВнешниеКомпоненты"				, "addin"
									, Перечисления.РежимыДоступа.Список, "-");
	ДобавитьПараметрОписанияОбъекта("Модули"						, "module"
									, Перечисления.РежимыДоступа.Список, "-");
	ДобавитьПараметрОписанияОбъекта("Приложения"					, "app"
									, Перечисления.РежимыДоступа.Список, "-");
	ДобавитьПараметрОписанияОбъекта("ИнтернетРесурсы"				, "inet"
									, Перечисления.РежимыДоступа.Список, "-");
	ДобавитьПараметрОписанияОбъекта("Конфигуратор"					, "config"
									, Перечисления.ДаНет.Нет);
	ДобавитьПараметрОписанияОбъекта("ПривилегированныйРежим"		, "priv"
									, Перечисления.ДаНет.Нет);
	ДобавитьПараметрОписанияОбъекта("Криптография"					, "crypto"
									, Перечисления.ДаНет.Нет);
	ДобавитьПараметрОписанияОбъекта("РасширениеПрав"				, "right-extension"
									, Перечисления.ДаНет.Нет);
	ДобавитьПараметрОписанияОбъекта("ОграничивающиеРоли"			, "right-extension-definition-roles"	, "");
	ДобавитьПараметрОписанияОбъекта("РасширениеВсехМодулей"			, "all-modules-extension"
									, Перечисления.ДаНет.Нет);
	ДобавитьПараметрОписанияОбъекта("ДоступныеМодули"				, "modules-available-for-extension"		, "");
	ДобавитьПараметрОписанияОбъекта("НедоступныеМодули"				, "modules-not-available-for-extension"	, "");
    
КонецПроцедуры // ЗаполнитьПараметрыПрофиляБезопасности()

// Процедура заполняет массив описаний параметров виртуального каталога профиля безопасности
//
Процедура ЗаполнитьПараметрыКаталогаПрофиля() Экспорт

	ДобавитьПараметрОписанияОбъекта("Имя"			, "alias"			, , "-");
	ДобавитьПараметрОписанияОбъекта("Описание"		, "descr"			, "");
	ДобавитьПараметрОписанияОбъекта("ПутьККаталогу"	, "physicalPath"	, "");
	ДобавитьПараметрОписанияОбъекта("Чтение"		, "allowedRead"		, Перечисления.ДаНет.Нет);
	ДобавитьПараметрОписанияОбъекта("Запись"		, "allowedWrite"	, Перечисления.ДаНет.Нет);
	
КонецПроцедуры // ЗаполнитьПараметрыКаталогаПрофиля()

// Процедура заполняет массив описаний параметров COM-класса профиля безопасности
//
Процедура ЗаполнитьПараметрыCOMКлассаПрофиля() Экспорт

	ДобавитьПараметрОписанияОбъекта("Имя"			, "name"		, , "-");
	ДобавитьПараметрОписанияОбъекта("Описание"		, "descr"		, "");
	ДобавитьПараметрОписанияОбъекта("ИмяФайла"		, "fileName"	, "");
	ДобавитьПараметрОписанияОбъекта("ИдКласса"		, "id"			, "");
	ДобавитьПараметрОписанияОбъекта("Компьютер"		, "host"		, "");

КонецПроцедуры // ЗаполнитьПараметрыCOMКлассаПрофиля()

// Процедура заполняет массив описаний параметров внешней компоненты или модуля профиля безопасности
//
Процедура ЗаполнитьПараметрыКомпонентыМодуляПрофиля() Экспорт

	ДобавитьПараметрОписанияОбъекта("Имя"		, "name"	, , "-");
	ДобавитьПараметрОписанияОбъекта("Описание"	, "descr"	, "");
	ДобавитьПараметрОписанияОбъекта("Хэш"		, "hash");
	
КонецПроцедуры // ЗаполнитьПараметрыКомпонентыМодуляПрофиля()

// Процедура заполняет массив описаний параметров разрешенного приложения профиля безопасности
//
Процедура ЗаполнитьПараметрыПриложенияПрофиля() Экспорт

	ДобавитьПараметрОписанияОбъекта("Имя"		, "name"	, , "-");
	ДобавитьПараметрОписанияОбъекта("Описание"	, "descr"	, "");
	ДобавитьПараметрОписанияОбъекта("Маска"		, "wild"	, "*");

КонецПроцедуры // ЗаполнитьПараметрыПриложенияПрофиля()

// Процедура заполняет массив описаний параметров интернет ресурса профиля безопасности
//
Процедура ЗаполнитьПараметрыИнтернетРесурсаПрофиля() Экспорт

	ДобавитьПараметрОписанияОбъекта("Имя"			, "name"		, , "-");
	ДобавитьПараметрОписанияОбъекта("Описание"		, "descr"		, "");
	ДобавитьПараметрОписанияОбъекта("Протокол"		, "protocol"	, "");
	ДобавитьПараметрОписанияОбъекта("АдресРесурса"	, "url"			, "http");
	ДобавитьПараметрОписанияОбъекта("ПортСервера"	, "port"		, "");

КонецПроцедуры // ЗаполнитьПараметрыИнтернетРесурсаПрофиля()

Лог = Логирование.ПолучитьЛог("ktb.lib.irac");

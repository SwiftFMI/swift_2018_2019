# Как да използваме Swift, за да пишем web приложения?

Днес ще разгледаме как да използваме Swift при реализацията на web приложения.
Ще се фокусираме над [Vapor](https://vapor.codes/) (framework) но наученото можем да приложим и с други инструменти работещи със Swift или дори с NodeJS.

## Нека да инсталираме Vapor

Vapor работи на MacOS и Linux (Ubuntu). 

### Как да го инсталираме на MacOS

Можем да използваме `brew` мениджър за инсталиране на приложения в стил `linux`.

```
brew tap vapor/tap
brew install vapor/tap/vapor
```

### Как да го инсталираме на Ubuntu

Повече може да прочетете [тук](https://docs.vapor.codes/3.0/install/ubuntu/).

## Какво e Vapor?

>Non-blocking, event-driven architecture built on top of Apple's SwiftNIO delivers high performance.

>Expressive, protocol-oriented design with a focus on type-safety and maintainability.
>

## Демо проект

Ето така можем да създадем web проект.

	vapor new webapp --template=web
	
## Каква е структурата на demo проекта

Демо проекта е разделен на два модула - `App` и `Run`. Първият съдържа кода на нашия web сървър, а другият модул позволява стартирането му (`Run`).

```
.
├── CONTRIBUTING.md
├── Package.resolved
├── Package.swift (описание на проекта)
├── Public
│   ├── images
│   │   └── it-works.png (картинка)
│   └── styles
│       └── app.css (стилове)
├── README.md (малка документация)
├── Resources (ресурси)
│   └── Views
│       ├── base.leaf (шаблони)
│       ├── hello.leaf
│       └── welcome.leaf
├── Sources
│   ├── App (основен модул)
│   │   ├── Controllers (всички контролери)
│   │   ├── Models (всички модели)
│   │   ├── app.swift
│   │   ├── boot.swift 
│   │   ├── configure.swift (конфигурация)
│   │   └── routes.swift (пътища разпознавани от web app–а)
│   └── Run (стартиращ модул)
│       └── main.swift 
├── Tests (тестове)
│   ├── AppTests
│   │   └── AppTests.swift
│   └── LinuxMain.swift
├── circle.yml (виртуална конфигурация)
└── web.Dockerfile  (виртуална конфигурация)
```

Ресурсите `.leaf` позволяват по-лесно писане на HTML страници с помощен шаблонен език, който прави писането на сложни html страници приятно и бързо.

В папката `Public` се намират всички ресурси, които сървъра може да сервира без да ги обработва.
# SWEproject — Lilac Online Flower Store

Full-stack Java desktop application for an online flower shop using a **client–server** architecture (OCSF), **JavaFX** UI, and a remote **MySQL** database.

## Description

Lilac is a course software-engineering project that simulates a multi-branch flower store. Users can register or log in as **customers**, **employees**, or **managers**, browse catalog items, build custom products, place orders, and file complaints. Staff can manage catalog entries, sales, and reports; managers get additional reporting and user-management screens.

## Technologies

- Java, JavaFX (FXML)
- OCSF client/server framework (`src/ocsf/`)
- MySQL (JDBC)
- Eclipse project layout (`.project`, `.classpath`)

## Features

- Customer registration, login, cart, checkout, cancellations, complaints
- Employee catalog management, sales, complaints handling
- Manager reports (orders, earnings, complaints), freeze customer, staff registration
- Custom flower / bouquet builder
- Server-side order and catalog logic in `LilacServer.java`

## Project structure

```
SWEproject/
├── Images/                 # README screenshots
├── src/
│   ├── application/        # JavaFX FXML + controllers (UI)
│   ├── LilacClasses/         # Domain models (Order, Product, Customer, …)
│   ├── ocsf/                 # Client/server + LilacServer (main server logic)
│   ├── catalog/              # Product images
│   └── background/           # UI assets
├── .classpath
├── .project
└── README.md
```

## Prerequisites

- JDK 8+ with JavaFX (or OpenJDK + JavaFX SDK)
- Eclipse (recommended) or another Java IDE
- MySQL database reachable from the machine running the server
- MySQL JDBC driver on the classpath

## Configuration

1. **Database** — connection settings are in `src/ocsf/LilacServer.java` (`DB_URL`, `USER`, `PASS`). Update these for your own MySQL instance before running the server.
2. **Server port** — OCSF default port is **5555** (`LilacServer.DEFAULT_PORT`).

## How to run

### 1. Start the server

Run `ocsf.LilacServer` (or `ocsf.ServerConsole` with the server port argument, e.g. `5555`).

Main server logic: `src/ocsf/LilacServer.java`.

### 2. Start the client (JavaFX app)

Run `application.LilacApp` with program arguments:

```text
<loginId> <serverHost>
```

Example:

```text
guest localhost
```

The client connects to the OCSF server on the host you provide (see `LilacApp.java` for argument usage).

## Example usage

1. Launch `LilacServer` and wait until the server is listening.
2. Launch `LilacApp` with a login id and server host.
3. Use the home screen to enter as customer, employee, manager, or guest.
4. Browse the catalog, add items to the cart, and complete checkout (customer flow).

## Screenshots

| Screen | |
|--------|---|
| Home | ![Home](Images/sample_1.png) |
| Customer login | ![Customer login](Images/sample_2.png) |
| Customer registration | ![Registration](Images/sample_3.png) |
| Staff login | ![Staff login](Images/sample_4.png) |
| Validation example | ![Validation](Images/sample_5.png) |

## Notes / limitations

- Requires a working MySQL schema and network access to the configured DB host.
- JavaFX must be available on the runtime classpath (module path on newer JDKs).
- Remote DB credentials in the repo are from the original course deployment — replace before any real use.
- `src/ocsf/` includes third-party OCSF framework files from the course textbook.

## Author

Mustafa Waked — University of Haifa (Software Engineering project)

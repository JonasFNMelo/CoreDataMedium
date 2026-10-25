<div align="center">

# CoreDataMedium

### Learn Core Data from zero to relationships. 🗄️

CoreDataMedium is the companion project of a Medium article that teaches Apple's Core Data
step by step — from setting up the persistent container to modeling one-to-many and
many-to-many relationships — through a small music catalog app built in SwiftUI.

<br/>

[![Platform](https://img.shields.io/badge/iOS-18.5+-000000?style=for-the-badge&logo=apple&logoColor=white)](https://www.apple.com/ios/)
[![Swift](https://img.shields.io/badge/Swift-5-FA7343?style=for-the-badge&logo=swift&logoColor=white)](https://swift.org)
[![SwiftUI](https://img.shields.io/badge/SwiftUI-0052CC?style=for-the-badge&logo=swift&logoColor=white)](https://developer.apple.com/xcode/swiftui/)
[![Core Data](https://img.shields.io/badge/Core_Data-3693F3?style=for-the-badge&logo=apple&logoColor=white)](https://developer.apple.com/documentation/coredata)

</div>

---

## 📑 Table of Contents

- [About](#-about)
- [Features](#-features)
- [Data Model](#-data-model)
- [Tech Stack](#-tech-stack)
- [Project Structure](#-project-structure)
- [Getting Started](#-getting-started)
- [Authors](#-authors)

---

## 📖 About

Core Data is Apple's persistence framework, and while it's extremely powerful, its
learning curve is steep for beginners. This project is hands-on support material: each
part of the app maps to a Core Data concept, in the same order it appears in the
accompanying Medium article, so you can read the article and explore the code side by
side.

---

## 🚀 Features

- **🎤 Artists** — create artists and open each artist's profile.
- **💿 Albums** — create albums and link them to an artist.
- **🎵 Songs** — create songs and attach them to an album and to one or more artists.
- **🧭 Concepts covered** — `NSPersistentContainer` setup, entities and attributes in `.xcdatamodeld`, CRUD with `NSFetchRequest` and `NSManagedObjectContext`, and relationships with inverses and delete rules.

---

## 🧩 Data Model

The example uses a music domain with three entities:

| Relationship | Type |
|---|---|
| `Artist` → `Album` | one-to-many (an artist has many albums) |
| `Album` → `Song` | one-to-many (an album has many songs) |
| `Artist` ↔ `Song` | many-to-many (a song can have many artists) |

Every relationship has an inverse and uses the `Nullify` delete rule. All reads and writes
go through `CoreDataModel`, a single data-access layer exposed to the views by
`CoreDataViewModel`.

---

## 🛠️ Tech Stack

| Area | Tech |
|------|------|
| UI | SwiftUI |
| Persistence | Core Data |
| Architecture | MVVM |

---

## 📂 Project Structure

```
CoreDataMediumBackup/CoreDataMedium/CoreDataMedium/
├── CoreDataMediumApp.swift   # App entry
├── Models/                   # CoreDataModel + Model.xcdatamodeld (Artist, Album, Song)
├── ViewModel/                # CoreDataViewModel
├── Views/                    # Catalog, artist profile and creation screens
└── Assets.xcassets/
```

---

## 🎯 Getting Started

### Requirements

- Xcode 16+
- iOS 18.5+

### Run

```bash
git clone https://github.com/JonasFNMelo/CoreDataMedium.git
cd CoreDataMedium
open CoreDataMediumBackup/CoreDataMedium/CoreDataMedium.xcodeproj
```

Then pick an iPhone simulator and run (`⌘R`).

---

## 👥 Authors

<table width="100%">
  <tr>
    <td align="center" width="50%">
      <a href="https://github.com/Anshushu000"><img src="https://github.com/Anshushu000.png" width="80" alt="Anshu Li"/></a>
      <br/><sub><b>Anshu Li</b></sub><br/>
      <a href="https://github.com/Anshushu000"><img src="https://skillicons.dev/icons?i=github" alt="GitHub"/></a>
      <a href="https://www.linkedin.com/in/anshu-li/"><img src="https://skillicons.dev/icons?i=linkedin" alt="LinkedIn"/></a>
    </td>
    <td align="center" width="50%">
      <a href="https://github.com/JonasFNMelo"><img src="https://github.com/JonasFNMelo.png" width="80" alt="Jonas Melo"/></a>
      <br/><sub><b>Jonas Melo</b></sub><br/>
      <a href="https://github.com/JonasFNMelo"><img src="https://skillicons.dev/icons?i=github" alt="GitHub"/></a>
      <a href="https://www.linkedin.com/in/jonas-melo-/"><img src="https://skillicons.dev/icons?i=linkedin" alt="LinkedIn"/></a>
    </td>
  </tr>
</table>

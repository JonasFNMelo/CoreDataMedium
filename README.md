# CoreDataMedium

Repositório didático com o objetivo de ensinar **Core Data** do zero — partindo do básico até chegar em **Relationships** — através de um artigo no Medium acompanhado de código de exemplo.

## Sobre o projeto

Core Data é o framework de persistência da Apple e, apesar de ser extremamente poderoso, costuma ter uma curva de aprendizado íngreme para quem está começando. Este projeto foi pensado como um material de apoio prático: cada etapa do app reflete um conceito específico do Core Data, na ordem em que ele aparece no artigo do Medium que o acompanha.

A ideia é que, ao ler o artigo e explorar o código lado a lado, a pessoa consiga entender:

- O que é o **NSPersistentContainer** e como configurá-lo
- Como criar **Entities** e **Attributes** no modelo `.xcdatamodeld`
- Como fazer operações de **CRUD** com `NSFetchRequest` e `NSManagedObjectContext`
- Como modelar e usar **Relationships** com inversos e regras de exclusão

## O modelo de dados

O exemplo usa um domínio musical com três entidades:

| Relacionamento | Tipo |
|---|---|
| `Artist` → `Album` | one-to-many (um artista tem vários álbuns) |
| `Album` → `Song` | one-to-many (um álbum tem várias músicas) |
| `Artist` ↔ `Song` | many-to-many (uma música pode ter vários artistas) |

Todos os relacionamentos têm inverso definido e regra de exclusão `Nullify`.

## O que este projeto demonstra

- Domínio de **Core Data** além do CRUD básico: relacionamentos one-to-many e many-to-many com inversos
- Uma camada de acesso a dados centralizada (`CoreDataModel`), separada das Views
- **Comunicação técnica**: o código foi escrito para acompanhar um artigo didático

> 📸 _Screenshots em breve._

## Tecnologias

- **Swift**
- **SwiftUI**
- **Core Data**
- **Xcode**

## Estrutura do projeto

- `CoreDataMediumBackup/` — projeto Xcode com o código de exemplo usado no artigo

## Como rodar

1. Clone o repositório:
   ```bash
   git clone https://github.com/JonasFNMelo/CoreDataMedium.git
   ```
2. Abra `CoreDataMediumBackup/CoreDataMedium/CoreDataMedium.xcodeproj` no **Xcode** (recomendado Xcode 15 ou superior).
3. Selecione um simulador de iPhone e execute (`⌘R`).

## Autores

- **Jonas Melo**
- **Anshushu Li**

---

> Projeto criado como material de apoio a um artigo no Medium sobre Core Data. ^v^

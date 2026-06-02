# CoreDataMedium

Repositório didático com o objetivo de ensinar **Core Data** do zero — partindo do básico até chegar em **Relationships** — através de um artigo no Medium acompanhado de código de exemplo.

## Sobre o projeto

Core Data é o framework de persistência da Apple e, apesar de ser extremamente poderoso, costuma ter uma curva de aprendizado íngreme para quem está começando. Este projeto foi pensado como um material de apoio prático: cada etapa do app reflete um conceito específico do Core Data, na ordem em que ele aparece no artigo do Medium que o acompanha.

A ideia é que, ao ler o artigo e explorar o código lado a lado, a pessoa consiga entender:

- O que é o **NSPersistentContainer** e como configurá-lo
- Como criar **Entities** e **Attributes** no modelo `.xcdatamodeld`
- Como fazer operações de **CRUD** (criar, ler, atualizar e deletar)
- Como utilizar `@FetchRequest` em SwiftUI
- Como modelar e usar **Relationships** (one-to-one, one-to-many, many-to-many)

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
2. Abra o projeto no **Xcode** (recomendado Xcode 15 ou superior).
3. Selecione um simulador de iPhone e execute (`⌘R`).

## Autores

- **Jonas Melo**
- **Anshushu Li**

---

> Projeto criado como material de apoio a um artigo no Medium sobre Core Data. ^v^

# 📋 Desafio Técnico Flutter - App de Lista de Tarefas

Este projeto foi desenvolvido como parte de um desafio técnico Flutter Jr.  
O objetivo principal é criar um aplicativo de lista de tarefas usando a arquitetura **MVVM** com persistência local através do **Hive**.

---

## 🚀 Tecnologias utilizadas

- Flutter 3.x
- Dart
- Hive (armazenamento local NoSQL)
- Provider (gerenciamento de estado)
- Hive Generator + Build Runner (geração automática de adapters)
- Android Studio / VSCode

---

## 🏛️ Estrutura de Pastas (MVVM)
```bash
lib/
├── core/               # Helpers ou utilitários (futuramente)
├── models/
│    └── task_model.dart    # Modelo da tarefa
├── viewmodels/
│    └── task_view_model.dart   # Gerenciamento de estado das tarefas
├── views/
│    ├── home_page.dart         # Tela principal que lista tarefas
│    ├── add_task_page.dart     # Tela para adicionar nova tarefa
│    └── widgets/
│         └── task_item_widget.dart    # Widget que representa cada tarefa na lista
└── main.dart              # Ponto de entrada da aplicação
```

### 📚 Sobre a arquitetura MVVM utilizada:

O projeto segue o padrão **MVVM (Model-View-ViewModel)**, que tem como objetivo separar responsabilidades dentro da aplicação, facilitando a manutenção, escalabilidade e testabilidade do código.

- **Model (`models/`)**: Representa os dados da aplicação. Aqui definimos a estrutura da tarefa (`TaskModel`) e como ela será armazenada no Hive.

- **ViewModel (`viewmodels/`)**: Gerencia a lógica de negócios e o estado da aplicação. No `TaskViewModel`, lidamos com ações como adicionar, atualizar status e remover tarefas. O ViewModel expõe dados que a View pode observar.

- **View (`views/`)**: Responsável apenas por exibir os dados e interagir com o usuário. Temos:
  - `home_page.dart`: Tela principal que lista as tarefas.
  - `add_task_page.dart`: Tela de adição de novas tarefas.
  - `widgets/task_item_widget.dart`: Widget reutilizável para exibir cada tarefa individualmente.

- **Core (`core/`)**: Pasta reservada para utilitários ou helpers caso sejam necessários no futuro.

- **main.dart**: Ponto inicial da aplicação Flutter, onde é feita a inicialização do Hive e a configuração do Provider para gerenciamento de estado.

Essa separação de camadas permite que o projeto seja organizado, modular e fácil de entender, mantendo cada parte com sua responsabilidade clara.

## 🛠️ Funcionalidades implementadas

- 📋 Listar tarefas cadastradas (nome + status).
- ➕ Adicionar nova tarefa (tela de cadastro separada).
- ✅ Marcar tarefa como **Concluída** via Checkbox.
- 🛑 Remover tarefa deslizando para esquerda (Swipe para apagar).
- 💾 Salvar tarefas localmente utilizando Hive.
- 🌓 Tema escuro aplicado (fundo preto, textos claros).
- 🟨 Tarefas com status **Pendente** aparecem com texto amarelo, **Concluídas** em verde.
- ℹ️ Botão de informação (ícone `i`) explicando o funcionamento da aplicação.

---

## 🧑‍💻 Como rodar o projeto localmente

1. Clone o repositório:

```bash
git clone https://github.com/seu-usuario/desafio-flutter-todolist.git
cd desafio-flutter-todolist
```

2. Instale as dependências:

```bash
flutter pub get
```

3. Rode o build_runner para gerar arquivos necessários do Hive:

```bash
dart run build_runner build --delete-conflicting-outputs
```

4.Execute o app:

```bash
flutter run
```

✅ Certifique-se de estar com um dispositivo/emulador Android ou iOS ativo.
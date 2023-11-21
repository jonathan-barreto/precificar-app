# PRECIFICAR APP

## Rodando o APP Flutter na Versão 3.15.3 e FVM

Este tutorial guiará você através do processo de configuração e execução de um projeto Flutter na versão 3.15.3 utilizando o FVM (Flutter Version Management), um gerenciador de versões do Flutter.

### Pré-requisitos

Certifique-se de ter o Chocolatey instalado. Execute o seguinte comando no Windows PowerShell para instalar o Chocolatey:

```bash
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

### Instalação do Dart SDK

Instale o SDK do Dart usando o Chocolatey:

```bash
choco install dart-sdk --pre
```

### Instalação do FVM

Instale o FVM usando o Chocolatey:

```bash
choco intall fvml
```

### Instalação do Flutter 3.15.3

Instale a versão específica do Flutter usando o FVM:

```bash
fvm install 3.13.5
```

### Clonando o Projeto

Clone o projeto

```bash
git clone https://github.com/jonathan-barreto/precificar-app.git
```

### Configuração e Execução do Projeto

Abra o Visual Studio Code em modo Administrador e navegue até o diretório do projeto. Em seguida, defina a versão do Flutter para 3.15.3 no terminal:

```bash
fvm use 3.13.5
```

Instale as dependências do projeto:

```bash
fvm flutter pub get
```


### Configurando o Endereço IP na BaseURL

Navegue até o arquivo app_constants.dart localizado em lib/app/core/utils/constants/app_constants.dart no diretório do seu projeto. Abra o arquivo usando seu editor de código preferido.




# 🤖 Projet Robot Framework

Guide complet pour mettre en place et exécuter des tests automatisés avec Robot Framework.

---

## 📋 Prérequis

- Python 3.8+ installé ([python.org](https://www.python.org/downloads/))
- `pip` disponible dans le terminal
- Git (optionnel)

---

## 🚀 Installation pas à pas

### 1. Cloner le projet (ou créer le dossier)

```bash
git clone https://github.com/votre-utilisateur/votre-projet.git
cd votre-projet
```

Ou simplement :

```bash
mkdir mon-projet-robot
cd mon-projet-robot
```

---

### 2. Créer l'environnement virtuel (`.venv`)

```bash
python -m venv .venv
```

> Cela crée un dossier `.venv/` contenant un Python isolé pour ce projet.

---

### 3. Activer l'environnement virtuel

**Linux / macOS :**
```bash
source .venv/bin/activate
```

**Windows (PowerShell) :**
```powershell
.\.venv\Scripts\Activate.ps1
```

**Windows (CMD) :**
```cmd
.\.venv\Scripts\activate.bat
```

> Une fois activé, votre terminal affiche `(.venv)` au début de la ligne.

---

### 4. Installer Robot Framework et les librairies

```bash
pip install --upgrade pip
pip install robotframework
```

**Librairies courantes selon vos besoins :**

| Librairie | Commande d'installation | Usage |
|---|---|---|
| SeleniumLibrary | `pip install robotframework-seleniumlibrary` | Tests web (navigateur) |
| RequestsLibrary | `pip install robotframework-requests` | Tests API REST |
| DatabaseLibrary | `pip install robotframework-databaselibrary` | Tests base de données |
| SSHLibrary | `pip install robotframework-sshlibrary` | Connexions SSH |
| AppiumLibrary | `pip install robotframework-appiumlibrary` | Tests mobiles |

**Installer toutes vos dépendances en une fois :**
```bash
pip install -r requirements.txt
```

---

### 5. Créer le fichier `requirements.txt`

```txt
robotframework>=7.0
robotframework-seleniumlibrary>=6.0
robotframework-requests>=0.9
```

Générer automatiquement depuis l'environnement actuel :
```bash
pip freeze > requirements.txt
```

---

## 📁 Structure du projet recommandée

```
mon-projet-robot/
│
├── .venv/                   # Environnement virtuel (ne pas versionner)
├── tests/
│   ├── acceptance/          # Tests d'acceptance
│   │   └── login.robot
│   ├── api/                 # Tests API
│   │   └── users_api.robot
│   └── resources/           # Mots-clés partagés
│       ├── common.resource
│       └── variables.py
│
├── results/                 # Rapports générés (ne pas versionner)
│   ├── output.xml
│   ├── log.html
│   └── report.html
│
├── .gitignore
├── requirements.txt
└── README.md
```

---

## ✍️ Exemple de fichier de test `.robot`

```robot
*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${BASE_URL}    https://jsonplaceholder.typicode.com

*** Test Cases ***
Récupérer la liste des utilisateurs
    [Documentation]    Vérifie que l'API retourne bien des utilisateurs
    Create Session    api    ${BASE_URL}
    ${response}=    GET On Session    api    /users
    Should Be Equal As Strings    ${response.status_code}    200
    ${nb_users}=    Get Length    ${response.json()}
    Should Be True    ${nb_users} > 0

*** Keywords ***
Vérifier le statut HTTP
    [Arguments]    ${response}    ${code_attendu}
    Should Be Equal As Strings    ${response.status_code}    ${code_attendu}
```

---

## ▶️ Lancer les tests

**Tous les tests :**
```bash
robot tests/
```

**Un fichier spécifique :**
```bash
robot tests/api/users_api.robot
```

**Avec un dossier de sortie personnalisé :**
```bash
robot --outputdir results/ tests/
```

**Filtrer par tag :**
```bash
robot --include smoke tests/
robot --exclude wip tests/
```

---

## 📊 Consulter les rapports

Après exécution, Robot Framework génère automatiquement :

| Fichier | Description |
|---|---|
| `results/report.html` | Rapport visuel résumé |
| `results/log.html` | Log détaillé de chaque étape |
| `results/output.xml` | Données brutes (intégration CI/CD) |

Ouvrir dans un navigateur :
```bash
open results/report.html        # macOS
xdg-open results/report.html    # Linux
start results/report.html       # Windows
```

---

## 🔧 Configuration `.gitignore`

```gitignore
# Environnement virtuel
.venv/
env/

# Résultats des tests
results/
output.xml
log.html
report.html

# Python
__pycache__/
*.pyc
*.pyo
.pytest_cache/

# IDE
.vscode/
.idea/
```

---

## 🔄 Intégration CI/CD (GitHub Actions)

Exemple de workflow `.github/workflows/robot.yml` :

```yaml
name: Robot Framework Tests

on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3

      - name: Set up Python
        uses: actions/setup-python@v4
        with:
          python-version: '3.11'

      - name: Installer les dépendances
        run: |
          python -m pip install --upgrade pip
          pip install -r requirements.txt

      - name: Lancer les tests Robot Framework
        run: robot --outputdir results/ tests/

      - name: Publier les résultats
        uses: actions/upload-artifact@v3
        if: always()
        with:
          name: robot-results
          path: results/
```

---

## 🛠️ Commandes utiles

```bash
# Vérifier la version installée
robot --version

# Lister les librairies disponibles
pip list | grep robotframework

# Désactiver l'environnement virtuel
deactivate

# Supprimer et recréer l'environnement
rm -rf .venv
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

---

## 📚 Ressources

- [Documentation officielle Robot Framework](https://robotframework.org/)
- [Robot Framework sur PyPI](https://pypi.org/project/robotframework/)
- [SeleniumLibrary](https://robotframework.org/SeleniumLibrary/)
- [Robot Framework Guide](https://docs.robotframework.org/)

---

> **💡 Conseil :** Toujours travailler avec l'environnement virtuel activé (`(.venv)` visible dans le terminal) pour éviter les conflits de dépendances entre projets.

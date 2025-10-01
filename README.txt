=========================================================
 GUIDE D’UTILISATION - Projet Robot Framework StackOverflow
=========================================================

1. PRÉSENTATION
---------------
Ce projet permet d’automatiser des tests sur :
- L’API StackOverflow (https://api.stackexchange.com/2.3/questions)
- La page web StackOverflow (https://stackoverflow.com/questions?tab=Newest)

Objectif principal :
Vérifier que la première question renvoyée par l’API correspond bien
à la première question affichée sur la page web.

2. PRÉREQUIS
------------
- Python 3.10 ou version plus récente (cocher la case pour l'ajout de la variable d'environnement)
- Robotframework 
- NodeJs (ajouter le chemin du dossier dans la variable d'environnement PATH )

3. INSTALLATION
---------------

Installez les dépendances :
   pip install -r requirements.txt

installation de la Library Browser du robotframework: 
  https://docs.robotframework.org/docs/different_libraries/browser
 

4. EXÉCUTION DES TESTS
----------------------
a) Exécuter tous les tests :
   robot tests/

b) Exécuter uniquement les tests API :
   robot tests/api_tests.robot

c) Exécuter uniquement les tests Web :
   robot tests/web_tests.robot

d) Exécuter les tests de performance :
   robot tests/performance_tests.robot

e) Exécuter les tests multi-utilisateurs :
   robot tests/multi_user_tests.robot

5. RAPPORTS
-----------
Après exécution, les rapports se trouvent dans le dossier "results/".

- log.html       -> Journal détaillé des exécutions
- report.html    -> Rapport global
- output.xml     -> Résultats au format XML
- allure-report/ -> Rapport enrichi consultable via un navigateur
   (ouvrir results/allure-report/index.html)

6. STRUCTURE DU PROJET
----------------------
- api/                : Tests API
- pages/              : Pages objets pour Playwright (Browser)
- resources/          : Variables et configuration
- tests/              : Fichiers principaux des tests
- test_data/          : Données de test externes
- results/            : Rapports et résultats
- requirements.txt    : Dépendances Python
- setup.bat / run_tests.bat : Scripts pour Windows

7. POINTS D’AMÉLIORATION
------------------------
- Ajouter plus de cas négatifs (API hors service, mauvais paramètres).
- Intégrer les tests dans un pipeline CI/CD (GitHub Actions, GitLab CI...).
- Effectuer des tests de sécurité.
- Étendre les scénarios de performance et de charge.
- Améliorer la documentation technique (schémas, tutoriel utilisateur).

=========================================================
 FIN DU GUIDE
=========================================================

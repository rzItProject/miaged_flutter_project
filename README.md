# flutter_app_project_miaged
L’objectif de ce projet, a consisté à développer une version light de l’application Vinted en utilisant le kit de développement flutter.

## Comment utiliser le projet

Pour utiliser le projet, cloner la branche **main**, la branche qui contient les dernières modifications et le projet complet (l'ensemble des mvp). 

Pour utiliser l'application, vous devrez au préalable créer un compte utilisateur en allant sur la page d'enregistrement. 

/!\ pour la création d'un compte veuillez à bien faire attention de choisir un mot de passe avec au minimum une lettre majuscule, une lettre minuscule, un chiffre, un caractère spécial,et avoir une longueur minimale de **8 caractères**.

Pour ce projet, nous devions utiliser firebase pour la gestion de notre backend. Pour ce faire j'ai fait simple en me limitant à deux collections 'customer' et 'items', pour faire respectivement des opérations de CRUD sur leurs données. 

Enfin pour gérer les différents état du projet, j'ai décidé d'apprendre à utiliser Riverpod qui est beaucoup plus puissant que le gestionnaire natif proposé dans les statefulwidget (setstate). 

## Interfaces utilisateurs

- Inscription
![This is an image](/assets/readme/register.png)
- Connexion
![This is an image](/assets/readme/login.png.png)
- Liste de produit
![This is an image](/assets/readme/list_product.png)
- Détail du produit
![This is an image](/assets/readme/detail.png)
- Ajout dans le panier
![This is an image](/assets/readme/cart_item.png)
- Ajout avec succés au panier
![This is an image](/assets/readme/succes_add_cart.png)
- Profil 
![This is an image](/assets/readme/profil.png)


## Les fonctionnalités implémentées en bonus par rapport a ce qui était demandé

- un splash screen au démarrage de l'application
- une page d'inscription
- un bouton permettant de gérer l'obfuscation du champs de texte du mot de passe
- un indicateur au niveau de l'icone du panier dans la barre de navigation pour renseigner le nombre d'articles présent dans le panier
- utilisation du gestionnaire d'état riverpod
- validateurs sur l'ensemble des champs de saisie (notamment le mot de passe et email)

## Architecture

- Assets → les images
- data: 
    - models → les classes pour les représentations des objets
    - providers → y sont stockées les différents providers utilisés par l'application
    - repository → contient les classes permettant de communiquer avec les api
- screens → les classes permettant de gérer l'affichage de l'ui
- utils → les différents fichiers avec des variables constantes
- widget → qui contient des widget personnalisé


## Bibliothèque Dart
Pour développer ce projet j'ai utilisé plusieurs bibliothèques dart: 
  - **cached_network_image: ^3.2.3** →   pour  afficher les images à partir d'une url et les conserver dans un répertoire de cache
  - Les bibliothèques de firebase pour la gestion du backend (**cloud_firestore: ^4.4.5, firebase_auth: ^4.3.0 , firebase_core: ^2.8.0**)
  - **flutter_native_splash: ^2.2.19** → permet la création d'un splash screen à l'ouverture de l'application
  - *flutter_riverpod: ^2.3.1** →  permet de bénéficier  du gestionnaire d'état riverpod
  - **flutter_staggered_grid_view: ^0.6.2** → utilisé pour  gérer l'affichage des éléments sur une grid
  - **font_awesome_flutter: ^10.4.0** → permet d'accéder à un large panel d'icon

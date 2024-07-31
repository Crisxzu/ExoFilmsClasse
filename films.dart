import 'dart:io';

class Film
{
    String title;
    String director;
    int year;
    double rating;

    Film(this.title, this.director, this.year, this.rating);
}

void addFilm(List<Film> films)
{
    print("Entrez le titre du film :");
    String title = stdin.readLineSync()!;
    print("Entrez le réalisateur du film :");
    String director = stdin.readLineSync()!;
    print("Entrez l'année de sortie du film :");
    int year = int.parse(stdin.readLineSync()!);
    print("Entrez la note du film :");
    double rating = double.parse(stdin.readLineSync()!);
    films.add(Film(title, director, year, rating));
}

void printFilms(List<Film> films)
{
    int i = 0;
    for(Film film in films)
    {
        print("Film ${i+1}");
        print("Titre : ${film.title}");
        print("Réalisateur : ${film.director}");
        print("Année de sortie : ${film.year}");
        print("Note : ${film.rating}");
        print("=================================");
    }
}

void printMenu()
{
    print("Bienvenue dans la bibliothèque des films !");
    print("Faites votre choix :");
    print("1 : Ajouter un film");
    print("2 : Voir tous les films");
    print("3 : Voir les films selon leur directeur");
    print("4 : Quitter");
}


List<Film> getFilmsByDirector(List<Film> films, String director)
{
    List<Film> result = [];
    for(Film film in films)
    {
        if(film.director.contains(director))
        {
            result.add(film);
        }
    }

    return result;
}

void main() {
  List<Film> films = [];
  bool exit = false;

  while(!exit)
  {
    printMenu();
    int choix = int.parse(stdin.readLineSync()!);
    switch(choix)
    {
        case 1:
            addFilm(films);
            print("Film ajouté !");
        
        case 2:
            if(films.isEmpty)
            {
                print("Il n'y a pas de films dans la bibliothèque !");
            }
            else
            {
                printFilms(films);
                print("Films affichés !");
            }
        
        case 3:
            if(films.isEmpty)
            {
                print("Il n'y a pas de films dans la bibliothèque !");
            }
            else
            {
                print("Entrez le réalisateur du film :");
                String director = stdin.readLineSync()!;
                printFilms(getFilmsByDirector(films, director));
                print("Films du réalisateur \"${director}\" affichés !");
            }
        
        case 4:
            print("Au revoir !");
            exit = true;
    }
  }
}

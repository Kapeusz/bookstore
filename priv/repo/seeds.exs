# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Bookstore.Repo.insert!(%Bookstore.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

# alias Bookstore.Genres
# for category <- ~w(Architecture Art Beauty Health Biography Business Classics Comics Cooking Fantasy Dictionaries History Politics Horror Kids Law Economics Fiction Lifestyle Music Poetry Psychology Romance Science Science-Fiction Sociology Travel)
#  do Genres.create_category!(category)
# end

# alias Bookstore.Writers

# writers_data = [
#   %{
#     biography: "Stephen King was born on September 21, 1947, in Portland, Maine. He graduated from the University of Maine and later worked as a teacher while establishing himself as a writer. Having also published work under the pseudonym Richard Bachman, King's first horror novel, Carrie, was a huge success.",
#     first_name: "Stephen",
#     last_name: "King"
#   },
#   %{
#     biography: "On September 9, 1828, writer Leo Tolstoy was born at his family's estate, Yasnaya Polyana, in the Tula Province of Russia. He was the youngest of four boys. When Tolstoy's mother died in 1830, his father's cousin took over caring for the children.",
#     first_name: "Leo",
#     last_name: "Tolstoy"
#   },
#   %{
#     biography: "Fyodor Dostoyevsky, in full Fyodor Mikhaylovich Dostoyevsky, Dostoyevsky also spelled Dostoevsky, (born November 11 [October 30, Old Style], 1821, Moscow, Russia—died February 9 [January 28, Old Style], 1881, St. Petersburg), Russian novelist and short-story writer whose psychological penetration into the darkest recesses of the human heart, together with his unsurpassed moments of illumination, had an immense influence on 20th-century fiction.",
#     first_name: "Fyodor",
#     last_name: "Dostoyevsky"
#   },
#   %{
#     biography: "Herman Melville (born Melvill;[a] August 1, 1819 – September 28, 1891) was an American novelist, short story writer, and poet of the American Renaissance period. Among his best-known works are Moby-Dick (1851), Typee (1846), a romanticized account of his experiences in Polynesia, and Billy Budd, Sailor, a posthumously published novella. Although his reputation was not high at the time of his death, the centennial of his birth in 1919 was the starting point of a Melville revival and Moby-Dick grew to be considered one of the great American novels.",
#     first_name: "Herman",
#     last_name: "Melville"
#   },
# ]

# Enum.each(writers_data, fn(data) ->
#   Writers.create_author(data)
# end)

alias Bookstore.Media
alias Bookstore.Repo
alias Bookstore.Media.Publisher

Repo.insert!(%Publisher{
  name: "Penguin Random House",
  email: "consumerservices@penguinrandomhouse.com"
})

Repo.insert!(%Publisher{
  name: "Hachette Livre",
  email: "support-hli@hachettepro.fr"
})

Repo.insert!(%Publisher{
  name: "HarperCollins",
  email: "orders@harpercollins.com"
})

Repo.insert!(%Publisher{
  name: "Macmillan Publishers",
  email: ""
})

Repo.insert!(%Publisher{
  name: "Simon & Schuster",
  email: "TorUKSubmissions@macmillan.com"
})

Repo.insert!(%Publisher{
  name: "Wiley",
  email: "creditriskdept@wiley.com"
})

Repo.insert!(%Publisher{
  name: "Kodansha",
  email: "contact@kodansha.jp"
})

Repo.insert!(%Publisher{
  name: "Shueisha",
  email: "editor@japanecho.co.jp"
})

Repo.insert!(%Publisher{
  name: "Bonnier Books",
  email: "info@bonnierbooks.com"
})

Repo.insert!(%Publisher{
  name: "Klett",
  email: "contact klett-sprachen.de"
})

Repo.insert!(%Publisher{
  name: "Egmont Books",
  email: "mail@publishers.org.uk"
})

Repo.insert!(%Publisher{
  name: "Canaveral Press",
  email: "contact@canaveralpress.com"
})

Repo.insert!(%Publisher{
  name: "Coffee House Press",
  email: "info@coffeehousepress.org"
})

Repo.insert!(%Publisher{
  name: "Mercury House",
  email: "spd@spdbooks.org"
})

Repo.insert!(%Publisher{
  name: "New Rivers Press",
  email: "contact@nrp.org"
})

Repo.insert!(%Publisher{
  name: "Small Beer Press",
  email: "info@smallbeerpress.com"
})

Repo.insert!(%Publisher{
  name: "Legend Press",
  email: ""
})

Repo.insert!(%Publisher{
  name: "Graywolf Press",
  email: ""
})

Repo.insert!(%Publisher{
  name: "Blackwell Publishers",
  email: "info@legendtimesgroup.co.uk"
})

Repo.insert!(%Publisher{
  name: "Algonquin Books",
  email: "inquiry@algonquin.com"
})

Repo.insert!(%Publisher{
  name: "Atlantic Books",
  email: "publicity@atlantic-books.co.uk"
})

Repo.insert!(%Publisher{
  name: "Mercury House",
  email: "contact@mercuryhouse.co.uk"
})

Repo.insert!(%Publisher{
  name: "TSAR Publications",
  email: "treview@total.net"
})

Repo.insert!(%Publisher{
  name: "Moschatel Press",
  email: "inquire@moschatel.net"
})

Repo.insert!(%Publisher{
  name: "Faber Independent Alliance",
  email: "gapublicity@faber.co.uk"
})

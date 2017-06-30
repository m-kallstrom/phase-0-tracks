
star_wars_saga = {
  original_trilogy: {
    A_New_Hope: {
      number: 4,
      main_characters: [
        "Luke Skywalker",
        "Han Solo",
        "Princess Leia Organa",
        ],
      release_year: 1977,

      },

    The_Empire_Strikes_Back: {
      number: 5,
      main_characters: [
        "Luke Skywalker",
        "Han Solo",
        "Princess Leia Organa",
        ],
      release_year: 1980,
      },

    Return_of_the_Jedi: {
      number: 6,
      main_characters: [
        "Luke Skywalker",
        "Han Solo",
        "Princess Leia Organa",
        ],
      release_year: 1983,
      },
    },

  prequel_trilogy: {
    The_Phantom_Menace: {
      number: 1,
      main_characters: [
        "Anakin Skywalker",
        "Obi-Wan Kenobi",
        "Padme Amidala",
        "Qui-Gon Jinn",
        ],
      release_year: 1999,
      },

    Attack_of_the_Clones: {
      number: 2,
      main_characters: [
        "Anakin Skywalker",
        "Obi-Wan Kenobi",
        "Padme Amidala",
        ],
      release_year: 2002,
      },

    Revenge_of_the_Sith: {
      number: 3,
      main_characters: [
        "Anakin Skywalker",
        "Obi-Wan Kenobi",
        "Padme Amidala",
        ],
      release_year: 2005,
      },
    },

  sequel_trilogy: {
    The_Force_Awakens: {
      number: 7,
      main_characters: [
        "Rey",
        "Finn",
        "Poe Dameron",
        ],
      release_year: 2015,
      },

    The_Last_Jedi: {
      number: 8,
      main_characters: ["tbd"],
      release_year: 2017,
      },

    TBD: {
      number: 9,
      main_characters: ["tbd"],
      release_year: 2019,
      },
    },

  one_shots: {
    The_Holiday_Special: {
      note: "We don't speak of the Holiday Special.",
    },

    Rogue_One: {
      time_period: "between Episodes 3 and 4",
      main_characters: [
        "Jyn Erso",
        "Cassian Andor",
        "Baze Malbus",
        "Chirrut Imwe",
        ],
      release_year: 2016,
      },

      Untitled_Han_Solo_Film: {
        time_period: "between Episodes 3 and 4 but probably before Rogue One and Star Wars: Rebels",
        main_characters: ["tbd"],
        release_year: "tbd",
      }

  },
  cartoons_and_misc: {
    Star_Wars_Clone_Wars: {
      time_period: "between Episodes 2 and 3",
      main_characters: [
        "Anakin Skywalker",
        "Obi-Wan Kenobi",
        "Ahsoka Tano",
          ["Captain Rex",
           "Commander Cody",
           "Fives",
           "Various other clone troopers",
          ],
        ],
      release_year: 2008,
      },

    Star_Wars_Rebels: {
      time_period: "between Episodes 3 and 4 but before Rogue One",
      main_characters: [
        "Hera Syndulla",
        "Kanan Jarrus",
        "Sabine Wren",
        "Ezra Bridger",
        "Zeb Orellios",
        ],
      release_year: 2014,
      },
    },
}



# In phase-0-tracks/ruby/nested_data_structures.rb, design and build a nested data structure to represent a real-world construct. You can choose the construct: Is it a highway full of cars full of people? A classroom full of desks full of supplies? A fashion show with multiple runways featuring multiple models? Build something that will use a mix of hashes and arrays.

# Once you've built it, print a few individual pieces of deeply nested data from the structure, showing that you know how to use multiple indexes or hash keys (or both) to access nested items. Try to demonstrate a few different types of access.
users= [ {username: "Rubiksdude", email: "rubiks@dude.wow", password: "123456" },{username: "Legitcoder", email: "legitcoder@email.com", password: "123457"}, {username: "tstone", email: "tstone@email.com", password: "123457"}
]

User.create!(users)

decks= [ {name: "Memes"}, {name: "Pokemon"}, {name: "New York"}
]

Deck.create!(decks)

cards= [{question: "What is nyancat", answer: "a meme", deck_id: 1},{question: "true or false: Can I meme?", answer: "false", deck_id: 1},{question: "Who do i choose?", answer: "pikachu", deck_id: 2},{question: "What type is squirtle?", answer: "water", deck_id: 2},{question: "What is scizor's base attack?", answer: "130", deck_id: 2}, {question: "How many buroughs are there?", answer: "5", deck_id: 3}, {question: "What's the tallest building?", answer: "Empire State Building", deck_id: 3}, {question: "Where are you now?", answer: "New York", deck_id: 3}, {question: "What is man?", answer: "Boss Triangles", deck_id: 3}
]

Card.create!(cards)

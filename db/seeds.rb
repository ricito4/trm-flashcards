users= [ {username: "Rubiksdude", email: "rubiks@dude.wow", password: "123456" },{username: "Legitcoder", email: "legitcoder@email.com", password: "123457"}
]

User.create!(users)

decks= [ {name: "Memes"}, {name: "Pokemon"}
]

Deck.create!(decks)

cards= [{question: "What is nyancat", answer: "a meme", deck_id: 1},{question: "true or false: Can I meme?", answer: "false", deck_id: 1},{question: "Who do i choose?", answer: "pikachu", deck_id: 2},{question: "What type is squirtle?", answer: "water", deck_id: 2},{question: "What is scizor's base attack?", answer: "130", deck_id: 2}
]

Card.create!(cards)

Question.destroy_all

questions = Question.create!([
                                 { title: 'KDE2 BSD patching issue.',
                                   body: 'How to patch KDE2 under BSD?' },
                                 { title: 'The Ultimate Question of Life, the Universe, and Everything',
                                   body: "Actually I don't know the question itself. After 7.5mln years of calculation. Just give me a random answer. Please." }
                             ])

answers = Answer.create!([
                             { question: questions[0],
                               body: 'Ask in anime channel' },
                             { question: questions[1],
                               body: '42' },
                             { question: questions[1],
                               body: 'The answer is forty two' }
                         ])

Subject.create([
                {body: 'блок ВВП'},
                {body: 'блок ВП'}, 
                {body: 'блок МП'},
                {body: 'блок МТ'}
                ])

30.times do
  text = Faker::Lorem.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 4)
  subject_id = Subject.all.sample.id
  question = Question.create(text: text, subject_id: subject_id)
  4.times do
    body = Faker::Lorem.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 2)
    question.answers.create(body: body)
  end
  question.answers.sample.update(right: 1)
end

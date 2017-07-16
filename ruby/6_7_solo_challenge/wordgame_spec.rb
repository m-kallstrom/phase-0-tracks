#Solo Challenge

require_relative 'wordgame'

describe Wordgame do
  let(:hangman) { Wordgame.new("apple") }


  it "checks the word for the letter being guessed POSTIVE RESULT" do
    expect(hangman.check_letter("a")).to eq true
  end

  it "checks the word for the letter being guessed NEGATIVE RESULT" do
    expect(hangman.check_letter("z")).to eq false
  end

  it "obscures the array of letters" do
    expect(hangman.hide_letters).to eq [" _ ", " _ ", " _ ", " _ ", " _ "]
  end

  it "reveals the letter if correct" do
    hangman.hide_letters
    expect(hangman.letter_reveal("a")).to eq ["a", " _ ", " _ ", " _ ", " _ "]
  end

 it "updates the guess counter POSTIVE RESULT" do
    @letters_checked = ["a"]
    expect(hangman.update_counter("a")).to eq 0
  end
  it "updates the guess counter NEGATIVE RESULT" do
    expect(hangman.update_counter("z")).to eq 1
  end
end

#Solo Challenge

require_relative 'wordgame'

describe Wordgame do
  let(:hangman) { Wordgame.new("apple") }

  it "determines the number of guesses a user gets based on word length" do
    expect(hangman.guess_counter).to eq 11
  end

  it "checks the word for the letter being guessed POSTIVE RESULT" do
    hangman.hide_letters
    expect(hangman.check_letter("a")).to eq "a _  _  _  _ "
  end

  it "checks the word for the letter being guessed NEGATIVE RESULT" do
    hangman.hide_letters
    expect(hangman.check_letter("z")).to eq " _  _  _  _  _ "
  end

  it "obscures the array of letters" do
    expect(hangman.hide_letters).to eq " _  _  _  _  _ "
  end

  it "reveals the letter if correct" do
    hangman.hide_letters
    expect(hangman.letter_reveal("a")).to eq "a _  _  _  _ "
  end

 it "updates the guess counter when an item is NOT included" do
    hangman.update_counter("a")
    expect(hangman.update_counter("p")).to eq 2
  end

  it "keeps the guess counter the same when an item IS already included" do
    @letters_checked = ["a"]
    expect(hangman.update_counter("a")).to eq 1
  end

  it "updates the guess counter on the FIRST pass through" do
    expect(hangman.update_counter("a")).to eq 1
  end

  it "determines which message to give the user FAIL" do
    hangman.hide_letters
    expect(hangman.taunter).to eq "You get NOTHING! You LOSE! GOOD DAY, SIR!"
  end

  it "determines which message to give the user PASS" do
    expect(hangman.taunter).to eq "Awesome job! I knew you could do it!"
  end

  it "check all methods call each other properly to the final result" do
    hangman.hide_letters
    hangman.check_letter("a")
    hangman.check_letter("z")
    hangman.check_letter("p")
    hangman.check_letter("l")
    hangman.check_letter("a")
    hangman.check_letter("e")
    expect(hangman.game_over?).to eq "Awesome job! I knew you could do it!"
  end
end

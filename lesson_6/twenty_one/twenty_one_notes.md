# Twenty-One

- 13 cards/values - 2, 3, 4, 5, 6, 7, 8, 9, 10, jack, queen, king, ace
- 4 suits - hearts, diamonds, clubs, and spades
- 52 cards in total
- Face values:

  | Card | Value |
  |-----|-----|
  | 2-10 | face values |
  | jack, queen, king | 10 |
  | ace | 1 or 11 |

- Value of ace depends on the total value of the cards you have. If the total value of the cards with the drawn ace exceeds 21 the value is 1, else it is 11.

  Example - If a hand contains a 2, an ace and a 5, the total value of the hand is 18 (2 + 11 + 5), ace in this case is 11 given that the total value of the hand without it is 7 (less than 21), if you draw another card and it happens to be an ace, the value of this ace will be 1, because 2 + 11 + 5 + 11 = 29. The program must account for the value of each ace individually based on the draw order and the total value of the hand.

  One thing to identify here is that there can only be 1 ace with a value of 11 in the hand, therefore if more than 1 ace's exist in the hand, by default the other ace's have a value of 1.

## Implementation steps

High level flow:

1. Initiate the deck
2. Deal cards to player and dealer
3. Ask the player to 'hit' or 'stay'

    - Repeat until bust or 'stay'

4. If bus, dealer wins
5. Else, ask the dealer to 'hit' or 'stay'

    - Repeat until total >= 17

6. If bust, player wins
7. Else compare totals and declare winner

Detailed flow:

1. Initiate the deck that points to an array containing nested array with 2 elments, a suit value and a card value.
2. Initiate a player and a dealer variable that points to an empty array.
3. Add 2 nested arrays each from the deck in the player and dealer array.

### Deal cards to player and dealer

- method to deal a card (`deal_card`)

  - method takes 1 argument, an array of cards
  - first, shuffle the array using `Array#shuffle!`
  - chose a random element using `Array#sample`
  - delete the chosen element from the array

- to deal 2 initital cards

  - create a loop
  - call `deal_card` and append the return value in participants array
  - break loop when both arrays have 2 elements

### Calculate participant's card's value

- create a method to find a cards value

  - A card will be passed into the method as an array, the element at index 1 can be used to determine the card.
  - based on the card

    - if card equals any value in `('2'..'10').to_a` then card.to_i
    - if card equals any value `['j', 'q', 'k']` then 10
    - if card equals `'a'`

      - 1 if total `'a'` cards present in pariticpants array is >= 1
      - 11 if total `'a'` cards in equal to 0

- create a method to calculate the total value of a participants card

### Game logic

Players turn:

start loop

- Ask the player to 'hit' or 'stay'

    1 get input

    2 check if the input is valid

    3 if valid, break

    4 Else, go to #1

- break if busted? or input == 'stay'
- add a card to player's cards array (use `deal_card` method)

end loop

`busted?` sub-method:

> For `busted?` create another sub-method that calculates the total value of cards

    - pass the player's cards array as an argument
    - initiate a variable called total pointing to 0
    - call `card_value` method on each card by calling `Enumerable#each` on player's cards array
    - on each iteration add the current card's value to the total

- pass the player's cards array as an argument
- call the `total_value` method on the array
- if total value is > 21 then busted!

After busted or stay:

- if busted?

  - display results
  - ask if the player wants to play again

- else

  - dealers turn

Dealers turn:

start loop

- until total value of dealer's cards is >= 17
  - add a card to dealer's cards array

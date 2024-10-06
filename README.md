# Project 4 - *Memory Game*

Submitted by: **Andress Vizcaino Seolin**

**Name of your app** is an app that allows you to play a memory game where you match different fruit emojis. You're able to change
the grid size from 3, 6, or 10 pairs of cards to play with, while also having the function to reset the game.

Time spent: **18** hours spent in total

## Required Features

The following **required** functionality is completed:

- [X] App loads to display a grid of cards initially placed face-down:
  - Upon launching the app, a grid of cards should be visible.
  - Cards are facedown to indicate the start of the game.
- [X] Users can tap cards to toggle their display between the back and the face: 
  - Tapping on a facedown card should flip it to reveal the front.
  - Tapping a second card that is not identical should flip both back down
- [X] When two matching cards are found, they both disappear from view:
  - Implement logic to check if two tapped cards match.
  - If they match, both cards should either disappear.
  - If they don't match, they should return to the facedown position.
- [X] User can reset the game and start a new game via a button:
  - Include a button that allows users to reset the game.
  - This button should shuffle the cards and reset any game-related state.
 
The following **optional** features are implemented:

- [-] User can select number of pairs to play with (at least 2 unique values like 2 and 4).
  * (Hint: user Picker)
- [-] App allows for user to scroll to see pairs out of view.
  * (Hint: Use a Scrollview)
- [-] Add any flavor you’d like to your UI with colored buttons or backgrounds, unique cards, etc. 
  * Enhance the visual appeal of the app with colored buttons, backgrounds, or unique card designs.
  * Consider using animations or transitions to make the user experience more engaging.

The following **additional** features are implemented:

- [-] List anything else that you can get done to improve the app functionality!

## Video Walkthrough

<div>
    <a href="https://www.loom.com/share/53a8e68879ca42f4a18f67ffe869ac6d">
      <p>Loom Message - 6 October 2024 - Watch Video</p>
    </a>
    <a href="https://www.loom.com/share/53a8e68879ca42f4a18f67ffe869ac6d">
      <img style="max-width:300px;" src="https://cdn.loom.com/sessions/thumbnails/53a8e68879ca42f4a18f67ffe869ac6d-28156ce636311ad7-full-play.gif">
    </a>
  </div>

## Notes

Describe any challenges encountered while building the app.
Some challenges I ran into when creating this app were trying to figure out how to implement the option of choosing how many pairs
the user is allowed to play with. I eventually had to go about it in a different way than what was shown in the instructions but
the functionality is the same and still works. 

## License

    Copyright [2024] [Andress Vizcaino Seolin]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

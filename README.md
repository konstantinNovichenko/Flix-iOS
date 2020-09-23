# Flix

Flix is an app that allows users to browse movies from the [The Movie Database API](http://docs.themoviedb.apiary.io/#).

## Flix Part 2

### User Stories

#### REQUIRED (10pts)
- [x] (5pts) User can tap a cell to see more details about a particular movie.
- [x] (5pts) User can tap a tab bar button to view a grid layout of Movie Posters using a CollectionView.

#### BONUS
- [x] (2pts) User can tap a poster in the collection view to see a detail screen of that movie.
- [x] (2pts) In the detail view, when the user taps the poster, a new screen is presented modally where they can view the trailer.

### App Walkthrough GIF

<img src="http://g.recordit.co/gXfdktTVHX.gif" width=250><br>
<img src="http://g.recordit.co/QbiHKkWE0v.gif" width=250><br>

### Notes
I decided to set the spacing in CollectionView to 0 instead of 4 as my design preference.<br>
I had issues with auto layout for devices with small screen size. I suggest to make the detailed view scrollable so the users can read the synopsis in full on devices with small screen.

---

## Flix Part 1

### User Stories

#### REQUIRED (10pts)
- [x] (2pts) User sees an app icon on the home screen and a styled launch screen.
- [x] (5pts) User can view and scroll through a list of movies now playing in theaters.
- [x] (3pts) User can view the movie poster image for each movie.

#### BONUS
- [x] (2pt) User can view the app on various device sizes and orientations.
- [ ] (1pt) Run your app on a real device.

### App Walkthrough GIF

<img src="http://g.recordit.co/5OA0MNBxGv.gif" width=250><br>

### Notes
Encountered an issue with accessing the API due to security restrictions. Made changes in Info.plist file to fix the issue.

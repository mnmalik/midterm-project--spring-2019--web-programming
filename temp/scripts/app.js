/*jslint browser, es6 */

/*global window */
window.onload = function () {
  const CSSPreProcessor = `Sass`;
  const JSVersion = `ES6`;
  let body = document.querySelector(`body`);
  let paragraph = document.createElement(`p`);
  paragraph.appendChild(text);
  body.appendChild(paragraph);
}; // A Class to describe a "doorbell" (really a button)


class Doorbell {
  constructor(x_, y_, r_) {
    // Location and size
    this.x = x_;
    this.y = y_;
    this.r = r_;
  } // Is a point inside the doorbell? (used for mouse rollover, etc.)


  contains(mx, my) {
    return dist(mx, my, this.x, this.y) < this.r;
  } // Show the doorbell (hardcoded colors, could be improved)


  display(mx, my) {
    if (this.contains(mx, my)) {
      fill(100);
    } else {
      fill(175);
    }

    stroke(0);
    strokeWeight(4);
    ellipse(this.x, this.y, this.r, this.r);
  }

} // A sound file object


let dingdong; // A doorbell object (that will trigger the sound)

let doorbell;

setup = function setup() {
  createCanvas(200, 200); // Load the sound file.
  // We have included both an MP3 and an OGG version.

  soundFormats('mp3', 'ogg');
  dingdong = loadSound('assets/doorbell.mp3'); // Create a new doorbell

  doorbell = new Doorbell(width / 2, height / 2, 64);
};

draw = function draw() {
  background(0); // Show the doorbell

  doorbell.display(mouseX, mouseY);
};

mousePressed = function mousePressed() {
  // If the user clicks on the doorbell, play the sound!
  if (doorbell.contains(mouseX, mouseY)) {
    dingdong.play();
  }
};
/*
const WIDTH = 600,
    HEIGHT = 400,
    RED = 255,
    GREEN = 100,
    BLUE = 0,
    MIN = 1,
    MAX = 20;

setup = function setup() {
    createCanvas(710, 400);
    background(0);
}
mouseMoved = function mouseMoved () {
    fill(random(0, 255), random(0, 255), random(0, 255));
    ellipse(mouseX, mouseY, random(MIN, MAX), random(MIN, MAX));
}

*/
//mouseClicked= function mouseClicked () {
//  save(`random.png`);
//}
//let song;
//function setup() {
//  song = loadSound('song1.mp3');
//}
//mouseClicked = function mouseClicked() {
//if (song.isPlaying()) {
//  song.stop();
//} else {
//  song.play();
//}

/*
let song;

setup = function setup() {
    createCanvas(720, 200);
    background(255);
    song = loadSound('song1.mp3');

}

mousePressed = function mousePressed() {
    if (song.isPlaying()) {
        // .isPlaying() returns a boolean
        song.stop();
        background(255);
    } else {
        song.play();
        background(0);
    }
}
*/
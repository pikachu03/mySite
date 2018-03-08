int player1y = 40, player2y = 40;
boolean player1up = false, player1down = false;
boolean player2up = false, player2down = false;
int x = 200, y = 300, dx = 4, dy = 2;
int player1score = 0, player2score = 0;
boolean gameOver = false;
float r, g, b, dr, dg, db;

void setup() {
  size(600, 400);
  frameRate(100);
  r = 50;
  g = 100;
  b = 150;
  dr = 10;
  dg = 10;
  db = 10;
}

void draw() {
      if (player1score < 20 && player2score < 20) {
        background(0);
        fill(r, g, b);
        r += dr;
        g += dg;
        b += db;
        if (r > 250 || r < 50) dr *= -1;
        if (g > 250 || g < 50) dg *= -1;
        if (b > 250 || b < 50) db *= -1;
        noStroke();

        if (player1y < -1) player1y = 0;
        if (player1y > height - 99) player1y = height - 100;

        if (player2y < -1) player2y = 0;
        if (player2y > height - 99) player2y = height - 100;

        if (player1up) player1y -= 10;
        if (player1down) player1y += 10;

        if (player2up) player2y -= 10;
        if (player2down) player2y += 10;

        ellipse(x, y, 30, 30);
        check();
        x += dx;
        y += dy;

        rect(40, player1y, 20, 100);
        rect(width - 60, player2y, 20, 100);

        textSize(20);
        text("Score: " + player1score, 80, 20);
        text("Score: " + player2score, width - 160, 20);

        stroke(255);
        line(width / 2, 0, width / 2, height);

        textSize(10);
        text(" Developed by: \n Amitav Nott", width-80, height-20);

        if (player1score == 20) {
            background(0);
            textSize(40);
            text("Player 1 Wins! \nClick to Play Again!", width/2 - 120, height/2);
            gameOver = true;
        }

        if (player2score == 20) {
            background(0);
            textSize(40);
            text("Player 2 Wins! \nClick to Play Again!", width/2 - 120, height/2);
            gameOver = true;
        }
    }

    if (mousePressed) {
      if (gameOver) {
        player1score = 0;
        player2score = 0;
        x = 200; y = 300; dx = 4; dy = 2;
        player1y = 40; player2y = 40;
      }
    }
}

void keyPressed() {
    if (key == 'w') {
        player1up = true;
    }
    if (key == 's') {
        player1down = true;
    }

    if (key == CODED) {
      if (keyCode == UP) {
          player2up = true;
      }
      if (keyCode == DOWN) {
          player2down = true;
      }
    }
}

void keyReleased() {
    if (key == 'w') {
        player1up = false;
    }
    if (key == 's') {
        player1down = false;
    }

    if (key == CODED) {
      if (keyCode == UP) {
          player2up = false;
      }
      if (keyCode == DOWN) {
          player2down = false;
      }
    }
}

private void check() {
    if (x < 60 && x > 40 && y > player1y && y < player1y + 50) {
        dx *= -1;
        dy *= -1;
    }

    if (x < 60 && x > 40 && y > player1y && y < player1y + 100 && y > player1y + 50) {
        dx *= -1;
    }

    if (x > (width-40) - 20 && x < width - 40 && y > player2y && y < player2y + 50) {
        dx *= -1;
        dy *= -1;
    }

    if (x > (width-40) - 20 && x < width - 40 && y > player2y && y < player2y + 100 && y > player2y + 50) {
        dx *= -1;
    }

    if (y < 0 || y > height-15) {
        dy *= -1;
    }

    if (x < 15) {
        player2score++;
        dx *= -1;
    }

    if (x > width-15) {
        player1score++;
        dx *= -1;
    }
}

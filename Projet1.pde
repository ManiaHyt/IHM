PImage img;
PImage retourButton;
int selectedTable = -1;

void setup() {
  size(720, 900); 
  img = loadImage("user.png"); 
  retourButton = loadImage("back.png");
}

void draw() {
  background(255);
  drawHeader();
  drawMessages();
  drawBackButton();
  
  if (selectedTable != -1) {
    drawMenu(selectedTable);
  }
}

void drawHeader() {
  fill(0);
  textAlign(CENTER);
  textSize(24);
  text("Restaurant", width / 2, 50); 
  noFill();
  rect(width / 2 - 100, 20, 200, 40);
}

void drawMessages() {
  for (int i = 0; i < 10; i++) {
    drawMessage(50, 100 + 80 * i, "Table " + (i + 1), "UwU");
  }
}

void drawMessage(int x, int y, String name, String message) {
  // Dessiner la bulle
  fill(200);
  ellipse(x, y, 40, 40); // Bulle

  // Positionner et dessiner l'image dans la bulle
  imageMode(CENTER); // Pour positionner l'image en son centre
  image(img, x, y, 40, 40); // Ajustement de la position et de la taille de l'image

  // Dessiner le rectangle du message
  fill(230); // Couleur de remplissage des rectangles (gris clair)
  rect(x + 50, y - 20, 300, 60); // Rectangle pour le message
  fill(0); // Couleur du texte (noir)
  textAlign(LEFT);
  textFont(createFont("Arial", 18)); // Police pour le nom
  text(name, x + 60, y + 10); // Nom
  textFont(createFont("Arial", 12)); // Police pour le message
  text(message, x + 60, y + 30); // Message
}
  
void drawBackButton() {
  imageMode(CENTER);
  image(retourButton, 40, 40, 50, 50);
}

void drawMenu(int tableNumber) {
  fill(240); // Couleur de fond du menu
  rect(480, 0, 240, height); // Dessiner le menu

  // Dessiner la croix
  fill(0); // Couleur de la croix
  text("X", 490, 20); // Position de la croix

  // Titre du menu
  fill(0);
  text("Historique des messages de la Table " + tableNumber, 490, 40); // Position ajustée du titre
  // Afficher l'historique des messages ici pour la tableNumber
}

void mousePressed() {
  if (dist(mouseX, mouseY, 40, 40) < 25) {
    println("Bouton Retour cliqué");
  }
  for (int i = 0; i < 10; i++) {
    int x = 50;
    int y = 100 + 80 * i;
    if (selectedTable != -1 && mouseX >= 480 && mouseX <= 510 && mouseY >= 0 && mouseY <= 30) {
    selectedTable = -1; // Fermer le menu
  }
    if (mouseX >= x + 50 && mouseX <= x + 350 && mouseY >= y - 20 && mouseY <= y + 40) {
      selectedTable = i + 1; 
      break; 
    }
  }
}

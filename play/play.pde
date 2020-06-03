import processing.video.*;
import processing.serial.*;
Movie myMovie;
Serial myPort;
int newLine = 13; //ASCII change line: \n
int videoNum = 2;
Movie [] playlist = new Movie[videoNum];
int currentMovieIndex = 0;
String message;
String[] len = {"totoro.mov","mov2.mov"};

//float movieEndDuration = 0.029719;

void setup() {
  
  myPort = new Serial(this, "/dev/cu.usbmodem144101", 9600);
  size(500, 1200); // the ration of the video
  for(int i =0; i<videoNum; i++){
    playlist[i] = new Movie(this,len[i]);//new Movie(this, "ch"+(i+1)+".mp4");
    playlist[i].play();
  }
}

void draw() {
  background(0);
  image(playlist[currentMovieIndex],0,0);
}

// Called every time a new frame is available to read
void movieEvent(Movie m){
  m.read();
  message = myPort.readStringUntil(newLine);
  switch (message){
    case "0":
      currentMovieIndex = 0;
      println("play 0");
      break;
    case "1":
      currentMovieIndex = 1;
      break;
  }
  playlist[currentMovieIndex].read();
  
}

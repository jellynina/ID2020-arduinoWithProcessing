import processing.video.*;
import processing.serial.*;
Movie myMovie;
Serial myPort;
int newLine = 13; //ASCII change line: \n
int videoNum = 3;
Movie [] playlist = new Movie[videoNum];
int currentMovieIndex = 0;
String message;
String portMsg;
String[] len = {"totoro.mov","mov2.mov","mov3.mov"};

//float movieEndDuration = 0.029719;

void setup() {
  
  //myPort = new Serial(this, "/dev/cu.usbmodem146101", 9600);
  size(1476, 1576); // the ration of the video
  for(int i =0; i<videoNum; i++){
    playlist[i] = new Movie(this,len[i]);
  }
}

void draw() {
  //portMsg = myPort.readStringUntil(newLine);
  if (portMsg == null){
    playlist[0].play();
    println("default is playing");
  } else {
    playlist[0].stop();
    println("stop default");
    switch (portMsg){
      case "1":
        playlist[1].play();
        break;
    }
  }
  
  playlist[currentMovieIndex].play();
  image(playlist[currentMovieIndex],0,0);
}

// Called every time a new frame is available to read
void movieEvent(Movie m){
  m.read();
  //portMsg = myPort.readStringUntil(newLine);
  message = "1";
  if(portMsg == null){
    currentMovieIndex = 0;
  } else {
    switch (message){
      case "0":
        currentMovieIndex = 0;
        println("play 0");
        break;
      case "1":
        currentMovieIndex = 1;
        println("play 1");
        break;
      case "2":
        currentMovieIndex = 2;
        println("play 2");
        break;
      default:
       currentMovieIndex = 0;
       break;
    }
  }
  playlist[currentMovieIndex].read();
  
}

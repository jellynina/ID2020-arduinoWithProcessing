# Arduino控制Unity播放影片


## 參考資料

- [【米飯工作坊】Unity互動應用入門：Unity與Arduino溝通互動](https://www.youtube.com/watch?v=0keRacr_8lk&fbclid=IwAR18p0sQ63yyWFD8nh6RB7cpJb0wV6gNojBwnAjrD61wEYaThAzgU1kiJ5o)
-[Unity-播放影片新版方法 VideoPlayer](https://www.youtube.com/watch?v=tTJJav4ufbw&fbclid=IwAR1DWgslWdkl5FBI6uMBeLy061vpX8lkByWzruG-TSCopkTbkeEhkofOUoI)

# 用Arduino控制Processing播放影片

**無法有效的重置影片**：改用Unity播放影片

## 機制

使用`Searial.port`傳送目前播放的編號
程式碼請見[sketch_arduinoBtnSerialRead](https://github.com/jellynina/ID2020-arduinoWithProcessing/blob/master/sketch_arduinoBtnSerialRead/sketch_arduinoBtnSerialRead.ino)

**！注意** 因裝置緣故，狀態是顛倒的



## `import processing.video.*;`
Processing播放影片：
參見[play()](https://processing.org/reference/libraries/video/Movie_play_.html)

## import processing.serial.*;

```java
import processing.video.*;
Movie myMovie;
String[] len = {"data.mov","aa.mov"};
import processing.serial.*;

Serial myPort;
int i = 0;
int newLine = 13; //ASCII編碼中的換行字元: \n
 String message;
void setup() {
  myPort = new Serial(this, "COM3", 9600); 
  size(200, 200);
  myMovie = new Movie(this, len[i]);
  myMovie.loop();
}

void draw() {
  tint(255, 20);
  message = myPort.readStringUntil(newLine); 
  image(myMovie, mouseX, mouseY);
}

// Called every time a new frame is available to read
void movieEvent(Movie m) {
  m.read();
}
```
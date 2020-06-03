

int Btn[] = {2,4};
int state = 0;
int oldState;
int num = 2; // the number of the btns


void setup() {
  Serial.begin(9600);
  pinMode(Btn[0], INPUT); 
  pinMode(Btn[1], INPUT); 

}

void loop() {
  if(state != 0 && state == oldState){
    state = 0;
    }
  for(int i = 0; i < num; i=i+1){
    if(digitalRead(Btn[i]) == LOW){
      state = (i+1);
      if(oldState != state){
        oldState = state;
        }
      }
    }
    Serial.println(state);
  delay(500);

}

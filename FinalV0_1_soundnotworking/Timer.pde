class Timer
{

  float Time;

  Timer(float set)//constructor for creating a new timer
  {
    Time = set;
  }
  float getTime()// this returns the current time
  {
    return (Time);
  }
 // void setTime(float set)// set the timer as what ever you put as your temp variable ie. 10 or 20 seconds
  //{
   // Time = set;
 // }
  void countUp()//updating timer to count up. This is called within draw() loop.
  {
    Time += 1/frameRate;
  }
}

// i got this from this one guy form yourtube.

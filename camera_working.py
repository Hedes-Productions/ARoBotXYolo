import cv2
import keyboard
import time
import random

print("I'm ready to take pictures. Press 'm' to start and stop taking pictures. Press 'q' to quit the program.")
cap = cv2.VideoCapture(0)

if (cap.isOpened()== False): 
  print("Error opening video stream or file")
 
i=0
count = 0;
running = False
while(cap.isOpened()):
    fileNum = random.randint(1, 100000000000)
    ret, frame = cap.read()
    if ret == True:
        if (keyboard.is_pressed('m')):
            count=1;
            running = not running
            time.sleep(0.2)
        if running:
            cv2.imshow('Frame',frame)
            cv2.imwrite("dataset/frame %d.jpg" % fileNum,frame)
            i+=1
            if cv2.waitKey(25) & 0xFF == ord('q'):
                break
    else: 
        break

cap.release()

cv2.destroyAllWindows()

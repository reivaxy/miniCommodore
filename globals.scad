
hollowRatio = 0.94;

bodyTopOpeningX = 36;
bodyTopOpeningY = 17;

bodyBotOpeningX = 40;
bodyBotOpeningY = 40;

monitorBotOpeningX = bodyTopOpeningX-1;
monitorBotOpeningY = bodyTopOpeningY ;


keyPadHoleX = 10.25;
keyPadHoleY = 13.53;

keyboardHoleX = 31.8;
keyboardHoleY = 10.25;
spaceBarHoleX = 20.50;
spaceBarHoleY = 3.28;

keyPadX = keyPadHoleX -0.8 ;
keyPadY = keyPadHoleY -0.8 ;

keyboardX = keyboardHoleX - 1.8 ;
keyboardY = keyboardHoleY -0.8 ;
spaceBarX = spaceBarHoleX -1 ;
spaceBarY = spaceBarHoleY -0.5 ;


kbAxleSupportWidth = 1.6;
kbAxleSupportSpacing = 3.5;
kbAxleSupportSide = 8;
kbAxisDiam = 2;

switchX = 4;
switchY = 6.35;
switchFootX = switchX + 1;
switchFootY = switchY + 1.1;

screwPillarX = 5;
screwPillarY = 3.3;

module screw(head) {
  cylinder(d=1.3, h=8, $fn=80);
  if(head != 0) {
    cylinder(d1=3.7, d2=1.2, h=1.4, $fn=80);
  }
  
}
import processing.pdf.*;

void setup() {

  size(1280, 900, PDF, "sat.pdf");
  background(7, 44, 74);
  //drawGradient1(640, 450);
  //drawGradient2(640, 450);
  
}

void draw() {
  loadData("satellites.tsv");//load the satellites.tsv file
  println("Finished.");
  exit();
}

//void drawGradient1(float x, float y) {
//  pushMatrix();
//  pushStyle();
//  colorMode(HSB, 360, 100, 100);
//  noStroke();
//  ellipseMode(RADIUS);
//  int radius = 350;
//  float b = 29.02; 
//  for ( int r = radius; r > 0; --r) {
//    fill(206.87, 90.54, b);
//    ellipse(x, y, r, r);
//    b = (b + .3) % 360; //increments the hue
//  }
//  popMatrix();
//  popStyle();
//}
//
//void drawGradient2(float x, float y) {
//  pushMatrix();
//  pushStyle();
//  colorMode(HSB, 360, 100, 100);
//  noStroke();
//  ellipseMode(RADIUS);
//  int radius = 80;
//  float s = 100; 
//  for ( int r = radius; r > 0; --r) {
//    fill(206.87, s, 100);
//    ellipse(x, y, r, r);
//    s = (s - .3) % 360; //increments the hue
//  }
//  popMatrix();
//  popStyle();
//}

void loadData(String url) { //load the data from this url, it will be a string
  //0                   1                 2                           3                          4               5      6        7                 8               9              10                           11            12          13            14                      15                16                17                                                                                       
  //"Name of Satellite, Alternate Names"  Country/Org of UN Registry  Country of Operator/Owner  Operator/Owner  Users  Purpose  Detailed Purpose  Class of Orbit  Type of Orbit  Longitude of GEO (degrees)  Perigee (km)  Apogee (km)  Eccentricity  Inclination (degrees)  Period (minutes)  Launch Mass (kg.)  Dry Mass (kg.)  Power (watts)  Date of Launch  Expected Lifetime  Contractor  Country of Contractor  Launch Site  Launch Vehicle  COSPAR Number  NORAD NumberComments    Source Used for Orbital Data  Source  Source  Source  Source  Source  Source
  //load in the table data
        pushStyle();
        float radiusEarth = 6371;
        float radiusMap = map(sqrt(radiusEarth), 0, sqrt(1000), 0, 30);
        ellipse(640, 450, radiusMap, radiusMap);
        popStyle();
  Table t = loadTable(url, "header, tsv"); //load the table to the variable 't', while letting P3 know to to look for a 
  //from the data set these variable based on what's in these rows
  for (TableRow row : t.rows()) {

    String apogeeString = row.getString(11);//read the information in column 12 from all rows
    //println(apogeeString);

    String perigeeString = row.getString(10);
    //println(perigeeString);

    String launchMassString = row.getString(15);
    //println(launchMassString);
    
    String orbitClass = row.getString(7);
    



    //why is this a try?
    try {
      //prob this could be a function of some kind?
      String apogeeStringClean1 = apogeeString.replaceAll(",", "");
      //println(apogeeStringClean1);
      String apogeeStringClean2 = apogeeStringClean1.replaceAll("\"", "");
      //println(apogeeStringClean2);


      String perigeeStringClean1 = perigeeString.replaceAll(",", "");
      //println(apogeeStringClean1);
      String perigeeStringClean2 = perigeeStringClean1.replaceAll("\"", "");
      //println(apogeeStringClean2);


      String launchMassStringClean1 = launchMassString.replaceAll(",", "");
      //println(launchMassStringClean1);
      String launchMassStringClean2 = launchMassStringClean1.replaceAll("\"", "");
      //println(launchMassStringClean2);
      //String launchMassStringClean3 = launchMassStringClean2.replaceAll("+", "");
      //println(launchMassStringClean3);
      
      


      if (apogeeStringClean2.length() > 0 && perigeeStringClean2.length() > 0) {
        //turn these numbers into an integer
        int apogeeInt = Integer.parseInt(apogeeStringClean2, 10);

        int perigeeInt = Integer.parseInt(perigeeStringClean2, 10);

        int launchMassInt = Integer.parseInt(launchMassStringClean2, 10);
        String new_orbitClass = trim(orbitClass);
        
        noStroke();
          smooth();
          fill(255, 255, 255, 50);
          
        float rand = random(0, 10);

        //print(apogeeInt);
        //print(",");
        //println(perigeeInt);

        float avgHeight = ((apogeeInt + perigeeInt)/2) + 6371;
        //println(avgHeight);

        pushMatrix();
        translate(640, 450);
        
        noStroke();
        //this is the distance away from the center
        float radius = map(sqrt(avgHeight), 0, sqrt(1000), 0, 30);
        //this is the size of the circle
        float diam = map(sqrt(launchMassInt), 0, sqrt(5000), 0, 12);
        //this is...the apogee?this isn't related to how many points there are
        //numPoints is the length of the apogee number
        //float numPoints = apogeeStringClean2.length();
        //println(numPoints);
        //float numPoints = sqrt(apogeeStringClean2.length());
        
        //RANDOM ANGLE HERE?? why is float in ()?
        float angle=TWO_PI/(float)random(0, 10);
 
        if(new_orbitClass.equals("LEO")){
          //white
          fill(251, 251, 151, 80);     
        }else if(new_orbitClass.equals("MEO")){ 
          //teal        
          fill(0, 255, 215, 120);
        }else if(new_orbitClass.equals("GEO")){
          //orange       
          fill(255, 152, 0, 70);

                 
        }else if(new_orbitClass.equals("Elliptical")){
          //royal blue         
          fill(38, 126, 255, 150);
        }else{      
          fill(255, 255, 0, 80);
        }      
          if(launchMassString.length()>0){
          ellipse(radius*sin(angle*rand), radius*cos(angle*rand), diam, diam);
          } else{
            rect(radius*sin(angle*rand), radius*cos(angle*rand), 5, 5);
          }   
        popMatrix();
      } else {
        println("ERROR");
      }
    }
    catch (Exception e) { //WTF does this do?
    }
  }
}


    
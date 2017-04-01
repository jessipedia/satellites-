void setup(){
  
  size(1280,720);
  loadData("satellites.tsv");
  
  
}


void draw(){
  
}

void loadData(String url){
  
  //old way of labeling header information
  //0.                                  1.                          2.                          3.             4.     5.       6.                7.               8.            9.                          10.            11.         12.           13.                    14.               15.                16.             17. (and so on)
  //Name of Satellite, Alternate Names  Country/Org of UN Registry  Country of Operator/Owner  Operator/Owner  Users  Purpose  Detailed Purpose  Class of Orbit  Type of Orbit  Longitude of GEO (degrees)  Perigee (km)  Apogee (km)  Eccentricity  Inclination (degrees)  Period (minutes)  Launch Mass (kg.)  Dry Mass (kg.)  Power (watts)  Date of Launch  Expected Lifetime  Contractor  Country of Contractor  Launch Site  Launch Vehicle  COSPAR Number  NORAD Number  Comments    Source Used for Orbital Data  Source  Source  Source  Source  Source  Source                                                                                                                                                                                                                                                                                                                                                                                                                                                      
  //1.With the table class
  
  Table t = loadTable(url,"header, tsv"); //if we're loading a tsv we need to add the paramiter, it expects a csv
  for (TableRow row:t.rows()){
    String name = row.getString(0);
    String kgString = row.getString(15);
    kgString = kgString.replaceAll("\"","");
    
    String launchString = row.getString(18);
    println(launchString);
    int year = int(launchString.split("/")[2]);
    println(year);
    
    if (kgString.length() > 0) {
      float kg = float(kgString);
      float size = map(sqrt(kg), 0, sqrt(2000), 0, 60);
      ellipse(random(width), random(height), size, size);
    } else {
      rect(random(width), random(height), 10, 10);
    
    }
  }
    catch (Exception e){
    }
}
    
    float kg = row.getFloat(16);
    
    /*
    //float kg = row.getFloat("Launch Mass (kg.)"); //you can call by the header name if you add the "header" option to loadTable()
    //println(row.getString(16)); //to see what the string looks like before we try and make them into numbers. a little debugging here
    println(kg);
    ellipse(random(width), random(height), kg, kg);
    */
  }
  
  //2. Without the table class
  String[] rows = loadStrings(url);
  for (String row:rows) {
    
  }
}
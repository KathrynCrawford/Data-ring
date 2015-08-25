import processing.opengl.*;
import igeo.*;


size(1000, 850, IG.GL);


ICurve curve3 = new ICircle(new IVec(-20, 0, 0), new IVec(1, 0, 0), 20); //Circle creation
IG.squarePipe(curve3, 8).clr(1.0, 0, 0.5); //Square pipe around cirle

ISurface[] surfs = IG.surfaces();
IVec[] points = new IVec[528];
IVec origin = new IVec(0,0,0);
IVec xaxis = new IVec(50,0,0);
IVec yaxis = new IVec(0,50,0);
IVec zaxis = new IVec(0,0,50);
//new ICylinder(origin, xaxis, 0.1);
new ICylinder(origin, yaxis, 0.1);
//new ICylinder(origin, zaxis, 0.1); 

for ( ISurface surf : surfs ) { //for loop creates Points and Cylinders along surface

  int unum = 32, vnum = 32; 
  double uinc = 1.0/unum, vinc = 1.0/vnum;
  for (int i=0; i < unum; i++) {
    for (int j=0; j <= vnum; j++) {
      if ( (i+j)%2 == 0 ) {
        IVec pt1 = surf.pt(i*uinc, j*vinc);
        //new IPoint(pt1).clr(1.0, 0, 0);
        if ( j > 0) {
          IVec pt2 = surf.pt((i+1)*uinc, (j-1)*vinc);
          print(pt2.y() + " ");
          if ((pt2.x() <= -24.0 || pt2.x() >= 25) && (pt2.y() >= 8 ) ) {
            pt2.sub(random(5), 0, 0);
          }
          else if ((pt2.x() <= -16.0 || pt2.x() >= 17) && (pt2.y() >= 8 ) ) {
            pt2.add(random(5), 0, 0);
          }
          else {
            if(pt2.y() > 6) {
            pt2.sub(0, random(-15,0), 0);
            }
          }
          //points[i] = pt2;
          //print(points[i]);   
          new IPoint(pt2).clr(0, 1.0, 0);
          new ICylinder(pt1, pt2, 0.5).clr(1.,0,0);
        }
        if ( j < vnum ) {
          IVec pt3 = surf.pt((i+1)*uinc, (j+1)*vinc);
          print(pt3.x() + " ");
          if ((pt3.x() <= -24.0 || pt3.x() >= 25) && (pt3.y() >= 8 )) {
            pt3.sub(random(5), 0, 0);
          }
          else if ((pt3.x() <= -16.0 || pt3.x() >= 17) && (pt3.y() >= 8) ) {
            pt3.add(random(5), 0, 0);
          }
          //new IPoint(pt3).clr(0, 0, 1.0);
          new ICylinder(pt1, pt3, 0.5).clr(0,0,1.);
        }
      }
    }
  }
  surf.del();
}

/*print(IG.surfaceNum());
 print(IG.pointNum());
 print(IG.curveNum());
 print(IG.meshNum());
 print(IG.brepNum());
 */

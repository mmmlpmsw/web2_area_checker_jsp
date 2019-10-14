package ifmo.pip.lab2;

public class Point {
    public double x;
    public double y;
    public double R;
    public boolean isInArea;

    Point (double x, double y, double r){
        this.x = x;
        this.y = y;
        this.R = r;
    }


    public static boolean checkArea(double x, double y, double R){
        if(x >= 0 && y >= 0 && (x*x + y*y) <= R*R/4 ){
            return true;
        }
        if(x <= 0 && y <= 0 && x >= -R && y >= -R/2){
            return true;
        }
        if(x <= 0 && y >= 0 && y <= (x+R)){
            return true;
        }
        return false;
    }

}
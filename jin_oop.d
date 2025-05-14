// Approach: OOP
// Language: D
// Author: jin
//
import std;

immutable interface Shape {
    void draw( File output ) const;
}

immutable struct Coord {
    
    int x;
    int y;
    
    string toString() {
        return "[ x:" ~ this.x.to!string ~ ", y:" ~ this.y.to!string ~ " ]";
    }
    
}

immutable class Point: Shape {
    
    Coord pos;
    
    this( int x, int y ) {
        this.pos = Coord( x, y );
    }
    
    void draw( File output ) const {
        output.writeln( "Drawing Point( pos:", this.pos, " )" );
    }
    
}

immutable class Circle: Shape {
    
    Coord center;
    int radius;
    
    this( int x, int y, int radius ) {
        this.center = Coord( x, y );
        this.radius = radius;
    }
    
    void draw( File output ) const {
        writeln( "Drawing Circle( center:", this.center, ", radius:", this.radius, " )" );
    }
    
}

immutable class Rectangle: Shape {
    
    Coord from;
    Coord to;
    
    this( int fx, int fy, int tx, int ty ) {
        this.from = Coord( fx, fy );
        this.to = Coord( tx, ty );
    }
    
    void draw( File output ) const {
        writeln( "Drawing Rectangle( from:", this.from, ", to:", this.to, " )" );
    }
    
}


immutable class Scene {
    
    Shape[] shapes;
    
    this( immutable(immutable(Shape)[]) shapes ... ) {
        this.shapes = shapes;
    }
    
    void render( File output ) {
        foreach( shape; shapes ) shape.draw( output );
    }
    
}

void main() {
    
    auto scene = new Scene(
    	new Point( 1, 1 ),
    	new Circle( 5, 5, 3 ),
    	new Rectangle( 0, 0, 6, 3 ),
    );
    
    scene.render( stdout );
    
}

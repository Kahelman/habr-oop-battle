// Approach: OOP
// Language: D
// Author: jin

import std;

alias Canvas = File;

void paint( Commands ... )( Canvas canvas, Commands commands ) {
    canvas.writeln( commands );
}

struct Coord {
    
    int x;
    int y;
    
    string toString() const {
        return "[ x:" ~ this.x.to!string ~ ", y:" ~ this.y.to!string ~ " ]";
    }
    
}

abstract class Shape {
    Coord anchor;
    void draw( Canvas canvas ) const;
}

class Point: Shape {
    
    this( int x, int y ) {
        this.anchor = Coord( x, y );
    }
    
    override void draw( Canvas canvas ) const {
        canvas.paint( "	Point( anchor:", this.anchor, " )" );
    }
    
}

class Circle: Shape {
    
    uint radius;
    
    this( int x, int y, int radius ) {
        this.anchor = Coord( x, y );
        this.radius = radius;
    }
    
    override void draw( Canvas canvas ) const {
        canvas.paint( "	Circle( anchor:", this.anchor, ", radius:", this.radius, " )" );
    }
    
}

class Rectangle: Shape {
    
    Coord target;
    
    this( int ax, int ay, int tx, int ty ) {
        this.anchor = Coord( ax, ay );
        this.target = Coord( tx, ty );
    }
    
    override void draw( Canvas canvas ) const {
        canvas.paint( "	Rectangle( anchor:", this.anchor, ", target:", this.target, " )" );
    }
    
}


class Scene: Shape {
    
    Shape[] shapes;
    
    override void draw( Canvas canvas ) const {
        canvas.writeln( "Scene[" );
        foreach( shape; shapes ) shape.draw( canvas );
        canvas.writeln( "]" );
    }
    
}

void main() {
    
    auto scene = new Scene;
    scene.draw( stdout );
    
    scene.shapes ~= new Point( 1, 1 );
    scene.shapes ~= new Circle( 5, 5, 3 ),
    scene.shapes ~= new Rectangle( 0, 0, 6, 3 ),
    scene.draw( stdout );

    scene.shapes[0].anchor = Coord( 2, 2 );
    scene.draw( stdout );
}

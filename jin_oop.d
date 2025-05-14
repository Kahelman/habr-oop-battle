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
    Coord pos;
    void draw( Canvas canvas ) const;
}

class Point: Shape {
    
    this( int x, int y ) {
        this.pos = Coord( x, y );
    }
    
    override void draw( Canvas canvas ) const {
        canvas.paint( "	Point( pos:", this.pos, " )" );
    }
    
}

class Circle: Shape {
    
    int radius;
    
    this( int x, int y, int radius ) {
        this.pos = Coord( x, y );
        this.radius = radius;
    }
    
    override void draw( Canvas canvas ) const {
        canvas.paint( "	Circle( pos:", this.pos, ", radius:", this.radius, " )" );
    }
    
}

class Rectangle: Shape {
    
    Coord dims;
    
    this( int px, int py, int dx, int dy ) {
        this.pos = Coord( px, py );
        this.dims = Coord( dx, dy );
    }
    
    override void draw( Canvas canvas ) const {
        canvas.paint( "	Rectangle( pos:", this.pos, ", dims:", this.dims, " )" );
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

    scene.shapes[0].pos = Coord( 2, 2 );
    scene.draw( stdout );
}

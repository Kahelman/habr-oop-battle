// Approach: OOP
// Language: D
// Author: jin

import std;

struct Coord {
    
    int x;
    int y;
    
    string toString() const {
        return "[ x:" ~ this.x.to!string ~ ", y:" ~ this.y.to!string ~ " ]";
    }
    
}

abstract class Shape {
    Coord pos;
    void draw( File output ) const;
}

class Point: Shape {
    
    this( int x, int y ) {
        this.pos = Coord( x, y );
    }
    
    override void draw( File output ) const {
        output.writeln( "	Point( pos:", this.pos, " )" );
    }
    
}

class Circle: Shape {
    
    int radius;
    
    this( int x, int y, int radius ) {
        this.pos = Coord( x, y );
        this.radius = radius;
    }
    
    override void draw( File output ) const {
        output.writeln( "	Circle( pos:", this.pos, ", radius:", this.radius, " )" );
    }
    
}

class Rectangle: Shape {
    
    Coord dims;
    
    this( int px, int py, int dx, int dy ) {
        this.pos = Coord( px, py );
        this.dims = Coord( dx, dy );
    }
    
    override void draw( File output ) const {
        output.writeln( "	Rectangle( pos:", this.pos, ", dims:", this.dims, " )" );
    }
    
}


class Scene {
    
    Shape[] shapes;
    
    void render( File output ) const {
        output.writeln( "Scene[" );
        foreach( shape; shapes ) shape.draw( output );
        output.writeln( "]" );
    }
    
}

void main() {
    
    auto scene = new Scene;
    scene.render( stdout );
    
    scene.shapes ~= new Point( 1, 1 );
    scene.shapes ~= new Circle( 5, 5, 3 ),
    scene.shapes ~= new Rectangle( 0, 0, 6, 3 ),
    scene.render( stdout );

    scene.shapes[0].pos = Coord( 2, 2 );
    scene.render( stdout );
}

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
    
    this( int x, int y, uint radius ) {
        this.anchor = Coord( x, y );
        this.radius = radius;
    }
    
    override void draw( Canvas canvas ) const {
        canvas.paint( "	Circle( anchor:", this.anchor, ", radius:", this.radius, " )" );
    }
    
}

class Square: Shape {
    
    uint size;
    
    this( int x, int y, uint size ) {
        this.anchor = Coord( x, y );
        this.size = size;
    }
    
    override void draw( Canvas canvas ) const {
        canvas.paint( "	Square( anchor:", this.anchor, ", size:", this.size, " )" );
    }
    
}

class Line: Shape {
    
    Coord target;
    
    this( int ax, int ay, int tx, int ty ) {
        this.anchor = Coord( ax, ay );
        this.target = Coord( tx, ty );
    }
    
    override void draw( Canvas canvas ) const {
        canvas.paint( "	Line( anchor:", this.anchor, ", target:", this.target, " )" );
    }
    
}

class Rect: Shape {
    
    Coord target;
    
    this( int ax, int ay, int tx, int ty ) {
        this.anchor = Coord( ax, ay );
        this.target = Coord( tx, ty );
    }
    
    override void draw( Canvas canvas ) const {
        canvas.paint( "	Rect( anchor:", this.anchor, ", target:", this.target, " )" );
    }
    
}

class Oval: Shape {
    
    Coord target;
    uint radius;
    
    this( int ax, int ay, int tx, int ty, uint radius ) {
        this.anchor = Coord( ax, ay );
        this.target = Coord( tx, ty );
        this.radius = radius;
    }
    
    override void draw( Canvas canvas ) const {
        canvas.paint( "	Oval( anchor:", this.anchor, ", target:", this.target, ", radius:", this.radius, " )" );
    }
    
}

class Rhomb: Shape {
    
    Coord target;
    uint width;
    
    this( int ax, int ay, int tx, int ty, uint width ) {
        this.anchor = Coord( ax, ay );
        this.target = Coord( tx, ty );
        this.width = width;
    }
    
    override void draw( Canvas canvas ) const {
        canvas.paint( "	Rhomb( anchor:", this.anchor, ", target:", this.target, ", width:", this.width, " )" );
    }
    
}

class Trigon: Shape {
    
    Coord second;
    Coord third;
    
    this( int ax, int ay, int sx, int sy, int tx, int ty ) {
        this.anchor = Coord( ax, ay );
        this.second = Coord( sx, sy );
        this.third = Coord( tx, ty );
    }
    
    override void draw( Canvas canvas ) const {
        canvas.paint( "	Trigon( anchor:", this.anchor, ", second:", this.second, ", third:", this.third, " )" );
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
    scene.shapes ~= new Square( 7, 7, 2 ),
    scene.shapes ~= new Line( 1, 2, 3, 4 );
    scene.shapes ~= new Rect( 0, 0, 6, 3 ),
    scene.shapes ~= new Oval( 9, 7, 6, 5, 3 ),
    scene.shapes ~= new Rhomb( 6, 7, 3, 5, 2 ),
    scene.shapes ~= new Trigon( 3, 7, 8, 9, 6, 1 ),
    scene.draw( stdout );

    scene.shapes[0].anchor = Coord( 2, 2 );
    scene.draw( stdout );
}

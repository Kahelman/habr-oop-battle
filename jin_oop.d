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

alias AllFieldtypes( alias Class ) = staticMap!( Fields, BaseClassesTuple!Class, Class );

mixin template Ctors() {
    
    this() {}
    
    this( AllFieldtypes!( typeof(this) ) args ... ) {
        AliasSeq!( super.tupleof, this.tupleof ) = args;
    }
    
}

abstract class Shape {
    mixin Ctors;
    Coord anchor;
    void draw( Canvas canvas ) const;
}

class Point: Shape {
    mixin Ctors;
    
    override void draw( Canvas canvas ) const {
        canvas.paint( "	Point( anchor:", this.anchor, " )" );
    }
    
}

class Circle: Shape {
    mixin Ctors;
    
    uint radius;
    
    override void draw( Canvas canvas ) const {
        canvas.paint( "	Circle( anchor:", this.anchor, ", radius:", this.radius, " )" );
    }
    
}

class Square: Shape {
    mixin Ctors;
    
    uint size;
    
    override void draw( Canvas canvas ) const {
        canvas.paint( "	Square( anchor:", this.anchor, ", size:", this.size, " )" );
    }
    
}

class Line: Shape {
    mixin Ctors;
    
    Coord target;
    
    override void draw( Canvas canvas ) const {
        canvas.paint( "	Line( anchor:", this.anchor, ", target:", this.target, " )" );
    }
    
}

class Rect: Shape {
    mixin Ctors;
    
    Coord target;
    
    override void draw( Canvas canvas ) const {
        canvas.paint( "	Rect( anchor:", this.anchor, ", target:", this.target, " )" );
    }
    
}

class Oval: Shape {
    mixin Ctors;
    
    Coord target;
    uint radius;
    
    override void draw( Canvas canvas ) const {
        canvas.paint( "	Oval( anchor:", this.anchor, ", target:", this.target, ", radius:", this.radius, " )" );
    }
    
}

class Rhomb: Shape {
    mixin Ctors;
    
    Coord target;
    uint width;
    
    override void draw( Canvas canvas ) const {
        canvas.paint( "	Rhomb( anchor:", this.anchor, ", target:", this.target, ", width:", this.width, " )" );
    }
    
}

class Trigon: Shape {
    mixin Ctors;
    
    Coord second;
    Coord third;
    
    override void draw( Canvas canvas ) const {
        canvas.paint( "	Trigon( anchor:", this.anchor, ", second:", this.second, ", third:", this.third, " )" );
    }
    
}

class Scene: Shape {
    mixin Ctors;
    
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
    
    scene.shapes ~= new Point( Coord( 1, 1 ) );
    scene.shapes ~= new Circle( Coord( 5, 5 ), 3 ),
    scene.shapes ~= new Square( Coord( 7, 7 ), 2 ),
    scene.shapes ~= new Line( Coord( 1, 2 ), Coord( 3, 4 ) );
    scene.shapes ~= new Rect( Coord( 0, 0 ), Coord( 6, 3 ) ),
    scene.shapes ~= new Oval( Coord( 9, 7 ), Coord( 6, 5 ), 3 ),
    scene.shapes ~= new Rhomb( Coord( 6, 7 ), Coord( 3, 5 ), 2 ),
    scene.shapes ~= new Trigon( Coord( 3, 7 ), Coord( 8, 9 ), Coord( 6, 1 ) ),
    scene.draw( stdout );

    scene.shapes[0].anchor = Coord( 2, 2 );
    scene.draw( stdout );
}

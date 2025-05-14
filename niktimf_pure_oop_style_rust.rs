// ООП на Rust

trait Shape {
    fn draw(&self);
    fn name(&self) -> &str;
}

struct Point {
    x: i32,
    y: i32,
}

impl Point {
    fn new(x: i32, y: i32) -> Self {
        Point { x, y }
    }
}

impl Shape for Point {
    fn draw(&self) {
        println!("Drawing Point at ({}, {})", self.x, self.y);
    }

    fn name(&self) -> &str {
        "Point"
    }
}

struct Line {
    start: Point,
    end: Point,
}

impl Line {
    fn new(x1: i32, y1: i32, x2: i32, y2: i32) -> Self {
        Line {
            start: Point::new(x1, y1),
            end: Point::new(x2, y2),
        }
    }
}

impl Shape for Line {
    fn draw(&self) {
        println!(
            "Drawing Line from ({}, {}) to ({}, {})",
            self.start.x, self.start.y, self.end.x, self.end.y
        );
    }

    fn name(&self) -> &str {
        "Line"
    }
}

struct Circle {
    center: Point,
    radius: i32,
}

impl Circle {
    fn new(x: i32, y: i32, r: i32) -> Self {
        Circle {
            center: Point::new(x, y),
            radius: r,
        }
    }
}

impl Shape for Circle {
    fn draw(&self) {
        println!(
            "Drawing Circle at ({}, {}), r = {}",
            self.center.x, self.center.y, self.radius
        );
    }

    fn name(&self) -> &str {
        "Circle"
    }
}

struct Rectangle {
    top_left: Point,
    width: i32,
    height: i32,
}

impl Rectangle {
    fn new(x: i32, y: i32, w: i32, h: i32) -> Self {
        Rectangle {
            top_left: Point::new(x, y),
            width: w,
            height: h,
        }
    }
}

impl Shape for Rectangle {
    fn draw(&self) {
        println!(
            "Drawing Rectangle at ({}, {}) with width {} and height {}",
            self.top_left.x, self.top_left.y, self.width, self.height
        );
    }

    fn name(&self) -> &str {
        "Rectangle"
    }
}

struct Square {
    top_left: Point,
    side: i32,
}

impl Square {
    fn new(x: i32, y: i32, side: i32) -> Self {
        Square {
            top_left: Point::new(x, y),
            side,
        }
    }
}

impl Shape for Square {
    fn draw(&self) {
        println!(
            "Drawing Square at ({}, {}) with width {}",
            self.top_left.x, self.top_left.y, self.side
        );
    }

    fn name(&self) -> &str {
        "Square"
    }
}

struct Triangle {
    a: Point,
    b: Point,
    c: Point,
}

impl Triangle {
    fn new(x1: i32, y1: i32, x2: i32, y2: i32, x3: i32, y3: i32) -> Self {
        Triangle {
            a: Point::new(x1, y1),
            b: Point::new(x2, y2),
            c: Point::new(x3, y3),
        }
    }
}

impl Shape for Triangle {
    fn draw(&self) {
        println!(
            "Drawing Triangle with vertices ({}, {}), ({}, {}), ({}, {})",
            self.a.x, self.a.y, self.b.x, self.b.y, self.c.x, self.c.y
        );
    }

    fn name(&self) -> &str {
        "Triangle"
    }
}

struct Diamond {
    center: Point,
    width: i32,
    height: i32,
}

impl Diamond {
    fn new(x: i32, y: i32, w: i32, h: i32) -> Self {
        Diamond {
            center: Point::new(x, y),
            width: w,
            height: h,
        }
    }
}

impl Shape for Diamond {
    fn draw(&self) {
        println!(
            "Drawing Diamond at ({}, {}) with width {} and height {}",
            self.center.x, self.center.y, self.width, self.height
        );
    }

    fn name(&self) -> &str {
        "Diamond"
    }
}

struct Oval {
    center: Point,
    radius_x: i32,
    radius_y: i32,
}

impl Oval {
    fn new(x: i32, y: i32, rx: i32, ry: i32) -> Self {
        Oval {
            center: Point::new(x, y),
            radius_x: rx,
            radius_y: ry,
        }
    }
}

impl Shape for Oval {
    fn draw(&self) {
        println!(
            "Drawing Oval at ({}, {}) with radius_x {} and radius_y {}",
            self.center.x, self.center.y, self.radius_x, self.radius_y
        );
    }

    fn name(&self) -> &str {
        "Oval"
    }
}

struct Canvas {
    shapes: Vec<Box<dyn Shape>>,
}

impl Canvas {
    fn new() -> Self {
        Canvas { shapes: Vec::new() }
    }

    fn add(&mut self, shape: Box<dyn Shape>) {
        self.shapes.push(shape);
    }

    fn render(&self) {
        self.shapes.iter().for_each(|shape| shape.draw());
    }
}

fn main() {
    let mut canvas = Canvas::new();

    canvas.add(Box::new(Point::new(1, 1)));
    canvas.add(Box::new(Line::new(1, 2, 5, 6)));
    canvas.add(Box::new(Circle::new(5, 5, 3)));
    canvas.add(Box::new(Rectangle::new(0, 0, 6, 3)));
    canvas.add(Box::new(Square::new(0, 0, 4)));
    canvas.add(Box::new(Diamond::new(0, 0, 4, 3)));
    canvas.add(Box::new(Oval::new(0, 0, 4, 3)));
    canvas.add(Box::new(Triangle::new(0, 0, 4, 0, 2, 3)));

    canvas.render();
}

// ФП + ООП на Rust

struct Point {
    x: i32,
    y: i32,
}

impl Point {
    fn new(x: i32, y: i32) -> Self {
        Point { x, y }
    }
}

enum Shape {
    Point(Point),
    Line {
        start: Point,
        end: Point,
    },
    Circle {
        center: Point,
        radius: i32,
    },
    Rectangle {
        top_left: Point,
        width: i32,
        height: i32,
    },
    Square {
        top_left: Point,
        width: i32,
    },
    Diamond {
        center: Point,
        width: i32,
        height: i32,
    },
    Oval {
        center: Point,
        radius_x: i32,
        radius_y: i32,
    },
    Triangle {
        a: Point,
        b: Point,
        c: Point,
    },
}

impl Shape {
    fn draw(&self) {
        match &self {
            Shape::Point(p) => println!("Drawing Point at ({}, {})", p.x, p.y),
            Shape::Line { start, end } => println!(
                "Drawing Line from ({}, {}) to ({}, {})",
                start.x, start.y, end.x, end.y
            ),
            Shape::Circle { center, radius } => println!(
                "Drawing Circle at ({}, {}) with radius {}",
                center.x, center.y, radius
            ),
            Shape::Rectangle {
                top_left,
                width,
                height,
            } => println!(
                "Drawing Rectangle at ({}, {}) with width {} and height {}",
                top_left.x, top_left.y, width, height
            ),
            Shape::Square { top_left, width } => println!(
                "Drawing Square at ({}, {}) with width {}",
                top_left.x, top_left.y, width
            ),
            Shape::Diamond {
                center,
                width,
                height,
            } => println!(
                "Drawing Diamond at ({}, {}) with width {} and height {}",
                center.x, center.y, width, height
            ),
            Shape::Oval {
                center,
                radius_x,
                radius_y,
            } => println!(
                "Drawing Oval at ({}, {}) with radius_x {} and radius_y {}",
                center.x, center.y, radius_x, radius_y
            ),
            Shape::Triangle { a, b, c } => println!(
                "Drawing Triangle with vertices ({}, {}), ({}, {}), ({}, {})",
                a.x, a.y, b.x, b.y, c.x, c.y
            ),
        }
    }

    fn name(&self) -> &str {
        match &self {
            Shape::Point(_) => "Point",
            Shape::Line { .. } => "Line",
            Shape::Circle { .. } => "Circle",
            Shape::Rectangle { .. } => "Rectangle",
            Shape::Square { .. } => "Square",
            Shape::Diamond { .. } => "Diamond",
            Shape::Oval { .. } => "Oval",
            Shape::Triangle { .. } => "Triangle",
        }
    }
}

struct Canvas {
    shapes: Vec<Shape>,
}

impl Canvas {
    fn new() -> Self {
        Canvas { shapes: Vec::new() }
    }

    fn add_shape(&mut self, shape: Shape) {
        self.shapes.push(shape);
    }

    fn draw(&self) {
        self.shapes.iter().for_each(|shape| shape.draw());
    }
}

fn main() {
    let mut canvas = Canvas::new();
    canvas.add_shape(Shape::Point(Point::new(10, 20)));
    canvas.add_shape(Shape::Line {
        start: Point::new(30, 40),
        end: Point::new(50, 60),
    });
    canvas.add_shape(Shape::Circle {
        center: Point::new(70, 80),
        radius: 100,
    });
    canvas.add_shape(Shape::Rectangle {
        top_left: Point::new(90, 100),
        width: 120,
        height: 130,
    });
    canvas.add_shape(Shape::Square {
        top_left: Point::new(140, 150),
        width: 160,
    });
    canvas.add_shape(Shape::Diamond {
        center: Point::new(170, 180),
        width: 190,
        height: 200,
    });
    canvas.add_shape(Shape::Oval {
        center: Point::new(210, 220),
        radius_x: 230,
        radius_y: 240,
    });
    canvas.add_shape(Shape::Triangle {
        a: Point::new(250, 260),
        b: Point::new(270, 280),
        c: Point::new(290, 300),
    });
    canvas.draw();
}

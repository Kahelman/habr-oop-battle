// ФП подход на Rust

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

fn draw_shape(shape: &Shape) {
    match shape {
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

fn get_shape_name(shape: &Shape) -> &str {
    match shape {
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

type Canvas = Vec<Shape>;

fn add_shape(canvas: Canvas, shape: Shape) -> Canvas {
    let mut new_canvas = canvas;
    new_canvas.push(shape);
    new_canvas
}

fn render_canvas(canvas: &Canvas) {
    canvas.iter().for_each(draw_shape);
}

fn main() {
    let canvas = Canvas::new();
    // Используем затирание переменных
    let canvas = add_shape(canvas, Shape::Point(Point::new(10, 20)));
    let canvas = add_shape(
        canvas,
        Shape::Line {
            start: Point::new(30, 40),
            end: Point::new(50, 60),
        },
    );
    let canvas = add_shape(
        canvas,
        Shape::Circle {
            center: Point::new(70, 80),
            radius: 30,
        },
    );
    let canvas = add_shape(
        canvas,
        Shape::Rectangle {
            top_left: Point::new(100, 110),
            width: 40,
            height: 50,
        },
    );

    render_canvas(&canvas);
}

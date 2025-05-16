// Approach: OOP
// Language: C#
// Author: DmitryOlshak

var canvas = new Canvas();

canvas.Add(new Point(new Position(10, 20)));
canvas.Add(new Line(start: new Position(20, 20), end: new Position(30, 30)));
canvas.Add(new Circle(new Position(5, 5), radius: 10));
canvas.Add(new Rectangle(new Position(3, 3), width: 10, height: 10));
canvas.Add(new Square(new Position(3, 3), sideLength: 10));
canvas.Add(new Triangle(new Position(3, 3), new Position(6, 6), new Position(0, 6)));
canvas.Add(new Oval(new Position(30, 30), width: 10, height: 10));
canvas.Add(new Rhombus(new Position(40, 30), width: 10, height: 10));

canvas.Render();

Console.ReadKey();

public readonly struct Position(double x, double y)
{
    public override string ToString() => $"({x}:{y})";
}

public class Canvas
{
    private readonly List<Shape> _shapes = new();

    public void Add(Shape shape) => _shapes.Add(shape);

    public void Render() => _shapes.ForEach(x => x.Render());
}

public abstract class Shape
{
    public abstract void Render();
}

public class Point(Position position) : Shape
{
    public override void Render() => Console.WriteLine($"Render a point at {position}.");
}

public class Line(Position start, Position end) : Shape
{
    public override void Render() => Console.WriteLine($"Render a line from {start} to {end}.");
}

public class Circle(Position position, double radius) : Shape
{
    public override void Render() => Console.WriteLine($"Render a circle at {position} with {radius} radius.");
}

public class Rectangle(Position position, double width, double height) : Shape
{
    public override void Render() => Console.WriteLine($"Render a rectangle at {position} with {width} width and {height} height.");
}

public class Square(Position position, double sideLength) : Shape
{
    public override void Render() => Console.WriteLine($"Render a square at {position} with {sideLength} side length.");
}

public class Triangle(Position position1, Position position2, Position position3) : Shape
{
    public override void Render() => Console.WriteLine($"Render a triangle at {position1}, {position2}, {position3}.");
}

public class Oval(Position position, double width, double height) : Shape
{
    public override void Render() => Console.WriteLine($"Render an oval at {position} with {width} width and {height} height.");
}

public class Rhombus(Position position, double width, double height) : Shape
{
    public override void Render() => Console.WriteLine($"Render an rhombus at {position} with {width} width and {height} height.");
}
import turtle
class Polygon:
    def __init__(self,sides,name):
        self.sides = sides
        self.name = name
    
    def draw(self):
        for i in range(self.sides):
            turtle.forward(100)
            turtle.right(90)
        turtle.done()

class Square(Polygon):
    def __init__(self, sides, name):
        super().__init__(sides, name)
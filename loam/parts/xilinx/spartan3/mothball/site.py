__all__ = ['make_site']


def make_site(rep):
    if isinstance(rep, Site):
        return rep
    elif rep is None or isinstance(rep, tuple):
        return GridSite(rep)
    else:
        return Site(rep)


class Site:

    def __init__(self, location, placed=True):
        self.location = location
        self.placed = placed
        self.inst = None

    def __str__(self):
        return str(self.location)


class GridSite(Site):

    def __init__(self, coordinate, placed=True, grid=None):
        if grid is None:
            grid = {}

        if coordinate is None:
            coordinate = (0, 0)
            placed = False
        Site.__init__(self, coordinate, placed)

        if not self.placed:
            self.grid = grid
            self.grid[self.location] = self

    def __str__(self):
        return '_X%dY%d' % (self.x(), self.y())

    def x(self):
        return self.location[0]

    def y(self):
        return self.location[1]

    def delta(self, dx, dy):
        new_coordinate = (self.x() + dx, self.y() + dy)
        if not self.placed:
            try:
                return self.grid[new_coordinate]
            except KeyError:
                return GridSite(new_coordinate, self.placed, self.grid)
        else:
            return GridSite(new_coordinate)

    def north(self, dy=1):
        return self.delta(0, dy)

    def south(self, dy=1):
        return self.delta(0, -dy)

    def east(self, dx=1):
        return self.delta(dx, 0)

    def west(self, dx=1):
        return self.delta(-dx, 0)

const std = @import("std");
const image = std.image;

pub fn main() void {
    var input_file = std.io.getStdIn().reader();
    var output_file = std.io.getStdOut().writer();

    // Load the image from stdin
    var img = try image.load(image.Png, &input_file);

    // Apply a salt-print filter (this is a very simplified version)
    for (0..img.width()) |x| {
        for (0..img.height()) |y| {
            var pixel = img.getPixel(x, y);
            if ((x + y) % 2 == 0) { // This is not a real salt-print effect, it's just a simple checkerboard pattern
                pixel.r = 0;
                pixel.g = 0;
                pixel.b = 0;
            } else {
                pixel.r = 255;
                pixel.g = 255;
                pixel.b = 255;
            }
            img.setPixel(x, y, pixel);
        }
    }

    // Write the image to stdout
    try img.writePng(&output_file);
}

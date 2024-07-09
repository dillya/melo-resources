"""Inkscape rules for export."""

def export_svg(name, src, obj, out, **kwargs):
    native.genrule(
        name = name,
        srcs = [src],
        outs = [out],
        cmd = "inkscape -i " + obj + " -j -T $(location " + src + ") -o $@",
        **kwargs
    )

def export_png(name, src, out, **kwargs):
    native.genrule(
        name = name,
        srcs = [src],
        outs = [out],
        cmd = "inkscape $(location " + src + ") -o $@",
        **kwargs
    )

def replace_text(name, src, old_text, new_text, out, **kwargs):
    native.genrule(
        name = name,
        srcs = [src],
        outs = [out],
        cmd = "sed s%{}%{}% $(location {}) > $@".format(old_text, new_text, src),
        **kwargs
    )

def replace_color(name, src, old_color, new_color, out, **kwargs):
    native.genrule(
        name = name,
        srcs = [src],
        outs = [out],
        cmd = "sed s/#{}/#{}/ $(location {}) > $@".format(old_color, new_color, src),
        **kwargs
    )

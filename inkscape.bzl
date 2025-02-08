"""Inkscape rules for export."""

def export_svg(name, src, obj, out, margin = None, **kwargs):
    extra_args = ""
    if margin != None:
        extra_args += " --export-margin=" + str(margin)

    native.genrule(
        name = name,
        srcs = [src],
        outs = [out],
        cmd = "inkscape --vacuum-defs -i " + obj + " -j -l -T " + extra_args + " $(location " + src + ") -o $@",
        **kwargs
    )

def export_png(name, src, out, background = None, **kwargs):
    extra_args = ""
    if background != None:
        extra_args += " --export-background=" + background

    native.genrule(
        name = name,
        srcs = [src],
        outs = [out],
        cmd = "inkscape " + extra_args + " $(location " + src + ") -o $@",
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

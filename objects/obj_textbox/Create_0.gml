mediator = instance_find(object_ref,0)

text = ""
focus = false


sobre = function(r) {
    return point_in_rectangle(mouse_x, mouse_y, r[0], r[1], r[2], r[3]);
};
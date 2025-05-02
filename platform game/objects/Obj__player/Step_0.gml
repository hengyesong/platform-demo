//inputs
//determine left or right movement
move_x = keyboard_check(vk_right) - keyboard_check(vk_left);
move_x *= move_speed;

// check if jumping
var jump_pressed = keyboard_check_pressed(vk_space); //var makes the variable local to this event


//check for collsions
//check if standing on ground
is_grounded = place_meeting(x, y+2, Obj_ground);
sprite_index = Spr_run_right;
//check if touching a ladder
is_climbing = place_meeting(x, y, Obj_ladder);

//set sprite

if (is_climbing) {
	sprite_index = spr_climb;
	image_speed = 1;
}
else if (is_grounded) {
	if (move_x > 0) {
		sprite_index = Spr_run_right;
		image_speed =1 ;
	}
	else if (move_x < 0) {
		sprite_index = Spr_run_left;
		image_speed = 1;
	}
	else {
		sprite_index = Spr_idle;
		image_speed = 1;
	}
}	
// in the air
else {
	image_speed = 0;
}
//movement
//Climbing
if (is_climbing) {
	move_y = keyboard_check(vk_down) - keyboard_check(vk_up);
	move_y *= climb_speed;
	
	

}

else{
//Jumping 
	if (is_grounded && jump_pressed) {
		move_y = jump_speed;
	}
	else if (move_y < max_fall_speed) {
		move_y +=gravity_force;
	}
}

// actually move the player object
move_and_collide(move_x, move_y, Obj_ground);



if (y < -20 || y > room_height +200 || x < -20 || x > room_width+20)  {
	room_restart();
}










/// @description 


var up, left, right, down, vel_h, vel_v, desli;

up			= keyboard_check(vk_up);
down		= keyboard_check(vk_down);
left			= keyboard_check(vk_left);
right		= keyboard_check(vk_right);

if(place_meeting(x, y, obj_gelo)){
	desli = des_g;
}else {
	desli = des_n;	
}

vel_h = (right - left) * vel; 
vel_v = (down - up) * vel; 

velv = lerp(velv, vel_v, desli);
velh = lerp(velh, vel_h, desli);

//Checando colisão horizontal
if(place_meeting(x + velh, y, obj_block)){
	//Se estou colidindo
	while(!place_meeting(x + sign(velh), y, obj_block)){
		x += sign(velh);
	}
	//Terminei o laço de repetição e estou na parede horizontal
	velh = 0;
}

//Checando colisão vertical
if(place_meeting(x, y + velv, obj_block)){
	//Se estou tocando
	while(!place_meeting(x, y + sign(velv), obj_block)){
		y += sign(velv);	
	}
	//Terminei o laço de repetição e estou na parede vertical
	velv = 0;
}

x += velh;
y += velv;
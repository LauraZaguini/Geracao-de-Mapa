/// @description 

image_blend = c_black;

//Criando a room
//Definindo a altura e a largura da room
var size = sprite_width;
w = irandom_range(40, 100) * size;
h = w / 1.3333333;

room_width = w;
room_height = h;

//Divindo a room em colunas e linhas
var nc = w div size;
var nl  = h div size;

x = irandom_range(nc div 4, nc div 2) * size;
y = irandom_range(nl div 4, nl div 2) * size;

//Preenchendo a room com blocos
for(var i = 0; i < nc; i++){//Coluna
		for(var j = 0; j < nl; j++){//Linhas
				instance_create_layer(i * size, j * size, "Instances", obj_block);
		}
}

var passo = irandom_range(300, 1000);
var dir = 0;
var limite = irandom_range(30, 90);
var player_x = 0;
var player_y = 0;
var cont = 0;

repeat(passo){
	//Aumentando a chance dele repetir a direção
	var chance = irandom(100);
	if(chance > limite){
		//Movendo o objeto criador
		var dir = irandom(3) * 90;		
	}
	//Movendo o objeto criador
	x += lengthdir_x(size, dir);
	y += lengthdir_y(size, dir);
	
	//Destruindo o bloco que eu entro em contato
	var block = instance_place(x, y, obj_block);
	if(block) {
		instance_destroy(block);	
	}
	
	//Decidindo onde criar o player
	cont++;
	if(cont == 180){
		player_x = x;
		player_y = y;
	}
	
	
	//Limitando a posição do criador
	x = clamp(x, 5 * size, (nc - 5) * size) ;
	y = clamp(y, 5 * size, (nl - 5) * size);
}

//Criando o player
instance_create_layer(player_x, player_y, "Instances", obj_player);

//Criando a camera
instance_create_layer(player_x, player_y, "Instances", obj_camera);

tudo = true;
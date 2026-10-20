function user(_username) constructor{
	username =_username	
	
}

function resource(_index,_id) constructor{
	index = _index
	id = _id
}

function search(_id){
	for(i=0;i<array_length(global.resources);i++){
		if _id == global.resources[i].index {
			instance_destroy(global.resources[i].id)
			array_delete(global.resources,i,1)
			return	
		}
	}
}

global.user = new user("Eze");
global.actual_room = 0
global.client = undefined;

global.resources = []
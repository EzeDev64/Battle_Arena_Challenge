var data 
if (action == "Log In"){
	data = {
		username : "",
		password : ""
	}
}

mediator.notify(id,"focus")
mediator.notify(id,action)
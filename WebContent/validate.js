  function validateForm(){

  	var agent_id = document.getElementByID("agent_id");
  	var valid=true;
  		if(agent_id.value == "" || agent_id.value == "Choose agent here ...")
 			{
 				agent_id.className="wrong-input";
 				document.getElementByID("agentNameValidation").innerHTML = "Enter Agent Name";
 				valid=false;
 			}
 			return valid;
  }
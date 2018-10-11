function removeDisableButton() {
  var inputs = document.querySelectorAll(".btn");
  for(var i = 0; i < inputs.length; i++) {
      inputs[i].disabled = false;
  };
}

export { removeDisableButton };
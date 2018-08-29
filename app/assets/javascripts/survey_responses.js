// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

let back = document.getElementById('back-button');

let id = [];

back.addEventListener('click', (e) => {
	if (id.length > 0) {
		let form = document.getElementById(id.pop());
		let wrapper = form.parentElement;
		console.log('hello')
		wrapper.classList.remove('fadeOutRight');
		wrapper.classList.add('fadeInRight');
		wrapper.classList.remove('invisible');
	};
});


let forms = document.querySelectorAll('.new_answer');

forms.forEach(function(form) {
	form.addEventListener('submit', function () {
	id.push(this.id);
	console.log(id);	

	});
});







progress = document.getElementById('survey-progress');
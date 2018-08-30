// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

let back = document.getElementById('back-button');
let skip = document.getElementById('skip-button');

if (back) {
	let backId = [];

	back.addEventListener('click', (e) => {
		if (backId.length > 0) {
			let form = document.getElementById(backId.pop());
			let wrapper = form.parentElement;
			wrapper.classList.remove('fadeOutRight');
			wrapper.classList.add('fadeInRight');
			wrapper.classList.remove('invisible');
		};
	});

	let forms = document.querySelectorAll('.new_answer');

	forms.forEach(function(form) {
		form.addEventListener('submit', function () {
		backId.push(this.id);
		console.log(backId);	

		});
	});

	progress = document.getElementById('survey-progress');
};

if (skip) {

};


document.querySelectorAll('.survey-answer-label').forEach(function(label) {
  label.addEventListener('click', (e) => {

		console.log(e.currentTarget);
	});
});
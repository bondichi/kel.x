
const cards = document.querySelectorAll(".card-index");


const price = document.querySelectorAll(".card-description" p);


cards.addEventListener('mouseover', (e) => {

  price.style

});



document.querySelectorAll(".card-index").forEach((img) => {
  img.addEventListener("click", (event) => {
    event.currentTarget.classList.toggle("img-circle");
  });
});

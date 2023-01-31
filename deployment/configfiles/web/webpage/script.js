// Some simple JS 

const myButton = document.getElementById('knop');
let count = 0;
myButton.addEventListener('click', function() {
count++;
document.querySelectorAll('p')[1].innerHTML = `Your count = ${count};`
    if (count >= 20) {
    document.getElementById('hidden').style.display = 'block';

    if (count >= 50) {
        document.getElementById('hidden2').style.display = 'block'
    }
}
});

const sliderInit = () => {
  const slider = document.getElementById("myRange");
  const output = document.getElementById("value");
  output.innerHTML = slider.value;
  slider.oninput = function(){
    output.innerHTML = Math.floor(this.value / 20);
  };

  slider.addEventListener("change", function(){
    const x = slider.value;
    const color = 'linear-gradient(90deg, rgb(242, 232, 216)' + x + '%, rgb(250, 250, 250)' + x + '%)';
    slider.style.background = color;
  });
}
export { sliderInit };

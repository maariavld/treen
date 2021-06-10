const sliderInit = () => {
  const sliderGood = document.getElementById("myRangeGood");
  const outputGood = document.getElementById("valueGood");
  outputGood.innerHTML = sliderGood.value;
  sliderGood.oninput = function(){
    outputGood.innerHTML = Math.floor(this.value / 20);
  };

  sliderGood.addEventListener("change", function(){
    const x = sliderGood.value;
    const color = 'linear-gradient(90deg, rgb(242, 232, 216)' + x + '%, rgb(250, 250, 250)' + x + '%)';
    sliderGood.style.background = color;
  });

  const sliderFair = document.getElementById("myRangeFair");
  const outputFair = document.getElementById("valueFair");
  outputFair.innerHTML = sliderFair.value;
  sliderFair.oninput = function(){
    outputFair.innerHTML = Math.floor(this.value / 20);
  };

  sliderFair.addEventListener("change", function(){
    const x = sliderFair.value;
    const color = 'linear-gradient(90deg, rgb(242, 232, 216)' + x + '%, rgb(250, 250, 250)' + x + '%)';
    sliderFair.style.background = color;
  });

  const sliderOrganic = document.getElementById("myRangeOrganic");
  const outputOrganic = document.getElementById("valueOrganic");
  outputOrganic.innerHTML = sliderOrganic.value;
  sliderOrganic.oninput = function(){
    outputOrganic.innerHTML = Math.floor(this.value / 20);
  };

  sliderOrganic.addEventListener("change", function(){
    const x = sliderOrganic.value;
    const color = 'linear-gradient(90deg, rgb(242, 232, 216)' + x + '%, rgb(250, 250, 250)' + x + '%)';
    sliderOrganic.style.background = color;
  });

  const sliderCO2 = document.getElementById("myRangeCO2");
  const outputCO2 = document.getElementById("valueCO2");
  outputCO2.innerHTML = sliderCO2.value;
  sliderCO2.oninput = function(){
    outputCO2.innerHTML = Math.floor(this.value / 20);
  };

  sliderCO2.addEventListener("change", function(){
    const x = sliderCO2.value;
    const color = 'linear-gradient(90deg, rgb(242, 232, 216)' + x + '%, rgb(250, 250, 250)' + x + '%)';
    sliderCO2.style.background = color;
  });
}
export { sliderInit };

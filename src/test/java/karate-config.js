function fn() {   
  var env = karate.env; 
  karate.log('Test Environment Selected :', env);
  if (!env) {
    env = 'qa'; 
  }
  var config = { 
		  
    appKey: 'NotAdded',
    appHost: 'spoonacular-recipe-food-nutrition-v1.p.rapidapi.com',
    BMIbaseURL: 'https://body-mass-index-bmi-calculator.p.rapidapi.com/',
    StoreBaseURL: 'https://petstore.swagger.io/v2/user'
 
  };
 
  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);
  return config;
}



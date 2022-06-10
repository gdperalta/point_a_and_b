import LocationOptions from './components/locationOptions';
import ComputeRates from './components/computeRates';

document.addEventListener('turbolinks:load', () => {
	new ComputeRates();
	new LocationOptions();
});

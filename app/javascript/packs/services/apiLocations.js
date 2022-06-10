class ApiLocations {
	async fetchCountries() {
		const response = await fetch('http://localhost:3000/countries');

		return await response.json();
	}

	async fetchProvinces(country_id) {
		const response = await fetch(
			`http://localhost:3000/countries/${country_id}/provinces`
		);

		return await response.json();
	}

	async fetchCities(province_id) {
		const response = await fetch(
			`http://localhost:3000/provinces/${province_id}/cities`
		);

		return await response.json();
	}
}

export default ApiLocations;

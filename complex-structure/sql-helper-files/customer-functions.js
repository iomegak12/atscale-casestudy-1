function getCustomerRegion(city) {
    let region = '';

    const southernCities = ["Bangalore", "Chennai", "Mysore", "Trivandrum", "Hyderabad"];
    const northernCities = ["Mumbai", "New Delhi"];
    const westernCities = ["Kolkata", "Ranchi"];

    if (southernCities.includes(city)) {
        region = "Southern Region";
    }
    else if (northernCities.includes(city)) {
        region = "Northern Region";
    } else if (westernCities.includes(city)) {
        region = "Western Region";
    } else {
        region = "Eastern Region";
    }
    
    return region;
}

function getCustomerStatus(status) {
    let statusValue = "INACTIVE";

    if (status) {
        statusValue = "ACTIVE";
    }

    return statusValue;
}

function getCustomerType(creditLimit) {
    let customerType = "";

    if (creditLimit < 10000) {
        customerType = "SILVER";
    } else if (creditLimit >= 10000 && creditLimit < 12000) {
        customerType = "GOLD";
    } else if (creditLimit >= 12000 && creditLimit < 14000) {
        customerType = "PLATINUM";
    } else {
        customerType = "PREMIUM";
    }

    return customerType;
}

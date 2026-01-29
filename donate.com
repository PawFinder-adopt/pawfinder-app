<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>PawFinder – Donate | PawFinder-adopt/donate.com</title>
  <!-- Add a meta description mentioning the search phrase for easier discoverability -->
  <meta name="description" content="Support PawFinder in rescuing stray animals. Find us online by searching PawFinder-adopt/donate.com.">
  <style>
    /* Global styles reused from the main site */
    body {
      font-family: Arial, Helvetica, sans-serif;
      margin: 0;
      background-color: #ffffff;
      color: #000;
      line-height: 1.6;
    }
    h1, h2, h3 {
      color: #000;
    }
    a {
      color: #d6336c;
      text-decoration: none;
    }
    a:hover {
      text-decoration: underline;
      color: #a1123a;
    }
    /* Header */
    header {
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 1rem 2rem;
      background-color: #f9dde4;
      color: #000;
      border-bottom: 4px solid #f7cad0;
    }
    header h1 {
      margin: 0;
      font-size: 1.8rem;
    }
    nav ul {
      list-style: none;
      margin: 0;
      padding: 0;
      display: flex;
    }
    nav ul li {
      margin-left: 1rem;
    }
    nav ul li a {
      color: #000;
      font-weight: bold;
    }
    /* Hero section */
    .hero {
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      background-color: #fdeff4;
      padding: 2rem;
      border-bottom: 4px solid #f7cad0;
      text-align: center;
    }
    .hero h2 {
      margin-top: 0;
      font-size: 2rem;
      color: #000;
    }
    .cta-button {
      display: inline-block;
      margin-top: 1rem;
      padding: 0.8rem 1.5rem;
      background-color: #fda4af;
      color: #000;
      border-radius: 20px;
      font-weight: bold;
      border: 2px solid #f279a6;
    }
    .cta-button:hover {
      background-color: #f77ba2;
      color: #000;
    }
    /* Form container */
    .form-container {
      background-color: #ffe8f1;
      padding: 1.5rem;
      border-radius: 16px;
      box-shadow: 0 2px 6px rgba(0,0,0,0.05);
      margin: 2rem auto;
      max-width: 600px;
      border: 1px solid #f7cad0;
    }
    .form-container label {
      display: block;
      margin-bottom: 0.5rem;
      font-weight: bold;
    }
    .form-container input {
      width: 100%;
      padding: 0.5rem;
      border: 1px solid #dbaec7;
      border-radius: 8px;
      margin-bottom: 1rem;
      box-sizing: border-box;
      background-color: #fff;
      color: #000;
    }
    .form-container select {
      width: 100%;
      padding: 0.5rem;
      border: 1px solid #dbaec7;
      border-radius: 8px;
      margin-bottom: 1rem;
      background-color: #fff;
      color: #000;
    }
    .form-container button {
      background-color: #fda4af;
      color: #000;
      padding: 0.7rem 1.5rem;
      border: none;
      border-radius: 12px;
      cursor: pointer;
      border: 2px solid #f279a6;
    }
    .form-container button:hover {
      background-color: #f77ba2;
      color: #000;
    }
    /* Footer */
    footer {
      background-color: #f9dde4;
      color: #000;
      padding: 1rem 2rem;
      text-align: center;
      border-top: 4px solid #f7cad0;
    }
  </style>
</head>
<body>
  <header>
    <h1>PawFinder</h1>
    <nav>
      <ul>
        <li><a href="index.html">Home</a></li>
      </ul>
    </nav>
  </header>
  <div class="hero">
    <h2>Support Stray Animals</h2>
    <p>Your generosity helps provide food, medical care and shelter to stray dogs and cats.</p>
    <a class="cta-button" href="index.html">Return Home</a>
    <!-- Provide instructions on how to find the app via search -->
    <p style="margin-top:1rem;font-size:0.9rem;color:#333;">
      Looking for our main site? Just search for <strong>PawFinder-adopt/donate.com</strong> in your search engine.
    </p>
  </div>
  <section>
    <div class="form-container">
      <h3>Donate to Help</h3>
      <p>Your donation helps provide food, medical care, and safe shelter for stray animals. Thank you for your generosity!</p>
      <form id="donate-form">
        <label for="amount">Donation Amount (USD)</label>
        <input type="number" id="amount" name="amount" min="1" step="1" placeholder="Enter amount" required>
        <label for="shelter">Choose a Shelter</label>
        <select id="shelter" name="shelter" required>
          <option value="">Select Shelter</option>
          <!-- Original Austin shelters -->
          <option value="Austin Pets Alive">Austin Pets Alive</option>
          <option value="Austin Animal Services">Austin Animal Services</option>
          <option value="Austin Humane Society">Austin Humane Society</option>
          <!-- Additional shelters for donations -->
          <option value="SA Humane">SA Humane (San Antonio Humane Society)</option>
          <option value="PAWS Shelter of Central Texas">PAWS Shelter of Central Texas</option>
          <option value="Griffith Small Animal Hospital">Griffith Small Animal Hospital</option>
          <option value="Purrfect Match Cat Rescue">Purrfect Match Cat Rescue</option>
          <option value="Williamson County">Williamson County Animal Shelter</option>
        </select>
        <button type="submit">Donate</button>
      </form>
    </div>
  </section>
  <footer>
    <p>&copy; 2026 PawFinder. All rights reserved.</p>
  </footer>
  <!-- Donation form script -->
  <script>
    // Donation form submission handler
    const donateForm = document.getElementById('donate-form');
    if (donateForm) {
      donateForm.addEventListener('submit', function (event) {
        event.preventDefault();
        const amount = document.getElementById('amount').value || '';
        const shelter = document.getElementById('shelter').value || '';
        // Map each shelter to a donation page (opens in new tab)
        const donationLinks = {
          // Original Austin organizations
          'Austin Pets Alive': 'https://www.austinpetsalive.org/donate',
          // Redirect donors to the Austin Animal Center’s website rather than the city
          // domain, which sometimes returns errors. From this site donors can
          // easily navigate to give support.
          // Send donors to the City of Austin Animal Center page. This page provides
          // information on how to support the shelter and is more reliable than the
          // austinanimalcenter.org domain in some browsers.
          'Austin Animal Services': 'https://www.austintexas.gov/austin-animal-center',
          'Austin Humane Society': 'https://austinhumanesociety.org/donate',
          // New shelters added by user request
          'SA Humane': 'https://sahumane.org/donate',
          'PAWS Shelter of Central Texas': 'https://pawsshelter.org/donate',
          'Griffith Small Animal Hospital': 'https://griffithanimalhospital.com',
          'Purrfect Match Cat Rescue': 'https://purrfectmatchcatrescue.org/get-involved',
          // Update link for Williamson County Animal Shelter per user request
          'Williamson County': 'https://www.wilcotx.gov/163/Animal-Shelter'
        };
        if (donationLinks[shelter]) {
          // Open the selected shelter's donation page in a new tab
          window.open(donationLinks[shelter], '_blank');
        } else {
          alert('Please select a shelter to donate to.');
        }
      });
    }
  </script>
</body>
</html>
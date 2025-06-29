<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Plastic Waste Tracker - Learn About Waste</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gradient-to-br from-green-100 to-blue-100 min-h-screen p-6">
  <header class="text-center mb-12">
    <h1 class="text-4xl font-bold text-green-700">Learn About Plastic Waste</h1>
    <p class="text-lg text-gray-600">Understanding the Problem & Taking Action</p>
  </header>
  
  <main class="max-w-6xl mx-auto">
    <!-- Introduction to Plastic Waste Issue -->
    <section class="bg-white p-6 rounded-2xl shadow-xl mb-8">
      <h2 class="text-2xl font-semibold text-green-800">Why Plastic Waste Is Dangerous?</h2>
      <p class="text-gray-600 mt-4">
        Plastic waste is a major threat to the environment. Millions of tons of plastic waste end up in oceans, rivers, and landfills, harming wildlife and ecosystems.
        The toxic chemicals in plastic leach into the soil and water, contaminating natural resources. Moreover, plastic takes hundreds of years to break down, leaving a long-lasting environmental footprint.
      </p>
      <p class="text-gray-600 mt-4 font-semibold">The impacts of plastic waste include:</p>
      <ul class="list-disc list-inside text-gray-600">
        <li>Harm to marine life, with animals ingesting plastic debris.</li>
        <li>Soil contamination and ecosystem disruption.</li>
        <li>Threat to human health through chemicals in plastic waste.</li>
      </ul>
      <p class="text-green-600 font-semibold mt-4">We can help by reducing plastic consumption, recycling, and reporting plastic waste!</p>
    </section>

    <!-- Call to Action to Report Plastic Waste -->
    <section class="bg-white p-6 rounded-2xl shadow-xl mb-8 text-center">
      <h2 class="text-2xl font-semibold text-green-800">What Can You Do?</h2>
      <p class="text-gray-600 mt-4">
        You have the power to make a difference! Every small action counts. Report plastic waste in your area, reduce single-use plastic, and help raise awareness.
      </p>
      <a href="Report.jsp" class="inline-block bg-green-600 text-white px-6 py-3 mt-6 rounded-xl hover:bg-green-700 transition">Report Plastic Waste Now</a>
    </section>
  </main>
  
  <footer class="mt-12 text-center text-sm text-gray-500">
    &copy; 2025 Plastic Waste Tracker. All rights reserved.
  </footer>
</body>
</html>

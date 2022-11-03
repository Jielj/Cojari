import { Controller } from "@hotwired/stimulus"
import { Chart, registerables } from "chart.js"

// Connects to data-controller="charts-js"
export default class extends Controller {
  connect() {
    console.log("charts js connected");

    Chart.register(...registerables);

    const ctxBar = document.getElementById('barChart').getContext('2d');
    const ctxPie = document.getElementById('pieChart').getContext('2d');

    new Chart(ctxBar, {
        type: 'bar',
        data: {
            labels: ['Jan', 'Fev', 'Mar', 'Avr', 'Mai', 'Juin', 'Juil', 'Aout', 'Sept'],
            datasets: [{
                label: '# of Votes',
                data: [-12, 19, 3, 5, 2, 3, -23, -10, 15],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });

    new Chart(ctxPie, {
      type: 'doughnut',
      data: {
        labels: [
          'Red',
          'Blue',
          'Yellow'
        ],
        datasets: [{
          label: 'My First Dataset',
          data: [300, 50, 100],
          backgroundColor: [
            'rgb(255, 99, 132)',
            'rgb(54, 162, 235)',
            'rgb(255, 205, 86)'
          ],
          hoverOffset: 4
        }]
      },
      options: {
          scales: {
              y: {
                  beginAtZero: true
              }
          }
      }
  });
  }


}

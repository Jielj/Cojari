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
            labels: ['Jan', 'Fev', 'Mar', 'Avr', 'Mai', 'Juin', 'Juil', 'Aout', 'Sept','Oct', 'Nov', 'Dec'],
            datasets: [{
                data: [857, 545, 399, 380, 360, 230, 200, 142, 43, -20, -45, -66],
                 backgroundColor: [
            '#5AECB9',
            '#5AECB9',
            '#5AECB9',
            '#5AECB9',
            '#5AECB9',
            '#5AECB9',
            '#5AECB9',
            '#5AECB9',
            '#5AECB9',
            '#FF1717',
            '#FF1717',
            '#FF1717'
          ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            },
            plugins: {
                legend: {
                    display: false
                }
            }
        }
    });

    new Chart(ctxPie, {
      type: 'doughnut',
      data: {
        labels: [
          'Nettoyage',
          'Jardinage',
          'Sécurité',
          'Maintenance',
          'Consommables',
          'Autres'
        ],
        datasets: [{
          label: 'My First Dataset',
          data: [20, 10, 30, 25, 10, 5],
          backgroundColor: [
            '#AFA2FF',
            '#662E9B',
            '#011638',
            '#131515',
            '#0D21A1',
            '#EEF0F2'
          ],
          hoverOffset: 4
        }]
      },
      options: {
          // scales: {
          //     y: {
          //         beginAtZero: true
          //     }
          // }
          scales: {
   yAxes: [{
       ticks: {
           min: 0,
           max: 100,
           callback: function(value) {
               return value + "%"
           }
       },
       scaleLabel: {
           display: true,
           labelString: "Percentage"
       }
   }]
}
      }
  });
  }


}

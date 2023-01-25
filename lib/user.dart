// Solutionclass Solution {
//   int findMinArrowShots(List<List<int>> points) {
//     if (points.isEmpty) return 0;
//     points.sort((List<int> a, List<int> b) => a[1] - b[1]);
//     print('sorted points are $points');
//     return countShots(points);
//   }
//
//   int countShots(List<List<int>> points) {
//     int count = 1;
//     int end = points[0][1];
//     print('first end is $end');
//     for (int i = 1; i < points.length; i++) {
//       if (points[i][0] > end) {
//         print('new end is ${points[i][0]}');
//
//         count++;
//         end = points[i][1];
//         print('new end is $end');
//       } else {
//         print('skipping ${points[i]}');
//       }
//     }
//     return count;
//   }
// }

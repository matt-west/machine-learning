/**
 *  @fileoverview Euclidean distance algorithm.
 *  @author matt.west@kojilabs.com (Matt West)
 *  @license Copyright 2013 Matt West.
 *           Licensed under MIT (http://opensource.org/licenses/MIT).
 */


/**
 *  Calculate the euclidean distance between two items in a dataset.
 *
 *  @param  {object}  prefs The dataset containing data about both items that
 *                    are being compared.
 *  @param  {string}  p1 Item one for comparison.
 *  @param  {string}  p2 Item two for comparison.
 *  @return {float}  The euclidean distance score.
 */
function euclideanDistance(prefs, p1, p2) {
  si = [];

  for (var i = 0; i < Object.keys(prefs[p1]).length; i++) {
    key = Object.keys(prefs[p1])[i];

    if (Object.keys(prefs[p2]).indexOf(key) != -1) {
      si.push(key);
    }
  }

  if (si.length == 0) {
    return 0;
  }

  sum_of_squares = 0;

  for (var i = 0; i < si.length; i++) {
    key = si[i];

    sum_of_squares += Math.pow(prefs[p1][key] - prefs[p2][key], 2);
  }

  return 1.0 / (1 + Math.sqrt(sum_of_squares));
}

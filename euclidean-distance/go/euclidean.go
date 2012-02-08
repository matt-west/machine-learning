package main

import (
	"fmt"
	"math"
)

type Film struct {
	Film string
	P1   int
	P2   int
}

type Rating struct {
	Film   string
	Rating float64
}

type Critic struct {
	Name    string
	Ratings []Rating
}

func main() {
	ratings := []Rating{{"Lady in the Water", 2.5}, {"Snakes on a Plane", 3.5}, {"Just My Luck", 3.0}, {"Superman Returns", 3.5}, {"You, Me and Dupree", 2.5}, {"The Night Listener", 3.0}}
	ratings2 := []Rating{{"Lady in the Water", 3.0}, {"Snakes on a Plane", 3.5}, {"Just My Luck", 1.5}, {"Superman Returns", 5.0}, {"The Night Listener", 3.0}, {"You, Me and Dupree", 3.5}}
	critics := []Critic{{"Lisa Rose", ratings}, {"Gene Seymour", ratings2}}

	score := euclidean_distance(critics, "Lisa Rose", "Gene Seymour")
	fmt.Println(score)
}

func euclidean_distance(prefs []Critic, p1 string, p2 string) (r float64) {
	// Find the index of the of two critics
	p1_index := 0
	p2_index := 0

	for i := 0; i < len(prefs); i++ {
		if prefs[i].Name == p1 {
			p1_index = i
		} else if prefs[i].Name == p2 {
			p2_index = i
		}
	}

	si := make([]Film, 0)

	for i := 0; i < len(prefs[p1_index].Ratings); i++ {
		for i2 := 0; i2 < len(prefs[p2_index].Ratings); i2++ {
			// If this film has been rated by both critics add it to the array of films
			if prefs[p1_index].Ratings[i].Film == prefs[p2_index].Ratings[i2].Film {
				si = append(si, Film{prefs[p1_index].Ratings[i].Film, i, i2})
			}
		}
	}

	// Return 0 now if there are no films that both critics have rated
	if len(si) == 0 {
		return 0
	}

	sum_of_squares := 0.0

	for i := 0; i < len(si); i++ {
		film_p1_index := si[i].P1
		film_p2_index := si[i].P2
		sum_of_squares += math.Pow(prefs[p1_index].Ratings[film_p1_index].Rating-prefs[p2_index].Ratings[film_p2_index].Rating, 2)
	}

	result := 1 / (1 + math.Sqrt(sum_of_squares))

	return result
}
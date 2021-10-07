#include <stdio.h>
#include <algorithm>
using namespace std;
struct Point 
{
	int x, y;
};
bool cmp_x(const Point& a,const Point& b) { 
	return a.x < b.x; 
} 

bool cmp_y(const Point& a,const Point& b) { 
	return a.y < b.y; 
} 
void printpoints(Point* t,int c) {
	printf("\n");
	for(int i = 0; i < c; i++)
		printf("(%d %d),", t[i].x , t[i].y);
	printf("\n");
	printf("points printed\n");
}
int n;

int main() {
	printf("start\n");
	scanf("%d", &n);
	Point * ax = new Point[n];
	Point * ay = new Point[n];

	int x, y;
	for(int i = 0; i < n; i++){
		scanf("%d %d", &x, &y);
		ax[i].x = x;
		ax[i].y = y;
	}
	sort(ax, ax + n, cmp_x);
	printf("sorted x\n");
	printpoints(ax, n);
	double dist = 5.0;
	int start = 0;
	int end = n-1;
	int middle = (start + end)/2;
	double lane = (((start + end)%2 == 1) ? (((double)ax[middle].x + ax[middle + 1].x)     / 2) : ax[middle].x);

	double left_border = lane - dist;
	double right_border = lane + dist;
	printf("sentry\n");

	// gather left side
	int total_points = 0;
	int current_point = middle;
	for (int i = 0; left_border < (double)ax[current_point + i].x; i--){
		ay[total_points] = ax[current_point + i];
		total_points++;
	}
	// gather right side
	printf("points from left side %d\n", total_points);
	current_point = middle + 1;
	for (int i = 0; (double)ax[current_point + i].x < right_border ; i++){
		ay[total_points] = ax[current_point + i];
		total_points++;
	}
	printf("\nlb:%f rb:%f l:%f d:%f\n", left_border, right_border, lane, dist);
	printf("m:%d, m+1:%d, total:%d\n", middle, middle +1, total_points);

	printpoints(ay, total_points);
	sort(ay, ay + total_points, cmp_y);
	printpoints(ay, total_points);

	return 0;
}

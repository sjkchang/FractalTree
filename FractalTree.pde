private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .4;  
public void setup() 
{   
	size(640,600);    
	noLoop(); 


} 
public void draw() 
{   
	background(135, 206, 235);  
	noStroke();
	fill(0, 255, 0); 
	rect(0, 580, 700, 20);
	fill(255, 255, 51);
	ellipse(450, 150, 70, 70);
	//stroke(0,255,0);      
	drawBranches(320,500,100,3*Math.PI/2); 
	//stroke(165,42,42);
	//line(320,480,320,380);   
	//will add later 
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   double angle1 = angle + branchAngle;
	double angle2 = angle - branchAngle;
	int endX1 = (int)(branchLength*Math.cos(angle1) + x);
	int endY1 = (int)(branchLength*Math.sin(angle1) + y);
	int endX2 = (int)(branchLength*Math.cos(angle2) + x);
	int endY2 = (int)(branchLength*Math.sin(angle2) + y);
	branchLength = branchLength* fractionLength;
	if(branchLength < 6){
		stroke(139, 69, 19);
		strokeWeight(4);
		line(320,500,320,600);
	}
	else if(branchLength >= 30){
	//line(x1, y1, x2, y2);
	stroke(139, 69, 19);
	strokeWeight(3);
	line(x, y, endX1, endY1);
	line(x, y, endX2, endY2);
	drawBranches(endX1, endY1, branchLength, angle1);
	drawBranches(endX2, endY2, branchLength, angle2);
	//your code here
	}   
	else {
		strokeWeight(1);
		stroke(0, 255, 0);
		line(x, y, endX1, endY1);
		line(x, y, endX2, endY2);
		drawBranches(endX1, endY1, branchLength, angle1);
		drawBranches(endX2, endY2, branchLength, angle2);
	}
} 

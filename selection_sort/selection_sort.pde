int w = 100; 
int[] arr = new int[w]; 

void setup() {
  size(900, 900); 
  arr = create_array(w, width / 2); 
} 

int[] create_array(int n, int max) {
  int[] x = new int[n]; 
  for (int i = 0; i < n; i++) {
    x[i] = int(random(max));
    } 
    return x; 
  } 

void draw() {
  stroke(10, 20, 150); 
  background(50); 
  for (int i=0; i<w-1; i++) {
    int least = i; 
    for (int l=i+1; l<w; l++) { 
      if(arr[l] < arr[least]) {
        least = l; 
      } 
    } 
    int tm = arr[i]; 
    arr[i] = arr[least]; 
    arr[least] = tm; 
  } 
  plot_arr(arr, w); 
} 

void plot_arr(int[] x, int s) { 
  stroke(0, 0, 100); 
  for (int i = 0; i < s; i++) { 
    rect(0, height / s * i, x[i], height / s); 
  } 
} 

void mouseClicked() { 
  arr = create_array(w, width / 2); 
}
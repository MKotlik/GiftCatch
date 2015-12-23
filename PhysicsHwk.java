public class PhysicsHwk{
	public static void main(String[] args) {
		//12-5 #40
		double Vp = 4.46 * 1000; //velociy perigee in meters
		double Va = 3.64 * 1000; //velocity apogee in meters
		double Rp = 2 * Math.pow(10,4) * 1000; //distance perigee in meters

		double Vpk = 4.46; //velociy perigee in Kmeters
		double Vak = 3.64; //velocity apogee in Kmeters
		double Rpk = 2 * Math.pow(10,4); //distance perigee in Kmeters

		double G = 6.67 * Math.pow(10,-11); //G
		double Me = 5.98 * Math.pow(10,24); //Mass of Earth

		double Ra = -(G * Me) / (0.5 * Math.pow(Vp, 2) - (G * (Me / Rp)) - 0.5 * Math.pow(Va,2)); //distance apogee in meters

		double Rak = -(G * Me) / (0.5 * Math.pow(Vpk, 2) - (G * (Me / Rpk)) - 0.5 * Math.pow(Vak,2)); //distance apogee in meters

		//12-5 #41
		double Mm = 6.39 * Math.pow(10,23); //Mass mars kg
		double Rm = 3.39 * Math.pow(10,6); //Radius mars m

		double Vem = Math.sqrt((2 * G * Mm) / Rm); //Escape velocity mars

		//12-5 #43
		double Re = 6.37 * Math.pow(10,6); //Radius earth in meters

		double VlE = Math.sqrt((2 * G * Me) / Re); //Launch velocity to one earth radius

		System.out.println(VlE);
	}
}
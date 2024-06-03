package model;

import java.util.Arrays;

public class Disponibilite {

	   private String membre;
	   private boolean[] disponibilites;

	   @Override
	public String toString() {
		return "Disponibilite [membre=" + membre + ", disponibilites=" + Arrays.toString(disponibilites) + "]";
	}

	public Disponibilite(String membre, boolean[] disponibilites) {
		super();
		this.membre = membre;
		this.disponibilites = disponibilites;
	}

	public Disponibilite() {
	      
	   }

	   public String getMembre() {
	      return membre;
	   }

	   public void setMembre(String membre) {
	      this.membre = membre;
	   }

	   public boolean[] getDisponibilites() {
	      return disponibilites;
	   }

	   public void setDisponibilites(boolean[] disponibilites) {
	      this.disponibilites = disponibilites;
	   }
	}

package model;

import java.util.ArrayList;
import java.util.List;

public class Votes {

   private List<Disponibilite> votants;

   @Override
public String toString() {
	return "Votes [votants=" + votants + "]";
}

public Votes() {
      
      votants = new ArrayList<>();
   }

   public List<Disponibilite> getDisponibilites() {
      return votants;
   }

   public void setDisponibilites(List<Disponibilite> disponibilites) {
      this.votants = disponibilites;
   }

   public void addDisponibilite(Disponibilite disponibilite) {
      votants.add(disponibilite);
   }

  
}

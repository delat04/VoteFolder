

package com;

import java.io.IOException;
//import java.util.Arrays;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Votes;
import model.Disponibilite;

public class Servlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
   private Votes votes = new Votes();

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      try {
         // Récupération du membre et de la disponibilité à partir de l'URL
         String membre = request.getParameter("Membre");
         String[] disponibilite = request.getParameterValues("Disponibilite");
         
         
         
 		Boolean  condition=Boolean.valueOf("1==1").booleanValue();
		System.out.println(condition);

         // Vérification des paramètres
         if (membre != null && disponibilite != null) {
            boolean[] disponibilites = new boolean[] {false, false, false, false, false, false};
            for (String jour : disponibilite) {
               switch (jour.toLowerCase()) {
                  case "lundi":
                     disponibilites[0] = true;
                     break;
                  case "mardi":
                     disponibilites[1] = true;
                     break;
                  case "mercredi":
                     disponibilites[2] = true;
                     break;
                  case "jeudi":
                     disponibilites[3] = true;
                     break;
                  case "vendredi":
                     disponibilites[4] = true;
                     break;
                  case "samedi":
                     disponibilites[5] = true;
                     break;
               }
            }
            Disponibilite d = new Disponibilite(membre, disponibilites);
            votes.addDisponibilite(d);
         }
      } catch (Exception e) {
         // Handle exceptions appropriately
         e.printStackTrace(); // Log the exception
      }

      // Affichage des résultats des votes
      request.setAttribute("votes", votes);
      request.getRequestDispatcher("/WEB-INF/jsp_scriplets.jsp").forward(request, response);
   }
}

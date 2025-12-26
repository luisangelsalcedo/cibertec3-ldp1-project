package eparking.controllers;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;
import eparking.enums.ParkingStatus;
import eparking.enums.ReservationStatus;
import eparking.dao.IParkingDAO;
import eparking.dao.IReservationDAO;
import eparking.dao.IUserDAO;
import eparking.dao.ParkingDAO;
import eparking.dao.ReservationDAO;
import eparking.dao.UserDAO;
import eparking.model.Parking;
import eparking.model.Reservation;
import eparking.model.ReservationDTO;
import eparking.model.User;

public class ReservationController {
	private IUserDAO userDao = new UserDAO();
	private IParkingDAO parkingDao = new ParkingDAO();
	private IReservationDAO reservationDao = new ReservationDAO();
	
	public List<Parking> getParkingListWithReservations(LocalDate currentDate){
		
		List<Reservation> reservations = new ArrayList<>(reservationDao.getAllReservations(currentDate));
		List<Parking> allParkings = new ArrayList<>(parkingDao.getAllParkings());
		List<Parking> parkingsWithStatus = new ArrayList<>();
		
		for(Parking parking : allParkings) {
			Parking parkingCopy = new Parking(parking);
			
			boolean hasActiveReservation = 
					 reservations.stream()
					 	.anyMatch(reservation -> 
			                reservation.getParkingId() == parkingCopy.getId() &&
			                isActive(reservation)
			            );
			 
			parkingCopy.setStatus(hasActiveReservation ? ParkingStatus.BUSY : ParkingStatus.AVAILABLE);
			parkingsWithStatus.add(parkingCopy);
		}
		return parkingsWithStatus;
	} 
	
	public void registerReservation(Reservation reservation) {
		if(hasActiveReservationOnSameDay(reservation)) {	
			throw new IllegalArgumentException(
				"No puedes registrar más de una reserva por día.\n" +  
				"Ya tienes una reserva activa para esta fecha.");
		} 
		reservationDao.insertReservation(reservation);
	}
	
	public void updateReservation(Reservation reservation) {
		reservationDao.updateReservation(reservation);		
	}

	public int getTodayInProgressReservationsCount(){
		return countTodayReservationsByStatus(ReservationStatus.INPROGRESS);
	}

	public int getTodayCurrentReservationsCount(){
		return reservationDao.getAllReservations(LocalDate.now()).size();
	}

	public int getTodayAvailableParkingCount(){
		int reservationsActiveToday = reservationDao.getAllReservations(LocalDate.now())
				.stream()
				.filter(this::isActive)
				.collect(Collectors.toList()).size();
		
		return parkingDao.getAllParkings().size() - reservationsActiveToday;
	}
	
	public List<ReservationDTO> getAllReservationsDTOByUser(int userID) {
		return reservationDao.getAllReservationsByUser(userID).stream()
				.map(this::getReservationDetails)
				.collect(Collectors.toList());
			
	}
	public List<Reservation> getActiveReservations(int userID) {
		return reservationDao.getAllReservationsByUser(userID).stream()
			.filter(this::isActive)
			.collect(Collectors.toList());
			
	}
	
	public Reservation getActiveReservation(int userID) {
		return getActiveReservations(userID).stream()
			.filter(reservation -> !reservation.getCreationDate().isBefore(LocalDate.now()))
			.sorted(Comparator.comparing(Reservation::getCreationDate)) 
			.findFirst()
			.orElse(null);
	}
	
	public ReservationDTO getReservationDetails(Reservation reservation) {
		User reservationUser = userDao.findUserById(reservation.getUserId());
		Parking reservationParking = parkingDao.findParkingById(reservation.getParkingId());
		
		return new ReservationDTO(reservation, reservationUser, reservationParking);
	}
	
	private boolean hasActiveReservationOnSameDay(Reservation reservation) {
		return reservationDao.getAllReservationsByUser(reservation.getUserId()).stream()
	            .anyMatch(
	            		current -> isActive(current) && 
	            		current.getCreationDate().equals(reservation.getCreationDate())
	            );
    }
	
	private boolean isActive(Reservation reservation) {
		return reservation.getStatus().equals(ReservationStatus.PENDING) || 
			   reservation.getStatus().equals(ReservationStatus.INPROGRESS);
	}
	
	private int countTodayReservationsByStatus(ReservationStatus status) {
        return reservationDao.getAllReservations(LocalDate.now()).stream()
            .filter(reservation -> reservation.getStatus() == status)
            .collect(Collectors.toList()).size();
    }
	
	public void markOldReservarionsAsCanceled() {
		for(Reservation reservation : reservationDao.getAllReservations()) {
			if(
					reservation.getCreationDate().isBefore(LocalDate.now()) &&
					reservation.getStatus().equals(ReservationStatus.PENDING)
			  ){
				
				System.out.println("Se cancelo tu reserva del " + reservation.getCreationDate());
				reservation.setStatus(ReservationStatus.CANCELED);
				reservation.setEndTime(LocalTime.MAX);
				reservationDao.updateReservation(reservation);
			}
		}
	}


}
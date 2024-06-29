package com.spring.bioMedical.Controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.bioMedical.entity.Admin;
import com.spring.bioMedical.entity.Appointment;
import com.spring.bioMedical.service.AdminServiceImplementation;
import com.spring.bioMedical.service.AppointmentServiceImplementation;
import com.spring.bioMedical.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 *
 * @author Soumyadip Chowdhury
 * @github soumyadip007
 *
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	private UserService userService;
	private AdminServiceImplementation adminServiceImplementation;
	private AppointmentServiceImplementation appointmentServiceImplementation;

	@Autowired
	public AdminController(UserService userService, AdminServiceImplementation adminServiceImplementation,
						   AppointmentServiceImplementation appointmentServiceImplementation) {
		this.userService = userService;
		this.adminServiceImplementation = adminServiceImplementation;
		this.appointmentServiceImplementation = appointmentServiceImplementation;
	}

	private String getCurrentUsername() {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal instanceof UserDetails) {
			return ((UserDetails) principal).getUsername();
		} else {
			return principal.toString();
		}
	}

	private void updateLastSeenTimestamp() {
		String username = getCurrentUsername();
		Admin admin = adminServiceImplementation.findByEmail(username);
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		Date now = new Date();
		String log = now.toString();
		admin.setLastseen(log);
		adminServiceImplementation.save(admin);
	}

	@RequestMapping("/user-details")
	public String index(Model model) {
		List<Admin> list = adminServiceImplementation.findByRole("ROLE_USER");
		model.addAttribute("user", list);
		updateLastSeenTimestamp();
		return "admin/user";
	}

	@RequestMapping("/doctor-details")
	public String doctorDetails(Model model) {
		List<Admin> list = adminServiceImplementation.findByRole("ROLE_DOCTOR");
		model.addAttribute("user", list);
		updateLastSeenTimestamp();
		return "admin/doctor";
	}

	@RequestMapping("/admin-details")
	public String adminDetails(Model model) {
		List<Admin> list = adminServiceImplementation.findByRole("ROLE_ADMIN");
		model.addAttribute("user", list);
		updateLastSeenTimestamp();
		return "admin/admin";
	}

	@GetMapping("/add-doctor")
	public String showFormForAdd(Model theModel) {
		updateLastSeenTimestamp();
		Admin admin = new Admin();
		theModel.addAttribute("doctor", admin);
		return "admin/addDoctor";
	}

	@PostMapping("/save-doctor")
	public String saveDoctor(@ModelAttribute("doctor") Admin admin) {
		admin.setRole("ROLE_DOCTOR");
		admin.setPassword("default");
		admin.setEnabled(true);
		admin.setConfirmationToken("ByAdmin-Panel");
		logger.info("Saving new doctor: {}", admin);
		adminServiceImplementation.save(admin);
		return "redirect:/admin/user-details";
	}

	@GetMapping("/add-admin")
	public String showFormForAddAdmin(Model theModel) {
		updateLastSeenTimestamp();
		Admin admin = new Admin();
		theModel.addAttribute("admin", admin);
		return "admin/addAdmin";
	}

	@PostMapping("/save-admin")
	public String saveAdmin(@ModelAttribute("admin") Admin admin) {
		admin.setRole("ROLE_ADMIN");
		admin.setPassword("default");
		admin.setEnabled(true);
		admin.setConfirmationToken("ByAdmin-Panel");
		logger.info("Saving new admin: {}", admin);
		adminServiceImplementation.save(admin);
		return "redirect:/admin/user-details";
	}

	@GetMapping("/edit-my-profile")
	public String editForm(Model theModel) {
		String username = getCurrentUsername();
		Admin admin = adminServiceImplementation.findByEmail(username);
		updateLastSeenTimestamp();
		theModel.addAttribute("profile", admin);
		return "admin/updateMyProfile";
	}

	@PostMapping("/update")
	public String update(@ModelAttribute("profile") Admin admin) {
		logger.info("Updating profile: {}", admin);
		adminServiceImplementation.save(admin);
		return "redirect:/admin/user-details";
	}

	@RequestMapping("/appointments")
	public String appointments(Model model) {
		List<Appointment> list = appointmentServiceImplementation.findAll();
		model.addAttribute("app", list);
		updateLastSeenTimestamp();
		return "admin/appointment";
	}
}

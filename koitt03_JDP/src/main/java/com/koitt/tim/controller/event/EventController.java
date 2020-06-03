//조미선
package com.koitt.tim.controller.event;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.koitt.tim.dto.event.EventDto;
import com.koitt.tim.service.event.EventService;

@Controller
@RequestMapping("event")
public class EventController {

	@Autowired
	EventService eServ;

	@RequestMapping("event")
	public String eventList(Model model) {
		List<EventDto> dtos = eServ.selectEvent();
		System.out.println(dtos.get(0).getEvent_num());
		model.addAttribute("list", dtos);
		return "event/event";
	}

	@RequestMapping("fin_event")
	public String eventFinList(Model model) {
		List<EventDto> dtos = eServ.selectFinEvent();
		model.addAttribute("list", dtos);
		return "event/fin_event";
	}
}
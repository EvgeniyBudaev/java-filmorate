package ru.yandex.practicum.filmorate.controller;

import javax.validation.Valid;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;
import ru.yandex.practicum.filmorate.model.Film;
import ru.yandex.practicum.filmorate.service.FilmService;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/films")
@AllArgsConstructor
@Slf4j
public class FilmController {
    private final FilmService filmService;

    @GetMapping
    public List<Film> getFilms() {
        List<Film> filmsList= new ArrayList<>(filmService.getAllFilms().values());
        log.debug("Количество фильмов: {}", filmsList.size());
        return filmsList;
    }

    @PostMapping
    public Film createFilm(@Valid @RequestBody Film film) {
        log.info("Film added");
        return filmService.createFilm(film);
    }

    @PutMapping
    public Film updateFilm(@RequestBody Film film) {
        log.info("Film updated");
        return filmService.updateFilm(film);
    }
}

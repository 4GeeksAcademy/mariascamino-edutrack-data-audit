# EduTrack Data Audit — Informe de análisis (Q3)

**Tabla auditada:** `enrollments`
**Estado inicial:** 17 inscripciones · **Estado final:** 16 inscripciones (+1 agregada, −2 eliminadas)

## Resumen ejecutivo

- **4 inscripciones en riesgo de abandono** (avance < 10%). Lucia Fernandes aparece en 2 de ellas.
- **UI/UX Fundamentals es el curso más crítico:** 0% de avance promedio y sin instructor asignado.
- **Se corrigieron los datos:** se agregó 1 inscripción faltante, se marcaron 2 instructores como "Pending assignment" y se eliminaron 2 cuentas de prueba (`@test.com`).
- **Programming es la categoría principal:** 7 de 16 inscripciones y $409.93 de $819.84 en ingresos (50%).
- **Marketing es la categoría con peor desempeño:** menos inscripciones (2) y menos ingresos ($59.98).

---

## Lectura y filtros

## Q1 — Inscripciones en 'Intro to Python'

Resultado: 5

| Estudiante | Email | Avance |
|---|---|---|
| Emily Watson | emily.watson@student.edutrack.com | 85 |
| Klaus Weber | klaus.weber@student.edutrack.com | 92 |
| Marco Rossi | marco.rossi@student.edutrack.com | 88 |
| James Miller | james.miller@test.com | 30 |
| Priya Sharma | priya.sharma@student.edutrack.com | 55 |

> James Miller es una cuenta de prueba; se elimina en Q8.

## Q2 — Posibles abandonos (avance < 10%)

Resultado: 4

| ID | Estudiante | Curso | Avance |
|---|---|---|---|
| 5 | Lucia Fernandes | Web Design Basics | 5 |
| 6 | Lucia Fernandes | Digital Marketing 101 | 3 |
| 10 | Yuki Nakamura | UI/UX Fundamentals | 0 |
| 11 | Pierre Dubois | UI/UX Fundamentals | 0 |

**Hallazgo:** Lucia Fernandes tiene avance casi nulo en sus dos cursos. Los dos alumnos de UI/UX Fundamentals están en 0%.

## Q3 — Inscripciones sin instructor (NULL)

Resultado: 2

| ID | Estudiante | Curso |
|---|---|---|
| 10 | Yuki Nakamura | UI/UX Fundamentals |
| 11 | Pierre Dubois | UI/UX Fundamentals |

**Hallazgo:** ambas son del mismo curso, que tampoco tiene instructor en la tabla `courses`. Coinciden con los alumnos en 0% de Q2.

## Q4 — Top 5 con mayor avance que aún no aprueban

Resultado: 5

| Estudiante | Curso | Avance |
|---|---|---|
| Emily Watson | Web Design Basics | 60 |
| Priya Sharma | Intro to Python | 55 |
| Yuki Nakamura | Data Analysis with SQL | 45 |
| Emily Watson | Advanced Python | 40 |
| James Miller | Intro to Python | 30 |

**Hallazgo:** son los alumnos más fáciles de recuperar. Emily Watson aparece dos veces porque la tabla registra inscripciones, no estudiantes.

## Q5 — Inscripciones desde el 2024-07-01

Resultado: 9

| ID | Estudiante | Curso | Fecha |
|---|---|---|---|
| 17 | Emily Watson | Advanced Python | 2025-03-05 |
| 16 | Pierre Dubois | Data Analysis with SQL | 2025-02-20 |
| 15 | Priya Sharma | Intro to Python | 2025-01-10 |
| 12 | Priya Sharma | Digital Marketing 101 | 2024-12-01 |
| 11 | Pierre Dubois | UI/UX Fundamentals | 2024-11-05 |
| 10 | Yuki Nakamura | UI/UX Fundamentals | 2024-10-11 |
| 9 | Yuki Nakamura | Data Analysis with SQL | 2024-09-03 |
| 8 | Marco Rossi | Intro to Python | 2024-08-09 |
| 6 | Lucia Fernandes | Digital Marketing 101 | 2024-07-01 |

---

## Correcciones de datos

## Q6 — Inscripción faltante agregada

Resultado: 1 fila insertada

- ID 18 · Lucia Fernandes · Advanced Python (Programming) · 2025-04-01 · 0% · no aprobado · $69.99 · Carlos Vega

## Q7 — Instructores NULL actualizados

Resultado: 2 filas actualizadas

- IDs 10 y 11 (UI/UX Fundamentals) → instructor = `'Pending assignment'`

## Q8 — Cuentas de prueba eliminadas

Resultado: 2 filas eliminadas (confirmadas antes con SELECT)

- ID 13 · James Miller · james.miller@test.com · Intro to Python
- ID 14 · Alex Chen · alex.chen@test.com · Web Design Basics

La tabla queda con 16 inscripciones.

---

## Agregaciones (después de las correcciones)

## Q9 — Inscripciones por categoría

Resultado:

- Programming: 7
- Design: 4
- Data: 3
- Marketing: 2

## Q10 — Avance promedio por curso (de menor a mayor)

Resultado:

- UI/UX Fundamentals: 0.00
- Web Design Basics: 32.50
- Digital Marketing 101: 36.50
- Advanced Python: 45.00
- Data Analysis with SQL: 47.67
- Intro to Python: 80.00

**Hallazgo:** UI/UX Fundamentals no tiene ningún avance. Web Design y Digital Marketing están bajo 40%, en parte porque Lucia Fernandes está casi en 0% en ambos.

## Q11 — Cursos con más de 3 inscripciones

Resultado: 1

- Intro to Python: 4

## Q12 — Ingresos totales por categoría

Resultado:

- Programming: $409.93
- Data: $179.97
- Design: $169.96
- Marketing: $59.98

**Total:** $819.84

---

## Recomendaciones

1. **Asignar instructor a UI/UX Fundamentals** y contactar a sus 2 alumnos, que están en 0%.
2. **Contactar a Lucia Fernandes** (avance < 10% en 2 cursos) antes de que avance su nueva inscripción en Advanced Python.
3. **Hacer seguimiento a los alumnos de Q4**, que tienen buen avance pero no han aprobado.
4. **Revisar la estrategia de Marketing**, la categoría con menos demanda e ingresos.
5. **Evitar nuevas cuentas de prueba en producción** y hacer obligatorio el campo instructor en la integración del partner.

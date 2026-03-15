-- Ta reda på en specifik klass vilken utbildningsledare den har

select class_id, start_year, class.manager_id, first_name, last_name
from class
right join education_manager on class.manager_id = education_manager.manager_id
where class_id = 2;

-- Vilka kurser har Data Engineering?

select program.program_name,
       course.course_name,
       course.course_code,
       course.points,
       course.description
from program_course pc
right join program on program.program_id = pc.program_id
right join course on course.course_id = pc.course_id
where program_name = 'Data Engineering';

-- Hur många kurser har Fullstack Developer?

select program.program_name, count(*) as "course count"
from program_course pc
right join program on program.program_id = pc.program_id
right join course on course.course_id = pc.course_id
where program_name = 'Fullstack Developer'
group by program_name;

-- Vilka utbildare som undervisar vilka kurser

select first_name, last_name, course_name
from course_teacher ct
right join teacher on teacher.teacher_id = ct.teacher_id
right join course on course.course_id = ct.course_id;
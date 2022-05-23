DROP DATABASE backend;

CREATE DATABASE  backend;
USE backend;

DROP TABLE IF EXISTS article;
DROP TABLE IF EXISTS video;
DROP TABLE IF EXISTS document;
DROP TABLE IF EXISTS courses;

CREATE TABLE courses(
	coursesID BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	CourseName TEXT NOT NULL,
	CourseDescription TEXT NOT NULL,
    lastupdate timestamp
    
)ENGINE=INNODB;

INSERT INTO courses(CourseName, CourseDescription) VALUES 
('Basismat 1', 'At sætte de studerende i stand til selvstændigt at anvende fundamentale matematiske værktøjer ved løsning af ingeniørmæssige problemer, samt at introducere de studerende til de forskellige arbejdsformer, der kendetegner et videregående studium.'),
('Basismat 2', 'At give de studerende grundlæggende færdigheder inden for lineær algebra og systemer af lineære differentialligninger, samt erfaring med anvendelse heraf i ingeniørmæssige problemstillinger.'),
('CDIO-Projekt', 'Kursets mål er at gøre den studerende i stand til at håndtere en komplet systemudviklings-cyklus fra koncept-design til færdigt produkt. Kurset inkorporerer både softwaremæssige og hardwaremæssige aspekter. Kurset bestræber sig på at skabe arbejdssituationer som ligner de reelle arbejdsforhold for IT-ingeniører i industrien, og vil træne den studerende i at arbejde i et udviklings-team. 

Kurset bygger på den studerendes erfaring og viden fra studiets tidligere semestre (1.-3.) samt kundskaber som opnås i de andre kurser på studiets 4. semester. 

Den studerende skal opnå kursets mål som del af en gruppe på 6-8 studerende, mens det individuelle ansvar opretholdes. Herved forstås, at 
i. Den studerende skal kunne redegøre for den overordnede ide bag hver enkelt komponent i systemet, og  
ii. Den studerende skal udvise detaljeret forståelse af mindst en væsentlig komponent gennem alle CDIO faser.

Endviddere er det er mål at lade de studerende overveje etiske spørgsmål i relation til deres fagområde. Dette gøres genne et særligt etik-modul.'),
('Front end web technology', 'Kursets formål er at træne deltagerne i at udvikle webapplikationer i Angular'),
('Versionsstyring og testmetoder','Kursets formål er at introducere metoder og arbejdsformer indenfor softwaretest og versionsstyring. Deltagerne trænes i at teste mindre programmer og at organisere softwareudviklingsprojekter f.eks. ved hjælp af versionsstyring.'),
('Indledende programmering','Målet med dette kursus er at lære den studerende at bruge de grundlæggende begreber og teknikker i et imperativt- og objektorienteret programmeringsprog. Kurset vil benytte et programmeringssprog, som anvendes i industrien (for tiden Java). 
Kurset har som overordnet mål at sætte den studerende i stand til at designe, implementere og teste mindre programmer.'),
('Videregående programmering','Kursets formål er at træne deltagerne i at udvikle større Java programmer, der idriftsættes som ”Stand-alone-applikationer” eller som ”webapplikationer” 
De vigtigste biblioteker i API’et vil blive gennemgået tillige med en række mere avancerede facetter af selve sproget. Anvendelse af passende designmønstre vil ligeledes indgå i kurset.'),
('Software processer og mønstre','Kursets mål er at sætte den studerende i stand til at udvikle software efter agile udviklingsmetoder i et konkret projekt, der defineres i samarbejde med eksterne produkt ejere. Endvidere at give den studerende et overblik over gængse designmønstre og deres anvendelser. Den studerende lærer at arbejde med en leverance styret agil process model, hvor vurdering af risici samt værdi for kunden er i fokus.'),
('Brugerinteraktion og udvikling på mobile enheder','Kurset har til formål at gøre de studerende i stand til at identificere brugerbehov, konceptualisere og validere prototype brugerflader i en lean, kundedrevet agil og iterativ designproces og efterfølgende implementere designet på en mobil enhed.'),
('Datakommunikation','Kursets mål er, at sætte den studerende i stand til at: 

- forstå grundlæggende principper for kommunikation i datanetværk 
- forstå internettets opbygning og dets protokoller samt anvende disse 
- etablere kommunikation mellem to maskiner på et datanetværk 
- forstå sikkerhedsaspekter i brugen af intranet og internet.');



CREATE TABLE  article(
  id BIGINT AUTO_INCREMENT NOT NULL PRIMARY KEY,
  coursesID  BIGINT NOT NULL,
  articleTitle TEXT NOT NULL,
  articleDes TEXT NOT NULL,
  articlelink VARCHAR(2083) NOT NULL,
  INDEX (coursesID),
  FOREIGN KEY(coursesId) REFERENCES courses(coursesId) ON DELETE CASCADE
)ENGINE=INNODB;

INSERT INTO article (coursesID,articleTitle, articleDes,articlelink) VALUES (1,'Geometry of Complex Numbers ( Wikipedia )','Geometry of Complex Numbers: Circle Geometry, Moebius Transformation, Non-Euclidean Geometry is an undergraduate textbook on geometry, whose topics include circles, the complex plane, inversive geometry, and non-Euclidean geometry. It was written by Hans Schwerdtfeger, and originally published in 1962 as Volume 13 of the Mathematical Expositions series of the University of Toronto Press. A corrected edition was published in 1979 in the Dover Books on Advanced Mathematics series of Dover Publications (ISBN 0-486-63830-8). The Basic Library List Committee of the Mathematical Association of America has suggested its inclusion in undergraduate mathematics libraries.[1]','https://en.wikipedia.org/wiki/Geometry_of_Complex_Numbers');
INSERT INTO article (coursesID,articleTitle, articleDes,articlelink) VALUES (1,'Complex Numbers in Geometry','n plane geometry, complex numbers can be used to represent points, and thus other geometric objects as well such as lines, circles, and polygons. They are somewhat similar to Cartesian coordinates in the sense that they are used to algebraically prove geometric results, but they are especially useful in proving results involving circles and/or regular polygons (unlike Cartesian coordinates, which are useful for proving results involving lines).','https://brilliant.org/wiki/complex-numbers-in-geometry/');
INSERT INTO article (coursesID,articleTitle, articleDes,articlelink) VALUES (1,'An Introduction to the Algebra of Complex Numbers and the Geometry in the Complex Plane','1 Introduction
Complex numbers are a puzzling concept for today’s student of mathematics. This is not entirely surprising, as complex numbers were not immediately embraced by mathematicians either. Complex numbers showed up somewhat sporadically in works such as those of Cardano, Tartaglia, Bombelli and Wallis. However, it wasn’t until Caspar Wessel (1745–1818), a Norwegian map surveyor, that we first see a systematic and full theory of complex numbers. This project studies the basic definitions, as well as geometric and algebraic properties, of complex numbers via Wessel’s 1797 paper Om Directionens analytiske Betegning, et Forsog, anvendt fornemmelig til plane og sphaeriske Polygoners Oplosning (On the Analytical Representation of Direction. An Attempt Applied Chiefly to Solving Plane and Spherical Polygons) [Wessel, 1999]. It was the first to develop the geometry of complex numbers, though it was unfortunately not given much attention until about a century after it was written. As Michael Crowe writes [Crowe, 1994]:
Caspar Wessel...lays out for the first time the geometrical representation of complex numbers. His goal was not only to justify complex numbers, but also to investigate “how we may represent direction analytically.”. . . Wessel publish[ed] for the first time the now standard geometrical interpretation of complex numbers as entities that can be added, subtracted, multiplied, and divided.','https://digitalcommons.ursinus.edu/cgi/viewcontent.cgi?article=1002&context=triumphs_complex');
INSERT INTO article (coursesID,articleTitle, articleDes,articlelink) VALUES (1,'The Algebra and Geometry of Complex Numbers (Part 1)','For centuries mathematicians had found ways to describe and manipulate the perfect geometries they used to represent phenomenon of the natural world. Orbits were round. Length and amount were always positive numbers. There was no such thing as the square root of a negative number. In 1572, in his book L’Algebra, the first scrupulous description of complex numbers was given by Raphael Bombelli. In it he lays out the rules by which complex numbers may be added and multiplied. Bombelli found a practical use for complex numbers in the solving of depressed cubic equations because they let him solve such equations when negative roots were present. But because negative roots were too much of an abstraction for his day, he said of his method: “the whole matter seems to rest on sophistry rather than on truth”. In the 17th and 18th centuries advances and discoveries in mathematics were happening at an accelerating rate; however, for many, including the great René Descartes, mathematical ideas were still required to have some kind of geometric explanation or proof. These practitioners of mathematics were severely critical and dismissive of complex numbers because there was no geometric analogue for them. This fact lead Descartes, in 1637, to declare them “imaginary” stating that these types of numbers were fictitious and useless. The world would see the advent of Newton and Leibniz. It would see the advent of Leonhard Euler, who, in the mid 18th century, would give us Euler’s Formula, and who would establish i as the standard symbol for the square root of -1. Not until the late 18th and early 19th centuries did Wessel and Argand, independently of each other, publish papers representing complex numbers as points in the complex plane. Both papers went largely unnoticed until, over two decades later, Carl Friedrich Gauss would publish similarly. Because of Gauss’s reputation, this time, the world of science and mathematics took notice. With the complex plane in hand, mathematicians now had a way of making geometric sense of these curious numbers.','https://maninbocss.medium.com/the-algebra-and-geometry-of-complex-numbers-part-1-7e08957391e4');
INSERT INTO article (coursesID,articleTitle, articleDes,articlelink) VALUES (1,'Complex Numbers and Geometry','Several features of complex numbers make them extremely useful in plane geometry. For example, the simplest way to express a spiral similarity in algebraic terms is by means of multiplication by a complex number. A spiral similarity with center at c, coefficient of dilation r and angle of rotation t is given by a simple formula','https://www.cut-the-knot.org/arithmetic/algebra/ComplexNumbersGeometry.shtml');
INSERT INTO article (coursesID,articleTitle, articleDes,articlelink) VALUES (2,'Gaussian elimination ( Wikipedia )','In mathematics, Gaussian elimination, also known as row reduction, is an algorithm for solving systems of linear equations. It consists of a sequence of operations performed on the corresponding matrix of coefficients. This method can also be used to compute the rank of a matrix, the determinant of a square matrix, and the inverse of an invertible matrix. The method is named after Carl Friedrich Gauss (1777–1855) although some special cases of the method—albeit presented without proof—were known to Chinese mathematicians as early as circa 179 CE.[1]','https://en.wikipedia.org/wiki/Gaussian_elimination');
INSERT INTO article (coursesID,articleTitle, articleDes,articlelink) VALUES (2,'Matrix Calculator','With help of this calculator you can: find the matrix determinant, the rank, raise the matrix to a power, find the sum and the multiplication of matrices, calculate the inverse matrix. Just type matrix elements and click the button.','https://matrixcalc.org/en/');
INSERT INTO article (coursesID,articleTitle, articleDes,articlelink) VALUES (2,'Introduction to matrix calculations','Many of you in the world of data will have heard of matrix calculations. Matrices are the big rectangles full of numbers that often crop up in statistical analysis techniques, and doing calculations with them doesn’t work quite the same as with normal numbers. In this blog, I’m going to explain the basics behind matrix calculations without going in to too much detail (and for those of you out there who want to understand the specifics behind what I’m about to go through, I’ll include links to websites which can offer more detailed explanations).','https://www.theinformationlab.co.uk/2017/05/26/introduction-matrix-calculations/');
INSERT INTO article (coursesID,articleTitle, articleDes,articlelink) VALUES (2,'Matrices','Matrices is a plural form of a matrix, which is a rectangular array or a table where numbers or elements are arranged in rows and columns. They can have any number of columns and rows. Different operations can be performed on matrices such as addition, scalar multiplication, multiplication, transposition, etc.
There are certain rules to be followed while performing these matrix operations like they can be added or subtracted if only they have the same number of rows and columns whereas they can be multiplied if only columns in first and rows in second are exactly the same. Let us understand the different types of matrices and these rules in detail.','https://www.cuemath.com/algebra/solve-matrices/');
INSERT INTO article (coursesID,articleTitle, articleDes,articlelink) VALUES (3,'Software Development Project Management','To get products to market fast, software development teams rely on effective project and process management to streamline their workflows. Finding the right project management method is key to staying on top of product roadmaps and release schedules.

Read on to discover the top project management methods for software development, how you can implement them with your team, and best practices for project success.','https://www.smartsheet.com/content-center/best-practices/project-management/project-management-guide/software-development-project-management');
INSERT INTO article (coursesID,articleTitle, articleDes,articlelink) VALUES (3,'The Teamwork guide to software development project management','Software development and project management go together like the less-than sign and the greater-than sign on a page of HTML. You’d generally prefer not to see one without the other.
In this guide, we’ll walk you through everything that makes software project management special.
This includes how it works, how it can be used, and how software development project management differs from other implementations of project management processes.','https://www.teamwork.com/blog/software-development-project-management/');
INSERT INTO article (coursesID,articleTitle, articleDes,articlelink) VALUES (3,'Software Project Management ( Tutorial point )','Software Project
A Software Project is the complete procedure of software development from requirement gathering to testing and maintenance, carried out according to the execution methodologies, in a specified period of time to achieve intended software product.','https://www.tutorialspoint.com/software_engineering/software_project_management.htm');
INSERT INTO article (coursesID,articleTitle, articleDes,articlelink) VALUES (3,'Project Management Methods for Software Development Teams','Managing all types of projects, incl. software development, can be handled in various ways. There are plenty of methods and theory out there to dig into, to hopefully find the best possible solution for your project. The best one is very much a matter of the nature of your project, as well as you and your teams subjective opinion and thoughts going into the workflow.

Below, we have gathered some of the most popular methods designed solely for software projects. If youre more interested in universal project management methods, we have a similar article on those here.','https://www.forecast.app/blog/project-management-methods-for-software-development-teams');
INSERT INTO article (coursesID,articleTitle, articleDes,articlelink) VALUES (3,'Project Management in Software Development: The Complete Guide','As companies transition into the tech storm of the 21st-century, the hassles of effective project management in the software development pipeline are escalating like never before.

Maybe you’re a rising startup looking to optimize total productivity and output of your software projects. Or a well-established tech (or non-tech) corporation looking to scale your team’s software management efficiency.

In both cases, project management in software development is crucial to addressing all scopes of your business model. Keep reading to learn more about project management!','https://trio.dev/blog/project-management-software-development');
INSERT INTO article (coursesID,articleTitle, articleDes,articlelink) VALUES (4,'Tutorial: Intro to React', 'This tutorial is designed for people who prefer to learn by doing. If you prefer learning concepts from the ground up, check out our step-by-step guide. You might find this tutorial and the guide complementary to each other.','https://reactjs.org/tutorial/tutorial.html');
INSERT INTO article (coursesID,articleTitle, articleDes,articlelink) VALUES (4,'Learn React ( Codecademy )','Why Learn ReactJS?

ReactJS offers graceful solutions to some of front-end programming’s most persistent issues, allowing you to build dynamic and interactive web apps with ease. It’s fast, scalable, flexible, powerful, and has a robust developer community that’s rapidly growing. There’s never been a better time to learn React.

Take-Away Skills:

You’ll develop a strong understanding of React’s most essential concepts: JSX, class and function components, props, state, lifecycle methods, and hooks. You’ll be able to combine these ideas in React’s modular programming style.

Note on Prerequisites:

A strong foundation in JavaScript is a prerequisite for this course, as well as basic HTML.','https://www.codecademy.com/learn/react-101');
INSERT INTO article (coursesID,articleTitle, articleDes,articlelink) VALUES (4,'Learn HTML ( W3school )', 'HTML is the standard markup language for Web pages.

With HTML you can create your own Website.

HTML is easy to learn - You will enjoy it!','https://www.w3schools.com/html/');
INSERT INTO article (coursesID,articleTitle, articleDes,articlelink) VALUES (4,'Learn CSS ( W3school)','CSS is the language we use to style an HTML document.

CSS describes how HTML elements should be displayed.

This tutorial will teach you CSS from basic to advanced.','https://www.w3schools.com/css/default.asp');
INSERT INTO article (coursesID,articleTitle, articleDes,articlelink) VALUES (4,'Learn Javascript ( W3chool )', 'JavaScript is the worlds most popular programming language.

JavaScript is the programming language of the Web.

JavaScript is easy to learn.

This tutorial will teach you JavaScript from basic to advanced.','https://www.w3schools.com/js/default.asp');
INSERT INTO article (coursesID,articleTitle, articleDes,articlelink) VALUES (5,'Github','The home for all developers — including you.
Welcome to your personal dashboard, where you can find an introduction to how GitHub works, tools to help you build software, and help merging your first lines of code.','https://github.com');
INSERT INTO article (coursesID,articleTitle, articleDes,articlelink) VALUES (5,'Version control ( Wikipedia )','"Source control" redirects here. For other uses in medicine and environment, see Source control (disambiguation).
"Revision control system" redirects here. For the specific software implementation, see Revision Control System. In software engineering, version control (also known as revision control, source control, or source code management) is a class of systems responsible for managing changes to computer programs, documents, large web sites, or other collections of information. Version control is a component of software configuration management.[1]

Changes are usually identified by a number or letter code, termed the "revision number", "revision level", or simply "revision". For example, an initial set of files is "revision 1". When the first change is made, the resulting set is "revision 2", and so on. Each revision is associated with a timestamp and the person making the change. Revisions can be compared, restored, and, with some types of files, merged.[2]

The need for a logical way to organize and control revisions has existed for almost as long as writing has existed, but revision control became much more important, and complicated, when the era of computing began. The numbering of book editions and of specification revisions are examples that date back to the print-only era. Today, the most capable (as well as complex) revision control systems are those used in software development, where a team of people may concurrently make changes to the same files.

Version control systems are most commonly run as stand-alone applications, but revision control is also embedded in various types of software, such as word processors and spreadsheets, collaborative web docs,[3] and content management systems, e.g., Wikipedias page history. Revision control enables reverting a document to a previous revision, which is critical for allowing editors to track each others edits, correct mistakes, and defend against vandalism and spamming in wikis.','https://en.wikipedia.org/wiki/Version_control');
INSERT INTO article (coursesID,articleTitle, articleDes,articlelink) VALUES (5,'Gitlab','The DevOps Platform has arrived.
Deliver software faster with better security and collaboration in a single platform.','https://about.gitlab.com');
INSERT INTO article (coursesID,articleTitle, articleDes,articlelink) VALUES (5,'Version control concepts and best practices','Introduction to version control

If you are already familiar with version control, you can skim or skip this section.

A version control system serves the following purposes, among others.

Version control enables multiple people to simultaneously work on a single project. Each person edits his or her own copy of the files and chooses when to share those changes with the rest of the team. Thus, temporary or partial edits by one person do not interfere with another persons work. 
Version control also enables one person you to use multiple computers to work on a project, so it is valuable even if you are working by yourself.
Version control integrates work done simultaneously by different team members. In most cases, edits to different files or even the same file can be combined without losing any work. In rare cases, when two people make conflicting edits to the same line of a file, then the version control system requests human assistance in deciding what to do.
Version control gives access to historical versions of your project. This is insurance against computer crashes or data lossage. If you make a mistake, you can roll back to a previous version. You can reproduce and understand a bug report on a past version of your software. You can also undo specific edits without losing all the work that was done in the meanwhile. For any part of a file, you can determine when, why, and by whom it was ever edited.','https://homes.cs.washington.edu/~mernst/advice/version-control.html');
INSERT INTO article (coursesID,articleTitle, articleDes,articlelink) VALUES (5,'What is version control?','','https://www.atlassian.com/git/tutorials/what-is-version-control');
INSERT INTO article (coursesID,articleTitle, articleDes,articlelink) VALUES (6,'Java ( Codcademy )','Why Learn Java?

Java is among the most popular programming languages out there, mainly because of how versatile and compatible it is. Java can be used for a large number of things, including software development, mobile applications, and large systems development. As of 2019, 88% market share of all smartphones run on Android, the mobile operating system written in Java. Knowing Java opens a great deal of doors for you as a developer.

Take-Away Skills

In this course you’ll be exposed to fundamental programming concepts, including object-oriented programming (OOP) using Java. You’ll build 7 Java projects—like a basic calculator—to help you practice along the way.','https://www.codecademy.com/learn/learn-java');
INSERT INTO article (coursesID,articleTitle, articleDes,articlelink) VALUES (6,'Java Tutorial','Our core Java programming tutorial is designed for students and working professionals. Java is an object-oriented, class-based, concurrent, secured and general-purpose computer-programming language. It is a widely used robust technology.

What is Java?

Java is a programming language and a platform. Java is a high level, robust, object-oriented and secure programming language.

Java was developed by Sun Microsystems (which is now the subsidiary of Oracle) in the year 1995. James Gosling is known as the father of Java. Before Java, its name was Oak. Since Oak was already a registered company, so James Gosling and his team changed the name from Oak to Java.

Platform: Any hardware or software environment in which a program runs, is known as a platform. Since Java has a runtime environment (JRE) and API, it is called a platform.','https://www.javatpoint.com/java-tutorial');
INSERT INTO article (coursesID,articleTitle, articleDes,articlelink) VALUES (6,'Java ( Wikipedia )','','https://da.wikipedia.org/wiki/Java_(programmeringssprog)');
INSERT INTO article (coursesID,articleTitle, articleDes,articlelink) VALUES (6,'Java Introduction','What is Java?
Java is a popular programming language, created in 1995.

It is owned by Oracle, and more than 3 billion devices run Java.

It is used for:

Mobile applications (specially Android apps)
Desktop applications
Web applications
Web servers and application servers
Games
Database connection
And much, much more!','https://www.w3schools.com/java/java_intro.asp');
INSERT INTO article (coursesID,articleTitle, articleDes,articlelink) VALUES (6,'Learn Java Programming','Java is a powerful general-purpose programming language. It is used to develop desktop and mobile applications, big data processing, embedded systems, and so on. According to Oracle, the company that owns Java, Java runs on 3 billion devices worldwide, which makes Java one of the most popular programming languages.','https://www.programiz.com/java-programming');
INSERT INTO article (coursesID,articleTitle, articleDes,articlelink) VALUES (7,'Java ( Codcademy )','Why Learn Java?

Java is among the most popular programming languages out there, mainly because of how versatile and compatible it is. Java can be used for a large number of things, including software development, mobile applications, and large systems development. As of 2019, 88% market share of all smartphones run on Android, the mobile operating system written in Java. Knowing Java opens a great deal of doors for you as a developer.

Take-Away Skills

In this course you’ll be exposed to fundamental programming concepts, including object-oriented programming (OOP) using Java. You’ll build 7 Java projects—like a basic calculator—to help you practice along the way.','https://www.codecademy.com/learn/learn-java');
INSERT INTO article (coursesID,articleTitle, articleDes,articlelink) VALUES (7,'Java Tutorial','Our core Java programming tutorial is designed for students and working professionals. Java is an object-oriented, class-based, concurrent, secured and general-purpose computer-programming language. It is a widely used robust technology.

What is Java?

Java is a programming language and a platform. Java is a high level, robust, object-oriented and secure programming language.

Java was developed by Sun Microsystems (which is now the subsidiary of Oracle) in the year 1995. James Gosling is known as the father of Java. Before Java, its name was Oak. Since Oak was already a registered company, so James Gosling and his team changed the name from Oak to Java.

Platform: Any hardware or software environment in which a program runs, is known as a platform. Since Java has a runtime environment (JRE) and API, it is called a platform.','https://www.javatpoint.com/java-tutorial');
INSERT INTO article (coursesID,articleTitle, articleDes,articlelink) VALUES (7,'Java ( Wikipedia )','"Java language" redirects here. Not to be confused with Javanese language.
Not to be confused with JavaScript.
Java
Java programming language logo.svg
Paradigm	Multi-paradigm: generic, object-oriented (class-based), functional, imperative, reflective, concurrent
Designed by	James Gosling
Developer	Oracle Corporation
First appeared	May 23, 1995; 26 years ago[1]
Stable release	
Java SE 17[2] Edit this on Wikidata / 14 September 2021; 7 months ago
Typing discipline	Static, strong, safe, nominative, manifest
Filename extensions	.java, .class, .jar, .jmod
Website	oracle.com/java/, www.java.com
Influenced by
CLU,[3] Simula67,[3] Lisp,[3] Smalltalk,[3] Ada 83, C++,[4] C#,[5] Eiffel,[6] Mesa,[7] Modula-3,[8] Oberon,[9] Objective-C,[10] UCSD Pascal,[11][12] Object Pascal[13]
Influenced
Ada 2005, BeanShell, C#, Chapel,[14] Clojure, ECMAScript, Fantom, Gambas,[15] Groovy, Hack,[16] Haxe, J#, Kotlin, PHP, Python, Scala, Seed7, Vala, JavaScript, JS++
 Java Programming at Wikibooks
Java is a high-level, class-based, object-oriented programming language that is designed to have as few implementation dependencies as possible. It is a general-purpose programming language intended to let programmers write once, run anywhere (WORA),[17] meaning that compiled Java code can run on all platforms that support Java without the need to recompile.[18] Java applications are typically compiled to bytecode that can run on any Java virtual machine (JVM) regardless of the underlying computer architecture. The syntax of Java is similar to C and C++, but has fewer low-level facilities than either of them. The Java runtime provides dynamic capabilities (such as reflection and runtime code modification) that are typically not available in traditional compiled languages. As of 2019, Java was one of the most popular programming languages in use according to GitHub,[19][20] particularly for client–server web applications, with a reported 9 million developers.[21]

Java was originally developed by James Gosling at Sun Microsystems and released in May 1995 as a core component of Sun Microsystems Java platform. The original and reference implementation Java compilers, virtual machines, and class libraries were originally released by Sun under proprietary licenses. As of May 2007, in compliance with the specifications of the Java Community Process, Sun had relicensed most of its Java technologies under the GPL-2.0-only license. Oracle offers its own HotSpot Java Virtual Machine, however the official reference implementation is the OpenJDK JVM which is free open-source software and used by most developers and is the default JVM for almost all Linux distributions.

As of March 2022, Java 18 is the latest version, while Java 17, 11 and 8 are the current long-term support (LTS) versions. Oracle released the last zero-cost public update for the legacy version Java 8 LTS in January 2019 for commercial use, although it will otherwise still support Java 8 with public updates for personal use indefinitely. Other vendors have begun to offer zero-cost builds of OpenJDK 8 and 11 that are still receiving security and other upgrades.

Oracle (and others) highly recommend uninstalling outdated and unsupported versions of Java, due to unresolved security issues in older versions.[22] Oracle advises its users to immediately transition to a supported version, such as one of the LTS versions (8, 11, 17).','https://da.wikipedia.org/wiki/Java_(programmeringssprog)');
INSERT INTO article (coursesID,articleTitle, articleDes,articlelink) VALUES (7,'Java Introduction','What is Java?
Java is a popular programming language, created in 1995.

It is owned by Oracle, and more than 3 billion devices run Java.

It is used for:

Mobile applications (specially Android apps)
Desktop applications
Web applications
Web servers and application servers
Games
Database connection
And much, much more!','https://www.w3schools.com/java/java_intro.asp');
INSERT INTO article (coursesID,articleTitle, articleDes,articlelink) VALUES (7,'Learn Java Programming','Java is a powerful general-purpose programming language. It is used to develop desktop and mobile applications, big data processing, embedded systems, and so on. According to Oracle, the company that owns Java, Java runs on 3 billion devices worldwide, which makes Java one of the most popular programming languages.','https://www.programiz.com/java-programming');
INSERT INTO article (coursesID,articleTitle, articleDes,articlelink) VALUES (8,'Process Patterns in Software Engineering','As the software team moves through the software process they encounter problems. It would be very useful if solutions to these problems were readily available so that problems can be resolved quickly. Process-related problems which are encountered during software engineering work, it identifies the encountered problem and in which environment it is found, then it will suggest proven solutions to problem, they all are described by process pattern. By solving problems a software team can construct a process that best meets needs of a project.','https://www.geeksforgeeks.org/process-patterns-in-software-engineering/');
INSERT INTO article (coursesID,articleTitle, articleDes,articlelink) VALUES (8,'Process patterns ( Wikipedia','Process patterns can be defined as the set of activities, actions, work tasks or work products and similar related behaviour followed in a software development life cycle.

Process patterns can be more easily understood by dividing it into terms, Process which means the steps followed to achieve a task and patterns which means the recurrence of same basic features during the lifecycle of a process. Thus in a more universal term process patterns are common or general solution for a complexity.

Typical Examples are:

Customer communication (a process activity).
Analysis (an action).
Requirements gathering (a process task).
Reviewing a work product (a process task).
Design model (a work product).
Process Patterns can be best seen in software design cycle which involves the common stages of development. For example, a generic software design life cycles has following steps:

Communication.
Planning.
Modeling which involves requirement gathering, analysis and design from business perspective.
Development which involves code generation and testing.
Deployment includes the code deployment and testing in the production environment.','https://en.wikipedia.org/wiki/Process_patterns');
INSERT INTO article (coursesID,articleTitle, articleDes,articlelink) VALUES (8,'Process Patterns in Software Engineering: Types & Examples','Managing Complexity

Developing software is a complex business and it gets more so with each passing year. If you disagree, just take a look at the applications available on your cell phone or laptop. These applications have gotten more powerful, provide higher resolution displays, and include more and more features. It is a sign of the times.

It only makes sense that larger, more significant systems would change in a similar fashion. But how do you deal with these changes? How do you implement these larger systems in a consistent, systematic fashion that ensures a high-quality result? One way is to employ process patterns.','https://study.com/academy/lesson/process-patterns-in-software-engineering-types-examples.html');
INSERT INTO article (coursesID,articleTitle, articleDes,articlelink) VALUES (8,'Software Engineering Process Patterns Framework, Assessment and Technology Notes | Study Material','INTRODUCTION TO SOFTWARE ENGINEERING

In a fascinating book that provides an economist’s view of software and software engineering. Howard Baetjer, Jr. comments on the software process:

Because software, like all capital, embodies knowledge, and because that knowledge is initially dispersed, tacit, latent, and incomplete in large measure, software development is a social learning process. The process is a dialogue in which the knowledge that must become the software is brought together and embodied in the software. The process provides interaction between users and designers, between users and evolving tools, and between designers and evolving tools [technology]. It is an iterative process in which the evolving tool itself serves as the medium for communication, with each new round of the dialogue eliciting more useful knowledge from the people involved.

Indeed, building computer software is an iterative learning process, and the outcome, something that Baetjer would call “software capital”, is an embodiment of knowledge collected, distilled, and organized as the process is conducted.

But what exactly is a software process from a technical point of view? Within the context of this book, we define a software process as a framework for the tasks that are required to build high quality software .Is process synonymous with software engineering? The answer is yes and no. a software process defines the approach that is taken as software is engineered. But software engineering also encompasses technologies that populate the process---- technical methods and automated tools.

More important, software engineering is performed by creative, knowledgeable people who should adapt a mature software process that is appropriate for the products they build and the demands of their marketplace.

What is it? When you work to build a product or system, it‘s important to go through a series of predictable steps---- a road map that helps you create a timely, high–quality result. The road map that you follow is called a software process.

Who does it? Software engineers and their managers adapt the process to their needs and then follow it. In addition, the people who have requested the software have a role to play in the process of defining, building, and testing it.

Why is it important? Because it provides stability control, and organization to an activity that can, if left uncontrolled, become quite chaotic. However, a modern software engineering approach must be “agile”. It must demand only those activities, controls, and documentation that are appropriate for the project team and the product that is to be produced.

What are the steps? At a detailed level, the process that you adapt depends on the software that you’re building. One process might be appropriate for creating software for an aircraft avionics system, while an entirely different process would be indicated for the creation of a Web site.

What is the work product? From the point of view of a software engineer, the work products are the programs, documents, and data that are produced as a consequence of the activities and tasks defined by the process.

How do I ensure that I’ve done it right? There are a number of software process assessment mechanisms that enable organizations to determine the “maturity” of their software process. However, the quality, timeliness, and long-term viability of the product you build are the best indicators of the efficacy of the process of the process that you use. 

','http://www.mbaexamnotes.com/software-engineering-process-patterns-framework-assessment-and-technology.html');
INSERT INTO article (coursesID,articleTitle, articleDes,articlelink) VALUES (8,'Modeling Process Patterns and Their Application','Process pattern is an emerging approach for process reuse. Representing process models based on process patterns to explicit process solutions and factor recurrent process constituents is useful for process understanding as well as process modeling. This subject, however, is still a challenge for the software process technology community. In this paper, we present a UML-based process meta-model that allows explicit representation of process patterns in process models. The novel of our proposition is to enable the application of different process knowledge kinds not only for building but also for improving process models.','https://www.researchgate.net/publication/232653352_Modeling_Process_Patterns_and_Their_Application');
INSERT INTO article (coursesID,articleTitle, articleDes,articlelink) VALUES (9,'User Interface & Navigation','Your apps user interface is everything that the user can see and interact with. Android provides a variety of pre-built UI components such as structured layout objects and UI controls that allow you to build the graphical user interface for your app. Android also provides other UI modules for special interfaces such as dialogs, notifications, and menus.','https://developer.android.com/guide/topics/ui');
INSERT INTO article (coursesID,articleTitle, articleDes,articlelink) VALUES (9,'The Importance of User Interface Design in Mobile Applications','Various types of user interfaces for mobile apps

What is meant by usability and why is it important for user interface design?

Know about the importance of user interface design in app development.','https://invozone.com/blog/the-importance-of-user-interface-design-in-mobile-applications/');
INSERT INTO article (coursesID,articleTitle, articleDes,articlelink) VALUES (9,'User Interface Design Principles for Mobile App Development','Mobile applications are the new way of performing most of the activities online. A feature-rich and eye-catching mobile app UI design provides users with the experience they are looking for and boosts engagement. That is why the most crucial aspect of mobile app development is user interface design principles.

To make things easier, you can follow these points and design an excellent user interface for your mobile app.','https://www.fatbit.com/fab/mobile-user-interface-design-principles/');
INSERT INTO article (coursesID,articleTitle, articleDes,articlelink) VALUES (9,'mobile UI (mobile user interface)','A mobile user interface (mobile UI) is the graphical and usually touch-sensitive display on a mobile device, such as a smartphone or tablet, that allows the user to interact with the device’s apps, features, content and functions.

Mobile user interface (UI) design requirements are significantly different from those for desktop computers. The smaller screen size and touch screen controls create special considerations in UI design to ensure usability, readability and consistency. In a mobile interface, symbols may be used more extensively and controls may be automatically hidden until accessed. The symbols themselves must also be smaller and there is not enough room for text labels on everything, which can cause confusion.

Users have to be able to understand a command icon and its meaning whether through legible text or comprehensible graphical representation. Basic guidelines for mobile interface design are consistent across modern mobile operating systems.

Mobile UI design best practices include the following:

The layout of the information, commands, and content in an app should echo those of the operating system in placement, composition and colors. While apps may diverge to some degree in style, consistency on most of these points allows users to intuit or at least quickly learn how use an interface.

Click points must be usable for touch-based selection with a finger. This means a click point cant be too small or narrow in any direction, to avoid unwanted selection of nearby items, sometimes referred to as fat fingering.

Maximize the content window size. On small screens, the UI should not unnecessarily dominate screen size. It’s important to recognize that the object of a UI is to facilitate use of content and apps, not just use of the interface.

The number of controls or commands displayed at any given time should be appropriate to avoid overwhelming the user or making viewing/interacting with content confusing.

It can be challenging to strike a balance between attending to design considerations and dealing with the specific requirements of different apps. Furthermore, an app UI should be customized for each mobile OS, as that is the visual language the device user will be immersed in and typically most familiar with. To that end, mobile OS developers generally provide resources to familiarize UI designers with the way their OS does its interface.','https://www.techtarget.com/searchmobilecomputing/definition/mobile-UI-mobile-user-interface');
INSERT INTO article (coursesID,articleTitle, articleDes,articlelink) VALUES (9,'How to Create a Mobile App Interface Design','Everybody uses mobile applications. Banks, restaurants, and hospitals even have an application of their own. Currently, the number of worldwide smartphone users is 2.53 billion. By 2021, the estimated number will be as high as 2.87 billion.

Almost half of the world’s population is using mobile phones for their daily work. The application’s usability and quick response make it easy for users to utilize apps. Apps have replaced newspapers, TV, radio, and even such tools as Photoshop!

Therefore, the apps interface design has to be made with the utmost precision. It is the design functionality that sets the pace for the users. Do you want to learn how to design your own app? Would you like to discover all peculiarities of iOS and Android user interface design? In this article, we are considering why it’s so important to create an excellent mobile UI design, design peculiarities for various operating systems, and provide the best tips on how to design a mobile app.','https://fireart.studio/blog/how-to-create-a-mobile-app-interface-design/');
INSERT INTO article (coursesID,articleTitle, articleDes,articlelink) VALUES (10,'Data Communication – Definition, Components, Types, Channels','Human beings are the only creatures on the earth who are able to communicate with each other through the medium of language. But humans take this gift to another extent. Distance, time, and physical existence of the person don’t matter in communication these days because they build a communication system through which they can communicate or share data like images, videos, text, files, etc with their loved ones anytime anywhere. Communication is defined as a process in which more than one computer transfers information, instructions to each other and for sharing resources. Or in other words, communication is a process or act in which we can send or receive data. A network of computers is defined as an interconnected collection of autonomous computers. Autonomous means no computer can start, stop or control another computer.','https://www.geeksforgeeks.org/data-communication-definition-components-types-channels/');
INSERT INTO article (coursesID,articleTitle, articleDes,articlelink) VALUES (10,'Data communication ( Wikipedia )','Information collected on wikipedia about Data communication','https://en.wikipedia.org/wiki/Data_communication');
INSERT INTO article (coursesID,articleTitle, articleDes,articlelink) VALUES (10,'Data Communication & Computer Network','Data communications refers to the transmission of this digital data between two or more computers and a computer network or data network is a telecommunications network that allows computers to exchange data. The physical connection between networked computing devices is established using either cable media or wireless media. The best-known computer network is the Internet.

This tutorial should teach you basics of Data Communication and Computer Network (DCN) and will also take you through various advance concepts related to Data Communication and Computer Network.','https://www.tutorialspoint.com/data_communication_computer_network/index.htm');
INSERT INTO article (coursesID,articleTitle, articleDes,articlelink) VALUES (10,'Data Communication – What is Data Communication?','Data communication refers to the exchange of data between a source and a receiver via form of transmission media such as a wire cable. Data communication is said to be local if communicating devices are in the same building or a similarly restricted geographical area.

The meanings of source and receiver are very simple. The device that transmits the data is known as source and the device that receives the transmitted data is known as receiver. Data communication aims at the transfer of data and maintenance of the data during the process but not the actual generation of the information at the source and receiver. 

Datum mean the facts information statistics or the like derived by calculation or experimentation. The facts and information so gathered are processed in accordance with defined systems of procedure. Data can exist in a variety of forms such as numbers, text, bits and bytes. The Figure is an illustration of a simple data communication system.','https://ecomputernotes.com/computernetworkingnotes/communication-networks/what-is-data-communication');
INSERT INTO article (coursesID,articleTitle, articleDes,articlelink) VALUES (10,'What Does Data Communications (DC) Mean?','Data communications (DC) is the process of using computing and communication technologies to transfer data from one place to another, or between participating parties.

DC enables the movement of electronic or digital data between two or more network nodes, regardless of geographical location, technological medium or data contents.','https://www.techopedia.com/definition/6765/data-communications-dc');





CREATE TABLE  video(
  id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  coursesID BIGINT NOT NULL,
  videoTitle TEXT (45),
  videoDes  longtext,
  videoId VARCHAR(2083),
  INDEX (coursesID),
  
  FOREIGN KEY (coursesID) REFERENCES courses(coursesID) ON DELETE CASCADE
  
)ENGINE=INNODB;

INSERT INTO video (coursesID,videoTitle, videoDes,videoId) VALUES (1,'Introduction to complex numbers | Imaginary and complex numbers | Precalculus ','Precalculus on Khan Academy: You may think that precalculus is simply the course you take before calculus. You would be right, of course, but that definition does not mean anything unless you have some knowledge of what calculus is. Let us keep it simple, shall we? Calculus is a conceptual framework which provides systematic techniques for solving problems. These problems are appropriately applicable to analytic geometry and algebra. Therefore....precalculus gives you the background for the mathematical concepts, problems, issues and techniques that appear in calculus, including trigonometry, functions, complex numbers, vectors, matrices, and others. There you have it ladies and gentlemen....an introduction to precalculus!','SP-YJe7Vldo');
INSERT INTO video (coursesID,videoTitle, videoDes,videoId) VALUES (1,'Geometric Algebra in 2D - Fundamentals and Another Look at Complex Numbers','In this video, I introduce some of the concepts of geometric (Clifford) algebra, focusing on two-dimensional space (R^2). We will talk about the wedge (exterior) product, review the dot product, and introduce the geometric product. We will see that a new mathematical object, the bivector, arises from considering the wedge product. Furthermore, we are going to see that this bivector behaves like an imaginary unit in that it squares to -1. Since it has this property, it naturally relates to vector rotation in 2D, like the complex numbers.','PNlgMPzj-7Q');
INSERT INTO video (coursesID,videoTitle, videoDes,videoId) VALUES (1,'The geometric view of COMPLEX NUMBERS','This video is all about the geometric side, and how we can plot complex numbers using something called Argand Diagrams. We will look at how we can multiply complex numbers and see the interesting phenomena that multiplying by i is equivalent to rotation in the complex plane. We will then see how we can take a look analogous to polar coordinates and write complex numbers as R(cos(alpha)+isin(alpha)), and then when we multiply using some trig identities we can see how nicely the rotational components add. In episode 3 of this series, we will reinterpret this using polar coorindates','HrvEkftPZpw');
INSERT INTO video (coursesID,videoTitle, videoDes,videoId) VALUES (1,'Complex Numbers - Basic Operations','his algebra 2 video tutorial explains how to perform operations using complex numbers such as simplifying radicals, adding and subtracting complex numbers, simplifying it in standard form, graphing complex numbers and calculating the absolute value of complex numbers.  This video contains plenty of examples and practice problems.  It is useful for students taking algebra 2, precalculus or college algebra.

Here is a list of topics:
1.  Simplifying Radicals and Square Roots - Complex Numbers
2.  Standard Form of Complex Numbers - a+bi
3.  Graphing Complex Numbers - Real vs Imaginary Axis
4.  Adding and Subtracting Complex Numbers
5.  Multiply and Dividing Complex Numbers
6.  Operations With Imaginary Numbers - Addition, Subtraction, Multiplication and Division
7.  Simplifying Complex Numbers With Large Exponents
8.  Absolute Value Formula of Complex Numbers
9.  i, i^2, i^3, and i^4 Values
10.  Complex Numbers - Multiplying By The Conjugate
11.  Complex Imaginary Numbers - Using The Distributive Property
12.  Foiling With Complex Numbers
13.  Solving Quadratic Equations With Complex Imaginary Numbers
14.  Factoring Quadratic Equations With Complex Numbers
15.  Using The Quadratic Formula to Solve Quadratic Equations With Imaginary Solutions
16.  Solving Linear Equations With Complex Numbers
17.  Factoring Quadratic Equations With Fractions
18.  Writing The Quadratic Equation Giving The Complex Roots or Imaginary Solutions / Zeros
19.  Foiling Technique to Find Quadratic Equation Given Complex Numbers
20. Factoring Using Complex Conjugates
21.  Sum and Product of Roots Given Quadratic Equation','OQz1ydBcQSA');
INSERT INTO video (coursesID,videoTitle, videoDes,videoId) VALUES (1,'Complex Numbers - Practice Problems','This algebra video tutorial provides a multiple choice quiz on complex numbers.  It contains plenty of examples and practice problems.

Here is a list of topics:
1.  Absolute Value of Complex Numbers
2.  Adding and Subtracting Complex Numbers
3.  Multiplying Complex Numbers By its Conjugate
4.  Multiplying Complex Numbers With Exponents
5.  Simplifying Complex Numbers
6.  Simplifying Imaginary Numbers
7.  Multiplying Complex Numbers With Radicals and Square Roots
8.  Rationalize The Denominator
9.  Absolute Value of Imaginary Numbers
10.  Dividing Complex Numbers
11.  Solving Equations With Complex Numbers','y2wPAZwZTng');
INSERT INTO video (coursesID,videoTitle, videoDes,videoId) VALUES (2,'Gaussian Elimination & Row Echelon Form','This precalculus video tutorial provides a basic introduction into the gaussian elimination - a process that involves elementary row operations with 3x3 matrices which allows you to solve a system of linear equations with 3 variables.  You need to convert the system of equations into an augmented matrix and use matrix row operations to write it in row echelon form.  Next, you can convert back into a system of linear equations and solve using back substitution.  This video contains plenty of examples and practice problems.  ','eDb6iugi6Uk');
INSERT INTO video (coursesID,videoTitle, videoDes,videoId) VALUES (2,'Gauss Jordan Elimination & Reduced Row Echelon Form','This precalculus video tutorial provides a basic introduction into the gauss jordan elimination which is a process used to solve a system of linear equations by converting the system into an augmented matrix and using elementary row operations to convert the 3x3 matrix into its reduced row echelon form.  You can easily determine the answers once you convert it to that form.  ','eYSASx8_nyg');
INSERT INTO video (coursesID,videoTitle, videoDes,videoId) VALUES (2,'Intro To Matrix Math (Matrix Algebra Tutor) - Learn how to Calculate with Matrices','In this lesson, the student will learn what a matrix is in algebra and how to perform basic operations on matrices.  We will learn how to do basic matrix math operations by solving example problems.','94mdM-OcjLg');
INSERT INTO video (coursesID,videoTitle, videoDes,videoId) VALUES (2,'Intro to Matrices','This precalculus video tutorial provides a basic introduction into matrices.  It covers matrix notation and how to determine the order of a matrix and the value of the elements inside a matrix.  This video also covers the addition and subtraction of matrices as well as the scalar multiplication of matrices.','yRwQ7A6jVLk');
INSERT INTO video (coursesID,videoTitle, videoDes,videoId) VALUES (2,'Multiplying Matrices','This precalculus video tutorial provides a basic introduction into multiplying matrices.  It explains how to tell if you can multiply two matrices together and how to determine the order of the new matrix.  The order of the new matrix is based on the rows of the first matrix and the number of columns in the second matrix.  To multiply two matrices together, multiply the rows of the first matrix by the columns of the second matrix and find the sum of the products.  This video contains plenty of examples and practice problems on matrix multiplication. ','vzt9c7iWPxs');
INSERT INTO video (coursesID,videoTitle, videoDes,videoId) VALUES (3,'Top 10 Project Management Software 2022','Project management software helps teams plan and organize their days. From managing dashboards to board views, project tools come in many shapes and sizes. We have shortlisted the best all-round project management apps and software on the market right now. ','z9KjqfpR9XI');
INSERT INTO video (coursesID,videoTitle, videoDes,videoId) VALUES (3,'Project Management Tutorial ( Complete Course )','ABOUT THIS COURSE:
Prepare for a new career in the high-growth field of project management, no experience or degree required. Get professional training designed by Google and get on the fastrack to a competitively paid job. There are 475,100 U.S. job openings in project management with a $59,000 average entry-level salary.¹

Project managers are natural problem-solvers. They set the plan and guide teammates, and manage changes, risks, and stakeholders.

Over 6 courses, gain in-demand skills that will prepare you for an entry-level job. Learn from Google employees whose foundations in project management served as launchpads for their own careers. At under 10 hours per week, you can complete in less than six months. ','t7EYicEBfdQ');
INSERT INTO video (coursesID,videoTitle, videoDes,videoId) VALUES (3,'Software Project Management','Introduction to Software project management','w9BSk8MGOGM');
INSERT INTO video (coursesID,videoTitle, videoDes,videoId) VALUES (3,'Software Project Management: How To Manage a Software Development Project','Are you trying to build the right product but can’t seem to figure it out? Here is some software project management help! In this video, I want to share my strategy for how to manage a software project and get things done on time and on budget.','Y7sJwlyuoWw');
INSERT INTO video (coursesID,videoTitle, videoDes,videoId) VALUES (3,'Software Project Management - Why it is Different!
','The process used in software development differs from traditional PM! ','TYBVAvWkG6M');

INSERT INTO video (coursesID,videoTitle, videoDes,videoId) VALUES (4,'React Hooks Course', 'Learn all the different react hooks and theyre functionality','LlvBzyy-558');
INSERT INTO video (coursesID,videoTitle, videoDes,videoId) VALUES (4,'Learn HTML5 and CSS3 From Scratch', 'HTML and CSS are essential skills to have for a career in web development.

In this course we will cover both languages from the scratch and by the end of the course you will be creating your own projects.

(0:00) Intro
(2:47) What is HTML
(5:11) Google Chrome and Visual Studio Code
(6:02) Download Google Chrome
(8:11) Download Visual Studio Code
(13:58) Create A Project
(16:09) First Webpage
(20:35) Visual Code Settings
(22:48) Download Live Server Extension
(26:59) Basic HTML Document Structure
(29:05) Implementing Basic Document Structure
(34:50) Word Wrap and Emmet
(40:24) Heading Elements
(44:33) Paragraph Elements
(47:50) White Space Collapsing
(49:22) Lorem Ipsum Dummy Text
(51:17) Images
(57:15) Multiple Path Options
(1:00:06) External Images
(1:02:43) Nice Images
(1:05:49) Width and Height Attribute
(1:08:40) Crop Images
(1:12:07) Proper Path
(01:15:37) Comments And Line Breaks
(01:19:47) External Links
(01:23:32) Internal Links
(01:25:53) Links Within Page
(01:30:10) Empty Links
(01:32:39) Sup And Sub Elements
(01:34:39) Strong And Em Elements
(01:37:02) Special Characters In Html
(01:38:58) Unordered Lists
(01:41:25) Ordered Lists
(01:42:18) Nested Lists
(01:43:57) Table Element
(01:46:10) Forms - Input And Submit Elements
(01:58:12) Forms - Textarea - Radio - Checkbox
(02:09:40) Prettier And Code Formatter
(02:14:56) Keyboard Shortcuts
(02:26:06) External Resources - Head Element
(02:30:15) Html Project Intro
(02:32:16) Project Setup
(02:35:17) Download Images
(02:39:02) Logo, Heading, Navigation
(02:42:51) Home Page Completed
(02:54:30) About Page
(02:58:09) Numbers Page
(03:04:14) Contact Page
(03:09:11) Resource Files
(03:09:42) Text Editor Setup
(03:16:03) Css Intro
(03:17:35) Workspace Setup
(03:20:22) Inline Css
(03:23:40) Course Resources
(03:25:01) Internal Css
(03:28:00) External Css
(03:39:40) Power Struggle
(03:44:17) Basic Css Syntax
(03:52:27) Element Selectors
(03:55:15) Grouping Selectors
(03:57:27) Id Selectors
(04:02:09) Class Selectors
(04:06:17) Id And Class Selector Summary
(04:08:30) Div And Span Elements
(04:16:44) CSS Inheritance
(04:20:08) More Info On Inheritance
(04:22:30) Last Rule, Specificity, Universal Selector
(04:27:33) Colors Intro
(04:28:13) Color And Background-Color Properties
(04:32:33) Color Names
(04:33:30) Rgb
(04:37:46) Rgba
(04:44:33) Hex
(04:50:58) Vs-Code Color Options
(04:52:57) External Resources
(04:55:39) Units Intro
(04:56:18) Pixels, Font-Size, Width, Height
(05:02:13) Percent Values
(05:05:44) Em Values
(05:11:42) Rem Values
(05:14:41) VH And VW
(05:19:14) Default Browser Syles
(05:29:07) Calc Function
(05:33:38) Typography Intro
(05:34:07) Font-Family
(05:36:47) Font-Stack Generic Fonts
(05:39:23) Google Fonts
(05:46:00) Font-Weight Font-Style
(05:53:30) Text-Align And Text-Indent
(05:56:52) More Text Properties
(06:04:31) Box-Model Intro
(06:04:53) Padding
(06:13:28) Margin
(06:19:01) Border
(06:23:57) Border-Radius, Negative Margin
(06:27:24) Outline Property
(06:34:58) Display Property Intro
(06:35:19) Display Property
(06:43:26) Basic Horizontal Centering
(06:48:11) Mobile Navbar Example
(06:58:29) Box-Sizing Border-Box
(07:06:46) Display Inline-Block
(07:09:29) Display:none, Opacity, Visibility
(07:16:20) Background-Image Intro
(07:16:43) Background Images Setup
(07:19:43) Background-Image-Property
(07:27:45) Background-Repeat
(07:34:07) Background-Size
(07:36:58) Background-Position
(07:41:18) Background-Attachment
(07:47:04) Linear-Gradients
(07:56:49) Background Image Shortcuts Combined
(08:06:56) Linear-Gradient Colorzilla
(08:11:08) Float Position Intro
(08:11:47) Float Property
(08:19:18) Float Property Column Layout Example
(08:25:59) Position Static
(08:30:44) Position Relative
(08:33:18) Position Absolute
(08:38:42) Position Fixed
(08:42:30) Media Quries
(08:57:07) Z-Index
(09:06:04) ::Before And ::After Pseudo Elements
(09:27:14) Css Selectors Intro
(09:28:26) Basic Selectors
(09:31:07) Descendant Child Selectors
(09:35:50) First Line And First Letter
(09:36:56) :Hover Pseudo-Class Selector
(09:40:03) Link Pseudo-Class Selectors
(09:44:36) Root Preudo-Class Selectors
(09:51:01) Transform,Transition,And Animations
(09:52:17) Transform:transition()
(09:58:52) Transform:scale()
(10:01:20) Transform:rotate()
(10:04:47) Transform:skew()
(10:06:31) Transition Property
(10:09:13) Multiple Transition
(10:11:11) Transition Delay
(10:16:36) Transition-Timing Function
(10:25:51) Animation
(10:35:51) Animation-Fill-Mode
(10:40:53) Last Module Intro
(10:41:32) Css Variables
(10:56:19) Font-Awesome Icons
(11:07:55) Text-Shadow Box-Shadow
(11:14:44) Browser Prefixes
(11:19:23) Semantic Tags
(11:24:11) Emmet Workflow','mU6anWqZJcc');
INSERT INTO video (coursesID,videoTitle, videoDes,videoId) VALUES (4,'JavaScript Crash Course For Beginners', 'In this crash course we will go over the fundamentals of JavaScript including more modern syntax like classes, arrow functions, etc. This is the starting point on my channel for learning JS.','hdI2bqOjy3c');
INSERT INTO video (coursesID,videoTitle, videoDes,videoId) VALUES (4,'JavaScript Fundamentals For Beginners','This is a mini-course on the fundamentals of not only JavaScript, but programming in general. We will cover the following...

What is JavaScript?
Variables & Data Types
Loops
Arrays
Objects
Functions
Conditionals - If Statements, switches
Events
Forms & Validation','vEROU2XtPR8');
INSERT INTO video (coursesID,videoTitle, videoDes,videoId) VALUES (5,'Git Tutorial Part 1: What is Version Control?','','9GKpbI1siow');
INSERT INTO video (coursesID,videoTitle, videoDes,videoId) VALUES (5,'Git Tutorial Part 2: Vocab (Repo, Staging, Commit, Push, Pull)','','n-p1RUmdl9M');
INSERT INTO video (coursesID,videoTitle, videoDes,videoId) VALUES (5,'Git Tutorial Part 3: Installation, Command-line & Clone','','UFEby2zo-9E');
INSERT INTO video (coursesID,videoTitle, videoDes,videoId) VALUES (5,'Git Tutorial Part 4: GitHub (Pushing to a Server)','','ol_UCWox9kc');
INSERT INTO video (coursesID,videoTitle, videoDes,videoId) VALUES (5,'Git & GitHub Crash Course For Beginners','In this Git tutorial we will talk about what exactly Git is and we will look at and work with all of the basic and most important commands such as add, commit, status, push and more. This tutorial is very beginner friendly.','SWYqp7iY_Tc');
INSERT INTO video (coursesID,videoTitle, videoDes,videoId) VALUES (5,'What Is Version Control? | Git Version Control | Version Control In Software Engineering|','This video on Version Control will help you learn the basics of a Version Control System. To have a better understanding of the system, we will go through a use case. To understand the industrial applicability, we will look at some of the Version Control System benefits. Towards the end, we shall also see the best Version Control Systems in the market today.','Yc8sCSeMhi4');
INSERT INTO video (coursesID,videoTitle, videoDes,videoId) VALUES (6,'Java Tutorial for Beginners','TABLE OF CONTENTS 

0:00:00 Introduction 
0:01:46 Installing Java
0:03:59 Anatomy of a Java Program 
0:08:41 Your First Java Program 
0:15:59 Cheat Sheet 
0:16:29 How Java Code Gets Executed 
0:22:54 Course Structure
0:25:22 Types
0:25:57 Variables
0:29:07 Primitive Types
0:34:27 Reference Types
0:39:15 Primitive Types vs Reference Types 
0:43:39 Strings
0:50:42 Escape Sequences 
0:53:22 Arrays
0:58:47 Multi-Dimensional Arrays 
1:01:23 Constants
1:03:15 Arithmetic Expressions 
1:07:18 Order of Operations 
1:08:40 Casting
1:15:08 The Math Class 
1:19:50 Formatting Numbers 
1:25:40 Reading Input
1:30:45 Project: Mortgage Calculator 
1:32:55 Solution: Mortgage Calculator 
1:37:14 Types Summary
1:38:43 Control Flow 
1:39:30 Comparison Operators 
1:41:16 Logical Operators
1:45:52 If Statements
1:50:18 Simplifying If Statements 
1:53:47 The Ternary Operator
1:56:16 Switch Statements
2:00:07 Exercise: FizzBuzz
2:06:05 For Loops
2:09:53 While Loops
2:14:19 Do...While Loops
2:15:36 Break and Continue
2:18:52 For-Each Loop
2:21:59 Project: Mortgage Calculator 
2:23:27 Solution: Mortgage Calculator 
2:28:28 Control Flow Summary 
2:29:25 Clean Coding','eIrMbAQSU34'); 

INSERT INTO video (coursesID,videoTitle, videoDes,videoId) VALUES (6,'Learn Java 8 - Full Tutorial for Beginners','beginners.

⭐️Contents ⭐️

⌨️ (0:00:00)  1 - Basic Java keywords explained
⌨️ (0:21:59)  2 - Basic Java keywords explained - Coding Session
⌨️ (0:35:45)  3 - Basic Java keywords explained - Debriefing
⌨️ (0:43:41)  4 - Packages, import statements, instance members, default constructor
⌨️ (0:59:01)  5 - Access and non-access modifiers
⌨️ (1:11:59)  6 - Tools: IntelliJ Idea, Junit, Maven
⌨️ (1:22:53)  7 - If/else statements and booleans
⌨️ (1:42:20)  8 - Loops: for, while and do while loop
⌨️ (1:56:57)  9 - For each loop and arrays
⌨️ (2:14:21)  10 - Arrays and enums
⌨️ (2:41:37)  11 - Enums and switch statement
⌨️ (3:07:21)  12 - Switch statement cont.
⌨️ (3:20:39)  13 - Logging using slf4j and logback
⌨️ (3:51:19)  14 - Public static void main
⌨️ (4:11:35)  15 - Checked and Unchecked Exceptions
⌨️ (5:05:36)  16 - Interfaces
⌨️ (5:46:54)  17 - Inheritance
⌨️ (6:20:20)  18 - Java Object finalize() method
⌨️ (6:36:57)  19 - Object clone method.      [No lesson 20]
⌨️ (7:16:04)  21 - Number ranges, autoboxing, and more
⌨️ (7:53:00)  22 - HashCode and Equals
⌨️ (8:38:16)  23 - Java Collections
⌨️ (9:01:12)  24 - ArrayList','grEKMHGYyns');
INSERT INTO video (coursesID,videoTitle, videoDes,videoId) VALUES (6,'How To Master Java - Java for Beginners Roadmap','In this java tutorial I am going to share with you the Java roadmap you need to master Java.','TE3LyYW-AHQ');
INSERT INTO video (coursesID,videoTitle, videoDes,videoId) VALUES (6,'Learn Java in 14 Minutes (seriously)','Learn Java quickly by watching this video to the very end. If you do, you will walk away as a better java programmer :)

Here is how to learn java in 13 minutes, for beginners. Ihave been programming for 8+ years and learning java was very difficult for me. I want to make it as easy as possible for you to learn java quick and easy!  Hopefully, what you have learned in this video on how to learn java quickly can help you out.

In this java tutorial, I go over:
Compiling, keywords, symbols, storing data, primitive types, Strings,  printing text, objects, classes, methods, calling code between files, import, logic, if/else, for loops, nested loops, while loops, try catch, apis, and a few other areas. 

Learning java tricky at first... But SURELY you will get it :) If you followed along, congrats! You learned-by-doing!

I hope you enjoyed this video to learn java in 13 minutes, I tried to get everything I could in the shortest amount of time for you! I like to have a nice mix of java tutorials and actual java projects for you all :)

Was this able to help you learn java?','RRubcjpTkks');
INSERT INTO video (coursesID,videoTitle, videoDes,videoId) VALUES (7,'Java Tutorial for Beginners','TABLE OF CONTENTS 

0:00:00 Introduction 
0:01:46 Installing Java
0:03:59 Anatomy of a Java Program 
0:08:41 Your First Java Program 
0:15:59 Cheat Sheet 
0:16:29 How Java Code Gets Executed 
0:22:54 Course Structure
0:25:22 Types
0:25:57 Variables
0:29:07 Primitive Types
0:34:27 Reference Types
0:39:15 Primitive Types vs Reference Types 
0:43:39 Strings
0:50:42 Escape Sequences 
0:53:22 Arrays
0:58:47 Multi-Dimensional Arrays 
1:01:23 Constants
1:03:15 Arithmetic Expressions 
1:07:18 Order of Operations 
1:08:40 Casting
1:15:08 The Math Class 
1:19:50 Formatting Numbers 
1:25:40 Reading Input
1:30:45 Project: Mortgage Calculator 
1:32:55 Solution: Mortgage Calculator 
1:37:14 Types Summary
1:38:43 Control Flow 
1:39:30 Comparison Operators 
1:41:16 Logical Operators
1:45:52 If Statements
1:50:18 Simplifying If Statements 
1:53:47 The Ternary Operator
1:56:16 Switch Statements
2:00:07 Exercise: FizzBuzz
2:06:05 For Loops
2:09:53 While Loops
2:14:19 Do...While Loops
2:15:36 Break and Continue
2:18:52 For-Each Loop
2:21:59 Project: Mortgage Calculator 
2:23:27 Solution: Mortgage Calculator 
2:28:28 Control Flow Summary 
2:29:25 Clean Coding','eIrMbAQSU34');
INSERT INTO video (coursesID,videoTitle, videoDes,videoId) VALUES (7,'Java Full Course -Learn to code today','⭐️Time Stamps⭐️ 
#1   (00:00:00)  Java tutorial for beginners ☕
#2   (00:20:26)  variables ❌   
#3   (00:32:58)  swap two variables 💱
#4   (00:36:42)  user input ⌨️
#5   (00:44:40)  expressions 🧮
#6   (00:49:13)  GUI intro 🚩   
#7   (00:55:01)  Math class 📐   
#8   (01:01:08)  random numbers 🎲
#9   (01:05:39)  if statements 🚧
#10 (01:11:51)  switches ⬇
#11 (01:16:36)  logical operators ❗
#12 (01:24:33)  while loop 🔄
#13 (01:28:13)  for loop ➰
#14 (01:32:23)  nested loops ➿
#15 (01:38:28)  arrays 🚗
#16 (01:44:54)  2D arrays 🚚
#17 (01:52:59)  String methods 💬
#18 (01:59:18)  wrapper classes 🎁
#19 (02:06:30)  ArrayList 🧾
#20 (02:11:02)  2D ArrayList 📜
#21 (02:17:35)  for-each loop 🔃
#22 (02:21:20)  methods 📞
#23 (02:32:24)  overloaded methods ☎️
#24 (02:38:03)  printf 🖨️
#25 (02:49:25)  final keyword ⛔
#26 (02:51:24)  objects (OOP) ☕
#27 (03:01:36)  constructors 👷
#28 (03:11:36)  variable scope 🌍
#29 (03:16:39)  overloaded constructors 🍕
#30 (03:24:04)  toString method 🎉
#31 (03:30:08)  array of objects 🍱
#32 (03:35:48)  object passing 🏬
#33 (03:40:27)  static keyword ⚡
#34 (03:48:10)  inheritance 👪
#35 (03:53:45)  method overriding 🙅‍♂️
#36 (03:57:33)  super keyword 🦸‍♂️
#37 (04:05:06)  abstraction 👻
#38 (04:10:01)  access modifiers 🔒
#39 (04:19:39)  encapsulation 💊
#40 (04:27:30)  copy objects 🖨️
#41 (04:34:03)  interface 🦅
#42 (04:41:19)  polymorphism 🏁
#43 (04:46:55)  dynamic polymorphism ✨
#44 (04:55:13)  exception handling ⚠️
#45 (05:02:31)  File class 📁
#46 (05:09:15)  FileWriter (write to a file) 📝
#47 (05:12:30)  FileReader (read a file) 📖
#48 (05:17:04)  audio 🔊
#49 (05:27:34)  GUI 🖼️
#50 (05:39:41)  labels 👨‍💻
#51 (05:57:01)  panels 🟥
#52 (06:09:57)  buttons 🛎️
#53 (06:23:50)  BorderLayout 🧭
#54 (06:34:53)  FlowLayout 🌊
#55 (06:42:21)  GridLayout 🔳
#56 (06:47:12)  LayeredPane 📚
#57 (06:55:20)  open a new GUI window 🗔
#58 (07:05:39)  JOptionPane 🛑
#59 (07:17:30)  textfield 📛
#60 (07:27:01)  checkbox ✔️
#61 (07:35:23)  radio buttons 🔘
#62 (07:45:42)  combobox 📑
#63 (07:55:37)  slider 🌡️
#64 (08:08:08)  progress bar 📊
#65 (08:18:46)  menubar 🗄️
#66 (08:33:27)  select a file 🔎
#67 (08:42:25)  color chooser 🎨
#68 (08:48:45)  KeyListener 🚀
#69 (09:01:21)  MouseListener 🖱️
#70 (09:12:32)  drag and drop 👈
#71 (09:26:48)  key bindings ⌨️
#72 (09:38:57)  2D graphics 🖍️
#73 (09:58:33)  2D animation 👾
#74 (10:15:14)  generics ❓
#75 (10:36:43)  serialization 🥣
#76 (10:57:21)  TimerTask ⌚
#77 (11:08:36)  threads 🧵
#78 (11:24:01)  multithreading 🧶
#79 (11:38:44)  packages 📦
#80 (11:42:49)  compile/run command prompt 💽
#81 (11:50:51)  executable (.jar) ☕','xk4_1vDrzzo');
INSERT INTO video (coursesID,videoTitle, videoDes,videoId) VALUES (7,'Learn Java 8 - Full Tutorial for Beginners','⭐️Contents ⭐️

⌨️ (0:00:00)  1 - Basic Java keywords explained
⌨️ (0:21:59)  2 - Basic Java keywords explained - Coding Session
⌨️ (0:35:45)  3 - Basic Java keywords explained - Debriefing
⌨️ (0:43:41)  4 - Packages, import statements, instance members, default constructor
⌨️ (0:59:01)  5 - Access and non-access modifiers
⌨️ (1:11:59)  6 - Tools: IntelliJ Idea, Junit, Maven
⌨️ (1:22:53)  7 - If/else statements and booleans
⌨️ (1:42:20)  8 - Loops: for, while and do while loop
⌨️ (1:56:57)  9 - For each loop and arrays
⌨️ (2:14:21)  10 - Arrays and enums
⌨️ (2:41:37)  11 - Enums and switch statement
⌨️ (3:07:21)  12 - Switch statement cont.
⌨️ (3:20:39)  13 - Logging using slf4j and logback
⌨️ (3:51:19)  14 - Public static void main
⌨️ (4:11:35)  15 - Checked and Unchecked Exceptions
⌨️ (5:05:36)  16 - Interfaces
⌨️ (5:46:54)  17 - Inheritance
⌨️ (6:20:20)  18 - Java Object finalize() method
⌨️ (6:36:57)  19 - Object clone method.      [No lesson 20]
⌨️ (7:16:04)  21 - Number ranges, autoboxing, and more
⌨️ (7:53:00)  22 - HashCode and Equals
⌨️ (8:38:16)  23 - Java Collections
⌨️ (9:01:12)  24 - ArrayList','grEKMHGYyns');
INSERT INTO video (coursesID,videoTitle, videoDes,videoId) VALUES (7,'How To Master Java - Java for Beginners Roadmap','In this java tutorial I am going to share with you the Java roadmap you need to master Java.','TE3LyYW-AHQ');
INSERT INTO video (coursesID,videoTitle, videoDes,videoId) VALUES (7,'Learn Java in 14 Minutes (seriously)','Learn Java quickly by watching this video to the very end. If you do, you will walk away as a better java programmer :)

Here is how to learn java in 13 minutes, for beginners. Ihave been programming for 8+ years and learning java was very difficult for me. I want to make it as easy as possible for you to learn java quick and easy!  Hopefully, what you have learned in this video on how to learn java quickly can help you out.

In this java tutorial, I go over:
Compiling, keywords, symbols, storing data, primitive types, Strings,  printing text, objects, classes, methods, calling code between files, import, logic, if/else, for loops, nested loops, while loops, try catch, apis, and a few other areas. 

Learning java tricky at first... But SURELY you will get it :) If you followed along, congrats! You learned-by-doing!

I hope you enjoyed this video to learn java in 13 minutes, I tried to get everything I could in the shortest amount of time for you! I like to have a nice mix of java tutorials and actual java projects for you all :)

Was this able to help you learn java?','RRubcjpTkks');
INSERT INTO video (coursesID,videoTitle, videoDes,videoId) VALUES (8,'','','');
INSERT INTO video (coursesID,videoTitle, videoDes,videoId) VALUES (8,'','','');
INSERT INTO video (coursesID,videoTitle, videoDes,videoId) VALUES (8,'Learn Java 8 - Full Tutorial for Beginners','hello','grEKMHGYyns');
INSERT INTO video (coursesID,videoTitle, videoDes,videoId) VALUES (8,'Process Patterns In Software Engineering |SE|','','cwbOHMedsEY');
INSERT INTO video (coursesID,videoTitle, videoDes,videoId) VALUES (8,'10 Design Patterns Explained in 10 Minutes','Software design patterns help developers to solve common recurring problems with code. Lets explore 10 patterns from the famous Gang of Four book and implement them with JavaScript and TypeScript ','v-_1er1mWI');
INSERT INTO video (coursesID,videoTitle, videoDes,videoId) VALUES (9,'Android Studio For Beginners','This video will demonstrate (1) how to setup a project in Android Studio, (2) how to navigate within Android Studio to build a simple Android application, and (3) how to debug and run an Android app.','FlPARW5IX8');
INSERT INTO video (coursesID,videoTitle, videoDes,videoId) VALUES (9,'Android Development for Beginners - Full Course ( Part 1 )','Learn how to develop an android app from scratch in this full course for beginners. No prior programming experience required!','fis26HvvDII');
INSERT INTO video (coursesID,videoTitle, videoDes,videoId) VALUES (9,'Android Development for Beginners - Full Course ( Part 2 )','This is part 2 of a 15-hour course to learn Android app development.','RcSHAkpwXAQ&t=0s');
INSERT INTO video (coursesID,videoTitle, videoDes,videoId) VALUES (9,'How to Become a Mobile Developer in 2021','To start a career in mobile development, should you learn Native Android/iOS development or a cross-platform technology such as React-Native? Where do you start learning mobile development? How do you land your first mobile dev job? In this video, I touch on all these topics and more. 
','WvwwL0TwH6U');
INSERT INTO video (coursesID,videoTitle, videoDes,videoId) VALUES (9,'Mobile Application Development- User Interface (UI Elements in Android)','This particular channel is designed for the MOBILE APPLICATION DEVELOPMENT USING ANDROID. ','Wu8esI1j28w');
INSERT INTO video (coursesID,videoTitle, videoDes,videoId) VALUES (10,'Network Protocols & Communications (Part 1)','Computer Networks: Network Protocols and Communications in Computer Networks
Topics discussed:
1) Data Communication.
2) Simplex Data Flow.
3) Half Duplex Data Flow.
4) Duplex Data Flow.
5) Protocols in Computer Networks.
6) Unicasting, Multicasting, and Broadcasting.','ly8ikWtAY7s');
INSERT INTO video (coursesID,videoTitle, videoDes,videoId) VALUES (10,'Network Protocols & Communications (Part 2)','Topics discussed:
1) Devices or Nodes.
2) Media, Cables, and Waves.
3) Services.','iE_kY2LVBKA');
INSERT INTO video (coursesID,videoTitle, videoDes,videoId) VALUES (10,'Networking basics (2020) | What is a switch, router, gateway, subnet, gateway, firewall & DMZ','Networking basics (2020) | What is a switch, router, gateway, subnet, gateway, firewall & DMZ','_IOZ8_cPgu8');
INSERT INTO video (coursesID,videoTitle, videoDes,videoId) VALUES (10,'OSI Model Explained | OSI Animation | Open System Interconnection Model | OSI 7 layers | TechTerms','Learn computer network layers or OSI layers in a computer network, OSI Model, OSI reference model or open system interconnection model or networking model including Application Layer, Presentation Layer, Session Layer, Transport Layer, Network Layer, Data Link Layer and Physical layer. Definition, Function, and use of the OSI network model. Protocols in computer network layers of OSI model.','vv4y_uOneC0');
INSERT INTO video (coursesID,videoTitle, videoDes,videoId) VALUES (10,'Data Communication in Networking | Components of Data Communication','','QFjAY6yzMgo');


CREATE TABLE  document(
  id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  coursesID BIGINT NOT NULL,
  documentDes TEXT,
  INDEX (coursesID),

  FOREIGN KEY (coursesID) REFERENCES courses(coursesID) ON DELETE CASCADE
  	
)ENGINE=INNODB;

INSERT INTO document (coursesID, documentDes) VALUES (1, 'Read what i wrote 1');
INSERT INTO document (coursesID, documentDes) VALUES (2, 'Read what i wrote 2');
INSERT INTO document (coursesID, documentDes) VALUES (3, 'Read what i wrote 3');
INSERT INTO document (coursesID, documentDes) VALUES (1, 'Read what i wrote 4');
INSERT INTO document (coursesID, documentDes) VALUES (2, 'Read what i wrote 5');
INSERT INTO document (coursesID, documentDes) VALUES (3, 'Read what i wrote 6');


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Course.delete_all

Course.create!(
    code:   'CSE1100',
    title:  'Computer Fundamentals and Ethics',
    description:    %{<p>Computer Fundamentals: Introduction to Computer Basics, Types and Generation of
    Computers; Basic Organization and Functional Units.</p>
    <p>Hardware: Basic Units of Computer Hardware; Processors; Input, Output and Memory
    Devices; Keyboard; Mouse; OMR; OCR; MICR; CD-ROM; Printers; CRT; LCD; LED;
    Microfilm; Floppy.</p>
    <p>Software: Types of Software; System Software: Familiarization with Various Operating
    Systems (Windows, DOS, UNIX, Android, IOS Etc.); Application Software: Text
    Processing (MS-WORD, etc); Spread Sheet (MS-EXCEL etc).</p>
    <p>Language: Machine Language; Assembly Language; High Level Language; Assembler;
    Translator; Interpreter and Compiler.<p>
    <p>Database Management: Introduction of Data, Information and Management; Studying
    Various Tools like Foxpro, MS Access, Oracle etc; Mathematical and Simulation (Math
    Cad, Matlab etc.); Data Communications and Internet.</p>
    <p>Computer Ethics: Computers in the Workplace; Computer Crime; Rules of
    Communications; Privacy; Intellectual Property; Impact on Employment; Professional
    Responsibility; Globalization.</p>},
    prerequisite:   '',
    credit: 1.50,
    days:   40
)

Course.create!(
    code:   'CSE2201',
    title:  'Computer Algorithms',
    description:   %{<p>Asymptotic Notations: Complexity Analysis of Algorithms, Worst Case, Best Case and
    Average Case.</p>
    <p>Sorting Algorithms: Divide and Conquer Approach, Merge Sort and Quick Sort
    Algorithm, Complexity Analysis, Worst and Average Case Analysis, Heap Construction
    Algorithm, Heap Sort, Application of Heap: Priority Queue, Decision Tree Model and
    (Worst Case) Lower Bound on Sorting, Sorting in Linear Time - Radix Sort, Bucket Sort,
    Counting Sort, etc.</p>
    <p>Graph Algorithms: Representation of Graphs, Breadth First Search, Depth First Search,
    Minimum Spanning Tree, Kruskal and Prims Algorithm.</p>
    <p>Shortest Path: Dijkstra’s Algorithm, Bellman-Ford Algorithm. Floyd Warshall Algorithm.<p>
    <p>Searching Algorithms: Binary Search Trees, Balanced Binary Search Trees, AVL Trees
    and Red-Black Trees, B-Trees, Skip Lists, Hashing. Priority Queues, Heaps, Interval
    Trees. </p>
    <p>Dynamic Programming: Longest Common Subsequence (LCS), Matrix Chain
    Multiplication (MCM), Knapsack Problem, Multistage Graphs.</p>
    <p>Greedy Algorithm: Greedy Algorithm, Activity Selection Problem, Huffman Codes and its
    application, Knapsack problem, Tree Vertex Splitting.</p>
    <p>Recurrences & Backtracking: Recurrences, NP-Hard and NP-Complete Problems,
    Backtracking, n-Queen Problem, Branch and Bounds.</p>},
    prerequisite:   'CSE1100',
    credit: 3.00,
    days:   60
)

Course.create!(
    code:   'Math1117',
    title:  'Calculus and Co-ordinate Geometry',
    description:   %{<p>Differential Calculus: Review of differentiation of various types of functions. Rolle’s theorem, Mean value
    theorem. Taylor’s and Maclaurin’s theorems in finite and infinite forms. Divergency and Convergency of series.
    Partial differentiation, Euler’s theorem. Tangent, normal and curvature. Determination of maximum and minimum
    values of functions and their application.</p>
    <p>Integral Calculus: Review of indefinite and definite integration of various types of functions. Use of definite
    integration in summing series. Walli’s formulae. Improper integrals. Beta function and Gamma functions. Area
    under a plane curve and area of a region enclosed by two curves in cartesian and polar coordinates. Volume and
    surface areas of solids of revolution.</p>
    <p>Co-ordinate Geometry: Co-ordinate geometry of three dimension- System of co-ordinates, 
    transformation of coordinates, distance between two points, section formula, projection, direction 
    cosines, equations of planes and lines.</p>},
    prerequisite:   '',
    credit: 3.00,
    days:   60
)

Course.create!(
    code:   'EEE1101',
    title:  'Electrical Circuits I',
    description:   %{<p>Introduction of electrical power sources, ideal and practical sources, linear
    circuit elements. DC analysis of series, parallel and series-parallel circuits.
    Kirchhoff’s Voltage and current laws, voltage, current, power and energy.
    Sinusoidal wave: Average and effective values, form factor, peak factor,
    phase relation and phasors. Steady state AC analysis of series, parallel and
    series parallel circuits, phase relation between voltage and current, concept
    of impedance, power, power factor, phasor diagram. Network theorems:
    Superposition theorem, Thevenin’s theorem, Norton’s theorem, maximum
    power transfer theorem, substitution theorem and reciprocity theorem.
    Frequency response of ac circuits, resonance phenomena.</p>
    <p>Magnetic circuit and concepts: flux, fields, permeability reluctance, analysis
    of series, parallel and series- parallel magnetic circuit. </p>},
    prerequisite:   '',
    credit: 3.00,
    days:   60
)

Course.create!(
    code:   'EEE2103',
    title:  'Electronics II',
    description:   %{<p>BJT, FET, MOSFET multistage amplifier circuits. Frequency response of
    single stage and multistage amplifiers. Introduction to CMOS and its
    applications.</p>
    <p>Introduction to operational amplifiers: Basic linear and non linear
    applications. Frequency response, bandwidth and other practical limitation
    of op-amps, compensation techniques. Feedback concept, Improvement of
    amplifier characteristics by negative feedback. Classification, analysis of
    feedback amplifier. Sinusoidal oscillators: Concept and its classification.
    Active filters. Negative impedance converters. </p>},
    prerequisite:   'EEE1101',
    credit: 3.00,
    days:   60
)

######################
Department.delete_all
Department.create!(
    name:'CSE',
    description:'Computer Science & Engineering'
)
Department.create!(
    name:'EEE',
    description:'Electrical & Electronic Engineering'
)
Department.create!(
    name:'ECE',
    description:'Electrical & Computer Engineering'
)
Department.create!(
    name:'ME',
    description:'Mechanical Engineering'
)
Department.create!(
    name:'CE',
    description:'Civil Engineering'
)
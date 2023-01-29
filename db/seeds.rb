# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Course.create!(
    code:   'CSE1101',
    title:  'Computer Programming',
    description:    %{<p>Introduction to Computer Programming: Algorithm, Writing, Debugging and Running
    Programs using C/C++ Compiler.</p>
    <p>C/C++ Basics: Different Data Types and their Range, Operator and Operands and its
    Precedence, Input/Output, Conditional Operators, Loops Nested Structure, Error
    Handling, Built-in Functions.</p>
    <p>Functions and Arrays: Writing & Calling of User–defined Functions, Recursive
    Functions, Scope of Variables, Introduction to One-Dimensional Arrays, Multi-Dimensional
    Arrays and Array Manipulation.</p>
    <p>Pointers and Strings: Introduction to Pointers, Pointers and Array, Pointers and
    Functions, String I/O, String-based Built-in Functions, String Operations, Pointer and
    String.</p>
    <p>Files: Introduction to Files in C/C++, Opening, Closing and Updating Binary and
    Sequential Files.</p>
    <p>Advanced Topics: Operations on Bits, Register Variable, Pre-Processors and Graphics
    in C/C++.</p>},
    prerequisite:   '',
    credit: 3.00,
    semester: 1,
    days:   70
)

Course.create!(
    code:   'CSE1102',
    title:  'Sessional based on CSE 1101',
    description:    %{<p>Sessional based on the theory course CSE 1101</p>
    },
    prerequisite:   '',
    credit: 1.50,
    semester: 1,
    days:   40
)

Course.create!(
    code:   'EEE1151',
    title:  'Basic Electrical Engineering',
    description:    %{<p>Basics of Electrical Circuit: Electrical Units and Standards. Electrical Circuit Elements
    and Models. Signal and Waveforms. Fourier Representation of Non-Sinusoidal
    Waveforms. RMS and Average Value of Sinusoidal Waveforms. Introduction to Phasor
    Algebra. DC & Steady State AC Circuit Solutions: Series, Parallel, Series-Parallel
    Networks, Loop and Nodal Methods, Delta-Wye Transformations.</p>
    <p>Circuit Theorems: KVL, KCL, Thevenin, Norton, Super-position, Reciprocity and
    Maximum Power Transfer Theorems, Resonance. Circuit Analysis using Popular
    Simulation Tools.</p>
    },
    prerequisite:   '',
    credit: 3.00,
    semester: 1,
    days:   75
)

Course.create!(
    code:   'EEE1152',
    title:  'Sessional based on EEE 1151',
    description:    %{<p>Sessional based on the theory course EEE 1151</p>
    },
    prerequisite:   '',
    credit: 0.75,
    semester: 1,
    days:   20
)

######################
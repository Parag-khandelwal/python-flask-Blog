-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 25, 2022 at 09:39 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coderssummit.org`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `s_no` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_no` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`s_no`, `name`, `email`, `phone_no`, `message`, `date`) VALUES
(1, 'First Post', 'First@gmail.com', '123456789', 'First Post', '2022-01-09 20:19:39'),
(3, 'name', 'name@gmail.com', '9545781205', 'Hi this is a test message please enter ho jaa', '2022-01-19 16:53:51'),
(4, 'name', 'name@gmail.com', '9545781205', 'hello yhid id a texst ,essage', '2022-01-19 21:37:21'),
(5, 'name', 'name@gmail.com', '9545781205', 'hello yhid id a texst ,essage', '2022-01-19 21:44:45'),
(6, 'name', 'name@gmail.com', '9545781205', 'hi this is test message', '2022-01-19 21:45:14'),
(7, 'name', 'name@gmail.com', '9545781205', 'hii this is test message', '2022-01-19 21:50:28'),
(8, 'name', 'name@gmail.com', '9545781205', 'hii this is test message', '2022-01-19 22:06:31'),
(9, 'Chirag', 'chirag@gmail.com', '9563245876', 'Hii I am chirag the big brother of parag', '2022-01-22 20:01:45');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `s_no` int(11) NOT NULL,
  `title` text NOT NULL,
  `tagline` text NOT NULL,
  `slug` varchar(25) NOT NULL,
  `content` text NOT NULL,
  `img_file` varchar(12) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`s_no`, `title`, `tagline`, `slug`, `content`, `img_file`, `date`) VALUES
(1, 'Learn JavaScript', 'my first post', 'first-post', 'JavaScript (/ˈdʒɑːvəˌskrɪpt/),[10] often abbreviated JS, is a programming language that is one of the core technologies of the World Wide Web, alongside HTML and CSS.[11] Over 97% of websites use JavaScript on the client side for web page behavior,[12] often incorporating third-party libraries.[13] All major web browsers have a dedicated JavaScript engine to execute the code on users\' devices.\n\nJavaScript is a high-level, often just-in-time compiled language that conforms to the ECMAScript standard.[14] It has dynamic typing, prototype-based object-orientation, and first-class functions. It is multi-paradigm, supporting event-driven, functional, and imperative programming styles. It has application programming interfaces (APIs) for working with text, dates, regular expressions, standard data structures, and the Document Object Model (DOM).\n\nThe ECMAScript standard does not include any input/output (I/O), such as networking, storage, or graphics facilities. In practice, the web browser or other runtime system provides JavaScript APIs for I/O.\n\nJavaScript engines were originally used only in web browsers, but are now core components of some servers and a variety of applications. The most popular runtime system for this usage is Node.js.', 'about-bg.jpg', '2022-01-20 13:18:32'),
(2, 'This is my second post', 'coolest post', 'second-post', 'Hii I am Parag Khandelwal, I created this Blog and I am most likely to create all of the functionalities that a Blog page possess, Thanks for visiting my page hope you all are doing well And Have a nice Day!\r\n\r\nBye bye!!', 'about-bg.jpg', '2022-01-21 14:09:15'),
(3, 'Blog-A brief Intro...', 'An info About Blog', 'third-post', 'A blog (a truncation of \"weblog\")[1] is a discussion or informational website published on the World Wide Web consisting of discrete, often informal diary-style text entries (posts). Posts are typically displayed in reverse chronological order, so that the most recent post appears first, at the top of the web page. Until 2009, blogs were usually the work of a single individual,[citation needed] occasionally of a small group, and often covered a single subject or topic. In the 2010s, \"multi-author blogs\" (MABs) emerged, featuring the writing of multiple authors and sometimes professionally edited. MABs from newspapers, other media outlets, universities, think tanks, advocacy groups, and similar institutions account for an increasing quantity of blog traffic. The rise of Twitter and other \"microblogging\" systems helps integrate MABs and single-author blogs into the news media. Blog can also be used as a verb, meaning to maintain or add content to a blog.\r\n\r\nThe emergence and growth of blogs in the late 1990s coincided with the advent of web publishing tools that facilitated the posting of content by non-technical users who did not have much experience with HTML or computer programming. Previously, a knowledge of such technologies as HTML and File Transfer Protocol had been required to publish content on the Web, and early Web users therefore tended to be hackers and computer enthusiasts. In the 2010s, the majority are interactive Web 2.0 websites, allowing visitors to leave online comments, and it is this interactivity that distinguishes them from other static websites.[2] In that sense, blogging can be seen as a form of social networking service. Indeed, bloggers not only produce content to post on their blogs but also often build social relations with their readers and other bloggers.[3] However, there are high-readership blogs which do not allow comments.', 'post-bg.jpg', '2022-01-21 14:45:39'),
(4, 'Synopsis', 'a Jinja Miracle', 'fourth-post', 'A Jinja template is simply a text file. Jinja can generate any text-based format (HTML, XML, CSV, LaTeX, etc.). A Jinja template doesn’t need to have a specific extension: .html, .xml, or any other extension is just fine.\r\n\r\nA template contains variables and/or expressions, which get replaced with values when a template is rendered; and tags, which control the logic of the template. The template syntax is heavily inspired by Django and Python.\r\n\r\nBelow is a minimal template that illustrates a few basics using the default Jinja configuration. We will cover the details later in this document:\r\n\r\n<!DOCTYPE html>\r\n<html lang=\"en\">\r\n<head>\r\n    <title>My Webpage</title>\r\n</head>\r\n<body>\r\n    <ul id=\"navigation\">\r\n    {% for item in navigation %}\r\n        <li><a href=\"{{ item.href }}\">{{ item.caption }}</a></li>\r\n    {% endfor %}\r\n    </ul>\r\n\r\n    <h1>My Webpage</h1>\r\n    {{ a_variable }}\r\n\r\n    {# a comment #}\r\n</body>\r\n</html>\r\nThe following example shows the default configuration settings. An application developer can change the syntax configuration from {% foo %} to <% foo %>, or something similar.\r\n\r\nThere are a few kinds of delimiters. The default Jinja delimiters are configured as follows:\r\n\r\n{% ... %} for Statements\r\n\r\n{{ ... }} for Expressions to print to the template output\r\n\r\n{# ... #} for Comments not included in the template output\r\n\r\nLine Statements and Comments are also possible, though they don’t have default prefix characters. To use them, set line_statement_prefix and line_comment_prefix when creating the Environment.', 'about-bg.jpg', '2022-01-21 15:29:39'),
(5, 'Tests', 'Learn Jinja', 'fifth-post', 'Beside filters, there are also so-called “tests” available. Tests can be used to test a variable against a common expression. To test a variable or expression, you add is plus the name of the test after the variable. For example, to find out if a variable is defined, you can do name is defined, which will then return true or false depending on whether name is defined in the current template context.\r\n\r\nTests can accept arguments, too. If the test only takes one argument, you can leave out the parentheses. For example, the following two expressions do the same thing:\r\n\r\n{% if loop.index is divisibleby 3 %}\r\n{% if loop.index is divisibleby(3) %}\r\nThe List of Builtin Tests below describes all the builtin tests', 'about-bg.jpg', '2022-01-21 15:29:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`s_no`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`s_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `s_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `s_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

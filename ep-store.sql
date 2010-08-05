-- phpMyAdmin SQL Dump
-- version 2.10.1
-- http://www.phpmyadmin.net
-- 
-- Host: Localhost
-- Generation Time: Oct 01, 2007 at 02:36 PM
-- Server version: 5.0.37
-- PHP Version: 4.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- Database: `ep-store`
-- 

-- --------------------------------------------------------

-- 
-- Table structure for table `books`
-- 

DROP TABLE IF EXISTS `books`;
CREATE TABLE IF NOT EXISTS `books` (
  `id` int(15) NOT NULL auto_increment,
  `detailsPageURL` varchar(245) NOT NULL,
  `author` varchar(40) NOT NULL,
  `manufacturer` varchar(50) NOT NULL,
  `title` varchar(245) NOT NULL,
  `ASIN` varchar(15) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

-- 
-- Dumping data for table `books`
-- 

INSERT INTO `books` (`id`, `detailsPageURL`, `author`, `manufacturer`, `title`, `ASIN`) VALUES 
(1, 'http://www.amazon.co.uk/gp/redirect.html%3FASIN=0283070293%26tag=ws%26lcode=xm2%26cID=2025%26ccmID=165953%26location=/o/ASIN/0283070293%253FSubscriptionId=0525E2PQ81DD7ZTWTK82', 'Horace Panter', 'Sidgwick & Jackson', 'Ska''d for Life: A Personal Journey with the "Specials"', ''),
(2, 'http://www.amazon.co.uk/gp/redirect.html%3FASIN=0859653412%26tag=ws%26lcode=xm2%26cID=2025%26ccmID=165953%26location=/o/ASIN/0859653412%253FSubscriptionId=0525E2PQ81DD7ZTWTK82', 'Keith Zimmerman', 'Plexus Publishing Ltd', 'Rotten: No Irish, No Blacks, No Dogs', ''),
(3, 'http://www.amazon.co.uk/gp/redirect.html%3FASIN=086171380X%26tag=ws%26lcode=xm2%26cID=2025%26ccmID=165953%26location=/o/ASIN/086171380X%253FSubscriptionId=0525E2PQ81DD7ZTWTK82', 'Brad Warner', 'Wisdom Publications,U.S.', 'Hardcore Zen: Punk Rock Monster Movies & the Truth About Reality', ''),
(4, 'http://www.amazon.co.uk/gp/redirect.html%3FASIN=0711900523%26tag=ws%26lcode=xm2%26cID=2025%26ccmID=165953%26location=/o/ASIN/0711900523%253FSubscriptionId=0525E2PQ81DD7ZTWTK82', 'Nick Knight', 'Omnibus Press', 'Skinhead', ''),
(5, 'http://www.amazon.co.uk/gp/redirect.html%3FASIN=0954970497%26tag=ws%26lcode=xm2%26cID=2025%26ccmID=165953%26location=/o/ASIN/0954970497%253FSubscriptionId=0525E2PQ81DD7ZTWTK82', 'David Nolan', 'Independent Music Press', 'I Swear I Was There: The Gig That Changed the World', ''),
(6, 'http://www.amazon.co.uk/gp/redirect.html%3FASIN=0283070277%26tag=ws%26lcode=xm2%26cID=2025%26ccmID=165953%26location=/o/ASIN/0283070277%253FSubscriptionId=0525E2PQ81DD7ZTWTK82', 'Adam Ant', 'Sidgwick & Jackson Ltd', 'Stand and Deliver: The Autobiography', ''),
(7, 'http://www.amazon.co.uk/gp/redirect.html%3FASIN=085965396X%26tag=ws%26lcode=xm2%26cID=2025%26ccmID=165953%26location=/o/ASIN/085965396X%253FSubscriptionId=0525E2PQ81DD7ZTWTK82', 'Roberta Bayley', 'Plexus Publishing Ltd', 'Blondie: The Early Years 1976 - 1980', ''),
(8, 'http://www.amazon.co.uk/gp/redirect.html%3FASIN=1577315596%26tag=ws%26lcode=xm2%26cID=2025%26ccmID=165953%26location=/o/ASIN/1577315596%253FSubscriptionId=0525E2PQ81DD7ZTWTK82', 'Brad Warner', 'New World Library', 'Sit Down and Shut Up: Punk Rock Commentaries on Zen and Dogen''s Treasury of the Right Dharma Eye', ''),
(9, 'http://www.amazon.co.uk/gp/redirect.html%3FASIN=184609402X%26tag=ws%26lcode=xm2%26cID=2025%26ccmID=165953%26location=/o/ASIN/184609402X%253FSubscriptionId=0525E2PQ81DD7ZTWTK82', 'George Berger', 'Omnibus Press', '"Crass": The Biography', ''),
(10, 'http://www.amazon.co.uk/gp/redirect.html%3FASIN=0922915717%26tag=ws%26lcode=xm2%26cID=2025%26ccmID=165953%26location=/o/ASIN/0922915717%253FSubscriptionId=0525E2PQ81DD7ZTWTK82', 'Steven Blush', 'Feral House,U.S.', 'American Hardcore: A Tribal History', '');

-- --------------------------------------------------------

--
-- Table structure for table `dvds`
--

CREATE TABLE IF NOT EXISTS `dvds` (
  `id` int(15) NOT NULL auto_increment,
  `ASIN` varchar(15) NOT NULL,
  `detailsPageURL` varchar(245) NOT NULL,
  `actor` varchar(50) NOT NULL,
  `director` varchar(100) NOT NULL,
  `title` varchar(200) NOT NULL,
  `actor2` varchar(100) NOT NULL,
  `genre` varchar(100) NOT NULL,
  `image` varchar(170) NOT NULL,
  `datetime` varchar(100) default NULL,
  `date` date default NULL,
  `dateadded` varchar(100) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=52 ;


-- 
-- Dumping data for table `dvds`
-- 


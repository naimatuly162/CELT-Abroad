-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- হোষ্ট: localhost
-- তৈরী করতে ব্যবহৃত সময়: ফেব 25, 2021 at 02:59 PM
-- সার্ভার সংস্করন: 5.7.32-35-log
-- পিএইছপির সংস্করন: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- ডাটাবেইজ: `celt2473_celtabroad`
--

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `admins`
--

INSERT INTO `admins` (`id`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin@admin.com', NULL, '$2y$10$uQJYQC5J7r16ASioJMDCXuyR.o1ONDWDnrDoVE6nl6HPLiOzDfQJy', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `applications`
--

CREATE TABLE `applications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `program_id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `status` bigint(20) DEFAULT NULL COMMENT '1-apply 2-accept 3-reject',
  `bonus_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` decimal(8,2) DEFAULT NULL COMMENT 'bonus amount',
  `amount_usd` decimal(8,2) DEFAULT NULL COMMENT 'bonus amount usd',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `applications`
--

INSERT INTO `applications` (`id`, `program_id`, `student_id`, `status`, `bonus_id`, `amount`, `amount_usd`, `deleted_at`, `created_at`, `updated_at`) VALUES
(40, 134, 90, 2, NULL, NULL, NULL, NULL, '2021-01-18 06:08:44', '2021-02-06 10:31:10'),
(41, 156, 90, 2, NULL, NULL, NULL, NULL, '2021-01-26 05:38:06', '2021-01-26 09:48:43'),
(42, 155, 90, 2, NULL, NULL, NULL, NULL, '2021-01-26 05:38:14', '2021-01-26 09:48:54'),
(43, 154, 90, 2, NULL, NULL, NULL, NULL, '2021-01-26 05:38:23', '2021-01-26 09:49:00'),
(44, 152, 90, 2, NULL, NULL, NULL, NULL, '2021-01-26 05:40:02', '2021-01-26 09:49:07'),
(45, 151, 90, 2, NULL, NULL, NULL, NULL, '2021-01-26 07:29:37', '2021-01-26 09:49:17'),
(46, 145, 90, 2, NULL, NULL, NULL, NULL, '2021-01-26 09:12:59', '2021-01-26 09:49:12'),
(47, 135, 91, 1, NULL, NULL, NULL, NULL, '2021-02-06 10:29:55', '2021-02-06 10:29:55');

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `application_bonuses`
--

CREATE TABLE `application_bonuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `application_id` bigint(20) UNSIGNED DEFAULT NULL,
  `bonus_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` decimal(8,2) DEFAULT NULL COMMENT 'bonus amount',
  `amount_usd` decimal(8,2) DEFAULT NULL COMMENT 'bonus amount usd',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `application_bonuses`
--

INSERT INTO `application_bonuses` (`id`, `application_id`, `bonus_id`, `amount`, `amount_usd`, `created_at`, `updated_at`) VALUES
(1, 40, 1, '4444.00', '4444.00', '2021-02-06 10:30:58', '2021-02-06 10:30:58');

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `application_messages`
--

CREATE TABLE `application_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `application_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `application_messages`
--

INSERT INTO `application_messages` (`id`, `application_id`, `user_id`, `message`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 8, 7, 'hi', '2020-12-11 07:24:35', '2020-12-11 07:24:35', NULL),
(2, 8, 7, 'test', '2020-12-11 07:24:46', '2020-12-11 07:24:46', NULL),
(3, 8, 7, 'working', '2020-12-11 07:28:32', '2020-12-11 07:28:32', NULL),
(4, 8, 7, 'hı', '2020-12-13 09:56:17', '2020-12-13 09:56:17', NULL),
(5, 16, 7, 'dfgdfgdfg', '2020-12-13 09:57:24', '2020-12-13 09:57:24', NULL),
(6, 16, 7, 'dgdfgfdg', '2020-12-13 09:57:27', '2020-12-13 09:57:27', NULL),
(7, 8, 58, 'yes working', '2020-12-14 04:50:46', '2020-12-14 04:50:46', NULL),
(8, 14, 7, 'hi', '2020-12-14 04:56:08', '2020-12-14 04:56:08', NULL),
(9, 14, 7, 'hello', '2020-12-14 04:58:52', '2020-12-14 04:58:52', NULL),
(10, 8, 7, 'perfect', '2020-12-14 04:59:14', '2020-12-14 04:59:14', NULL),
(11, 14, 7, 'send more detail', '2020-12-14 05:03:02', '2020-12-14 05:03:02', NULL),
(12, 16, 64, 'hhhh\nəkləlklk\nəşlkə', '2020-12-15 14:43:42', '2020-12-15 14:43:42', NULL),
(13, 40, 11, 'sdsadsadsadasd', '2021-02-06 10:25:40', '2021-02-06 10:25:40', NULL),
(14, 47, 11, 'Zəhmtə olamasa sənədləri upload edin', '2021-02-06 10:32:06', '2021-02-06 10:32:06', NULL);

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `blogs`
--

INSERT INTO `blogs` (`id`, `image`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'IPTm85g7QjDozK4x1kuRqp5mSvz6oibk3vOrfl7k.jpeg', '2020-03-31 15:24:42', '2020-04-10 10:00:37', '2020-04-10 10:00:37'),
(2, 'nkp76MTnYAUEzAuuJ0pcI8stfU1r0f8L9ce4BIkg.jpeg', '2020-04-10 10:00:09', '2020-12-31 18:03:05', '2020-12-31 18:03:05'),
(3, 'beOStrFbrQlIgMDxg8pGbowrzkTEGd2Y5xCK6EOB.jpeg', '2020-04-10 13:09:59', '2020-12-31 18:03:02', '2020-12-31 18:03:02'),
(4, 'uZnZM7a6uHSpJlCGK8V2ZRLoNacbcS9fwzSwvMlq.jpeg', '2020-04-10 13:30:19', '2020-12-31 18:02:59', '2020-12-31 18:02:59'),
(5, 'PMjX8pUp5oYAb9Ws8yFIvjJWOW2BTcFBoKudUQ0i.jpeg', '2020-04-10 13:48:52', '2020-12-31 18:03:08', '2020-12-31 18:03:08'),
(6, 'gGXIT6wWjPTkOHQ3ekgRcDszqezJRhe40T0qgcld.jpeg', '2020-04-10 14:02:55', '2020-12-31 18:02:56', '2020-12-31 18:02:56');

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '2020-03-31 15:18:26', '2020-03-31 15:18:26', NULL),
(2, '2020-04-10 09:40:46', '2020-04-10 09:40:46', NULL),
(3, '2020-04-10 13:05:09', '2020-04-10 13:05:09', NULL);

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `blog_category_translations`
--

CREATE TABLE `blog_category_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_category_id` bigint(20) UNSIGNED NOT NULL,
  `locale` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `blog_category_translations`
--

INSERT INTO `blog_category_translations` (`id`, `blog_category_id`, `locale`, `title`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'en', 'Information Technology', '2020-03-31 15:18:26', '2020-03-31 15:18:26', NULL),
(2, 2, 'en', 'Scholarship', '2020-04-10 09:40:46', '2020-04-10 09:40:46', NULL),
(3, 2, 'ru', 'ученость', '2020-04-10 09:40:46', '2020-04-10 09:40:46', NULL),
(4, 2, 'tr', 'burs', '2020-04-10 09:40:46', '2020-04-10 09:40:46', NULL),
(5, 3, 'en', 'technology', '2020-04-10 13:05:10', '2020-04-10 13:05:10', NULL),
(6, 3, 'ru', 'технологии', '2020-04-10 13:05:10', '2020-04-10 13:05:10', NULL),
(7, 3, 'tr', 'teknoloji', '2020-04-10 13:05:10', '2020-04-10 13:05:10', NULL);

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `blog_translations`
--

CREATE TABLE `blog_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `blog_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `locale` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `blog_translations`
--

INSERT INTO `blog_translations` (`id`, `blog_id`, `category_id`, `locale`, `title`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 'en', 'IT modernisation series', '<p style=\"margin: 1.5em 0px; font-size: 18px; line-height: 1.67em; color: #666666; font-family: Arial, sans-serif;\"><em>the company&rsquo;s software combines AI with Natural Language Processing (NLP) to understand and interpret user requests, challenges and problems before then using a further degree of AI to help deliver the appropriate actions to satisfy the user&rsquo;s needs. The commentary below comes from&nbsp;Vaibhav Nivargi, CTO and co-founder of Moveworks.</em></p>\r\n<section class=\"section main-article-chapter\" style=\"padding-top: 10px; margin-top: 0px; background-image: initial; background-position: 0px center; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; color: #323232; font-family: Arial, sans-serif; font-size: 15px;\" data-menu-title=\"Nivargi writes as follows&hellip;\">\r\n<h2 class=\"section-title\" style=\"font-size: 30px; margin: 28px 0px 30px; line-height: 1.21em; position: relative; padding-left: 39px;\">Nivargi writes as follows&hellip;</h2>\r\n<p style=\"margin: 1.5em 0px; font-size: 18px; line-height: 1.67em; color: #666666;\">There&rsquo;s no shortage of buzzwords that come to mind when speaking about IT modernisation, from data analytics to digital maturity to multi-cloud infrastructures. Although these terms have become somewhat stale, companies are achieving lower costs and greater scalability than ever before by embracing all of the above.</p>\r\n<p style=\"margin: 1.5em 0px; font-size: 18px; line-height: 1.67em; color: #666666;\">But the truth is&nbsp; &ndash; for 99% of employees &ndash; the IT team isn&rsquo;t judged on any of those buzzwords.</p>\r\n<p style=\"margin: 1.5em 0px; font-size: 18px; line-height: 1.67em; color: #666666;\">For them, what matters is getting tech support the moment they need it, without having to jump through hoops in the process. The real challenge, then, is to&nbsp;<em>speak their language.</em></p>\r\n<p style=\"margin: 1.5em 0px; font-size: 18px; line-height: 1.67em; color: #666666;\">When employees email IT to ask for troubleshooting assistance on Zoom (or some other collaboration channel) or to request a license for Salesforce, help desk agents must read through their tickets and assign them to the right subject-matter experts, who must then also read them to decide the best resolution. Often, this process will involve several back-and-forths between the submitter and multiple agents, with some emails getting lost in the inbox and some tickets getting stuck in a queue. That&rsquo;s why, despite our advanced analytics and automated tools and complex cloud architectures, the average IT issue still takes&nbsp;<em>three days</em>&nbsp;to resolve &ndash; a delay that doesn&rsquo;t suggest &lsquo;modern&rsquo; at all.</p>\r\n<p style=\"margin: 1.5em 0px; font-size: 18px; line-height: 1.67em; color: #666666;\">To solve this language problem, CIOs are considering&nbsp;conversational AI.</p>\r\n</section>', '2020-03-31 15:24:42', '2020-04-10 10:00:37', '2020-04-10 10:00:37'),
(3, 2, 2, 'en', 'Featured Scholarships', '<p style=\"box-sizing: border-box; margin: 0px 0px 15px; overflow-wrap: break-word; outline: none; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-block-start: 0px; margin-block-end: 0px; font-size: 15px; color: #666666; line-height: 1.6; font-family: Poppins, sans-serif;\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>\r\n<ul style=\"box-sizing: border-box; margin: 0px 0px 15px; padding: 0px; overflow-wrap: break-word; outline: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-block-start: 0px; margin-block-end: 0px; list-style-type: none; padding-inline-start: 0px; color: #666666; font-family: Poppins, sans-serif; font-size: 13px;\">\r\n<li style=\"box-sizing: border-box; overflow-wrap: break-word; outline: none; padding: 0px; margin: 0px 0px 8px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); list-style: none; font-size: 15px; line-height: 1.6;\">&nbsp;lorem quis bibendum auctor, nisi elit.</li>\r\n<li style=\"box-sizing: border-box; overflow-wrap: break-word; outline: none; padding: 0px; margin: 0px 0px 8px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); list-style: none; font-size: 15px; line-height: 1.6;\">&nbsp;bibendum Sollib bibendum auctor, nisi elit.</li>\r\n<li style=\"box-sizing: border-box; overflow-wrap: break-word; outline: none; padding: 0px; margin: 0px 0px 8px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); list-style: none; font-size: 15px; line-height: 1.6;\">&nbsp;citudin, lorem quis bibendum consequat bibendum</li>\r\n</ul>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 15px; overflow-wrap: break-word; outline: none; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-block-start: 0px; margin-block-end: 0px; font-size: 15px; color: #666666; line-height: 1.6; font-family: Poppins, sans-serif;\">Sollicitudin, lorem quis bibe u auctor, nisi elit conat ipsu, nec sagittis sem ni id elit. Duis sed odio sit amet nibh vulpute rsus. Proin gravida nibh vel velit auctor aliquet. Lorem ipsum dolor sit amet, consecteolore magna aliqua.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 15px; overflow-wrap: break-word; outline: none; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-block-start: 0px; margin-block-end: 0px; font-size: 15px; color: #666666; line-height: 1.6; font-family: Poppins, sans-serif;\">Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis auttur adipisicing elit, sed do eiod tempor incididunt ut labore et dolore magna aliqua. Ut en esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', '2020-04-10 10:00:09', '2020-12-31 18:03:05', '2020-12-31 18:03:05'),
(4, 2, 2, 'ru', 'Рекомендуемые стипендии', '<p>Существует множество вариаций отрывков Lorem Ipsum, но большинство претерпело изменения в той или иной форме из-за введенного юмора или случайных слов, которые не выглядят даже правдоподобно. Если вы собираетесь использовать отрывок из Lorem Ipsum, вы должны быть уверены, что в середине текста нет ничего смущающего. Все генераторы Lorem Ipsum в Интернете имеют тенденцию повторять заранее определенные фрагменты по мере необходимости, что делает их первым настоящим генератором в Интернете. Он использует словарь из более чем 200 латинских слов в сочетании с несколькими модельными структурами предложений для создания Lorem Ipsum, который выглядит разумным. Сгенерированный Lorem Ipsum, следовательно, всегда свободен от повторения, введенного юмора или нехарактерных слов и т. Д.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;lorem quis bibendum auctor, nisi elit.</p>\r\n<p>&nbsp;bibendum Sollib bibendum auctor, nisi elit.</p>\r\n<p>&nbsp;Штифт, лорев квис бибендум</p>\r\n<p>Sollicitude, lorem quis bibe u auctor, nisi elit conat ipsu, nec sagittis sem ni id elit. Duis sed odio sit amet nibh vulpute rsus. Proin gravida nibh Velvel Auctor Aliquet. Lorem Ipsum Dolor Sit Amet, посвященный Аликва.</p>\r\n<p>&nbsp;</p>\r\n<p>Ut enim ad minim veniam, quis nostrud упражнение ullamco labouris nisi ut aliquip ex ea кассовый следствие. Duis auttur adipisicing elit, sed do eiod temporid incutidunt ut labore et dolore magna aliqua. Ut en esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat непроизведенный, иск в виновном виноватом моллите аниме, то есть лейборист.</p>', '2020-04-10 10:00:09', '2020-12-31 18:03:05', '2020-12-31 18:03:05'),
(5, 2, 2, 'tr', 'Öne Çıkan Burslar', '<p>Lorem Ipsum\'un bir&ccedil;ok pasajı var, ancak &ccedil;oğunluğu enjekte edilmiş mizah ya da biraz inandırıcı g&ouml;r&uuml;nmeyen rastgele kelimelerle bir şekilde değişime uğradı. Lorem Ipsum\'un bir pasajını kullanacaksanız, metnin ortasında utan&ccedil; verici bir şey olmadığından emin olmanız gerekir. İnternet\'teki t&uuml;m Lorem Ipsum jenerat&ouml;rleri, &ouml;nceden tanımlanmış par&ccedil;aları gerektiği gibi tekrarlama eğilimindedir ve bu da bunu İnternet\'teki ilk ger&ccedil;ek jenerat&ouml;r yapar. Makul g&ouml;r&uuml;nen Lorem Ipsum &uuml;retmek i&ccedil;in birka&ccedil; model c&uuml;mle yapısı ile birlikte 200\'den fazla Latince kelimenin s&ouml;zl&uuml;ğ&uuml;n&uuml; kullanır. Bu nedenle, oluşturulan Lorem Ipsum her zaman tekrar, enjekte edilmiş mizah veya karakteristik olmayan kelimeler vb.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;lorem quis bibendum m&uuml;zayede, nisi elit.</p>\r\n<p>&nbsp;bibendum Sollib bibendum auctor, nisi elit.</p>\r\n<p>&nbsp;citudin, lorem quis bibendum Sonu&ccedil;ları</p>\r\n<p>Sollicitudin, lorem quis bibe u auctor, nisi elit conat ipsu, nec sagittis sem ni id elit. Duis sed odio sit amet nibh vulpute rsus. Proin gravida nibh vel velit a&ccedil;ık artırma aliquet. Lorem ipsum dolor sit amet, consecteolore magna aliqua.</p>\r\n<p>&nbsp;</p>\r\n<p>En az adenim veniam, burun deliği egzersizi ullamco labouris nisi ut aliquip ex ea commodo resultsat. Duis auttur adipisicing elit, sed do eiod tempor incididunt ut labore ve dolore magna aliqua. Ut en esse cillum dolore eu fugiat nulla pariatur. Dışlayıcı sint occaecat cupidatat non proident, culpa qui officia deserunt mollit anim id est laborum sunt.</p>', '2020-04-10 10:00:09', '2020-12-31 18:03:05', '2020-12-31 18:03:05'),
(6, 3, 3, 'en', 'Information Technology', '<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif; font-size: 14px;\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English.</p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif; font-size: 14px;\">Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif; font-size: 14px;\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif; font-size: 14px;\">The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\r\n<p>&nbsp;</p>', '2020-04-10 13:10:00', '2020-12-31 18:03:02', '2020-12-31 18:03:02'),
(7, 3, 3, 'ru', 'Информационные технологии', '<p>Это давно установленный факт, что читатель будет отвлекаться на удобочитаемое содержимое страницы при просмотре ее макета. Смысл использования Lorem Ipsum в том, что он имеет более-менее нормальное распределение букв, в отличие от использования &laquo;Контент здесь, контент здесь&raquo;, что делает его похожим на читаемый английский.</p>\r\n<p>&nbsp;</p>\r\n<p>Многие настольные издательские пакеты и редакторы веб-страниц теперь используют Lorem Ipsum в качестве текста модели по умолчанию, а поиск по запросу &laquo;lorem ipsum&raquo; обнаружит многие веб-сайты, которые еще находятся в зачаточном состоянии. Различные версии развивались годами, иногда случайно, иногда специально (впрыскиваемый юмор и тому подобное).</p>\r\n<p>&nbsp;</p>\r\n<p>Это давно установленный факт, что читатель будет отвлекаться на удобочитаемое содержимое страницы при просмотре ее макета.</p>\r\n<p>&nbsp;</p>\r\n<p>Смысл использования Lorem Ipsum в том, что он имеет более-менее нормальное распределение букв, в отличие от использования &laquo;Контент здесь, контент здесь&raquo;, что делает его похожим на читаемый английский. Многие настольные издательские пакеты и редакторы веб-страниц теперь используют Lorem Ipsum в качестве текста модели по умолчанию, а поиск по запросу &laquo;lorem ipsum&raquo; обнаружит многие веб-сайты, которые еще находятся в зачаточном состоянии. Различные версии развивались годами, иногда случайно, иногда специально (впрыскиваемый юмор и тому подобное).</p>', '2020-04-10 13:10:00', '2020-12-31 18:03:02', '2020-12-31 18:03:02'),
(8, 3, 3, 'tr', 'Bilgi Teknolojisi', '<p>Bir okuyucunun, d&uuml;zenine bakarken bir sayfanın okunabilir i&ccedil;eriği tarafından dikkatinin dağıtılacağı uzun zamandır bilinen bir ger&ccedil;ektir. Lorem Ipsum\'u kullanmanın amacı, \'Buradaki i&ccedil;erik, burada i&ccedil;erik\' kullanmak yerine, okunabilir İngilizce gibi g&ouml;r&uuml;nmesini sağlamak i&ccedil;in, az &ccedil;ok normal harf dağılımına sahip olmasıdır.</p>\r\n<p>&nbsp;</p>\r\n<p>Bir&ccedil;ok masa&uuml;st&uuml; yayınlama paketi ve web sayfası d&uuml;zenleyicisi artık Lorem Ipsum\'u varsayılan model metni olarak kullanmaktadır ve \'lorem ipsum\' araması hen&uuml;z bebeklik d&ouml;neminde olan bir&ccedil;ok web sitesini ortaya &ccedil;ıkaracaktır. Yıllar boyunca, bazen kazara, bazen de bilerek &ccedil;eşitli versiyonlar gelişmiştir (enjekte edilen mizah ve benzeri).</p>\r\n<p>&nbsp;</p>\r\n<p>Bir okuyucunun, d&uuml;zenine bakarken bir sayfanın okunabilir i&ccedil;eriği tarafından dikkatinin dağıtılacağı uzun zamandır bilinen bir ger&ccedil;ektir.</p>\r\n<p>&nbsp;</p>\r\n<p>Lorem Ipsum\'u kullanmanın amacı, \'Buradaki i&ccedil;erik, buradaki i&ccedil;erik\' kullanmak yerine, okunabilir İngilizce gibi g&ouml;r&uuml;nmesini sağlamak i&ccedil;in, az &ccedil;ok normal harf dağılımına sahip olmasıdır. Bir&ccedil;ok masa&uuml;st&uuml; yayınlama paketi ve web sayfası d&uuml;zenleyicisi artık Lorem Ipsum\'u varsayılan model metni olarak kullanmaktadır ve \'lorem ipsum\' araması hen&uuml;z bebeklik d&ouml;neminde olan bir&ccedil;ok web sitesini ortaya &ccedil;ıkaracaktır. Yıllar boyunca, bazen kazara, bazen de bilerek &ccedil;eşitli versiyonlar gelişmiştir (enjekte edilen mizah ve benzeri).</p>', '2020-04-10 13:10:00', '2020-12-31 18:03:02', '2020-12-31 18:03:02'),
(9, 4, 2, 'en', 'Thought Box', '<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif; font-size: 14px;\">Contrary to popular belief, Lorem Ipsum is not simply random text.</p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif; font-size: 14px;\">It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance.</p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif; font-size: 14px;\">The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p>\r\n<p>&nbsp;</p>', '2020-04-10 13:30:19', '2020-12-31 18:02:59', '2020-12-31 18:02:59'),
(10, 4, 2, 'ru', 'Коробка мысли', '<p>Вопреки распространенному мнению, Lorem Ipsum - это не просто случайный текст.</p>\r\n<p>&nbsp;</p>\r\n<p>Он имеет корни в произведении классической латинской литературы 45 года до нашей эры, что делает его более 2000 лет. Ричард МакКлинток, профессор латыни в Хэмпден-Сиднейском колледже в Вирджинии, отыскал одно из самых непонятных латинских слов, concectetur, из отрывка из Lorem Ipsum и, пройдя по ссылкам на слова в классической литературе, обнаружил несомненный источник. Lorem Ipsum взято из разделов 1.10.32 и 1.10.33 из \"De Finibus Bonorum et Malorum\" (Крайности добра и зла) Цицерона, написанных в 45 г. до н.э. Эта книга является трактатом по теории этики, очень популярным во времена Ренессанса.</p>\r\n<p>&nbsp;</p>\r\n<p>Первая строка Lorem Ipsum, &laquo;Lorem ipsum dolor sit amet ..&raquo;, взята из строки в разделе 1.10.32.</p>', '2020-04-10 13:30:19', '2020-12-31 18:02:59', '2020-12-31 18:02:59'),
(11, 4, 2, 'tr', 'düşünce kutusu', '<p>Pop&uuml;ler inanışın aksine, Lorem Ipsum sadece rastgele bir metin değildir.</p>\r\n<p>&nbsp;</p>\r\n<p>K&ouml;kleri M&Ouml; 45\'lerden kalma klasik Latin edebiyatının bir par&ccedil;asıdır ve 2000 yılı aşkın bir s&uuml;redir vardır. Virginia\'daki Hampden-Sydney Koleji\'nde Latin profes&ouml;r olan Richard McClintock, Lorem Ipsum pasajından daha belirsiz Latince kelimelerden biri olan konstr&uuml;kt&ouml;rlere baktı ve klasik edebiyattaki kelimenin alıntılarından ş&uuml;phesiz kaynağı keşfetti. Lorem Ipsum, M&Ouml; 45\'te yazılmış Cicero\'nun \"de Finibus Bonorum et Malorum\" un (1.10.32 ve 1.10.33) b&ouml;l&uuml;mlerinden gelmektedir. Bu kitap, R&ouml;nesans d&ouml;neminde &ccedil;ok pop&uuml;ler olan etik teorisi &uuml;zerine bir tezdir.</p>\r\n<p>&nbsp;</p>\r\n<p>Lorem Ipsum\'un ilk satırı olan \"Lorem ipsum dolor sit amet ..\", b&ouml;l&uuml;m 1.10.32\'deki bir satırdan gelmektedir.</p>', '2020-04-10 13:30:20', '2020-12-31 18:02:59', '2020-12-31 18:02:59'),
(12, 5, 3, 'en', 'Sample Content', '<p style=\"box-sizing: border-box; margin: 0px 0px 15px; overflow-wrap: break-word; outline: none; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-block-start: 0px; margin-block-end: 0px; font-size: 15px; color: #666666; line-height: 1.6; font-family: Poppins, sans-serif;\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>\r\n<ul style=\"box-sizing: border-box; margin: 0px 0px 15px; padding: 0px; overflow-wrap: break-word; outline: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-block-start: 0px; margin-block-end: 0px; list-style-type: none; padding-inline-start: 0px; color: #666666; font-family: Poppins, sans-serif; font-size: 13px;\">\r\n<li style=\"box-sizing: border-box; overflow-wrap: break-word; outline: none; padding: 0px; margin: 0px 0px 8px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); list-style: none; font-size: 15px; line-height: 1.6;\">&nbsp;lorem quis bibendum auctor, nisi elit.</li>\r\n<li style=\"box-sizing: border-box; overflow-wrap: break-word; outline: none; padding: 0px; margin: 0px 0px 8px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); list-style: none; font-size: 15px; line-height: 1.6;\">&nbsp;bibendum Sollib bibendum auctor, nisi elit.</li>\r\n<li style=\"box-sizing: border-box; overflow-wrap: break-word; outline: none; padding: 0px; margin: 0px 0px 8px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); list-style: none; font-size: 15px; line-height: 1.6;\">&nbsp;citudin, lorem quis bibendum consequat bibendum</li>\r\n</ul>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 15px; overflow-wrap: break-word; outline: none; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-block-start: 0px; margin-block-end: 0px; font-size: 15px; color: #666666; line-height: 1.6; font-family: Poppins, sans-serif;\">Sollicitudin, lorem quis bibe u auctor, nisi elit conat ipsu, nec sagittis sem ni id elit. Duis sed odio sit amet nibh vulpute rsus. Proin gravida nibh vel velit auctor aliquet. Lorem ipsum dolor sit amet, consecteolore magna aliqua.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 15px; overflow-wrap: break-word; outline: none; padding: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); margin-block-start: 0px; margin-block-end: 0px; font-size: 15px; color: #666666; line-height: 1.6; font-family: Poppins, sans-serif;\">Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis auttur adipisicing elit, sed do eiod tempor incididunt ut labore et dolore magna aliqua. Ut en esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>', '2020-04-10 13:48:53', '2020-12-31 18:03:08', '2020-12-31 18:03:08'),
(13, 5, 3, 'ru', 'Образец контента', '<p>Существует множество вариаций отрывков Lorem Ipsum, но большинство претерпело изменения в той или иной форме из-за введенного юмора или случайных слов, которые не выглядят даже правдоподобно. Если вы собираетесь использовать отрывок из Lorem Ipsum, вы должны быть уверены, что в середине текста нет ничего смущающего. Все генераторы Lorem Ipsum в Интернете имеют тенденцию повторять заранее определенные фрагменты по мере необходимости, что делает их первым настоящим генератором в Интернете. Он использует словарь из более чем 200 латинских слов в сочетании с несколькими модельными структурами предложений для создания Lorem Ipsum, который выглядит разумным. Сгенерированный Lorem Ipsum, следовательно, всегда свободен от повторения, введенного юмора или нехарактерных слов и т. Д.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;lorem quis bibendum auctor, nisi elit.</p>\r\n<p>&nbsp;bibendum Sollib bibendum auctor, nisi elit.</p>\r\n<p>&nbsp;Штифт, лорев квис бибендум</p>\r\n<p>Sollicitude, lorem quis bibe u auctor, nisi elit conat ipsu, nec sagittis sem ni id elit. Duis sed odio sit amet nibh vulpute rsus. Proin gravida nibh Velvel Auctor Aliquet. Lorem Ipsum Dolor Sit Amet, посвященный Аликва.</p>\r\n<p>&nbsp;</p>\r\n<p>Ut enim ad minim veniam, quis nostrud упражнение ullamco labouris nisi ut aliquip ex ea кассовый следствие. Duis auttur adipisicing elit, sed do eiod temporid incutidunt ut labore et dolore magna aliqua. Ut en esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat непроизведенный, иск в виновном виноватом моллите аниме, то есть лейборист.</p>', '2020-04-10 13:48:54', '2020-12-31 18:03:08', '2020-12-31 18:03:08'),
(14, 5, 3, 'tr', 'Örnek İçerik', '<p>Lorem Ipsum\'un bir&ccedil;ok pasajı var, ancak &ccedil;oğunluğu enjekte edilmiş mizah ya da biraz inandırıcı g&ouml;r&uuml;nmeyen rastgele kelimelerle bir şekilde değişime uğradı. Lorem Ipsum\'un bir pasajını kullanacaksanız, metnin ortasında utan&ccedil; verici bir şey olmadığından emin olmanız gerekir. İnternet\'teki t&uuml;m Lorem Ipsum jenerat&ouml;rleri, &ouml;nceden tanımlanmış par&ccedil;aları gerektiği gibi tekrarlama eğilimindedir ve bu da bunu İnternet\'teki ilk ger&ccedil;ek jenerat&ouml;r yapar. Makul g&ouml;r&uuml;nen Lorem Ipsum &uuml;retmek i&ccedil;in birka&ccedil; model c&uuml;mle yapısı ile birlikte 200\'den fazla Latince kelimenin s&ouml;zl&uuml;ğ&uuml;n&uuml; kullanır. Bu nedenle, oluşturulan Lorem Ipsum her zaman tekrar, enjekte edilmiş mizah veya karakteristik olmayan kelimeler vb.</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;lorem quis bibendum m&uuml;zayede, nisi elit.</p>\r\n<p>&nbsp;bibendum Sollib bibendum auctor, nisi elit.</p>\r\n<p>&nbsp;citudin, lorem quis bibendum Sonu&ccedil;ları</p>\r\n<p>Sollicitudin, lorem quis bibe u auctor, nisi elit conat ipsu, nec sagittis sem ni id elit. Duis sed odio sit amet nibh vulpute rsus. Proin gravida nibh vel velit a&ccedil;ık artırma aliquet. Lorem ipsum dolor sit amet, consecteolore magna aliqua.</p>\r\n<p>&nbsp;</p>\r\n<p>En az adenim veniam, burun deliği egzersizi ullamco labouris nisi ut aliquip ex ea commodo resultsat. Duis auttur adipisicing elit, sed do eiod tempor incididunt ut labore ve dolore magna aliqua. Ut en esse cillum dolore eu fugiat nulla pariatur. Dışlayıcı sint occaecat cupidatat non proident, culpa qui officia deserunt mollit anim id est laborum sunt.</p>', '2020-04-10 13:48:54', '2020-12-31 18:03:08', '2020-12-31 18:03:08'),
(15, 6, 2, 'en', 'Test', '<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif; font-size: 14px;\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English.</p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif; font-size: 14px;\">Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif; font-size: 14px;\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</p>\r\n<p style=\"margin: 0px 0px 15px; padding: 0px; text-align: justify; font-family: \'Open Sans\', Arial, sans-serif; font-size: 14px;\">The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\r\n<p>&nbsp;</p>', '2020-04-10 14:02:56', '2020-12-31 18:02:56', '2020-12-31 18:02:56'),
(16, 6, 2, 'ru', 'тест', '<p>Это давно установленный факт, что читатель будет отвлекаться на удобочитаемое содержимое страницы при просмотре ее макета. Смысл использования Lorem Ipsum в том, что он имеет более-менее нормальное распределение букв, в отличие от использования &laquo;Контент здесь, контент здесь&raquo;, что делает его похожим на читаемый английский.</p>\r\n<p>&nbsp;</p>\r\n<p>Многие настольные издательские пакеты и редакторы веб-страниц теперь используют Lorem Ipsum в качестве текста модели по умолчанию, а поиск по запросу &laquo;lorem ipsum&raquo; обнаружит многие веб-сайты, которые еще находятся в зачаточном состоянии. Различные версии развивались годами, иногда случайно, иногда специально (впрыскиваемый юмор и тому подобное).</p>\r\n<p>&nbsp;</p>\r\n<p>Это давно установленный факт, что читатель будет отвлекаться на удобочитаемое содержимое страницы при просмотре ее макета.</p>\r\n<p>&nbsp;</p>\r\n<p>Смысл использования Lorem Ipsum в том, что он имеет более-менее нормальное распределение букв, в отличие от использования &laquo;Контент здесь, контент здесь&raquo;, что делает его похожим на читаемый английский. Многие настольные издательские пакеты и редакторы веб-страниц теперь используют Lorem Ipsum в качестве текста модели по умолчанию, а поиск по запросу &laquo;lorem ipsum&raquo; обнаружит многие веб-сайты, которые еще находятся в зачаточном состоянии. Различные версии развивались годами, иногда случайно, иногда специально (впрыскиваемый юмор и тому подобное).</p>', '2020-04-10 14:02:56', '2020-12-31 18:02:56', '2020-12-31 18:02:56'),
(17, 6, 2, 'tr', 'Ölçek', '<p>Bir okuyucunun, d&uuml;zenine bakarken bir sayfanın okunabilir i&ccedil;eriği tarafından dikkatinin dağıtılacağı uzun zamandır bilinen bir ger&ccedil;ektir. Lorem Ipsum\'u kullanmanın amacı, \'Buradaki i&ccedil;erik, burada i&ccedil;erik\' kullanmak yerine, okunabilir İngilizce gibi g&ouml;r&uuml;nmesini sağlamak i&ccedil;in, az &ccedil;ok normal harf dağılımına sahip olmasıdır.</p>\r\n<p>&nbsp;</p>\r\n<p>Bir&ccedil;ok masa&uuml;st&uuml; yayınlama paketi ve web sayfası d&uuml;zenleyicisi artık Lorem Ipsum\'u varsayılan model metni olarak kullanmaktadır ve \'lorem ipsum\' araması hen&uuml;z bebeklik d&ouml;neminde olan bir&ccedil;ok web sitesini ortaya &ccedil;ıkaracaktır. Yıllar boyunca, bazen kazara, bazen de bilerek &ccedil;eşitli versiyonlar gelişmiştir (enjekte edilen mizah ve benzeri).</p>\r\n<p>&nbsp;</p>\r\n<p>Bir okuyucunun, d&uuml;zenine bakarken bir sayfanın okunabilir i&ccedil;eriği tarafından dikkatinin dağıtılacağı uzun zamandır bilinen bir ger&ccedil;ektir.</p>\r\n<p>&nbsp;</p>\r\n<p>Lorem Ipsum\'u kullanmanın amacı, \'Buradaki i&ccedil;erik, buradaki i&ccedil;erik\' kullanmak yerine, okunabilir İngilizce gibi g&ouml;r&uuml;nmesini sağlamak i&ccedil;in, az &ccedil;ok normal harf dağılımına sahip olmasıdır. Bir&ccedil;ok masa&uuml;st&uuml; yayınlama paketi ve web sayfası d&uuml;zenleyicisi artık Lorem Ipsum\'u varsayılan model metni olarak kullanmaktadır ve \'lorem ipsum\' araması hen&uuml;z bebeklik d&ouml;neminde olan bir&ccedil;ok web sitesini ortaya &ccedil;ıkaracaktır. Yıllar boyunca, bazen kazara, bazen de bilerek &ccedil;eşitli versiyonlar gelişmiştir (enjekte edilen mizah ve benzeri).</p>', '2020-04-10 14:02:56', '2020-12-31 18:02:56', '2020-12-31 18:02:56');

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `bonuses`
--

CREATE TABLE `bonuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `bonuses`
--

INSERT INTO `bonuses` (`id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '2020-03-23 16:42:36', '2020-03-23 16:42:36', NULL),
(2, '2020-05-01 15:52:08', '2020-05-01 15:52:08', NULL),
(3, '2020-05-01 15:52:17', '2020-05-01 15:52:17', NULL);

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `bonus_translations`
--

CREATE TABLE `bonus_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bonus_id` bigint(20) UNSIGNED NOT NULL,
  `locale` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `bonus_translations`
--

INSERT INTO `bonus_translations` (`id`, `bonus_id`, `locale`, `title`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'en', 'CELT Free Travel', '2020-03-23 16:42:36', '2020-08-08 16:15:19', NULL),
(2, 2, 'en', 'CELT Scholarship', '2020-05-01 15:52:08', '2020-08-08 16:14:03', NULL),
(3, 3, 'en', 'CELT Visa Pay', '2020-05-01 15:52:17', '2020-08-08 16:14:45', NULL);

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `state_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `cities`
--

INSERT INTO `cities` (`id`, `image`, `country_id`, `state_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(14, '7XwTmsWLdOlKFnAX3RSVb50CBYZDF5P44r80H9nt.svg', 1, NULL, '2020-07-06 10:15:03', '2020-07-06 16:17:11', '2020-07-06 16:17:11'),
(15, 'FZ6ca64rRoBooQ9TsSyVqfiNWmSfC3BLrKyPu40I.jpeg', 1, 11, '2020-07-06 10:17:21', '2020-07-06 10:17:21', NULL),
(16, 'imqpLwHQcT75R6iBXQ4UwOm5yIjfHmSvXyIFclVB.jpeg', 2, NULL, '2020-07-06 15:51:06', '2020-08-04 15:05:39', '2020-08-04 15:05:39'),
(17, 'uc8NhO8ttLFU7CtOaX4nwBx84AWhidl8UuT70VTG.jpeg', 3, NULL, '2020-07-12 15:09:16', '2020-08-04 15:05:44', '2020-08-04 15:05:44'),
(18, 'y7fnLfUu4Px9mFIkm4spP0kz8m3ZJSebQ1ASoXKp.jpeg', 1, 12, '2020-07-12 16:36:28', '2020-07-12 16:36:28', NULL),
(19, 'P7f5DaybhCDjZUUj7zV8jH0BIWqqF55yrK21S98D.jpeg', 4, 13, '2020-07-26 12:17:07', '2020-07-26 12:17:07', NULL),
(20, 'quCIBtJKDwoJTaI7aYDQFTaaEMfLxTumjqvWfu5C.jpeg', 4, 13, '2020-07-26 12:18:29', '2020-07-26 12:18:29', NULL),
(21, 'qZ4jrmARSIxpjm1W6UmTEOcVFW24xezYJi9ATsuE.jpeg', 2, NULL, '2020-08-11 14:25:45', '2020-08-11 14:25:45', NULL),
(22, 'ZddtaSs97RZzCpDBi2Avp67lPjZOfJBIpl0qcwht.jpeg', 5, 16, '2020-08-23 21:06:28', '2020-08-23 21:06:28', NULL),
(23, '1612954682_MEzMoIMTfCERPDcvMxDRUE9811jh8s5ngTn3msjc.webp', 6, NULL, '2021-02-10 10:58:03', '2021-02-10 10:58:03', NULL),
(24, '1612954783_nNWEiXlzF7BkfczuT2RywWb3P3sqU8mxvSKZvqZP.webp', 6, NULL, '2021-02-10 10:59:44', '2021-02-10 10:59:44', NULL),
(25, '1612954841_kXcvn13wGqS8GUckjsAj6SvDJ5ChuaSOS6cA91Iz.webp', 6, NULL, '2021-02-10 11:00:41', '2021-02-10 11:00:41', NULL),
(26, '1612954971_2242dLUcsbWO4w9mjaloT6E3eQs0H0ARp219E793.webp', 6, NULL, '2021-02-10 11:02:51', '2021-02-10 11:02:51', NULL);

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `city_translations`
--

CREATE TABLE `city_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `city_id` bigint(20) UNSIGNED NOT NULL,
  `locale` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `city_translations`
--

INSERT INTO `city_translations` (`id`, `city_id`, `locale`, `title`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(29, 14, 'en', 'Virginia', '<p>Virginia State less city</p>', '2020-07-06 10:15:03', '2020-07-06 16:17:11', '2020-07-06 16:17:11'),
(30, 15, 'en', 'Baltimore', '<p><a style=\"color: #faa700; background-image: none; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; outline-color: #3366cc; font-family: sans-serif; font-size: 14px;\" title=\"\" href=\"https://en.wikipedia.org/wiki/Baltimore\">Baltimore</a></p>', '2020-07-06 10:17:21', '2020-07-06 10:17:21', NULL),
(31, 16, 'en', 'Istanbul', '<p>sss</p>', '2020-07-06 15:51:07', '2020-08-04 15:05:39', '2020-08-04 15:05:39'),
(32, 17, 'en', 'Baku', '<p>Baku</p>', '2020-07-12 15:09:16', '2020-08-04 15:05:44', '2020-08-04 15:05:44'),
(33, 18, 'en', 'Tampa', '<p>Tampa</p>', '2020-07-12 16:36:28', '2020-07-12 16:36:28', NULL),
(34, 19, 'en', 'London', '<p>London</p>', '2020-07-26 12:17:07', '2020-07-26 12:17:07', NULL),
(35, 20, 'en', 'Manchester', '<p>Manchester</p>', '2020-07-26 12:18:29', '2020-07-26 12:18:29', NULL),
(36, 21, 'en', 'Istanbul', '<p>İST</p>', '2020-08-11 14:25:45', '2020-08-11 14:25:45', NULL),
(37, 22, 'en', 'Berlin', '<p>Berlin</p>', '2020-08-23 21:06:28', '2020-08-23 21:06:28', NULL),
(38, 23, 'en', 'Budapest', '<p>Budapest</p>', '2021-02-10 10:58:03', '2021-02-10 10:58:03', NULL),
(39, 24, 'en', 'Debrecen', '<p>Debrecen</p>', '2021-02-10 10:59:44', '2021-02-10 10:59:44', NULL),
(40, 25, 'en', 'Szeged', '<p>Szeged</p>', '2021-02-10 11:00:41', '2021-02-10 11:00:41', NULL),
(41, 26, 'en', 'Pecs', '<p>Pecs</p>', '2021-02-10 11:02:51', '2021-02-10 11:02:51', NULL);

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `contact_us`
--

CREATE TABLE `contact_us` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` int(11) NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `institution` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` bigint(20) UNSIGNED NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `contact_us`
--

INSERT INTO `contact_us` (`id`, `full_name`, `phone`, `email`, `institution`, `country`, `message`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Aakash Gandhi', 77097, 'aakash.g@cearsinfotech.com', 'test', 4, 'fdgdfg', '2020-09-24 08:34:28', '2020-09-24 08:34:28', NULL),
(2, 'Aakash Gandhi', 333333, 'paakashg@gmail.com', 'test', 3, 'this is test', '2020-09-24 08:38:53', '2020-09-24 08:38:53', NULL),
(3, 'Aakash Gandhi', 333332, 'paakashg1@gmail.com', 'test', 3, 'this is test', '2020-09-24 08:39:57', '2020-09-24 08:39:57', NULL),
(4, 'Aakash Gandhi', 3323331, 'paakashg1@dgmail.com', 'test', 3, 'this is test', '2020-09-24 08:41:53', '2020-09-24 08:41:53', NULL),
(5, 'Aakash Gandhi', 33231331, 'paaka4shg1@dgmail.com', 'test', 3, 'this is test', '2020-09-24 08:50:36', '2020-09-24 08:50:36', NULL),
(6, 'Aakash Gandhi', 444444, 'admin@fddf.com', 'test', 2, 'fsdfdsf', '2020-09-25 07:23:07', '2020-09-25 07:23:07', NULL),
(7, 'Aakash Gandhi', 885545, 'paakagshg@gmail.com', 'test', 2, 'test', '2020-09-25 08:29:31', '2020-09-25 08:29:31', NULL),
(8, 'ECIZvHlyto', 2147483647, 'denisnorman3856@gmail.com', 'rvHOIRdFDjCcbtma', 5, 'FEZSPijDgz', '2020-12-06 19:06:09', '2020-12-06 19:06:09', NULL),
(9, 'Jerrymip', 365145284, 'elena_angel9393@gmail.com', '365145284', 3, 'You wanted to get back at me? Take that!!! \r\n \r\nhttp://anti-covid.us/', '2020-12-30 22:18:11', '2020-12-30 22:18:11', NULL);

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_residential` tinyint(1) NOT NULL DEFAULT '0',
  `degree_sequence` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '[]'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `countries`
--

INSERT INTO `countries` (`id`, `currency_id`, `image`, `created_at`, `updated_at`, `deleted_at`, `is_residential`, `degree_sequence`) VALUES
(1, 1, '1611640013_4HerpjLckobxmUZ9WzhDtr16jD8TFAZ83Mcj66jR.webp', '2020-07-06 10:13:03', '2021-01-26 05:46:53', NULL, 0, '[\"3\",\"2\",\"1\",\"4\"]'),
(2, 8, '1611639928_8r03VXdV9XUHrblu3ER0MenYHUJoyyAeMS5aZ4KI.webp', '2020-07-06 15:50:31', '2021-01-26 05:45:29', NULL, 0, '[\"3\",\"5\",\"2\",\"1\",\"4\"]'),
(3, 9, '7gXGs5PNTHFwnJiyqzyjZHvzDqz1ofqSpivoHsVD.jpeg', '2020-07-08 13:29:59', '2020-08-04 15:05:44', NULL, 1, '[\"3\",\"5\",\"2\",\"1\",\"4\"]'),
(4, 10, '1611640068_wJeFWcsALUECkG7qmxwY2picR0axvePYzylvs5RU.webp', '2020-07-26 12:11:33', '2021-01-26 05:47:49', NULL, 0, '[\"3\",\"5\",\"6\",\"2\",\"1\",\"4\"]'),
(5, 11, '1611639994_7zlwYRML46UhJiquWgXS2oApbyLHgEgFn9DTGGL6.webp', '2020-08-23 21:02:19', '2021-01-26 05:46:35', NULL, 0, '[]'),
(6, 12, '1612954568_IPQqpOCabxi7WcfxXuKlTovNOmiDUzu0tcH4EdcN.webp', '2021-02-10 10:56:08', '2021-02-10 10:56:08', NULL, 0, '[]');

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `country_translations`
--

CREATE TABLE `country_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `locale` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `country_translations`
--

INSERT INTO `country_translations` (`id`, `country_id`, `locale`, `title`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(71, 1, 'az', NULL, NULL, '2020-07-06 10:13:03', '2020-07-06 10:13:03', NULL),
(72, 1, 'en', 'USA', '<p>usa description</p>', '2020-07-06 10:13:03', '2020-07-06 10:13:03', NULL),
(73, 1, 'ru', NULL, NULL, '2020-07-06 10:13:03', '2020-07-06 10:13:03', NULL),
(74, 1, 'tr', NULL, NULL, '2020-07-06 10:13:03', '2020-07-06 10:13:03', NULL),
(75, 2, 'az', NULL, NULL, '2020-07-06 15:50:31', '2020-08-04 15:05:39', NULL),
(76, 2, 'en', 'Turkey', '<p>The number of international students choosing to study in Turkey has witnessed a significant upsurge from the 2015-16 academic year. Currently, there are around 650,000 foreign students in Turkey, signalling the country&rsquo;s growing importance as a higher education destination.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Motivations for study in Turkey include the opportunity to gain a relatively inexpensive and good quality education, with opportunities for scholarships that also pay a monthly allowance, covering accommodation and tuition fees, health insurance and travel expenses.</p>\r\n<p>&nbsp;</p>\r\n<p>Turkey is already a firmly established tourist destination, with nearly 40 million tourists visiting from all over the world in 2017 according to Invest in Turkey, making it the 10th most popular holiday destination. The Turkish government is keen to extend this popularity into the international student market, with a target of 350,000 international students.</p>\r\n<p>&nbsp;</p>\r\n<p>If you&rsquo;d like to study in Turkey, click on the tabs below to find out about top universities in Turkey, popular cities for students, how much you&rsquo;ll need to budget, and how to get a student visa.</p>', '2020-07-06 15:50:31', '2020-12-31 18:10:56', NULL),
(77, 2, 'ru', NULL, NULL, '2020-07-06 15:50:31', '2020-08-04 15:05:39', NULL),
(78, 2, 'tr', NULL, NULL, '2020-07-06 15:50:31', '2020-08-04 15:05:39', NULL),
(79, 3, 'az', NULL, NULL, '2020-07-08 13:29:59', '2020-08-04 15:05:44', NULL),
(80, 3, 'en', 'Azerbaijan', '<p>az</p>', '2020-07-08 13:29:59', '2020-08-04 15:05:44', NULL),
(81, 3, 'ru', NULL, NULL, '2020-07-08 13:29:59', '2020-08-04 15:05:44', NULL),
(82, 3, 'tr', NULL, NULL, '2020-07-08 13:29:59', '2020-08-04 15:05:44', NULL),
(83, 4, 'az', NULL, NULL, '2020-07-26 12:11:33', '2020-07-26 12:11:33', NULL),
(84, 4, 'en', 'The United Kingdom', '<p>The United Kingdom</p>', '2020-07-26 12:11:33', '2020-07-26 12:11:33', NULL),
(85, 4, 'ru', NULL, NULL, '2020-07-26 12:11:33', '2020-07-26 12:11:33', NULL),
(86, 4, 'tr', NULL, NULL, '2020-07-26 12:11:33', '2020-07-26 12:11:33', NULL),
(87, 5, 'az', NULL, NULL, '2020-08-23 21:02:19', '2020-08-23 21:02:19', NULL),
(88, 5, 'en', 'Germany', '<p>Germany</p>', '2020-08-23 21:02:19', '2020-08-23 21:02:19', NULL),
(89, 5, 'ru', NULL, NULL, '2020-08-23 21:02:19', '2020-08-23 21:02:19', NULL),
(90, 5, 'tr', NULL, NULL, '2020-08-23 21:02:19', '2020-08-23 21:02:19', NULL),
(91, 6, 'az', NULL, NULL, '2021-02-10 10:56:08', '2021-02-10 10:56:08', NULL),
(92, 6, 'en', 'Hungary', '<p>Hungary</p>', '2021-02-10 10:56:08', '2021-02-10 10:56:08', NULL),
(93, 6, 'ru', NULL, NULL, '2021-02-10 10:56:08', '2021-02-10 10:56:08', NULL),
(94, 6, 'tr', NULL, NULL, '2021-02-10 10:56:08', '2021-02-10 10:56:08', NULL);

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `country_wise_education`
--

CREATE TABLE `country_wise_education` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `residential_country_id` bigint(20) UNSIGNED NOT NULL,
  `destination_country_id` bigint(20) UNSIGNED NOT NULL,
  `residential_degree_id` bigint(20) UNSIGNED NOT NULL,
  `destination_degree_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `country_wise_education`
--

INSERT INTO `country_wise_education` (`id`, `residential_country_id`, `destination_country_id`, `residential_degree_id`, `destination_degree_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, 1, 3, 5, '2020-08-10 13:44:27', '2020-08-10 14:33:24', '2020-08-10 14:33:24'),
(2, 2, 4, 3, 5, '2020-08-10 14:01:02', '2020-08-10 16:49:07', '2020-08-10 16:49:07'),
(3, 3, 2, 3, 2, '2020-08-10 14:11:19', '2020-08-10 16:49:03', '2020-08-10 16:49:03'),
(4, 3, 1, 3, 5, '2020-08-10 14:34:26', '2020-08-10 14:34:42', '2020-08-10 14:34:42'),
(5, 3, 4, 3, 5, '2020-08-10 16:51:33', '2020-08-10 16:51:33', NULL),
(6, 3, 4, 2, 1, '2020-08-10 16:52:02', '2020-08-10 16:52:02', NULL),
(7, 3, 4, 1, 4, '2020-08-10 16:52:25', '2020-08-10 16:52:25', NULL),
(8, 3, 4, 7, 2, '2020-08-10 16:56:35', '2020-08-10 16:56:35', NULL),
(9, 3, 4, 8, 2, '2020-08-10 16:57:42', '2020-08-10 16:57:42', NULL),
(10, 3, 4, 3, 2, '2020-08-10 16:58:05', '2020-08-10 16:58:21', '2020-08-10 16:58:21'),
(11, 3, 2, 3, 2, '2020-08-10 16:58:42', '2020-08-10 16:58:42', NULL),
(12, 3, 2, 2, 1, '2020-08-10 16:59:05', '2020-08-10 16:59:05', NULL),
(13, 3, 2, 1, 4, '2020-08-10 16:59:23', '2020-08-10 16:59:23', NULL),
(14, 3, 2, 5, 2, '2020-08-10 17:00:23', '2020-08-10 17:00:23', NULL),
(15, 3, 2, 7, 2, '2020-08-10 17:00:48', '2020-08-10 17:00:48', NULL),
(16, 3, 2, 8, 2, '2020-08-10 17:01:13', '2020-08-10 17:01:13', NULL),
(17, 3, 1, 3, 2, '2020-08-10 17:02:50', '2020-08-10 17:02:50', NULL),
(18, 3, 1, 2, 1, '2020-08-10 17:03:55', '2020-08-10 17:03:55', NULL),
(19, 3, 1, 1, 4, '2020-08-10 17:05:26', '2020-08-10 17:05:26', NULL),
(20, 2, 1, 3, 2, '2020-08-11 12:03:09', '2020-08-11 12:03:09', NULL),
(21, 2, 4, 3, 5, '2020-08-11 12:03:29', '2020-08-11 12:03:29', NULL),
(22, 2, 4, 2, 1, '2020-08-11 12:03:50', '2020-08-11 12:03:50', NULL),
(23, 2, 4, 1, 4, '2020-08-11 12:04:10', '2020-08-11 12:04:10', NULL),
(24, 2, 4, 5, 2, '2020-08-11 12:04:35', '2020-08-11 12:04:35', NULL),
(25, 3, 5, 3, 2, '2021-01-05 14:53:19', '2021-01-05 14:53:19', NULL);

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `usd_rate` decimal(10,2) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `currencies`
--

INSERT INTO `currencies` (`id`, `code`, `symbol`, `usd_rate`, `is_default`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'USD', '$', '1.00', 1, NULL, '2020-04-24 12:48:25', NULL),
(2, 'RUB', '₽', '74.79', 0, '2020-04-24 12:49:21', '2020-04-24 12:49:21', NULL),
(3, 'NZD', '$', '1.67', 0, '2020-04-24 13:25:25', '2020-08-23 16:15:17', '2020-08-23 16:15:17'),
(4, 'AUD', '$', '1.57', 0, '2020-04-24 13:28:04', '2020-08-23 16:15:54', '2020-08-23 16:15:54'),
(5, 'CAD', 'C$', '0.76', 0, '2020-04-24 13:29:00', '2020-08-23 21:01:24', NULL),
(6, 'INR', '₹', '76.36', 0, '2020-04-24 13:29:58', '2020-08-23 16:15:24', '2020-08-23 16:15:24'),
(7, 'CFP', '₣', '110.78', 0, '2020-04-24 13:32:17', '2020-08-23 16:15:32', '2020-08-23 16:15:32'),
(8, 'TRY', '₺', '7.34', 0, '2020-04-24 13:33:26', '2020-08-23 16:15:04', NULL),
(9, 'AZN', '₼', '1.70', 0, '2020-05-01 15:47:07', '2020-12-11 07:03:51', '2020-12-11 07:03:51'),
(10, 'GBP', '£', '1.31', 0, '2020-07-26 12:10:06', '2020-08-23 20:59:55', NULL),
(11, 'EUR', '€', '1.18', 0, '2020-08-23 20:59:15', '2020-08-23 20:59:15', NULL),
(12, 'HUF', 'Ft', '0.00', 0, '2020-08-23 21:09:17', '2020-08-23 21:09:17', NULL),
(13, 'Man', '₼', '0.58', 0, '2020-12-31 18:07:50', '2020-12-31 18:07:50', NULL);

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `education_levels`
--

CREATE TABLE `education_levels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_foundation` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `education_levels`
--

INSERT INTO `education_levels` (`id`, `created_at`, `updated_at`, `deleted_at`, `is_foundation`) VALUES
(1, '2020-03-21 12:41:16', '2020-08-10 17:58:00', NULL, 1),
(2, '2020-03-23 16:40:02', '2020-08-10 17:58:08', NULL, 1),
(3, '2020-05-01 15:49:19', '2020-08-10 17:58:16', NULL, 1),
(4, '2020-07-04 12:53:30', '2020-08-10 17:58:24', NULL, 1),
(5, '2020-07-04 12:53:47', '2020-07-30 23:56:41', NULL, 1),
(6, '2020-07-26 18:42:02', '2020-07-26 18:45:30', '2020-07-26 18:45:30', 0),
(7, '2020-08-10 16:54:30', '2020-08-10 16:54:30', NULL, 1),
(8, '2020-08-10 16:55:58', '2020-08-10 16:55:58', NULL, 1),
(9, '2020-08-14 10:41:35', '2020-08-14 10:41:59', '2020-08-14 10:41:59', 0);

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `education_level_translations`
--

CREATE TABLE `education_level_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `education_level_id` bigint(20) UNSIGNED NOT NULL,
  `locale` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `education_level_translations`
--

INSERT INTO `education_level_translations` (`id`, `education_level_id`, `locale`, `title`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'en', 'Master\'s', '<p>Master</p>', '2020-03-21 12:41:16', '2020-04-21 10:24:30', NULL),
(2, 2, 'en', 'Bachelor\'s', '<p>ss</p>', '2020-03-23 16:40:02', '2020-04-21 10:23:59', NULL),
(3, 1, 'ru', 'Мастер', '<pre id=\"tw-target-text\" class=\"tw-data-text tw-text-large tw-ta\" dir=\"ltr\" style=\"unicode-bidi: isolate; font-size: 28px; line-height: 36px; background-color: #f8f9fa; border: none; padding: 2px 0.14em 2px 0px; position: relative; margin-top: -2px; margin-bottom: -2px; resize: none; font-family: inherit; overflow: hidden; width: 277px; white-space: pre-wrap; overflow-wrap: break-word; color: #222222;\" data-placeholder=\"Translation\"><span lang=\"ru\">Мастер</span></pre>', '2020-04-09 12:34:05', '2020-04-09 12:34:05', NULL),
(4, 1, 'tr', 'Yüksek Lisans', '<pre id=\"tw-target-text\" class=\"tw-data-text tw-text-large tw-ta\" dir=\"ltr\" style=\"unicode-bidi: isolate; line-height: 36px; border: none; padding: 2px 0.14em 2px 0px; position: relative; margin-top: -2px; margin-bottom: -2px; resize: none; font-family: inherit; overflow: hidden; width: 277px; white-space: pre-wrap; overflow-wrap: break-word;\" data-placeholder=\"Translation\"><span lang=\"tr\">Usta</span></pre>', '2020-04-09 12:34:05', '2020-04-21 10:24:30', NULL),
(5, 2, 'ru', 'Бакалавры', '<pre id=\"tw-target-text\" class=\"tw-data-text tw-text-large tw-ta\" dir=\"ltr\" style=\"unicode-bidi: isolate; font-size: 28px; line-height: 36px; background-color: #f8f9fa; border: none; padding: 2px 0.14em 2px 0px; position: relative; margin-top: -2px; margin-bottom: -2px; resize: none; font-family: inherit; overflow: hidden; width: 277px; white-space: pre-wrap; overflow-wrap: break-word; color: #222222;\" data-placeholder=\"Translation\"><span lang=\"ru\">Бакалавры</span></pre>', '2020-04-09 12:34:27', '2020-04-09 12:34:27', NULL),
(6, 2, 'tr', 'Lisans', '<pre id=\"tw-target-text\" class=\"tw-data-text tw-text-large tw-ta\" dir=\"ltr\" style=\"unicode-bidi: isolate; font-size: 28px; line-height: 36px; background-color: #f8f9fa; border: none; padding: 2px 0.14em 2px 0px; position: relative; margin-top: -2px; margin-bottom: -2px; resize: none; font-family: inherit; overflow: hidden; width: 277px; white-space: pre-wrap; overflow-wrap: break-word; color: #222222;\" data-placeholder=\"Translation\"><span lang=\"tr\">Lisans</span></pre>', '2020-04-09 12:34:27', '2020-04-09 12:34:27', NULL),
(7, 2, 'az', 'Bakalavr', NULL, '2020-04-21 10:23:59', '2020-04-21 10:23:59', NULL),
(8, 1, 'az', 'Magistr', NULL, '2020-04-21 10:24:30', '2020-04-21 10:24:30', NULL),
(9, 3, 'en', 'High School', '<p>ss</p>', '2020-05-01 15:49:19', '2020-07-04 12:53:10', NULL),
(10, 4, 'en', 'PhD', '<p>PhD</p>', '2020-07-04 12:53:30', '2020-07-04 12:53:30', NULL),
(11, 5, 'en', 'Foundation', '<p>foundation</p>', '2020-07-04 12:53:47', '2020-08-10 16:49:34', NULL),
(12, 6, 'en', '1st University Year', '<p>1st University Year</p>', '2020-07-26 18:42:02', '2020-07-26 18:45:30', '2020-07-26 18:45:30'),
(13, 7, 'en', '1st University Year', '<p>xdcddsf</p>', '2020-08-10 16:54:30', '2020-08-10 16:54:30', NULL),
(14, 8, 'en', '2nd University Year', '<p>2nd University Year</p>', '2020-08-10 16:55:58', '2020-08-10 16:55:58', NULL),
(15, 9, 'en', 'gfdgdfg', '<p>gfdg</p>', '2020-08-14 10:41:35', '2020-08-14 10:41:59', '2020-08-14 10:41:59');

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `exams`
--

CREATE TABLE `exams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `min` int(11) DEFAULT NULL,
  `max` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `type` enum('english','aptitude') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'english'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `exams`
--

INSERT INTO `exams` (`id`, `parent_id`, `min`, `max`, `created_at`, `updated_at`, `deleted_at`, `type`) VALUES
(1, NULL, 4, 9, '2020-03-21 12:42:02', '2020-08-01 11:10:21', '2020-08-01 11:10:21', 'english'),
(2, NULL, 10, 120, '2020-03-23 16:41:03', '2020-08-08 16:03:50', NULL, 'english'),
(3, NULL, 1, 9, '2020-07-06 17:20:05', '2020-07-25 19:27:02', '2020-07-25 19:27:02', 'english'),
(4, NULL, 1, 9, '2020-08-05 10:44:31', '2020-08-05 11:10:53', NULL, 'english'),
(5, 4, 1, 9, '2020-08-05 11:11:13', '2020-08-05 11:13:24', '2020-08-05 11:13:24', 'english'),
(6, NULL, 300, 1600, '2020-08-05 11:14:12', '2020-08-07 16:53:08', NULL, 'aptitude');

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `exam_sub_sections`
--

CREATE TABLE `exam_sub_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `exam_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `exam_sub_sections`
--

INSERT INTO `exam_sub_sections` (`id`, `exam_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 6, '2020-08-06 14:24:45', '2020-08-06 15:01:37', '2020-08-06 15:01:37'),
(2, 6, '2020-08-06 14:33:21', '2020-08-06 15:00:59', '2020-08-06 15:00:59'),
(3, 2, '2020-08-06 14:36:30', '2020-08-06 14:36:30', NULL),
(4, 2, '2020-08-06 14:36:56', '2020-08-06 14:36:56', NULL),
(5, 6, '2020-08-06 15:01:51', '2020-08-08 16:02:35', '2020-08-08 16:02:35'),
(6, 6, '2020-08-06 15:02:22', '2020-08-08 16:02:40', '2020-08-08 16:02:40'),
(7, 6, '2020-08-06 15:53:38', '2020-08-06 15:53:38', NULL),
(8, 6, '2020-08-06 15:53:55', '2020-08-06 15:53:55', NULL),
(9, 4, '2020-08-06 15:56:02', '2020-08-06 15:56:02', NULL),
(10, 2, '2020-08-08 16:01:23', '2020-08-08 16:01:23', NULL),
(11, 2, '2020-08-08 16:01:36', '2020-08-08 16:01:36', NULL),
(12, 4, '2020-08-08 16:02:01', '2020-08-08 16:02:01', NULL),
(13, 4, '2020-08-08 16:02:11', '2020-08-08 16:02:11', NULL),
(14, 4, '2020-08-08 16:02:19', '2020-08-08 16:02:19', NULL),
(15, 6, '2020-08-08 16:02:55', '2020-08-08 16:02:55', NULL);

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `exam_sub_section_translations`
--

CREATE TABLE `exam_sub_section_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `exam_sub_section_id` bigint(20) UNSIGNED NOT NULL,
  `locale` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `exam_sub_section_translations`
--

INSERT INTO `exam_sub_section_translations` (`id`, `exam_sub_section_id`, `locale`, `title`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'en', 'speaking', '2020-08-06 14:24:45', '2020-08-06 15:01:37', '2020-08-06 15:01:37'),
(2, 2, 'en', 'Writting', '2020-08-06 14:33:21', '2020-08-06 15:00:59', '2020-08-06 15:00:59'),
(3, 3, 'en', 'Reading', '2020-08-06 14:36:35', '2020-08-06 14:36:35', NULL),
(4, 4, 'en', 'Listening', '2020-08-06 14:37:03', '2020-08-06 14:37:03', NULL),
(5, 5, 'en', 'speakings', '2020-08-06 15:01:55', '2020-08-08 16:02:35', '2020-08-08 16:02:35'),
(6, 6, 'en', 'writting', '2020-08-06 15:02:22', '2020-08-08 16:02:40', '2020-08-08 16:02:40'),
(7, 7, 'en', 'Math', '2020-08-06 15:53:38', '2020-08-06 15:53:38', NULL),
(8, 8, 'az', 'Verbal', '2020-08-06 15:53:55', '2020-08-06 15:53:55', NULL),
(9, 8, 'en', 'Verbal', '2020-08-06 15:53:55', '2020-08-06 15:53:55', NULL),
(10, 9, 'en', 'Listening', '2020-08-06 15:56:02', '2020-08-06 15:56:02', NULL),
(11, 10, 'en', 'Writing', '2020-08-08 16:01:23', '2020-08-08 16:01:23', NULL),
(12, 11, 'en', 'Speaking', '2020-08-08 16:01:36', '2020-08-08 16:01:36', NULL),
(13, 12, 'en', 'Reading', '2020-08-08 16:02:01', '2020-08-08 16:02:01', NULL),
(14, 13, 'en', 'Writing', '2020-08-08 16:02:11', '2020-08-08 16:02:11', NULL),
(15, 14, 'en', 'Speaking', '2020-08-08 16:02:19', '2020-08-08 16:02:19', NULL),
(16, 15, 'en', 'Essay', '2020-08-08 16:02:55', '2020-08-08 16:02:55', NULL);

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `exam_translations`
--

CREATE TABLE `exam_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `exam_id` bigint(20) UNSIGNED NOT NULL,
  `locale` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `exam_translations`
--

INSERT INTO `exam_translations` (`id`, `exam_id`, `locale`, `title`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'en', 'IELTS', NULL, '2020-03-21 12:42:02', '2020-08-01 11:10:21', '2020-08-01 11:10:21'),
(2, 2, 'en', 'TOEFL IBT', NULL, '2020-03-23 16:41:03', '2020-06-30 11:42:47', NULL),
(3, 3, 'az', 'IELTS new', NULL, '2020-07-06 17:20:05', '2020-07-25 19:26:58', '2020-07-25 19:26:58'),
(4, 3, 'en', 'IELTS new', NULL, '2020-07-06 17:20:05', '2020-07-25 19:26:58', '2020-07-25 19:26:58'),
(5, 4, 'en', 'IELTS', NULL, '2020-08-05 10:44:31', '2020-08-05 11:10:53', NULL),
(6, 5, 'en', 'Listening', NULL, '2020-08-05 11:11:13', '2020-08-05 11:13:24', '2020-08-05 11:13:24'),
(7, 6, 'en', 'SAT I', NULL, '2020-08-05 11:14:12', '2020-08-05 11:14:12', NULL);

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '0=university, 1=program',
  `institution_id` bigint(20) UNSIGNED DEFAULT NULL,
  `program_id` bigint(20) UNSIGNED DEFAULT NULL,
  `country_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `faqs`
--

INSERT INTO `faqs` (`id`, `type`, `institution_id`, `program_id`, `country_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4, '0', NULL, NULL, NULL, '2020-04-09 13:51:54', '2020-04-09 13:51:54', NULL),
(5, '0', NULL, NULL, NULL, '2020-04-09 13:55:02', '2020-04-09 13:55:02', NULL),
(6, '0', NULL, NULL, NULL, '2020-04-09 13:56:07', '2020-04-09 13:56:07', NULL),
(8, '1', NULL, NULL, NULL, '2020-04-09 14:00:38', '2020-04-09 14:00:38', NULL),
(9, '1', NULL, NULL, NULL, '2020-04-09 14:01:37', '2020-04-09 14:01:37', NULL),
(10, '1', NULL, NULL, NULL, '2020-04-09 14:02:22', '2020-04-09 14:02:22', NULL),
(11, '0', NULL, NULL, NULL, '2021-02-19 09:51:38', '2021-02-19 09:51:38', NULL);

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `faq_translations`
--

CREATE TABLE `faq_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `faq_id` bigint(20) UNSIGNED NOT NULL,
  `locale` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `question` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `faq_translations`
--

INSERT INTO `faq_translations` (`id`, `faq_id`, `locale`, `question`, `answer`, `created_at`, `updated_at`, `deleted_at`) VALUES
(7, 4, 'en', 'Why won\'t my payment go through?', '<p><span style=\"color: #666666; font-family: Poppins, sans-serif; font-size: 14px;\">Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et.&nbsp;</span></p>', '2020-04-09 13:51:54', '2020-04-09 14:23:57', NULL),
(8, 4, 'ru', 'Почему мой платеж не пройдет?', '<p>Д. результирующая клише критики, за такую высокой жизнь денонсировать Терри Ричардсон для кальмара. 3 волка луна услуги, не cupidatat скейтборда потребительского бранч. Food Truck киноа не знаю, как мой труд, такой контекст. 3 волком время луны бранч, но они положили птицу на него некоторые кальмары одного происхождения кофе не будет принимать Шордич.</p>\r\n<p>&nbsp;</p>', '2020-04-09 13:51:54', '2020-04-09 14:23:57', NULL),
(9, 4, 'tr', 'Ödemem neden yapılmıyor?', '<p>DA &ccedil;ıkan klişe kalamar i&ccedil;in Terry Richardson Denounce b&ouml;yle y&uuml;ksek yaşam i&ccedil;in eleştirdi. değil kaykay t&uuml;ketici bir brunch cupidatat 3 kurt ay hizmetleri. quinoa Gıda Kamyon bilmiyorum nasıl benim zahmet, b&ouml;yle bir bağlam. 3 kurt ay Brunch zaman, ancak bazı kalamar tek k&ouml;kenli kahvedir Shoreditch alacak değil &uuml;zerinde bir kuş koydular.</p>', '2020-04-09 13:51:54', '2020-04-09 14:23:57', NULL),
(10, 5, 'en', 'What are English language proficiency requirements?', '<p><span style=\"color: #666666; font-family: Poppins, sans-serif; font-size: 14px;\">Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo</span></p>', '2020-04-09 13:55:02', '2020-04-09 13:55:02', NULL),
(11, 5, 'ru', 'Каковы требования к владению английским языком?', '<p>Д. результирующая клише критики, за такую высокой жизнь денонсировать Терри Ричардсон для кальмара. 3 волка луна услуги, не cupidatat скейтборда потребительского бранч. Food Truck киноа не знаю, как мой труд, такой контекст. 3 волком время луны бранч, но они положили птицу на него некоторые кальмары одного происхождения кофе не будет принимать Шордич.</p>\r\n<p>&nbsp;</p>', '2020-04-09 13:55:02', '2020-04-09 14:26:45', NULL),
(12, 5, 'tr', 'İngilizce yeterlilik koşulları nelerdir?', '<p>DA &ccedil;ıkan klişe kalamar i&ccedil;in Terry Richardson Denounce b&ouml;yle y&uuml;ksek yaşam i&ccedil;in eleştirdi. değil kaykay t&uuml;ketici bir brunch cupidatat 3 kurt ay hizmetleri. quinoa Gıda Kamyon bilmiyorum nasıl benim zahmet, b&ouml;yle bir bağlam. 3 kurt ay Brunch zaman, ancak bazı kalamar tek k&ouml;kenli kahvedir Shoreditch alacak değil &uuml;zerinde bir kuş koydular.</p>\r\n<p>&nbsp;</p>', '2020-04-09 13:55:02', '2020-04-09 14:26:45', NULL),
(13, 6, 'en', 'How do I get a refund?', '<p><span style=\"color: #666666; font-family: Poppins, sans-serif; font-size: 14px;\">Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident</span></p>', '2020-04-09 13:56:13', '2020-04-09 13:56:13', NULL),
(14, 6, 'ru', 'Как мне получить возврат?', '<p>Д. результирующая клише критики, за такую высокой жизнь денонсировать Терри Ричардсон для кальмара. 3 волка луна услуги, не cupidatat скейтборда потребительского бранч. Food Truck киноа не знаю, как мой труд, такой контекст. 3 волком время луны бранч, но они положили птицу на него некоторые кальмары одного происхождения кофе не будет принимать Шордич.</p>\r\n<p>&nbsp;</p>', '2020-04-09 13:56:13', '2020-04-09 14:27:19', NULL),
(15, 6, 'tr', 'Nasıl geri ödeme alabilirim?', '<p>DA &ccedil;ıkan klişe kalamar i&ccedil;in Terry Richardson Denounce b&ouml;yle y&uuml;ksek yaşam i&ccedil;in eleştirdi. değil kaykay t&uuml;ketici bir brunch cupidatat 3 kurt ay hizmetleri. quinoa Gıda Kamyon bilmiyorum nasıl benim zahmet, b&ouml;yle bir bağlam. 3 kurt ay Brunch zaman, ancak bazı kalamar tek k&ouml;kenli kahvedir Shoreditch alacak değil &uuml;zerinde bir kuş koydular.</p>\r\n<p>&nbsp;</p>', '2020-04-09 13:56:13', '2020-04-09 14:27:19', NULL),
(19, 8, 'en', 'Changing account name?', '<p><span style=\"color: #666666; font-family: Poppins, sans-serif; font-size: 14px;\">Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et.&nbsp;</span></p>', '2020-04-09 14:00:38', '2020-04-09 14:00:38', NULL),
(20, 8, 'ru', 'Изменение имени учетной записи?', '<p>Д. результирующая клише критики, за такую высокой жизнь денонсировать Терри Ричардсон для кальмара. 3 волка луна услуги, не cupidatat скейтборда потребительского бранч. Food Truck киноа не знаю, как мой труд, такой контекст. 3 волком время луны бранч, но они положили птицу на него некоторые кальмары одного происхождения кофе не будет принимать Шордич.</p>\r\n<p>&nbsp;</p>', '2020-04-09 14:00:38', '2020-04-09 14:20:50', NULL),
(21, 8, 'tr', 'Hesap adı değiştiriliyor mu?', '<p>DA &ccedil;ıkan klişe kalamar i&ccedil;in Terry Richardson Denounce b&ouml;yle y&uuml;ksek yaşam i&ccedil;in eleştirdi. değil kaykay t&uuml;ketici bir brunch cupidatat 3 kurt ay hizmetleri. quinoa Gıda Kamyon bilmiyorum nasıl benim zahmet, b&ouml;yle bir bağlam. 3 kurt ay Brunch zaman, ancak bazı kalamar tek k&ouml;kenli kahvedir Shoreditch alacak değil &uuml;zerinde bir kuş koydular.</p>', '2020-04-09 14:00:38', '2020-04-09 14:20:50', NULL),
(22, 9, 'en', 'What is the transfer application process?', '<p><span style=\"color: #666666; font-family: Poppins, sans-serif; font-size: 14px;\">Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch.</span></p>', '2020-04-09 14:01:37', '2020-04-09 14:01:37', NULL),
(23, 9, 'ru', 'Как проходит процесс подачи заявления?', '<p>Д. результирующая клише критики, за такую высокой жизнь денонсировать Терри Ричардсон для кальмара. 3 волка луна услуги, не cupidatat скейтборда потребительского бранч. Food Truck киноа не знаю, как мой труд, такой контекст. 3 волком время луны бранч, но они положили птицу на него некоторые кальмары одного происхождения кофе не будет принимать Шордич.</p>\r\n<p>&nbsp;</p>', '2020-04-09 14:01:37', '2020-04-09 14:25:32', NULL),
(24, 9, 'tr', 'Transfer başvuru süreci nedir?', '<p>DA &ccedil;ıkan klişe kalamar i&ccedil;in Terry Richardson Denounce b&ouml;yle y&uuml;ksek yaşam i&ccedil;in eleştirdi. değil kaykay t&uuml;ketici bir brunch cupidatat 3 kurt ay hizmetleri. quinoa Gıda Kamyon bilmiyorum nasıl benim zahmet, b&ouml;yle bir bağlam. 3 kurt ay Brunch zaman, ancak bazı kalamar tek k&ouml;kenli kahvedir Shoreditch alacak değil &uuml;zerinde bir kuş koydular.</p>\r\n<p>&nbsp;</p>', '2020-04-09 14:01:37', '2020-04-09 14:25:33', NULL),
(25, 10, 'en', 'What is distance education?', '<p><span style=\"color: #666666; font-family: Poppins, sans-serif; font-size: 14px;\">Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor,</span></p>', '2020-04-09 14:02:23', '2020-04-09 14:02:23', NULL),
(26, 10, 'ru', 'Что такое дистанционное обучение?', '<p>Д. результирующая клише критики, за такую высокой жизнь денонсировать Терри Ричардсон для кальмара. 3 волка луна услуги, не cupidatat скейтборда потребительского бранч. Food Truck киноа не знаю, как мой труд, такой контекст. 3 волком время луны бранч, но они положили птицу на него некоторые кальмары одного происхождения кофе не будет принимать Шордич.</p>\r\n<p>&nbsp;</p>', '2020-04-09 14:02:23', '2020-04-09 14:25:04', NULL),
(27, 10, 'tr', 'Uzaktan eğitim nedir?', '<p>DA &ccedil;ıkan klişe kalamar i&ccedil;in Terry Richardson Denounce b&ouml;yle y&uuml;ksek yaşam i&ccedil;in eleştirdi. değil kaykay t&uuml;ketici bir brunch cupidatat 3 kurt ay hizmetleri. quinoa Gıda Kamyon bilmiyorum nasıl benim zahmet, b&ouml;yle bir bağlam. 3 kurt ay Brunch zaman, ancak bazı kalamar tek k&ouml;kenli kahvedir Shoreditch alacak değil &uuml;zerinde bir kuş koydular.</p>\r\n<p>&nbsp;</p>', '2020-04-09 14:02:23', '2020-04-09 14:25:04', NULL),
(28, 11, 'az', 'hgyh', '<p>fyfy</p>', '2021-02-19 09:51:38', '2021-02-19 09:51:38', NULL),
(29, 11, 'en', 'vgg', '<p>gygy</p>', '2021-02-19 09:51:38', '2021-02-19 09:51:38', NULL),
(30, 11, 'ru', NULL, NULL, '2021-02-19 09:51:38', '2021-02-19 09:51:38', NULL),
(31, 11, 'tr', NULL, NULL, '2021-02-19 09:51:38', '2021-02-19 09:51:38', NULL);

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `foundation_routes`
--

CREATE TABLE `foundation_routes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `apply_to` enum('both','residential','destination') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `foundation_degrees` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '[]'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `grading_schemes`
--

CREATE TABLE `grading_schemes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `min` decimal(8,2) DEFAULT NULL,
  `max` decimal(8,2) DEFAULT NULL,
  `is_custom` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `grading_schemes`
--

INSERT INTO `grading_schemes` (`id`, `min`, `max`, `is_custom`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4, '1.00', '100.00', 0, '2020-06-28 11:37:20', '2020-07-08 13:31:00', '2020-07-08 13:31:00'),
(5, '1.00', '100.00', 0, '2020-06-28 11:37:45', '2020-07-08 13:31:04', '2020-07-08 13:31:04'),
(7, '1.00', '100.00', 0, '2020-06-28 11:38:38', '2020-07-08 13:31:09', '2020-07-08 13:31:09'),
(8, '1.00', '5.00', 0, '2020-06-29 16:22:31', '2020-07-08 13:31:13', '2020-07-08 13:31:13'),
(9, NULL, NULL, 0, '2020-07-06 17:57:07', '2020-07-26 18:51:50', '2020-07-26 18:51:50'),
(10, '1.00', '100.00', 0, '2020-07-06 17:57:42', '2020-07-06 17:57:42', NULL),
(11, '1.00', '5.00', 0, '2020-07-08 13:31:29', '2020-07-08 13:31:29', NULL),
(12, '1.00', '100.00', 0, '2020-07-08 13:36:20', '2020-07-08 13:36:20', NULL),
(13, '1.00', '100.00', 0, '2020-07-17 12:46:57', '2020-07-17 12:46:57', NULL),
(14, '1.00', '100.00', 0, '2020-07-26 18:52:07', '2020-07-31 08:15:08', NULL),
(15, '1.00', '100.00', 0, '2020-08-11 11:58:26', '2020-08-11 11:58:41', '2020-08-11 11:58:41'),
(16, '1.00', '100.00', 0, '2020-08-11 11:58:59', '2020-08-11 11:58:59', NULL),
(17, '1.00', '100.00', 0, '2020-08-11 11:59:32', '2020-08-11 11:59:32', NULL),
(18, '1.00', '100.00', 0, '2020-08-11 12:00:15', '2020-08-11 12:00:15', NULL),
(19, '1.00', '100.00', 0, '2020-08-11 12:00:46', '2020-08-11 12:00:46', NULL);

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `grading_scheme_counrty_education_levels`
--

CREATE TABLE `grading_scheme_counrty_education_levels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `grading_scheme_id` bigint(20) UNSIGNED NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `education_level_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `grading_scheme_counrty_education_levels`
--

INSERT INTO `grading_scheme_counrty_education_levels` (`id`, `grading_scheme_id`, `country_id`, `education_level_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(19, 9, 2, 3, '2020-07-06 17:57:07', '2020-07-26 12:40:50', '2020-07-26 12:40:50'),
(20, 10, 2, 2, '2020-07-06 17:57:42', '2020-07-06 17:57:42', NULL),
(21, 11, 3, 3, '2020-07-08 13:31:29', '2020-07-08 13:31:29', NULL),
(22, 12, 3, 3, '2020-07-08 13:36:24', '2020-07-08 13:36:24', NULL),
(23, 13, 3, 2, '2020-07-17 12:47:02', '2020-07-17 12:47:02', NULL),
(24, 9, 2, 3, '2020-07-26 12:40:50', '2020-07-26 18:51:36', '2020-07-26 18:51:36'),
(25, 9, 2, 3, '2020-07-26 18:51:36', '2020-07-26 18:51:50', '2020-07-26 18:51:50'),
(26, 14, 2, 3, '2020-07-26 18:52:07', '2020-07-31 08:03:17', '2020-07-31 08:03:17'),
(27, 14, 2, 3, '2020-07-31 08:03:17', '2020-07-31 08:03:38', '2020-07-31 08:03:38'),
(28, 14, 2, 2, '2020-07-31 08:03:18', '2020-07-31 08:03:38', '2020-07-31 08:03:38'),
(29, 14, 2, 3, '2020-07-31 08:03:38', '2020-07-31 08:03:54', '2020-07-31 08:03:54'),
(30, 14, 2, 3, '2020-07-31 08:03:54', '2020-07-31 08:13:00', '2020-07-31 08:13:00'),
(31, 14, 2, 3, '2020-07-31 08:13:00', '2020-07-31 08:14:35', '2020-07-31 08:14:35'),
(32, 14, 2, 3, '2020-07-31 08:14:35', '2020-07-31 08:15:08', '2020-07-31 08:15:08'),
(33, 14, 2, 3, '2020-07-31 08:15:08', '2020-07-31 08:15:08', NULL),
(34, 15, 3, 2, '2020-08-11 11:58:26', '2020-08-11 11:58:41', '2020-08-11 11:58:41'),
(35, 16, 3, 1, '2020-08-11 11:58:59', '2020-08-11 11:58:59', NULL),
(36, 17, 3, 5, '2020-08-11 11:59:32', '2020-08-11 11:59:32', NULL),
(37, 18, 3, 7, '2020-08-11 12:00:22', '2020-08-11 12:00:22', NULL),
(38, 19, 3, 8, '2020-08-11 12:00:47', '2020-08-11 12:00:47', NULL);

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `grading_scheme_data`
--

CREATE TABLE `grading_scheme_data` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `grading_scheme_id` bigint(20) UNSIGNED NOT NULL,
  `max` decimal(8,2) DEFAULT NULL,
  `position` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `grading_scheme_data_translations`
--

CREATE TABLE `grading_scheme_data_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `grading_scheme_data_id` bigint(20) UNSIGNED NOT NULL,
  `locale` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `institutions`
--

CREATE TABLE `institutions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_id` bigint(20) UNSIGNED NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `state_id` bigint(20) UNSIGNED DEFAULT NULL,
  `city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `cover_photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `national_ranking` bigint(20) DEFAULT NULL,
  `global_ranking` bigint(20) DEFAULT NULL,
  `youtube_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `unirep_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `institutions`
--

INSERT INTO `institutions` (`id`, `slug`, `type_id`, `country_id`, `state_id`, `city_id`, `cover_photo`, `national_ranking`, `global_ranking`, `youtube_url`, `is_featured`, `is_active`, `unirep_id`, `created_at`, `updated_at`) VALUES
(26, 'iubh-university', 2, 5, 16, 22, '912880.jpg', 4, 201, '8XddcOgXFCc', 1, 1, 11, '2021-01-05 14:16:49', '2021-01-05 14:18:53'),
(27, 'koc-university', 2, 2, NULL, 21, '982827.jpeg', 3, 400, 'eMnb_vGsDYs', 1, 1, 10, '2021-01-09 17:32:17', '2021-01-20 15:19:56'),
(28, 'ozyegin-university', 2, 2, NULL, 21, '232232.jpg', 6, 500, 'A4UotDIUTPA', 1, 1, 10, '2021-01-09 20:22:06', '2021-01-20 15:19:59'),
(29, 'istanbul-bilgi-university', 2, 2, NULL, 21, '503268.jpg', 10, 700, 'EJNTkdq4Z2M', 1, 1, 10, '2021-01-09 20:30:33', '2021-01-20 15:20:06'),
(30, 'sabanci-university', 2, 2, NULL, 21, '226678.jpg', 2, 400, 'EIjkgqzSWd0', 1, 1, 10, '2021-01-09 20:37:02', '2021-01-20 15:20:03'),
(31, 'medipol-university', 2, 2, NULL, 21, '673134.jpg', 10, 500, 'zdfyxZ2cdgQ', 1, 1, 10, '2021-01-09 20:40:20', '2021-01-20 15:20:08'),
(32, 'bahcesehir-university', 2, 2, NULL, 21, '615916.jpg', 7, 500, 'wWva53j5kJA', 1, 1, 10, '2021-01-09 20:46:10', '2021-01-20 15:20:04'),
(34, 'university-of-south-florida', 2, 1, 12, 18, '151622.jpg', 43, 103, 'vf0jFfm8MTM', 1, 1, 11, '2021-02-10 06:26:15', '2021-02-10 07:51:33'),
(35, 'elte-university-eotvos-lorand-university', 2, 6, NULL, 23, NULL, 1, 101, 'E0ko1h4kWPw', 0, 1, 11, '2021-02-10 11:43:01', '2021-02-10 12:21:59'),
(36, 'ibs-international-business-school-budapest', 2, 6, NULL, 23, '237449.jpg', 4, 70, 'lohb12Yuu20', 0, 0, 11, '2021-02-12 08:54:40', '2021-02-12 08:54:40'),
(37, 'metu-budapest-metropolitan-university', 2, 6, NULL, 23, '700089.jpg', 7, NULL, 'OEQw8EtN4gc', 0, 0, 11, '2021-02-13 09:33:39', '2021-02-13 09:33:39'),
(38, 'corvinus-university-of-budapest', 2, 6, NULL, 23, '309380.jpg', 5, 600, 'IdZ6rtEBkRw', 0, 0, 11, '2021-02-15 09:59:28', '2021-02-15 09:59:28'),
(39, 'university-of-debrecen', 2, 6, NULL, 24, '950592.jpg', 4, 151, 'ZJCesY8ACEI', 0, 0, 11, '2021-02-18 06:20:11', '2021-02-18 06:20:11');

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `institution_images`
--

CREATE TABLE `institution_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `institution_id` bigint(20) UNSIGNED NOT NULL,
  `image_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `institution_images`
--

INSERT INTO `institution_images` (`id`, `institution_id`, `image_name`, `created_at`, `updated_at`) VALUES
(96, 26, 'T6452Lq5YUnMUiXpZdS0DZEjmwJRlyUV5upCIKm2.jpeg', '2021-01-05 14:18:53', '2021-01-05 14:18:53'),
(97, 26, 'FCLd6r9JcLJcLnCiVMMNLzx0eFMLOwiZELTeZzh8.jpeg', '2021-01-05 14:18:53', '2021-01-05 14:18:53'),
(98, 26, 'nWKn3zV5d4McddQgrUbD0L9KT2VTh7BV021YQDkj.jpeg', '2021-01-05 14:18:53', '2021-01-05 14:18:53'),
(99, 26, '4tPXbrNhEdD9L2I4tsmDMxtUR97qXrHuaYNe7cSu.jpeg', '2021-01-05 14:18:53', '2021-01-05 14:18:53'),
(100, 26, 'aYDBHqeiWHZEcXWaY5CbKUjmLWMcWujbolMZFIDY.jpeg', '2021-01-05 14:18:53', '2021-01-05 14:18:53'),
(107, 27, 'N2nW7VfiAulIiyFlL5zI5Sflm4K9axHw0dirhKNn.jpeg', '2021-01-09 17:35:50', '2021-01-09 17:35:50'),
(108, 28, 'a3hb3zUeq1RjwlBt8X3K7re2MaFutWcLGRspxcWz.jpeg', '2021-01-09 20:22:06', '2021-01-09 20:22:06'),
(109, 29, 'eQ6zsY97F265LstN5OfNtxqr4ISaj3jMnJUGAdi0.jpeg', '2021-01-09 20:30:33', '2021-01-09 20:30:33'),
(110, 30, 'g1ti4JFysT0qP0BTAf3vQVyxI4wguyvUIzjO9Ekx.jpeg', '2021-01-09 20:37:02', '2021-01-09 20:37:02'),
(112, 31, 'UliaDMsIV0izfxWrG4VEtLF3uU8hfmuT41Gtoehk.jpeg', '2021-01-09 20:41:31', '2021-01-09 20:41:31'),
(113, 32, 'Pv6anyugvP2ts30zsmTNTL7Bnlmws2kpgUzaeZ7h.jpeg', '2021-01-09 20:46:10', '2021-01-09 20:46:10'),
(115, 34, '1612938262_LrEgRTvnKamjmj88wqrfab1vJUT1hw4JQD1PVhhh.webp', '2021-02-10 06:26:15', '2021-02-10 06:26:15'),
(116, 34, '1612938262_tIR2cy1mPch3MsUiSeHM0VrIr0mLGbWUuYKV08Uw.webp', '2021-02-10 06:26:15', '2021-02-10 06:26:15'),
(117, 34, '1612938262_WmbYUHpYiboPEEHurPuzjCa8fppCSoqdupV0FX5v.webp', '2021-02-10 06:26:15', '2021-02-10 06:26:15'),
(118, 34, '1612938263_pCzKgrNDten1322cpT3uyo0QB3S8AoitbtQpXKfk.webp', '2021-02-10 06:26:15', '2021-02-10 06:26:15'),
(119, 34, '1612938263_lXb0uUeJGYkLChjTesdyBMuyMCZplrbtgqKealp7.webp', '2021-02-10 06:26:15', '2021-02-10 06:26:15'),
(120, 35, '1612957285_WRB12PEqVvwqSEYL4W4zD2Qy3WhUHltN44ZNqC5N.webp', '2021-02-10 11:43:01', '2021-02-10 11:43:01'),
(121, 35, '1612957285_Sw1ns9scdamNIcOCusKOjGxujHdTuKeiVZl4amfR.webp', '2021-02-10 11:43:01', '2021-02-10 11:43:01'),
(122, 35, '1612957286_7dnhRzseESUsSLoYa7NWT97NHPCFmPe2TkyfcAOy.webp', '2021-02-10 11:43:01', '2021-02-10 11:43:01'),
(123, 35, '1612957286_RECc9Kc6fFq80wFhAEubwwnp0BMoUTvpc8Xk4dQL.webp', '2021-02-10 11:43:01', '2021-02-10 11:43:01'),
(124, 36, '1613119975_dBKbEpSmOOkRH7laucjDxm9ByL2QFR0Xt6KwBRAz.webp', '2021-02-12 08:54:40', '2021-02-12 08:54:40'),
(125, 36, '1613119975_D7gq8dR6gFo2JQyQzbpGcVFqrIY76DqJ84Lgxyfp.webp', '2021-02-12 08:54:40', '2021-02-12 08:54:40'),
(126, 36, '1613119976_vsaRAFTk3e4wbZMS4DgvBXrt0Ge8Uy78z3vmoMaO.webp', '2021-02-12 08:54:40', '2021-02-12 08:54:40'),
(127, 36, '1613119978_mHUsljH4P4AZjMh99SWvryR0ji6CCYLkeehhZ2hn.webp', '2021-02-12 08:54:40', '2021-02-12 08:54:40'),
(128, 36, '1613120020_jppzPYHTnmLVrpdmc5bcDAaaU6C8NvEcVH82Xc9H.webp', '2021-02-12 08:54:40', '2021-02-12 08:54:40'),
(129, 36, '1613120053_9M4YX50K5B0vZNGicaBPoug4u70bA2bBc64uEpcs.webp', '2021-02-12 08:54:40', '2021-02-12 08:54:40'),
(130, 37, '1613208814_R9UEY04gp9WjLqzFna1OU8w1IYWY7DoqZYjHzfbf.webp', '2021-02-13 09:33:39', '2021-02-13 09:33:39'),
(131, 37, '1613208814_TXoH8IxQuzO6zieF6vfiHlIGDym465Osakpmfnf5.webp', '2021-02-13 09:33:39', '2021-02-13 09:33:39'),
(132, 37, '1613208815_phbqBqWxFnlxFePyncobKrhMTcrQRVD6XSpvIdkJ.webp', '2021-02-13 09:33:39', '2021-02-13 09:33:39'),
(133, 37, '1613208815_Hhi3docGHHbHifilmxYbyTlBEs6CqWBkbm5Ww4Mh.webp', '2021-02-13 09:33:39', '2021-02-13 09:33:39'),
(134, 38, '1613383130_2ELjcLMJGERO6E83upRtb7lEYl5iVyM31RNqZllS.webp', '2021-02-15 09:59:28', '2021-02-15 09:59:28'),
(135, 38, '1613383130_C21ry6cFkIqTvIpV0O5sEyG5ZjJC0LsvrUye8kKu.webp', '2021-02-15 09:59:28', '2021-02-15 09:59:28'),
(136, 38, '1613383131_QecO35xZqGMvDTBeZbFX35DQcWmObbodvvieFtRe.webp', '2021-02-15 09:59:28', '2021-02-15 09:59:28'),
(137, 38, '1613383131_jW6Od9SfYcM8JVnAxGVfXEa9HoJhmJlZOVkwZBw4.webp', '2021-02-15 09:59:28', '2021-02-15 09:59:28'),
(138, 39, '1613628950_tPn0tT3YuIevpvwMopqDZKSX4BMfZEBYWwnraw5Z.webp', '2021-02-18 06:20:11', '2021-02-18 06:20:11'),
(139, 39, '1613628950_a8dVeX4cmTFpF1cmkvjbkaDDgQNDf3EPLI3ZPFcY.webp', '2021-02-18 06:20:11', '2021-02-18 06:20:11'),
(140, 39, '1613628950_njzRNySfDXaeTBaFkX8bSNZCd5ncQAF3lySPBPb9.webp', '2021-02-18 06:20:11', '2021-02-18 06:20:11'),
(141, 39, '1613628950_sq0rmBtbf7rgPmYSvIUCIdFtMMhrYj8KspADTcCT.webp', '2021-02-18 06:20:11', '2021-02-18 06:20:11');

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `institution_programs`
--

CREATE TABLE `institution_programs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `institution_id` bigint(20) UNSIGNED NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `state_id` bigint(20) UNSIGNED DEFAULT NULL,
  `city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tuition_fees` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tuition_fees_usd` decimal(10,2) NOT NULL,
  `fees_type` int(11) NOT NULL DEFAULT '1' COMMENT '1=year 2=month',
  `scholarship` decimal(10,2) NOT NULL DEFAULT '0.00',
  `scholarship_usd` decimal(10,2) NOT NULL,
  `subject_ranking` bigint(20) DEFAULT NULL,
  `gpa` bigint(20) DEFAULT NULL,
  `scholarship_type` int(11) NOT NULL DEFAULT '1' COMMENT '1-amount,2-percentage',
  `scholarship_value` double(8,2) DEFAULT NULL,
  `current_degree_level_id` bigint(20) UNSIGNED DEFAULT NULL,
  `degree_level_id` bigint(20) UNSIGNED DEFAULT NULL,
  `study_type_id` bigint(20) UNSIGNED DEFAULT NULL,
  `study_duration_id` bigint(20) UNSIGNED DEFAULT NULL,
  `language_id` bigint(20) UNSIGNED DEFAULT NULL,
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `unirep_id` bigint(20) UNSIGNED NOT NULL,
  `application_fee` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `institution_programs`
--

INSERT INTO `institution_programs` (`id`, `institution_id`, `country_id`, `state_id`, `city_id`, `slug`, `cover`, `tuition_fees`, `tuition_fees_usd`, `fees_type`, `scholarship`, `scholarship_usd`, `subject_ranking`, `gpa`, `scholarship_type`, `scholarship_value`, `current_degree_level_id`, `degree_level_id`, `study_type_id`, `study_duration_id`, `language_id`, `currency_id`, `unirep_id`, `application_fee`, `is_active`, `is_featured`, `created_at`, `updated_at`) VALUES
(127, 26, 5, 16, 22, 'computer-science', NULL, '10997.00', '12976.46', 1, '2749.25', '29.50', NULL, 60, 2, 25.00, 2, 3, 1, 4, 1, 11, 11, '0', 1, 1, '2021-01-05 14:25:57', '2021-01-05 14:26:23'),
(128, 26, 5, 16, 22, 'hospitality-management', NULL, '10997.00', '12976.46', 1, '2749.25', '29.50', 3, 60, 2, 25.00, 2, 3, 1, 4, 1, 11, 11, '0', 1, 0, '2021-01-05 14:30:14', '2021-01-05 14:46:26'),
(129, 26, 5, 16, 22, 'aviation-management', NULL, '10997.00', '12976.46', 1, '2749.25', '29.50', NULL, 60, 2, 25.00, 2, 3, 1, 4, 1, 11, 11, '0', 1, 0, '2021-01-05 14:31:18', '2021-01-05 14:46:28'),
(130, 26, 5, 16, 22, 'international-management', NULL, '10997.00', '12976.46', 1, '2749.25', '29.50', 1, 60, 2, 25.00, 2, 3, 1, 4, 1, 11, 11, '0', 1, 1, '2021-01-05 14:32:00', '2021-01-05 14:46:57'),
(131, 26, 5, 16, 22, 'business-administration', NULL, '10997.00', '12976.46', 1, '2749.25', '29.50', 1, 60, 2, 25.00, 2, 3, 1, 4, 1, 11, 11, '0', 1, 1, '2021-01-05 14:35:05', '2021-01-05 14:46:54'),
(132, 26, 5, 16, 22, 'robotics', NULL, '10997.00', '12976.46', 1, '2749.25', '29.50', 1, 60, 2, 25.00, 2, 3, 1, 4, 1, 11, 11, '0', 1, 0, '2021-01-05 14:35:57', '2021-01-05 14:46:35'),
(133, 26, 5, 16, 22, 'business-and-it', NULL, '10997.00', '12976.46', 1, '2749.25', '29.50', 1, 60, 2, 25.00, 2, 3, 1, 4, 1, 11, 11, '0', 1, 0, '2021-01-05 14:36:48', '2021-01-05 14:46:38'),
(134, 26, 5, 16, 22, 'industrial-engineering-and-management', NULL, '10997.00', '12976.46', 1, '2749.25', '3244.12', 1, 60, 2, 25.00, 2, 3, 1, 4, 1, 11, 11, '0', 1, 1, '2021-01-05 14:37:38', '2021-01-21 15:33:30'),
(135, 26, 5, 16, 22, 'data-science', NULL, '10997.00', '12976.46', 1, '2749.25', '3244.12', 1, 60, 2, 25.00, 2, 3, 1, 4, 1, 11, 11, '0', 1, 1, '2021-01-05 14:38:10', '2021-02-06 10:24:52'),
(136, 26, 5, 16, 22, 'master-of-management', NULL, '14990.00', '17688.20', 1, '3747.50', '4422.05', 2, 60, 2, 25.00, 1, 2, 1, 3, 1, 11, 11, '0', 1, 0, '2021-01-05 14:45:44', '2021-01-21 15:33:04'),
(138, 27, 2, NULL, 21, 'economics', NULL, '19500.00', '19500.00', 1, '19500.00', '19500.00', 5, 60, 2, 100.00, 2, 3, 1, 2, 1, 1, 10, '200 TL', 1, 0, '2021-01-09 17:42:45', '2021-02-11 11:52:23'),
(139, 27, 2, NULL, 21, 'business-administration4', NULL, '19500.00', '19500.00', 1, '19500.00', '100.00', 5, 60, 2, 100.00, 2, 3, 1, 2, 1, 1, 10, '200 TL', 1, 0, '2021-01-09 17:45:01', '2021-01-20 15:20:51'),
(140, 27, 2, NULL, 21, 'international-relations', NULL, '19500.00', '19500.00', 1, '19500.00', '100.00', 5, 60, 2, 100.00, 2, 3, 1, 2, 1, 1, 10, '200 TL', 1, 0, '2021-01-09 17:46:41', '2021-01-20 15:20:53'),
(141, 27, 2, NULL, 21, 'chemical-and-biological-engineering', NULL, '19500.00', '19500.00', 1, '19500.00', '100.00', 5, 60, 2, 100.00, 2, 3, 1, 2, 1, 1, 10, '200 TL', 1, 0, '2021-01-09 17:49:06', '2021-01-20 15:20:55'),
(142, 27, 2, NULL, 21, 'computer-engineering', NULL, '19500.00', '19500.00', 1, '19500.00', '100.00', 5, 60, 2, 100.00, 2, 3, 1, 2, 1, 1, 10, '200 TL', 1, 0, '2021-01-09 17:49:52', '2021-01-20 15:20:57'),
(143, 27, 2, NULL, 21, 'electrical-and-electronics-engineering', NULL, '19500.00', '19500.00', 1, '19500.00', '100.00', 5, 60, 2, 100.00, 2, 3, 1, 2, 1, 1, 10, '200 TL', 1, 0, '2021-01-09 17:50:38', '2021-01-20 15:20:59'),
(144, 27, 2, NULL, 21, 'industrial-engineering', NULL, '19500.00', '19500.00', 1, '19500.00', '100.00', 5, 60, 2, 100.00, 2, 3, 1, 2, 1, 1, 10, '200 TL', 1, 0, '2021-01-09 17:51:49', '2021-01-20 15:21:02'),
(145, 27, 2, NULL, 21, 'mechanical-engineering', NULL, '19500.00', '19500.00', 1, '19500.00', '100.00', 5, 60, 2, 100.00, 2, 3, 1, 2, 1, 1, 10, '200 TL', 1, 0, '2021-01-09 17:52:47', '2021-01-20 15:21:04'),
(146, 27, 2, NULL, 21, 'chemistry', NULL, '19500.00', '19500.00', 1, '19500.00', '100.00', 5, 60, 2, 100.00, 2, 3, 1, 2, 1, 1, 10, '200 TL', 1, 0, '2021-01-09 17:56:00', '2021-01-20 15:21:06'),
(147, 27, 2, NULL, 21, 'physics', NULL, '19500.00', '19500.00', 1, '19500.00', '100.00', 5, 60, 2, 100.00, 2, 3, 1, 2, 1, 1, 10, '200 TL', 1, 0, '2021-01-09 17:57:07', '2021-01-20 15:21:08'),
(148, 27, 2, NULL, 21, 'mathematics', NULL, '19500.00', '19500.00', 1, '195.00', '195.00', 5, 60, 2, 1.00, 2, 3, 1, 2, 1, 1, 10, '200 TL', 1, 0, '2021-01-09 17:58:56', '2021-01-22 07:31:01'),
(149, 27, 2, NULL, 21, 'molecular-biology-and-genetics', NULL, '19500.00', '19500.00', 1, '9750.00', '9750.00', 5, 60, 2, 50.00, 2, 3, 1, 2, 1, 1, 10, '200 TL', 1, 0, '2021-01-09 17:59:43', '2021-01-22 17:38:56'),
(150, 27, 2, NULL, 21, 'archeology-and-history-of-art', NULL, '19500.00', '19500.00', 1, '9750.00', '9750.00', 5, 60, 2, 50.00, 2, 3, 1, 2, 1, 1, 10, '200 TL', 1, 0, '2021-01-09 18:01:03', '2021-01-22 17:38:34'),
(151, 27, 2, NULL, 21, 'english-language-comparative-literature', NULL, '19500.00', '19500.00', 1, '9750.00', '9750.00', 5, 60, 2, 50.00, 2, 3, 1, 2, 1, 1, 10, '200 TL', 1, 0, '2021-01-09 18:02:08', '2021-01-22 17:38:12'),
(152, 27, 2, NULL, 21, 'history', NULL, '19500.00', '19500.00', 1, '9750.00', '9750.00', 5, 60, 2, 50.00, 2, 3, 1, 2, 1, 1, 10, '200 TL', 1, 0, '2021-01-09 18:02:58', '2021-01-22 17:37:49'),
(153, 27, 2, NULL, 21, 'psychology', NULL, '19500.00', '19500.00', 1, '9750.00', '9750.00', 5, 60, 2, 50.00, 2, 3, 1, 2, 1, 1, 10, '200 TL', 1, 0, '2021-01-09 18:03:39', '2021-01-22 17:37:22'),
(154, 27, 2, NULL, 21, 'philosophy', NULL, '19500.00', '19500.00', 1, '9750.00', '9750.00', 5, 60, 2, 50.00, 2, 3, 1, 2, 1, 1, 10, '200 TL', 1, 0, '2021-01-09 18:04:19', '2021-01-22 17:36:51'),
(155, 27, 2, NULL, 21, 'sociology', NULL, '19500.00', '19500.00', 1, '9750.00', '9750.00', 5, 60, 2, 50.00, 2, 3, 1, 2, 1, 1, 10, '200 TL', 1, 0, '2021-01-09 18:05:05', '2021-01-22 17:36:39'),
(156, 27, 2, NULL, 21, 'media-and-visual-arts', NULL, '19500.00', '19500.00', 1, '9750.00', '9750.00', 5, 60, 2, 50.00, 2, 3, 1, 2, 1, 1, 10, '200 TL', 1, 0, '2021-01-09 18:06:01', '2021-01-22 17:36:08'),
(157, 27, 2, NULL, 21, 'law', NULL, '19500.00', '19500.00', 1, '9750.00', '9750.00', 5, 60, 2, 50.00, 2, 3, 1, 2, 1, 1, 10, '200 TL', 1, 0, '2021-01-09 18:07:59', '2021-01-22 17:35:48'),
(158, 27, 2, NULL, 21, 'medicine', NULL, '26500.00', '26500.00', 1, '13250.00', '13250.00', 5, 60, 2, 50.00, 2, 3, 1, 6, 1, 1, 10, '200 TL', 1, 1, '2021-01-09 18:09:41', '2021-01-22 17:35:13'),
(159, 34, 1, 12, 18, 'bsc-management', NULL, '17342.00', '17342.00', 1, '12000.00', '12000.00', 6, 70, 1, 12000.00, 2, 3, 1, 2, 1, 1, 11, '0', 1, 0, '2021-02-10 06:34:26', '2021-02-10 07:51:50'),
(160, 34, 1, 12, 18, 'bsc-biomedical-sciences', NULL, '17342.00', '17342.00', 1, '12000.00', '12000.00', 7, 77, 1, 12000.00, 2, 3, 1, 2, 1, 1, 11, '0', 1, 0, '2021-02-10 07:36:48', '2021-02-10 07:52:08'),
(161, 34, 1, 12, 18, 'bsc-accounting', NULL, '17342.00', '17342.00', 1, '12000.00', '12000.00', 4, 77, 1, 12000.00, 2, 3, 1, 2, 1, 1, 11, '0', 1, 0, '2021-02-10 07:53:13', '2021-02-10 10:02:05'),
(162, 34, 1, 12, 18, 'bsc-cell-and-molecular-biology', NULL, '17342.00', '17342.00', 1, '12000.00', '12000.00', 4, 77, 1, 12000.00, 2, 3, 1, 2, 1, 1, 11, '0', 1, 0, '2021-02-10 07:57:58', '2021-02-10 10:02:08'),
(163, 34, 1, 12, 18, 'bsc-biomedical-sciences65', NULL, '17342.00', '17342.00', 1, '12000.00', '12000.00', 4, 77, 1, 12000.00, 2, 3, 1, 2, 1, 1, 11, '0', 1, 0, '2021-02-10 08:03:50', '2021-02-10 10:02:10'),
(164, 34, 1, 12, 18, 'bsc-marine-biology', NULL, '17342.00', '17342.00', 1, '12000.00', '12000.00', 4, 77, 1, 12000.00, 2, 3, 1, 2, 1, 1, 11, '0', 1, 0, '2021-02-10 08:11:51', '2021-02-10 10:02:13'),
(165, 34, 1, 12, 18, 'bsc-biomedical-engineering', NULL, '17342.00', '17342.00', 1, '12000.00', '12000.00', 4, 77, 1, 12000.00, 2, 3, 1, 2, 1, 1, 11, '0', 1, 0, '2021-02-10 08:13:10', '2021-02-10 10:02:15'),
(166, 34, 1, 12, 18, 'bsc-marketing', NULL, '17342.00', '17342.00', 1, '12000.00', '12000.00', 4, 77, 1, 12000.00, 2, 3, 1, 2, 1, 1, 11, '0', 1, 0, '2021-02-10 08:20:46', '2021-02-10 10:02:17'),
(167, 34, 1, 12, 18, 'bsc-finance', NULL, '17342.00', '17342.00', 1, '12000.00', '12000.00', 4, 77, 1, 12000.00, 2, 3, 1, 2, 1, 1, 11, '0', 1, 0, '2021-02-10 08:22:14', '2021-02-10 10:02:20'),
(168, 34, 1, 12, 18, 'bsc-finance78', NULL, '17342.00', '17342.00', 1, '12000.00', '12000.00', 4, 77, 1, 12000.00, 2, 3, 1, 2, 1, 1, 11, '0', 1, 0, '2021-02-10 08:22:54', '2021-02-10 10:02:22'),
(170, 34, 1, 12, 18, 'bsc-economics', NULL, '17342.00', '17342.00', 1, '12000.00', '12000.00', 4, 77, 1, 12000.00, 2, 3, 1, 2, 1, 1, 11, '0', 1, 0, '2021-02-10 08:26:00', '2021-02-10 10:02:24'),
(171, 34, 1, 12, 18, 'bsc-chemical-engineering', NULL, '17342.00', '17342.00', 1, '12000.00', '12000.00', 4, 77, 1, 12000.00, 2, 3, 1, 2, 1, 1, 11, '0', 1, 0, '2021-02-10 08:29:10', '2021-02-10 10:02:26'),
(172, 34, 1, 12, 18, 'bsc-chemistry', NULL, '17342.00', '17342.00', 1, '12000.00', '12000.00', 4, 77, 1, 12000.00, 2, 3, 1, 2, 1, 1, 11, '0', 1, 0, '2021-02-10 08:49:32', '2021-02-10 10:02:29'),
(173, 34, 1, 12, 18, 'bsc-civil-engineering', NULL, '17342.00', '17342.00', 1, '12000.00', '12000.00', 4, 77, 1, 12000.00, 2, 3, 1, 2, 1, 1, 11, '0', 1, 0, '2021-02-10 08:52:21', '2021-02-10 10:02:32'),
(174, 34, 1, 12, 18, 'ba-journalism-news-editorial', NULL, '17342.00', '17342.00', 1, '12000.00', '12000.00', 4, 77, 1, 12000.00, 2, 3, 1, 2, 1, 1, 11, '0', 1, 0, '2021-02-10 08:57:59', '2021-02-10 10:02:34'),
(175, 34, 1, 12, 18, 'ba-public-relations', NULL, '17342.00', '17342.00', 1, '12000.00', '12000.00', 4, 77, 1, 12000.00, 2, 3, 1, 2, 1, 1, 11, '0', 1, 0, '2021-02-10 08:59:05', '2021-02-10 10:02:37'),
(176, 34, 1, 12, 18, 'ba-communication', NULL, '17342.00', '17342.00', 1, '12000.00', '12000.00', 4, 77, 1, 12000.00, 2, 3, 1, 2, 1, 1, 11, '0', 1, 0, '2021-02-10 08:59:51', '2021-02-10 10:02:39'),
(177, 34, 1, 12, 18, 'ba-advertising', NULL, '17342.00', '17342.00', 1, '12000.00', '12000.00', 4, 77, 1, 12000.00, 2, 3, 1, 2, 1, 1, 11, '0', 1, 0, '2021-02-10 09:00:46', '2021-02-10 10:02:41'),
(178, 34, 1, 12, 18, 'bsc-computer-science', NULL, '17342.00', '17342.00', 1, '12000.00', '12000.00', 4, 77, 1, 12000.00, 2, 3, 1, 2, 1, 1, 11, '0', 1, 0, '2021-02-10 09:18:25', '2021-02-10 10:02:43'),
(179, 34, 1, 12, 18, 'bsc-electrical-engineering', NULL, '17342.00', '17342.00', 1, '12000.00', '12000.00', 4, 77, 1, 12000.00, 2, 3, 1, 2, 1, 1, 11, '0', 1, 0, '2021-02-10 09:20:23', '2021-02-10 10:02:45'),
(180, 34, 1, 12, 18, 'bsc-mechanical-engineering', NULL, '17342.00', '17342.00', 1, '12000.00', '12000.00', 4, 77, 1, 12000.00, 2, 3, 1, 2, 1, 1, 11, '0', 1, 0, '2021-02-10 09:52:41', '2021-02-10 10:02:47'),
(181, 34, 1, 12, 18, 'bsc-computer-engineering', NULL, '17342.00', '17342.00', 1, '12000.00', '12000.00', 4, 77, 1, 12000.00, 2, 3, 1, 2, 1, 1, 11, '0', 1, 0, '2021-02-10 09:53:22', '2021-02-10 10:02:48'),
(182, 34, 1, 12, 18, 'bsc-industrial-engineering', NULL, '17342.00', '17342.00', 1, '12000.00', '12000.00', 4, 77, 1, 12000.00, 2, 3, 1, 2, 1, 1, 11, '0', 1, 0, '2021-02-10 09:53:46', '2021-02-10 10:02:50'),
(183, 34, 1, 12, 18, 'bsc-business-analytics-and-information-systems', NULL, '17342.00', '17342.00', 1, '12000.00', '12000.00', 4, 77, 1, 12000.00, 2, 3, 1, 2, 1, 1, 11, '0', 1, 0, '2021-02-10 09:55:13', '2021-02-10 10:02:52'),
(184, 34, 1, 12, 18, 'ba-theatre-design', NULL, '17342.00', '17342.00', 1, '12000.00', '12000.00', 4, 77, 1, 12000.00, 2, 3, 1, 2, 1, 1, 11, '0', 1, 0, '2021-02-10 10:02:10', '2021-02-10 10:02:54'),
(185, 34, 1, 12, 18, 'ba-political-science', NULL, '17342.00', '17342.00', 1, '12000.00', '12000.00', 4, 77, 1, 12000.00, 2, 3, 1, 2, 1, 1, 11, '0', 1, 0, '2021-02-10 10:25:47', '2021-02-10 11:16:56'),
(186, 34, 1, 12, 18, 'bsc-medical-technology', NULL, '17342.00', '17342.00', 1, '12000.00', '12000.00', 4, 77, 1, 12000.00, 2, 3, 1, 2, 1, 1, 11, '0', 1, 0, '2021-02-10 10:27:07', '2021-02-10 11:16:59'),
(187, 34, 1, 12, 18, 'bscpublic-health', NULL, '17342.00', '17342.00', 1, '12000.00', '12000.00', 4, 77, 1, 12000.00, 2, 3, 1, 2, 1, 1, 11, '0', 1, 0, '2021-02-10 10:27:44', '2021-02-10 11:17:06'),
(188, 34, 1, 12, 18, 'ba-criminology', NULL, '17342.00', '17342.00', 1, '12000.00', '12000.00', 4, 77, 1, 12000.00, 2, 3, 1, 2, 1, 1, 11, '0', 1, 0, '2021-02-10 10:28:15', '2021-02-10 11:17:09'),
(189, 34, 1, 12, 18, 'ba-physics', NULL, '17342.00', '17342.00', 1, '12000.00', '12000.00', 4, 77, 1, 12000.00, 2, 3, 1, 2, 1, 1, 11, '0', 1, 0, '2021-02-10 10:41:33', '2021-02-10 11:17:11'),
(190, 34, 1, 12, 18, 'ba-mathematics', NULL, '17342.00', '17342.00', 1, '12000.00', '12000.00', 4, 77, 1, 12000.00, 2, 3, 1, 2, 1, 1, 11, '0', 1, 0, '2021-02-10 10:42:17', '2021-02-10 11:17:13'),
(191, 34, 1, 12, 18, 'ma-assurance', NULL, '15864.00', '15864.00', 1, '0.00', '0.00', 4, 77, 1, 0.00, 1, 2, 1, 1, 1, 1, 11, '0', 1, 0, '2021-02-10 10:46:09', '2021-02-10 11:17:16'),
(192, 35, 6, NULL, 23, 'bsc-computer-science73', NULL, '6000.00', '7080.00', 1, '0.00', '0.00', 4, 75, 1, 0.00, 2, 3, 1, 4, 1, 11, 11, '80', 1, 0, '2021-02-10 12:56:01', '2021-02-11 06:17:08'),
(193, 35, 6, NULL, 23, 'ba-sociology', NULL, '4800.00', '5664.00', 1, '0.00', '0.00', 4, 75, 1, 0.00, 2, 3, 1, 4, 1, 11, 11, '100', 1, 0, '2021-02-10 13:28:01', '2021-02-11 06:16:35'),
(194, 35, 6, NULL, 23, 'ba-psychology', NULL, '4800.00', '5664.00', 1, '0.00', '0.00', 4, 75, 1, 0.00, 2, 3, 1, 4, 1, 11, 11, '0', 1, 0, '2021-02-10 13:34:03', '2021-02-11 06:16:03'),
(195, 35, 6, NULL, 23, 'ba-motion-pictures', NULL, '4600.00', '5428.00', 1, '0.00', '0.00', 4, 75, 1, 0.00, 2, 3, 1, 4, 1, 11, 11, '150', 1, 0, '2021-02-10 13:36:36', '2021-02-11 06:15:08'),
(196, 35, 6, NULL, 23, 'bsc-mechanical-engineering78', NULL, '6000.00', '7080.00', 1, '0.00', '0.00', 4, 75, 1, 0.00, 2, 3, 1, 7, 1, 11, 11, '80', 1, 0, '2021-02-10 13:38:27', '2021-02-11 06:14:59'),
(197, 35, 6, NULL, 23, 'ba-international-business-economics', NULL, '5000.00', '5900.00', 1, '0.00', '0.00', 4, 75, 1, 0.00, 2, 3, 1, 2, 1, 11, 11, '100', 1, 0, '2021-02-10 13:43:15', '2021-02-11 06:14:15'),
(198, 35, 6, NULL, 23, 'ba-english-and-american-studies', NULL, '4400.00', '5192.00', 1, '0.00', '0.00', 4, 75, 1, 0.00, 2, 3, 1, 4, 1, 11, 11, '150', 1, 0, '2021-02-10 13:45:24', '2021-02-11 06:14:33'),
(199, 35, 6, NULL, 23, 'ma-american-studies', NULL, '7000.00', '8260.00', 1, '0.00', '0.00', 4, 65, 1, 0.00, 1, 2, 1, 1, 1, 11, 11, '150', 0, 0, '2021-02-11 06:18:04', '2021-02-11 06:19:10'),
(200, 35, 6, NULL, 23, 'msc-applied-mathematics', NULL, '8380.00', '9888.40', 1, '0.00', '0.00', 4, 65, 1, 0.00, 1, 2, 1, 1, 1, 11, 11, '160', 0, 0, '2021-02-11 06:31:35', '2021-02-11 06:31:35'),
(201, 35, 6, NULL, 23, 'msc-biology', NULL, '8380.00', '9888.40', 1, '0.00', '0.00', 4, 65, 1, 0.00, 1, 2, 1, 1, 1, 11, 11, '160', 0, 0, '2021-02-11 07:09:01', '2021-02-11 07:09:01'),
(202, 35, 6, NULL, 23, 'msc-chemistry', NULL, '8380.00', '9888.40', 1, '0.00', '0.00', 4, 65, 1, 0.00, 1, 2, 1, 1, 1, 11, 11, '160', 0, 0, '2021-02-11 07:11:11', '2021-02-11 07:11:11'),
(203, 35, 6, NULL, 23, 'ma-communication-and-media-studies', NULL, '4400.00', '5192.00', 1, '0.00', '0.00', 4, 65, 1, 0.00, 1, 2, 1, 1, 1, 11, 11, '150', 0, 0, '2021-02-11 07:41:38', '2021-02-11 07:41:38'),
(204, 35, 6, NULL, 23, 'msc-computational-and-cognitive-neuroscience', NULL, '2600.00', '3068.00', 1, '0.00', '0.00', 4, 65, 1, 0.00, 1, 2, 1, 1, 1, 11, 11, '120', 0, 0, '2021-02-11 07:43:49', '2021-02-11 07:43:49'),
(205, 35, 6, NULL, 23, 'msc-computer-science', NULL, '6000.00', '7080.00', 1, '0.00', '0.00', 4, 65, 1, 0.00, 1, 2, 1, 1, 1, 11, 11, '140', 0, 0, '2021-02-11 07:45:24', '2021-02-11 07:45:24'),
(206, 35, 6, NULL, 23, 'msc-computer-science-digital-factory', NULL, '6000.00', '7080.00', 1, '0.00', '0.00', 4, 65, 1, 0.00, 1, 2, 1, 1, 1, 11, 11, '140', 0, 0, '2021-02-11 07:46:19', '2021-02-11 07:46:19'),
(207, 35, 6, NULL, 23, 'msc-computer-science-financial-technology-specialization', NULL, '6000.00', '7080.00', 1, '0.00', '0.00', 4, 65, 1, 0.00, 1, 2, 1, 1, 1, 11, 11, '140', 0, 0, '2021-02-11 07:47:10', '2021-02-11 07:47:10'),
(208, 35, 6, NULL, 23, 'msc-computer-science-artificial-intelligence-specialization', NULL, '6000.00', '7080.00', 1, '0.00', '0.00', 4, 65, 1, 0.00, 1, 2, 1, 1, 1, 11, 11, '140', 0, 0, '2021-02-11 07:47:46', '2021-02-11 07:47:46'),
(209, 35, 6, NULL, 23, 'msc-computer-science-cybersecurity-specialization', NULL, '6000.00', '7080.00', 1, '0.00', '0.00', 4, 65, 1, 0.00, 1, 2, 1, 1, 1, 11, 11, '140', 0, 0, '2021-02-11 07:51:53', '2021-02-11 07:51:53'),
(210, 35, 6, NULL, 23, 'msc-computer-science-data-science-specialization', NULL, '6000.00', '7080.00', 1, '0.00', '0.00', 4, 65, 1, 0.00, 1, 2, 1, 1, 1, 11, 11, '140', 0, 0, '2021-02-11 07:52:21', '2021-02-11 07:52:21'),
(211, 35, 6, NULL, 23, 'msc-computer-science-software-and-service-architectures-specialization', NULL, '6000.00', '7080.00', 1, '0.00', '0.00', 4, 65, 1, 0.00, 1, 2, 1, 1, 1, 11, 11, '140', 0, 0, '2021-02-11 07:53:08', '2021-02-11 07:53:08'),
(212, 35, 6, NULL, 23, 'msc-computer-science-for-autonomous-systems', NULL, '6000.00', '7080.00', 1, '0.00', '0.00', 4, 65, 1, 0.00, 1, 2, 1, 1, 1, 11, 11, '140', 0, 0, '2021-02-11 07:53:53', '2021-02-11 07:53:53'),
(213, 35, 6, NULL, 23, 'msc-financial-technology', NULL, '12000.00', '14160.00', 1, '6000.00', '7080.00', 4, 65, 2, 50.00, 1, 2, 1, 1, 1, 11, 11, '0', 0, 0, '2021-02-12 08:07:32', '2021-02-12 08:09:33'),
(214, 35, 6, NULL, 23, 'msc-digital-factory', NULL, '12000.00', '14160.00', 1, '6000.00', '7080.00', 4, 65, 1, 6000.00, 1, 2, 1, 1, 1, 11, 11, '0', 0, 0, '2021-02-12 08:08:07', '2021-02-12 08:08:07'),
(215, 35, 6, NULL, 23, 'msc-data-science', NULL, '12000.00', '14160.00', 1, '6000.00', '7080.00', 4, 65, 1, 6000.00, 1, 2, 1, 1, 1, 11, 11, '0', 0, 0, '2021-02-12 08:08:56', '2021-02-12 08:08:56'),
(216, 35, 6, NULL, 23, 'msc-cyber-security', NULL, '12000.00', '14160.00', 1, '6000.00', '7080.00', 4, 65, 1, 6000.00, 1, 2, 1, 1, 1, 11, 11, '0', 0, 0, '2021-02-12 08:10:12', '2021-02-12 08:10:12'),
(217, 35, 6, NULL, 23, 'msc-autonomous-systems', NULL, '12000.00', '14160.00', 1, '6000.00', '7080.00', 4, 65, 1, 6000.00, 1, 2, 1, 1, 1, 11, 11, '0', 0, 0, '2021-02-12 08:10:42', '2021-02-12 08:10:42'),
(218, 35, 6, NULL, 23, 'msc-materials-science', NULL, '8380.00', '9888.40', 1, '0.00', '0.00', 4, 65, 1, 0.00, 1, 2, 1, 1, 1, 11, 11, '160', 0, 0, '2021-02-12 08:12:29', '2021-02-12 08:21:21'),
(219, 35, 6, NULL, 23, 'msc-mathematics', NULL, '8380.00', '9888.40', 1, '0.00', '0.00', 4, 65, 1, 0.00, 1, 2, 1, 1, 1, 11, 11, '160', 0, 0, '2021-02-12 08:13:24', '2021-02-12 08:20:51'),
(220, 35, 6, NULL, 23, 'msc-meteorology', NULL, '8380.00', '9888.40', 1, '0.00', '0.00', 4, 65, 1, 0.00, 1, 2, 1, 1, 1, 11, 11, '160', 0, 0, '2021-02-12 08:20:05', '2021-02-12 08:20:05'),
(221, 35, 6, NULL, 23, 'ma-philosophy', NULL, '4400.00', '5192.00', 1, '0.00', '0.00', 4, 65, 1, 0.00, 1, 2, 1, 1, 1, 11, 11, '150', 0, 0, '2021-02-12 08:24:44', '2021-02-12 08:24:44'),
(222, 35, 6, NULL, 23, 'msc-physics', NULL, '8380.00', '9888.40', 1, '0.00', '0.00', 4, 65, 1, 0.00, 1, 2, 1, 1, 1, 11, 11, '160', 0, 0, '2021-02-12 08:26:51', '2021-02-12 08:26:51'),
(223, 35, 6, NULL, 23, 'ma-psychology', NULL, '8400.00', '9912.00', 1, '0.00', '0.00', 4, 65, 1, 0.00, 1, 2, 1, 1, 1, 11, 11, '120', 0, 0, '2021-02-12 08:29:19', '2021-02-12 08:29:19'),
(224, 35, 6, NULL, 23, 'ma-english-studies', NULL, '7000.00', '8260.00', 1, '0.00', '0.00', 4, 65, 1, 0.00, 1, 2, 1, 1, 1, 11, 11, '150', 0, 0, '2021-02-12 08:31:39', '2021-02-12 08:31:39'),
(225, 35, 6, NULL, 23, 'ma-european-and-international-business-law', NULL, '2000.00', '2360.00', 1, '0.00', '0.00', 4, 65, 1, 0.00, 1, 2, 2, 3, 1, 11, 11, '0', 0, 0, '2021-02-12 08:33:23', '2021-02-12 08:33:23'),
(226, 35, 6, NULL, 23, 'ma-human-resource-counselling', NULL, '3800.00', '4484.00', 1, '0.00', '0.00', 4, 65, 1, 0.00, 1, 2, 1, 1, 1, 11, 11, '120', 0, 0, '2021-02-12 08:35:51', '2021-02-12 08:35:51'),
(227, 35, 6, NULL, 23, 'ma-instruction-of-english-as-a-foreign-language', NULL, '7000.00', '8260.00', 1, '0.00', '0.00', 4, 65, 1, 0.00, 1, 2, 1, 1, 1, 11, 11, '150', 0, 0, '2021-02-12 08:37:04', '2021-02-12 08:37:04'),
(228, 35, 6, NULL, 23, 'ma-international-relations', NULL, '6000.00', '7080.00', 1, '0.00', '0.00', 4, 65, 1, 0.00, 1, 2, 1, 1, 1, 11, 11, '100', 0, 0, '2021-02-12 08:38:57', '2021-02-12 08:38:57'),
(229, 36, 6, NULL, 23, 'bsc-corporate-finance', NULL, '7400.00', '8732.00', 1, '1850.00', '2183.00', NULL, 70, 2, 25.00, 2, 3, 1, 4, 1, 11, 11, '100', 0, 0, '2021-02-12 09:08:09', '2021-02-12 09:08:09'),
(230, 36, 6, NULL, 23, 'bsc-business-and-diplomatic-studies', NULL, '7400.00', '8732.00', 1, '1850.00', '2183.00', NULL, 70, 2, 25.00, 2, 3, 1, 4, 1, 11, 11, '100', 0, 0, '2021-02-13 06:48:22', '2021-02-13 06:48:22'),
(231, 36, 6, NULL, 23, 'bsc-business-management', NULL, '7400.00', '8732.00', 1, '1850.00', '2183.00', NULL, 70, 2, 25.00, 2, 3, 1, 4, 1, 11, 11, '100', 0, 0, '2021-02-13 06:50:52', '2021-02-13 06:50:52'),
(232, 36, 6, NULL, 23, 'bsc-business-management-with-hrm-and-business-psychology', NULL, '7400.00', '8732.00', 1, '1850.00', '2183.00', NULL, 70, 2, 25.00, 2, 3, 1, 4, 1, 11, 11, '100', 0, 0, '2021-02-13 06:58:52', '2021-02-13 06:58:52'),
(233, 36, 6, NULL, 23, 'bsc-business-management-with-marketing', NULL, '7400.00', '8732.00', 1, '1850.00', '2183.00', NULL, 70, 2, 25.00, 2, 3, 1, 4, 1, 11, 11, '100', 0, 0, '2021-02-13 06:59:44', '2021-02-13 06:59:44'),
(234, 36, 6, NULL, 23, 'bsc-business-management-with-tourism', NULL, '7400.00', '8732.00', 1, '1850.00', '2183.00', NULL, 70, 2, 25.00, 2, 3, 1, 4, 1, 11, 11, '100', 0, 0, '2021-02-13 07:02:28', '2021-02-13 07:02:28'),
(235, 36, 6, NULL, 23, 'msc-strategic-finance', NULL, '9400.00', '11092.00', 1, '2350.00', '2773.00', NULL, 65, 2, 25.00, 1, 2, 1, 3, 1, 11, 11, '100', 0, 0, '2021-02-13 08:07:43', '2021-02-13 08:24:17'),
(236, 36, 6, NULL, 23, 'msc-it-for-business-data-analytics', NULL, '11000.00', '12980.00', 1, '2750.00', '3245.00', NULL, 65, 2, 25.00, 1, 2, 1, 3, 1, 11, 11, '100', 0, 0, '2021-02-13 08:09:07', '2021-02-13 08:24:24'),
(237, 36, 6, NULL, 23, 'msc-strategic-marketing', NULL, '9400.00', '11092.00', 1, '2350.00', '2773.00', 7, 65, 2, 25.00, 1, 2, 1, 3, 1, 11, 11, '100', 0, 0, '2021-02-13 08:10:41', '2021-02-13 08:24:41'),
(238, 36, 6, NULL, 23, 'msc-strategic-international-management', NULL, '9400.00', '11092.00', 1, '2350.00', '2773.00', 11, 65, 2, 25.00, 1, 2, 1, 3, 1, 11, 11, '100', 0, 0, '2021-02-13 08:23:55', '2021-02-13 08:23:55'),
(239, 36, 6, NULL, 23, 'msc-strategic-human-resource-management', NULL, '9400.00', '11092.00', 1, '2350.00', '2773.00', 11, 65, 2, 25.00, 1, 2, 1, 3, 1, 11, 11, '100', 0, 0, '2021-02-13 08:26:35', '2021-02-13 08:27:30'),
(240, 37, 6, NULL, 23, 'communication-and-media-science', NULL, '5000.00', '5900.00', 1, '500.00', '590.00', NULL, 65, 2, 10.00, 2, 3, 1, 4, 1, 11, 11, '150', 0, 0, '2021-02-13 10:28:53', '2021-02-15 07:16:48'),
(241, 37, 6, NULL, 23, 'ba-international-relations', NULL, '5000.00', '5900.00', 1, '500.00', '590.00', NULL, 65, 2, 10.00, 2, 3, 1, 4, 1, 11, 11, '150', 0, 0, '2021-02-15 07:22:00', '2021-02-15 07:22:00'),
(242, 37, 6, NULL, 23, 'bsc-business-administration-and-management', NULL, '5000.00', '5900.00', 1, '500.00', '590.00', NULL, 65, 2, 10.00, 2, 3, 1, 7, 1, 11, 11, '150', 0, 0, '2021-02-15 07:23:46', '2021-02-15 07:23:46'),
(243, 37, 6, NULL, 23, 'bsc-finance-and-accounting', NULL, '5000.00', '5900.00', 1, '500.00', '590.00', NULL, 65, 2, 10.00, 2, 3, 1, 7, 1, 11, 11, '150', 0, 0, '2021-02-15 07:25:30', '2021-02-15 07:25:30'),
(244, 37, 6, NULL, 23, 'bsc-commerce-and-marketing', NULL, '5000.00', '5900.00', 1, '500.00', '590.00', NULL, 65, 2, 10.00, 2, 3, 1, 7, 1, 11, 11, '150', 0, 0, '2021-02-15 07:26:01', '2021-02-15 07:26:01'),
(245, 37, 6, NULL, 23, 'bsc-tourism-and-catering', NULL, '5000.00', '5900.00', 1, '500.00', '590.00', NULL, 65, 2, 10.00, 2, 3, 1, 2, 1, 11, 11, '150', 0, 0, '2021-02-15 07:32:48', '2021-02-15 07:53:12'),
(246, 37, 6, NULL, 23, 'ba-animation', NULL, '7000.00', '8260.00', 1, '700.00', '826.00', NULL, 65, 2, 10.00, 2, 3, 1, 4, 1, 11, 11, '150', 0, 0, '2021-02-15 07:51:34', '2021-02-15 07:51:34'),
(247, 37, 6, NULL, 23, 'ba-environmental-design', NULL, '6800.00', '8024.00', 1, '680.00', '802.40', NULL, 65, 2, 10.00, 2, 3, 1, 4, 1, 11, 11, '150', 0, 0, '2021-02-15 07:52:39', '2021-02-15 07:52:39'),
(248, 37, 6, NULL, 23, 'ba-graphic-design', NULL, '7000.00', '8260.00', 1, '700.00', '826.00', NULL, 65, 2, 10.00, 2, 3, 1, 4, 1, 11, 11, '150', 0, 0, '2021-02-15 07:53:57', '2021-02-15 07:53:57'),
(249, 37, 6, NULL, 23, 'ba-media-design', NULL, '6800.00', '8024.00', 1, '680.00', '802.40', NULL, 65, 2, 10.00, 2, 3, 1, 4, 1, 11, 11, '150', 0, 0, '2021-02-15 08:05:19', '2021-02-15 08:05:19'),
(250, 37, 6, NULL, 23, 'ba-motion-picture-cameraman-specialization', NULL, '7000.00', '8260.00', 1, '700.00', '826.00', NULL, 65, 2, 10.00, 2, 3, 1, 4, 1, 11, 11, '150', 0, 0, '2021-02-15 08:05:59', '2021-02-15 08:05:59'),
(251, 37, 6, NULL, 23, 'ba-motion-picture-cameraman-specialization90', NULL, '6800.00', '8024.00', 1, '680.00', '802.40', NULL, 65, 2, 10.00, 2, 3, 1, 4, 1, 11, 11, '150', 0, 0, '2021-02-15 08:06:32', '2021-02-15 08:06:32'),
(252, 37, 6, NULL, 23, 'ba-visual-representation-specializing-in-film-and-media', NULL, '6800.00', '8024.00', 1, '680.00', '802.40', NULL, 65, 2, 10.00, 2, 3, 1, 4, 1, 11, 11, '150', 0, 0, '2021-02-15 08:07:42', '2021-02-15 08:07:42'),
(253, 37, 6, NULL, 23, 'ba-visual-representation-specializing-in-film-and-media59', NULL, '6800.00', '8024.00', 1, '680.00', '802.40', NULL, 65, 2, 10.00, 2, 3, 1, 4, 1, 11, 11, '150', 0, 0, '2021-02-15 08:08:13', '2021-02-15 08:08:13'),
(254, 37, 6, NULL, 23, 'ma-communication-and-media-studies16', NULL, '5200.00', '6136.00', 1, '520.00', '613.60', NULL, 65, 2, 10.00, 1, 2, 1, 1, 1, 11, 11, '150', 0, 0, '2021-02-15 09:22:36', '2021-02-15 09:22:36'),
(255, 37, 6, NULL, 23, 'msc-management-and-leadership', NULL, '5200.00', '6136.00', 1, '520.00', '613.60', NULL, 65, 2, 10.00, 1, 2, 1, 1, 1, 11, 11, '150', 0, 0, '2021-02-15 09:23:41', '2021-02-15 09:23:41'),
(256, 37, 6, NULL, 23, 'mba-master-of-business-administration', NULL, '5800.00', '6844.00', 1, '580.00', '684.40', NULL, 65, 2, 10.00, 1, 2, 1, 1, 1, 11, 11, '150', 0, 0, '2021-02-15 09:33:29', '2021-02-15 09:33:29'),
(257, 37, 6, NULL, 23, 'msc-marketing', NULL, '5200.00', '6136.00', 1, '520.00', '613.60', NULL, 65, 2, 10.00, 1, 2, 1, 1, 1, 11, 11, '150', 0, 0, '2021-02-15 09:34:02', '2021-02-15 09:34:02'),
(258, 37, 6, NULL, 23, 'mba-master-of-business-administration68', NULL, '5800.00', '6844.00', 1, '580.00', '684.40', NULL, 65, 2, 10.00, 1, 2, 1, 1, 1, 11, 11, '150', 0, 0, '2021-02-15 09:34:58', '2021-02-15 09:34:58'),
(259, 37, 6, NULL, 23, 'msc-tourism-management', NULL, '5200.00', '6136.00', 1, '520.00', '613.60', NULL, 65, 2, 10.00, 1, 2, 1, 1, 1, 11, 11, '150', 0, 0, '2021-02-15 09:36:06', '2021-02-15 09:36:06'),
(260, 37, 6, NULL, 23, 'ma-design', NULL, '7200.00', '8496.00', 1, '720.00', '849.60', NULL, 65, 2, 10.00, 1, 2, 1, 1, 1, 11, 11, '150', 0, 0, '2021-02-15 09:37:59', '2021-02-15 09:37:59'),
(261, 37, 6, NULL, 23, 'ma-art-and-design-management', NULL, '7200.00', '8496.00', 1, '720.00', '849.60', NULL, 65, 2, 10.00, 1, 2, 1, 1, 1, 11, 11, '150', 0, 0, '2021-02-15 09:39:00', '2021-02-15 09:39:00'),
(262, 37, 6, NULL, 23, 'ma-fashion-and-textile-design', NULL, '7200.00', '8496.00', 1, '720.00', '849.60', NULL, 65, 2, 10.00, 1, 2, 1, 1, 1, 11, 11, '150', 0, 0, '2021-02-15 09:39:41', '2021-02-15 09:39:41'),
(263, 37, 6, NULL, 23, 'ma-graphic-design', NULL, '7200.00', '8496.00', 1, '720.00', '849.60', NULL, 65, 2, 10.00, 1, 2, 1, 1, 1, 11, 11, '150', 0, 0, '2021-02-15 09:40:08', '2021-02-15 09:40:08'),
(264, 38, 6, NULL, 23, 'msc-applied-economics', NULL, '6000.00', '7080.00', 1, '0.00', '0.00', NULL, 65, 1, 0.00, 2, 3, 1, 4, 1, 11, 11, '100', 0, 0, '2021-02-15 10:52:01', '2021-02-15 11:50:59'),
(265, 38, 6, NULL, 23, 'msc-business-and-management', NULL, '6000.00', '7080.00', 1, '0.00', '0.00', NULL, 65, 1, 0.00, 2, 3, 1, 7, 1, 11, 11, '100', 0, 0, '2021-02-15 11:38:44', '2021-02-15 11:51:11'),
(266, 38, 6, NULL, 23, 'msc-communication-and-media-science', NULL, '4800.00', '5664.00', 1, '0.00', '0.00', NULL, 65, 1, 0.00, 2, 3, 1, 4, 1, 11, 11, '100', 0, 0, '2021-02-15 11:46:13', '2021-02-15 11:51:22'),
(267, 38, 6, NULL, 23, 'msc-international-business', NULL, '5200.00', '6136.00', 1, '0.00', '0.00', NULL, 65, 1, 0.00, 2, 3, 1, 2, 1, 11, 11, '100', 0, 0, '2021-02-15 11:48:21', '2021-02-15 11:51:35'),
(268, 38, 6, NULL, 23, 'ba-international-relations27', NULL, '4800.00', '5664.00', 1, '0.00', '0.00', NULL, 65, 1, 0.00, 2, 3, 1, 4, 1, 11, 11, '100', 0, 0, '2021-02-15 11:49:52', '2021-02-15 11:49:52'),
(269, 38, 6, NULL, 23, 'bsc-sociolog', NULL, '4800.00', '5664.00', 1, '0.00', '0.00', NULL, 65, 1, 0.00, 2, 3, 1, 4, 1, 11, 11, '100', 0, 0, '2021-02-15 11:52:42', '2021-02-15 11:52:42'),
(270, 38, 6, NULL, 23, 'msc-business-informatics', NULL, '6800.00', '8024.00', 1, '0.00', '0.00', NULL, 65, 1, 0.00, 1, 2, 1, 1, 1, 11, 11, '100', 0, 0, '2021-02-17 07:00:03', '2021-02-17 07:00:03'),
(271, 38, 6, NULL, 23, 'ma-communication-and-sociology', NULL, '5200.00', '6136.00', 1, '0.00', '0.00', NULL, 65, 1, 0.00, 1, 2, 1, 1, 1, 11, 11, '100', 0, 0, '2021-02-17 07:39:12', '2021-02-17 07:39:55'),
(272, 38, 6, NULL, 23, 'ma-economic-analysis', NULL, '6000.00', '7080.00', 1, '0.00', '0.00', NULL, 65, 1, 0.00, 1, 2, 1, 1, 1, 11, 11, '100', 0, 0, '2021-02-17 07:40:41', '2021-02-17 07:40:41'),
(273, 38, 6, NULL, 23, 'ma-economics-of-family-policy-and-public-policies-for-human-development', NULL, '5200.00', '6136.00', 1, '0.00', '0.00', NULL, 65, 1, 0.00, 1, 2, 1, 1, 1, 11, 11, '100', 0, 0, '2021-02-17 07:42:03', '2021-02-17 07:42:03'),
(274, 38, 6, NULL, 23, 'msc-finance', NULL, '6800.00', '8024.00', 1, '0.00', '0.00', NULL, 65, 1, 0.00, 1, 2, 1, 1, 1, 11, 11, '100', 0, 0, '2021-02-17 07:42:54', '2021-02-17 07:42:54'),
(275, 38, 6, NULL, 23, 'ma-health-policy-planning-and-financing', NULL, '5200.00', '6136.00', 1, '0.00', '0.00', NULL, 65, 1, 0.00, 1, 2, 1, 1, 1, 11, 11, '100', 0, 0, '2021-02-17 07:45:07', '2021-02-17 07:45:07'),
(276, 38, 6, NULL, 23, 'ma-international-economy-and-business', NULL, '5200.00', '6136.00', 1, '0.00', '0.00', NULL, 65, 1, 0.00, 1, 2, 1, 1, 1, 11, 11, '100', 0, 0, '2021-02-17 07:47:02', '2021-02-17 07:47:02'),
(277, 38, 6, NULL, 23, 'ma-international-relations67', NULL, '4800.00', '5664.00', 1, '0.00', '0.00', NULL, 65, 1, 0.00, 1, 2, 1, 1, 1, 11, 11, '100', 0, 0, '2021-02-17 08:33:51', '2021-02-17 08:33:51'),
(278, 38, 6, NULL, 23, 'ma-international-taxation', NULL, '6800.00', '8024.00', 1, '0.00', '0.00', NULL, 65, 1, 0.00, 1, 2, 1, 1, 1, 11, 11, '100', 0, 0, '2021-02-17 08:34:51', '2021-02-17 08:34:51'),
(279, 38, 6, NULL, 23, 'ma-marketing', NULL, '6800.00', '8024.00', 1, '0.00', '0.00', NULL, 65, 1, 0.00, 1, 2, 1, 1, 1, 11, 11, '100', 0, 0, '2021-02-17 08:35:38', '2021-02-17 08:35:38'),
(280, 38, 6, NULL, 23, 'ma-public-policy-and-management', NULL, '4800.00', '5664.00', 1, '0.00', '0.00', NULL, 65, 1, 0.00, 1, 2, 1, 1, 1, 11, 11, '100', 0, 0, '2021-02-17 11:38:39', '2021-02-17 11:38:39'),
(281, 38, 6, NULL, 23, 'ma-sociology', NULL, '5200.00', '6136.00', 1, '0.00', '0.00', NULL, 65, 1, 0.00, 1, 2, 1, 1, 1, 11, 11, '100', 0, 0, '2021-02-17 11:39:29', '2021-02-17 11:39:29'),
(282, 39, 6, NULL, 24, 'ss', NULL, '6000.00', '6000.00', 1, '0.00', '0.00', NULL, 65, 1, 0.00, 2, 3, 1, 7, 1, 1, 11, '150', 0, 0, '2021-02-25 11:54:15', '2021-02-25 12:13:29'),
(283, 39, 6, NULL, 24, 'ss36', NULL, '6500.00', '6500.00', 1, '0.00', '0.00', NULL, 65, 1, 0.00, 2, 3, 1, 7, 1, 1, 11, '150', 0, 0, '2021-02-25 12:03:42', '2021-02-25 12:13:51'),
(284, 39, 6, NULL, 24, 'bsc-biology', NULL, '6000.00', '6000.00', 1, '0.00', '0.00', NULL, 65, 1, 0.00, 2, 3, 1, 4, 1, 1, 11, '150', 0, 0, '2021-02-25 13:13:30', '2021-02-25 13:13:30');

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `institution_program_bonuses`
--

CREATE TABLE `institution_program_bonuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `institution_program_id` bigint(20) UNSIGNED NOT NULL,
  `bonus_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `institution_program_bonuses`
--

INSERT INTO `institution_program_bonuses` (`id`, `institution_program_id`, `bonus_id`, `created_at`, `updated_at`) VALUES
(155, 127, 1, NULL, NULL),
(156, 127, 3, NULL, NULL),
(157, 128, 1, NULL, NULL),
(158, 128, 3, NULL, NULL),
(159, 129, 1, NULL, NULL),
(160, 129, 3, NULL, NULL),
(161, 130, 1, NULL, NULL),
(162, 130, 3, NULL, NULL),
(163, 131, 1, NULL, NULL),
(164, 131, 3, NULL, NULL),
(165, 132, 1, NULL, NULL),
(166, 132, 3, NULL, NULL),
(167, 133, 1, NULL, NULL),
(168, 133, 3, NULL, NULL),
(169, 134, 1, NULL, NULL),
(170, 134, 3, NULL, NULL),
(171, 135, 1, NULL, NULL),
(172, 135, 3, NULL, NULL),
(173, 136, 1, NULL, NULL),
(174, 136, 3, NULL, NULL),
(178, 138, 2, NULL, NULL),
(179, 139, 2, NULL, NULL),
(180, 140, 2, NULL, NULL),
(181, 141, 2, NULL, NULL),
(182, 142, 2, NULL, NULL),
(183, 143, 2, NULL, NULL),
(184, 144, 2, NULL, NULL),
(185, 145, 2, NULL, NULL),
(186, 146, 2, NULL, NULL),
(187, 147, 2, NULL, NULL),
(188, 148, 2, NULL, NULL),
(189, 149, 2, NULL, NULL),
(190, 150, 2, NULL, NULL),
(191, 151, 2, NULL, NULL),
(192, 152, 2, NULL, NULL),
(193, 153, 2, NULL, NULL),
(194, 154, 2, NULL, NULL),
(195, 155, 2, NULL, NULL),
(196, 156, 2, NULL, NULL),
(197, 157, 2, NULL, NULL),
(198, 158, 2, NULL, NULL),
(199, 159, 2, NULL, NULL),
(200, 159, 3, NULL, NULL),
(201, 160, 2, NULL, NULL),
(202, 160, 3, NULL, NULL),
(203, 161, 2, NULL, NULL),
(204, 161, 3, NULL, NULL),
(205, 162, 2, NULL, NULL),
(206, 162, 3, NULL, NULL),
(207, 163, 2, NULL, NULL),
(208, 163, 3, NULL, NULL),
(209, 164, 2, NULL, NULL),
(210, 164, 3, NULL, NULL),
(211, 165, 2, NULL, NULL),
(212, 165, 3, NULL, NULL),
(213, 166, 2, NULL, NULL),
(214, 166, 3, NULL, NULL),
(215, 167, 2, NULL, NULL),
(216, 167, 3, NULL, NULL),
(217, 168, 2, NULL, NULL),
(218, 168, 3, NULL, NULL),
(221, 170, 2, NULL, NULL),
(222, 170, 3, NULL, NULL),
(223, 171, 2, NULL, NULL),
(224, 171, 3, NULL, NULL),
(225, 172, 2, NULL, NULL),
(226, 172, 3, NULL, NULL),
(227, 173, 2, NULL, NULL),
(228, 173, 3, NULL, NULL),
(229, 174, 2, NULL, NULL),
(230, 174, 3, NULL, NULL),
(231, 175, 2, NULL, NULL),
(232, 175, 3, NULL, NULL),
(233, 176, 2, NULL, NULL),
(234, 176, 3, NULL, NULL),
(235, 177, 2, NULL, NULL),
(236, 177, 3, NULL, NULL),
(237, 178, 2, NULL, NULL),
(238, 178, 3, NULL, NULL),
(239, 179, 2, NULL, NULL),
(240, 179, 3, NULL, NULL),
(241, 180, 2, NULL, NULL),
(242, 180, 3, NULL, NULL),
(243, 181, 2, NULL, NULL),
(244, 181, 3, NULL, NULL),
(245, 182, 2, NULL, NULL),
(246, 182, 3, NULL, NULL),
(247, 183, 2, NULL, NULL),
(248, 183, 3, NULL, NULL),
(249, 184, 2, NULL, NULL),
(250, 184, 3, NULL, NULL),
(251, 185, 2, NULL, NULL),
(252, 185, 3, NULL, NULL),
(253, 186, 2, NULL, NULL),
(254, 186, 3, NULL, NULL),
(255, 187, 2, NULL, NULL),
(256, 187, 3, NULL, NULL),
(257, 188, 2, NULL, NULL),
(258, 188, 3, NULL, NULL),
(259, 189, 2, NULL, NULL),
(260, 189, 3, NULL, NULL),
(261, 190, 2, NULL, NULL),
(262, 190, 3, NULL, NULL),
(263, 191, 2, NULL, NULL),
(264, 191, 3, NULL, NULL),
(265, 192, 2, NULL, NULL),
(266, 192, 3, NULL, NULL),
(267, 193, 2, NULL, NULL),
(268, 193, 3, NULL, NULL),
(269, 194, 2, NULL, NULL),
(270, 194, 3, NULL, NULL),
(271, 195, 2, NULL, NULL),
(272, 195, 3, NULL, NULL),
(273, 196, 2, NULL, NULL),
(274, 196, 3, NULL, NULL),
(275, 197, 2, NULL, NULL),
(276, 197, 3, NULL, NULL),
(277, 198, 2, NULL, NULL),
(278, 198, 3, NULL, NULL),
(279, 199, 2, NULL, NULL),
(280, 199, 3, NULL, NULL),
(281, 200, 2, NULL, NULL),
(282, 200, 3, NULL, NULL),
(283, 201, 2, NULL, NULL),
(284, 201, 3, NULL, NULL),
(285, 202, 2, NULL, NULL),
(286, 202, 3, NULL, NULL),
(287, 203, 2, NULL, NULL),
(288, 203, 3, NULL, NULL),
(289, 204, 2, NULL, NULL),
(290, 204, 3, NULL, NULL),
(291, 205, 2, NULL, NULL),
(292, 205, 3, NULL, NULL),
(293, 206, 2, NULL, NULL),
(294, 206, 3, NULL, NULL),
(295, 207, 2, NULL, NULL),
(296, 207, 3, NULL, NULL),
(297, 208, 2, NULL, NULL),
(298, 208, 3, NULL, NULL),
(299, 209, 2, NULL, NULL),
(300, 209, 3, NULL, NULL),
(301, 210, 2, NULL, NULL),
(302, 210, 3, NULL, NULL),
(303, 211, 2, NULL, NULL),
(304, 211, 3, NULL, NULL),
(305, 212, 2, NULL, NULL),
(306, 212, 3, NULL, NULL),
(307, 213, 2, NULL, NULL),
(308, 213, 3, NULL, NULL),
(309, 214, 2, NULL, NULL),
(310, 214, 3, NULL, NULL),
(311, 215, 2, NULL, NULL),
(312, 215, 3, NULL, NULL),
(313, 216, 2, NULL, NULL),
(314, 216, 3, NULL, NULL),
(315, 217, 2, NULL, NULL),
(316, 217, 3, NULL, NULL),
(317, 218, 2, NULL, NULL),
(318, 218, 3, NULL, NULL),
(319, 219, 2, NULL, NULL),
(320, 219, 3, NULL, NULL),
(321, 220, 2, NULL, NULL),
(322, 220, 3, NULL, NULL),
(323, 221, 2, NULL, NULL),
(324, 221, 3, NULL, NULL),
(325, 222, 2, NULL, NULL),
(326, 222, 3, NULL, NULL),
(327, 223, 2, NULL, NULL),
(328, 223, 3, NULL, NULL),
(329, 224, 2, NULL, NULL),
(330, 224, 3, NULL, NULL),
(331, 225, 2, NULL, NULL),
(332, 225, 3, NULL, NULL),
(333, 226, 2, NULL, NULL),
(334, 226, 3, NULL, NULL),
(335, 227, 2, NULL, NULL),
(336, 227, 3, NULL, NULL),
(337, 228, 2, NULL, NULL),
(338, 228, 3, NULL, NULL),
(339, 229, 2, NULL, NULL),
(340, 229, 3, NULL, NULL),
(341, 230, 2, NULL, NULL),
(342, 230, 3, NULL, NULL),
(343, 231, 2, NULL, NULL),
(344, 231, 3, NULL, NULL),
(345, 232, 2, NULL, NULL),
(346, 232, 3, NULL, NULL),
(347, 233, 2, NULL, NULL),
(348, 233, 3, NULL, NULL),
(349, 234, 2, NULL, NULL),
(350, 234, 3, NULL, NULL),
(351, 235, 2, NULL, NULL),
(352, 235, 3, NULL, NULL),
(353, 236, 2, NULL, NULL),
(354, 236, 3, NULL, NULL),
(355, 237, 2, NULL, NULL),
(356, 237, 3, NULL, NULL),
(357, 238, 2, NULL, NULL),
(358, 238, 3, NULL, NULL),
(359, 239, 2, NULL, NULL),
(360, 239, 3, NULL, NULL),
(361, 240, 2, NULL, NULL),
(362, 240, 3, NULL, NULL),
(363, 241, 2, NULL, NULL),
(364, 241, 3, NULL, NULL),
(365, 242, 2, NULL, NULL),
(366, 242, 3, NULL, NULL),
(367, 243, 2, NULL, NULL),
(368, 243, 3, NULL, NULL),
(369, 244, 2, NULL, NULL),
(370, 244, 3, NULL, NULL),
(371, 245, 2, NULL, NULL),
(372, 245, 3, NULL, NULL),
(373, 246, 2, NULL, NULL),
(374, 246, 3, NULL, NULL),
(375, 247, 2, NULL, NULL),
(376, 247, 3, NULL, NULL),
(377, 248, 2, NULL, NULL),
(378, 248, 3, NULL, NULL),
(379, 249, 2, NULL, NULL),
(380, 249, 3, NULL, NULL),
(381, 250, 2, NULL, NULL),
(382, 250, 3, NULL, NULL),
(383, 251, 2, NULL, NULL),
(384, 251, 3, NULL, NULL),
(385, 252, 2, NULL, NULL),
(386, 252, 3, NULL, NULL),
(387, 253, 2, NULL, NULL),
(388, 253, 3, NULL, NULL),
(389, 254, 2, NULL, NULL),
(390, 254, 3, NULL, NULL),
(391, 255, 2, NULL, NULL),
(392, 255, 3, NULL, NULL),
(393, 256, 2, NULL, NULL),
(394, 256, 3, NULL, NULL),
(395, 257, 2, NULL, NULL),
(396, 257, 3, NULL, NULL),
(397, 258, 2, NULL, NULL),
(398, 258, 3, NULL, NULL),
(399, 259, 2, NULL, NULL),
(400, 259, 3, NULL, NULL),
(401, 260, 2, NULL, NULL),
(402, 260, 3, NULL, NULL),
(403, 261, 2, NULL, NULL),
(404, 261, 3, NULL, NULL),
(405, 262, 2, NULL, NULL),
(406, 262, 3, NULL, NULL),
(407, 263, 2, NULL, NULL),
(408, 263, 3, NULL, NULL),
(409, 264, 2, NULL, NULL),
(410, 264, 3, NULL, NULL),
(411, 265, 2, NULL, NULL),
(412, 265, 3, NULL, NULL),
(413, 266, 2, NULL, NULL),
(414, 266, 3, NULL, NULL),
(415, 267, 2, NULL, NULL),
(416, 267, 3, NULL, NULL),
(417, 268, 2, NULL, NULL),
(418, 268, 3, NULL, NULL),
(419, 269, 2, NULL, NULL),
(420, 269, 3, NULL, NULL),
(421, 270, 2, NULL, NULL),
(422, 270, 3, NULL, NULL),
(423, 271, 2, NULL, NULL),
(424, 271, 3, NULL, NULL),
(425, 272, 2, NULL, NULL),
(426, 272, 3, NULL, NULL),
(427, 273, 2, NULL, NULL),
(428, 273, 3, NULL, NULL),
(429, 274, 2, NULL, NULL),
(430, 274, 3, NULL, NULL),
(431, 275, 2, NULL, NULL),
(432, 275, 3, NULL, NULL),
(433, 276, 2, NULL, NULL),
(434, 276, 3, NULL, NULL),
(435, 277, 2, NULL, NULL),
(436, 277, 3, NULL, NULL),
(437, 278, 2, NULL, NULL),
(438, 278, 3, NULL, NULL),
(439, 279, 2, NULL, NULL),
(440, 279, 3, NULL, NULL),
(441, 280, 2, NULL, NULL),
(442, 280, 3, NULL, NULL),
(443, 281, 2, NULL, NULL),
(444, 281, 3, NULL, NULL),
(445, 282, 1, NULL, NULL),
(446, 283, 1, NULL, NULL),
(447, 282, 3, NULL, NULL),
(448, 283, 3, NULL, NULL),
(449, 284, 1, NULL, NULL),
(450, 284, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `institution_program_deadlines`
--

CREATE TABLE `institution_program_deadlines` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `institution_program_id` bigint(20) UNSIGNED NOT NULL,
  `start_month` int(11) NOT NULL,
  `last_month` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `institution_program_deadlines`
--

INSERT INTO `institution_program_deadlines` (`id`, `institution_program_id`, `start_month`, `last_month`, `created_at`, `updated_at`) VALUES
(272, 127, 10, 8, NULL, NULL),
(273, 127, 4, 2, NULL, NULL),
(274, 128, 10, 8, NULL, NULL),
(275, 128, 4, 2, NULL, NULL),
(276, 129, 10, 8, NULL, NULL),
(277, 129, 4, 2, NULL, NULL),
(278, 130, 10, 8, NULL, NULL),
(279, 130, 4, 2, NULL, NULL),
(280, 131, 10, 8, NULL, NULL),
(281, 131, 4, 2, NULL, NULL),
(282, 132, 10, 8, NULL, NULL),
(283, 132, 4, 2, NULL, NULL),
(284, 133, 10, 8, NULL, NULL),
(285, 133, 4, 2, NULL, NULL),
(295, 139, 9, 6, NULL, NULL),
(296, 140, 9, 6, NULL, NULL),
(297, 141, 9, 6, NULL, NULL),
(300, 144, 9, 6, NULL, NULL),
(301, 145, 9, 6, NULL, NULL),
(302, 143, 9, 6, NULL, NULL),
(303, 142, 9, 6, NULL, NULL),
(305, 147, 9, 6, NULL, NULL),
(306, 146, 9, 6, NULL, NULL),
(326, 136, 10, 8, NULL, NULL),
(327, 136, 4, 2, NULL, NULL),
(328, 134, 10, 8, NULL, NULL),
(329, 134, 4, 2, NULL, NULL),
(330, 148, 9, 6, NULL, NULL),
(331, 158, 9, 6, NULL, NULL),
(332, 157, 9, 6, NULL, NULL),
(333, 156, 9, 6, NULL, NULL),
(334, 155, 9, 6, NULL, NULL),
(335, 154, 9, 6, NULL, NULL),
(337, 153, 9, 6, NULL, NULL),
(338, 152, 9, 6, NULL, NULL),
(340, 151, 9, 6, NULL, NULL),
(341, 150, 9, 6, NULL, NULL),
(342, 149, 9, 6, NULL, NULL),
(343, 135, 10, 8, NULL, NULL),
(344, 135, 4, 2, NULL, NULL),
(349, 160, 8, 7, NULL, NULL),
(350, 160, 1, 12, NULL, NULL),
(351, 159, 8, 7, NULL, NULL),
(352, 159, 1, 12, NULL, NULL),
(353, 161, 8, 7, NULL, NULL),
(354, 161, 1, 12, NULL, NULL),
(367, 165, 8, 7, NULL, NULL),
(368, 165, 1, 12, NULL, NULL),
(369, 164, 8, 7, NULL, NULL),
(370, 164, 1, 12, NULL, NULL),
(371, 163, 8, 7, NULL, NULL),
(372, 163, 1, 12, NULL, NULL),
(373, 162, 8, 7, NULL, NULL),
(374, 162, 1, 12, NULL, NULL),
(375, 166, 8, 7, NULL, NULL),
(376, 166, 1, 12, NULL, NULL),
(377, 167, 8, 7, NULL, NULL),
(378, 167, 1, 12, NULL, NULL),
(387, 171, 8, 7, NULL, NULL),
(388, 171, 1, 12, NULL, NULL),
(389, 172, 8, 7, NULL, NULL),
(390, 172, 1, 12, NULL, NULL),
(393, 173, 8, 7, NULL, NULL),
(394, 173, 1, 12, NULL, NULL),
(395, 174, 8, 7, NULL, NULL),
(396, 174, 1, 12, NULL, NULL),
(397, 175, 8, 7, NULL, NULL),
(398, 175, 1, 12, NULL, NULL),
(399, 176, 8, 7, NULL, NULL),
(400, 176, 1, 12, NULL, NULL),
(401, 177, 8, 7, NULL, NULL),
(402, 177, 1, 12, NULL, NULL),
(403, 170, 8, 7, NULL, NULL),
(404, 170, 1, 12, NULL, NULL),
(405, 168, 8, 7, NULL, NULL),
(406, 168, 1, 12, NULL, NULL),
(407, 178, 8, 7, NULL, NULL),
(408, 178, 1, 12, NULL, NULL),
(409, 179, 8, 7, NULL, NULL),
(410, 179, 1, 12, NULL, NULL),
(411, 180, 8, 7, NULL, NULL),
(412, 180, 1, 12, NULL, NULL),
(413, 181, 8, 7, NULL, NULL),
(414, 181, 1, 12, NULL, NULL),
(415, 182, 8, 7, NULL, NULL),
(416, 182, 1, 12, NULL, NULL),
(417, 183, 8, 7, NULL, NULL),
(418, 183, 1, 12, NULL, NULL),
(419, 184, 8, 7, NULL, NULL),
(420, 184, 1, 12, NULL, NULL),
(421, 185, 8, 7, NULL, NULL),
(422, 185, 1, 12, NULL, NULL),
(423, 186, 8, 7, NULL, NULL),
(424, 186, 1, 12, NULL, NULL),
(425, 187, 8, 7, NULL, NULL),
(426, 187, 1, 12, NULL, NULL),
(427, 188, 8, 7, NULL, NULL),
(428, 188, 1, 12, NULL, NULL),
(429, 189, 8, 7, NULL, NULL),
(430, 189, 1, 12, NULL, NULL),
(431, 190, 8, 7, NULL, NULL),
(432, 190, 1, 12, NULL, NULL),
(433, 191, 8, 7, NULL, NULL),
(434, 191, 1, 12, NULL, NULL),
(447, 197, 9, 4, NULL, NULL),
(448, 198, 9, 4, NULL, NULL),
(449, 196, 9, 4, NULL, NULL),
(450, 195, 9, 4, NULL, NULL),
(451, 194, 9, 4, NULL, NULL),
(452, 193, 9, 4, NULL, NULL),
(453, 192, 9, 4, NULL, NULL),
(455, 199, 9, 4, NULL, NULL),
(456, 200, 9, 4, NULL, NULL),
(457, 201, 9, 4, NULL, NULL),
(458, 202, 9, 4, NULL, NULL),
(459, 203, 9, 4, NULL, NULL),
(460, 204, 9, 4, NULL, NULL),
(461, 205, 9, 4, NULL, NULL),
(462, 206, 9, 4, NULL, NULL),
(463, 207, 9, 4, NULL, NULL),
(464, 208, 9, 4, NULL, NULL),
(465, 209, 9, 4, NULL, NULL),
(466, 210, 9, 4, NULL, NULL),
(467, 211, 9, 4, NULL, NULL),
(468, 212, 9, 4, NULL, NULL),
(471, 138, 9, 6, NULL, NULL),
(473, 214, 9, 4, NULL, NULL),
(474, 215, 9, 4, NULL, NULL),
(475, 213, 9, 4, NULL, NULL),
(476, 216, 9, 4, NULL, NULL),
(477, 217, 9, 4, NULL, NULL),
(482, 220, 9, 4, NULL, NULL),
(483, 219, 9, 4, NULL, NULL),
(484, 218, 9, 4, NULL, NULL),
(485, 221, 9, 4, NULL, NULL),
(486, 222, 9, 4, NULL, NULL),
(487, 223, 9, 4, NULL, NULL),
(488, 224, 9, 4, NULL, NULL),
(489, 225, 9, 4, NULL, NULL),
(490, 226, 9, 4, NULL, NULL),
(491, 227, 9, 4, NULL, NULL),
(492, 228, 9, 4, NULL, NULL),
(493, 229, 9, 5, NULL, NULL),
(494, 230, 9, 5, NULL, NULL),
(495, 231, 9, 5, NULL, NULL),
(496, 232, 9, 5, NULL, NULL),
(497, 233, 9, 5, NULL, NULL),
(498, 234, 9, 5, NULL, NULL),
(502, 238, 9, 5, NULL, NULL),
(503, 235, 9, 5, NULL, NULL),
(504, 236, 9, 5, NULL, NULL),
(505, 237, 9, 5, NULL, NULL),
(507, 239, 9, 5, NULL, NULL),
(516, 240, 9, 7, NULL, NULL),
(517, 240, 2, 1, NULL, NULL),
(518, 241, 9, 7, NULL, NULL),
(519, 241, 2, 1, NULL, NULL),
(520, 242, 9, 7, NULL, NULL),
(521, 242, 2, 1, NULL, NULL),
(522, 243, 9, 7, NULL, NULL),
(523, 243, 2, 1, NULL, NULL),
(524, 244, 9, 7, NULL, NULL),
(525, 244, 2, 1, NULL, NULL),
(528, 246, 9, 7, NULL, NULL),
(529, 246, 2, 1, NULL, NULL),
(530, 247, 9, 7, NULL, NULL),
(531, 247, 2, 1, NULL, NULL),
(532, 245, 9, 7, NULL, NULL),
(533, 245, 2, 1, NULL, NULL),
(534, 248, 9, 7, NULL, NULL),
(535, 248, 2, 1, NULL, NULL),
(536, 249, 9, 7, NULL, NULL),
(537, 249, 2, 1, NULL, NULL),
(538, 250, 9, 7, NULL, NULL),
(539, 250, 2, 1, NULL, NULL),
(540, 251, 9, 7, NULL, NULL),
(541, 251, 2, 1, NULL, NULL),
(542, 252, 9, 7, NULL, NULL),
(543, 252, 2, 1, NULL, NULL),
(544, 253, 9, 7, NULL, NULL),
(545, 253, 2, 1, NULL, NULL),
(546, 254, 9, 7, NULL, NULL),
(547, 254, 2, 1, NULL, NULL),
(548, 255, 9, 7, NULL, NULL),
(549, 255, 2, 1, NULL, NULL),
(550, 256, 9, 7, NULL, NULL),
(551, 256, 2, 1, NULL, NULL),
(552, 257, 9, 7, NULL, NULL),
(553, 257, 2, 1, NULL, NULL),
(554, 258, 9, 7, NULL, NULL),
(555, 258, 2, 1, NULL, NULL),
(556, 259, 9, 7, NULL, NULL),
(557, 259, 2, 1, NULL, NULL),
(558, 260, 9, 7, NULL, NULL),
(559, 260, 2, 1, NULL, NULL),
(560, 261, 9, 7, NULL, NULL),
(561, 261, 2, 1, NULL, NULL),
(562, 262, 9, 7, NULL, NULL),
(563, 262, 2, 1, NULL, NULL),
(564, 263, 9, 7, NULL, NULL),
(565, 263, 2, 1, NULL, NULL),
(573, 268, 9, 5, NULL, NULL),
(574, 264, 9, 5, NULL, NULL),
(575, 265, 9, 5, NULL, NULL),
(576, 266, 9, 5, NULL, NULL),
(577, 267, 9, 5, NULL, NULL),
(578, 269, 9, 5, NULL, NULL),
(579, 270, 9, 5, NULL, NULL),
(581, 271, 9, 5, NULL, NULL),
(582, 272, 9, 5, NULL, NULL),
(583, 273, 9, 5, NULL, NULL),
(584, 274, 9, 5, NULL, NULL),
(585, 275, 9, 5, NULL, NULL),
(586, 276, 9, 5, NULL, NULL),
(587, 277, 9, 5, NULL, NULL),
(588, 278, 9, 5, NULL, NULL),
(589, 279, 9, 5, NULL, NULL),
(590, 280, 9, 5, NULL, NULL),
(591, 281, 9, 5, NULL, NULL),
(600, 282, 2, 12, NULL, NULL),
(601, 282, 9, 6, NULL, NULL),
(602, 283, 2, 11, NULL, NULL),
(603, 283, 9, 6, NULL, NULL),
(604, 284, 2, 11, NULL, NULL),
(605, 284, 9, 6, NULL, NULL);

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `institution_program_exam_requirements`
--

CREATE TABLE `institution_program_exam_requirements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `institution_program_id` bigint(20) UNSIGNED NOT NULL,
  `exam_id` bigint(20) NOT NULL,
  `score` decimal(8,1) NOT NULL,
  `reading_score` decimal(10,1) NOT NULL,
  `listening_score` decimal(10,1) NOT NULL,
  `speaking_score` decimal(10,1) NOT NULL,
  `writing_score` decimal(10,1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `institution_program_exam_requirements`
--

INSERT INTO `institution_program_exam_requirements` (`id`, `institution_program_id`, `exam_id`, `score`, `reading_score`, `listening_score`, `speaking_score`, `writing_score`, `created_at`, `updated_at`) VALUES
(325, 127, 2, '80.0', '0.0', '0.0', '0.0', '0.0', '2021-01-05 14:25:57', '2021-01-05 14:25:57'),
(326, 127, 4, '6.0', '0.0', '0.0', '0.0', '0.0', '2021-01-05 14:25:57', '2021-01-05 14:25:57'),
(327, 128, 2, '80.0', '0.0', '0.0', '0.0', '0.0', '2021-01-05 14:30:14', '2021-01-05 14:30:14'),
(328, 128, 4, '6.0', '0.0', '0.0', '0.0', '0.0', '2021-01-05 14:30:14', '2021-01-05 14:30:14'),
(329, 129, 2, '80.0', '0.0', '0.0', '0.0', '0.0', '2021-01-05 14:31:18', '2021-01-05 14:31:18'),
(330, 129, 4, '6.0', '0.0', '0.0', '0.0', '0.0', '2021-01-05 14:31:18', '2021-01-05 14:31:18'),
(331, 130, 2, '80.0', '0.0', '0.0', '0.0', '0.0', '2021-01-05 14:32:00', '2021-01-05 14:32:00'),
(332, 130, 4, '6.0', '0.0', '0.0', '0.0', '0.0', '2021-01-05 14:32:00', '2021-01-05 14:32:00'),
(333, 131, 2, '80.0', '0.0', '0.0', '0.0', '0.0', '2021-01-05 14:35:05', '2021-01-05 14:35:05'),
(334, 131, 4, '6.0', '0.0', '0.0', '0.0', '0.0', '2021-01-05 14:35:05', '2021-01-05 14:35:05'),
(335, 132, 2, '80.0', '0.0', '0.0', '0.0', '0.0', '2021-01-05 14:35:58', '2021-01-05 14:35:58'),
(336, 132, 4, '6.0', '0.0', '0.0', '0.0', '0.0', '2021-01-05 14:35:58', '2021-01-05 14:35:58'),
(337, 133, 2, '80.0', '0.0', '0.0', '0.0', '0.0', '2021-01-05 14:36:48', '2021-01-05 14:36:48'),
(338, 133, 4, '6.0', '0.0', '0.0', '0.0', '0.0', '2021-01-05 14:36:48', '2021-01-05 14:36:48'),
(349, 139, 6, '1180.0', '0.0', '0.0', '0.0', '0.0', '2021-01-09 17:45:01', '2021-01-09 17:45:01'),
(350, 140, 6, '1180.0', '0.0', '0.0', '0.0', '0.0', '2021-01-09 17:46:41', '2021-01-09 17:46:41'),
(351, 141, 6, '1200.0', '0.0', '0.0', '0.0', '0.0', '2021-01-09 17:49:06', '2021-01-09 17:49:06'),
(354, 144, 6, '1200.0', '0.0', '0.0', '0.0', '0.0', '2021-01-09 17:51:49', '2021-01-09 17:51:49'),
(355, 145, 6, '1200.0', '0.0', '0.0', '0.0', '0.0', '2021-01-09 17:52:47', '2021-01-09 17:52:47'),
(356, 143, 6, '1200.0', '0.0', '0.0', '0.0', '0.0', '2021-01-09 17:53:28', '2021-01-09 17:53:28'),
(357, 142, 6, '1200.0', '0.0', '0.0', '0.0', '0.0', '2021-01-09 17:54:11', '2021-01-09 17:54:11'),
(359, 147, 6, '1180.0', '0.0', '0.0', '0.0', '0.0', '2021-01-09 17:57:07', '2021-01-09 17:57:07'),
(360, 146, 6, '1180.0', '0.0', '0.0', '0.0', '0.0', '2021-01-09 17:57:43', '2021-01-09 17:57:43'),
(380, 136, 2, '80.0', '0.0', '0.0', '0.0', '0.0', '2021-01-21 15:33:04', '2021-01-21 15:33:04'),
(381, 136, 4, '6.0', '0.0', '0.0', '0.0', '0.0', '2021-01-21 15:33:04', '2021-01-21 15:33:04'),
(382, 134, 2, '80.0', '0.0', '0.0', '0.0', '0.0', '2021-01-21 15:33:30', '2021-01-21 15:33:30'),
(383, 134, 4, '6.0', '0.0', '0.0', '0.0', '0.0', '2021-01-21 15:33:30', '2021-01-21 15:33:30'),
(384, 148, 6, '1180.0', '0.0', '0.0', '0.0', '0.0', '2021-01-22 07:31:01', '2021-01-22 07:31:01'),
(385, 158, 6, '1450.0', '0.0', '0.0', '0.0', '0.0', '2021-01-22 17:35:13', '2021-01-22 17:35:13'),
(386, 157, 6, '1410.0', '0.0', '0.0', '0.0', '0.0', '2021-01-22 17:35:48', '2021-01-22 17:35:48'),
(387, 156, 6, '1180.0', '0.0', '0.0', '0.0', '0.0', '2021-01-22 17:36:09', '2021-01-22 17:36:09'),
(388, 155, 6, '1180.0', '0.0', '0.0', '0.0', '0.0', '2021-01-22 17:36:39', '2021-01-22 17:36:39'),
(389, 154, 6, '1180.0', '0.0', '0.0', '0.0', '0.0', '2021-01-22 17:36:51', '2021-01-22 17:36:51'),
(391, 153, 6, '1180.0', '0.0', '0.0', '0.0', '0.0', '2021-01-22 17:37:22', '2021-01-22 17:37:22'),
(392, 152, 6, '1180.0', '0.0', '0.0', '0.0', '0.0', '2021-01-22 17:37:49', '2021-01-22 17:37:49'),
(394, 151, 6, '1180.0', '0.0', '0.0', '0.0', '0.0', '2021-01-22 17:38:12', '2021-01-22 17:38:12'),
(395, 150, 6, '1180.0', '0.0', '0.0', '0.0', '0.0', '2021-01-22 17:38:34', '2021-01-22 17:38:34'),
(396, 149, 6, '1180.0', '0.0', '0.0', '0.0', '0.0', '2021-01-22 17:38:56', '2021-01-22 17:38:56'),
(397, 135, 2, '80.0', '0.0', '0.0', '0.0', '0.0', '2021-02-06 10:24:52', '2021-02-06 10:24:52'),
(398, 135, 4, '6.0', '0.0', '0.0', '0.0', '0.0', '2021-02-06 10:24:52', '2021-02-06 10:24:52'),
(403, 160, 2, '79.0', '0.0', '0.0', '0.0', '0.0', '2021-02-10 07:37:43', '2021-02-10 07:37:43'),
(404, 160, 4, '6.5', '0.0', '0.0', '0.0', '0.0', '2021-02-10 07:37:43', '2021-02-10 07:37:43'),
(405, 159, 2, '79.0', '0.0', '0.0', '0.0', '0.0', '2021-02-10 07:38:10', '2021-02-10 07:38:10'),
(406, 159, 4, '6.5', '0.0', '0.0', '0.0', '0.0', '2021-02-10 07:38:10', '2021-02-10 07:38:10'),
(407, 161, 2, '79.0', '0.0', '0.0', '0.0', '0.0', '2021-02-10 07:53:13', '2021-02-10 07:53:13'),
(408, 161, 4, '6.5', '0.0', '0.0', '0.0', '0.0', '2021-02-10 07:53:13', '2021-02-10 07:53:13'),
(421, 165, 2, '79.0', '0.0', '0.0', '0.0', '0.0', '2021-02-10 08:14:20', '2021-02-10 08:14:20'),
(422, 165, 4, '6.5', '0.0', '0.0', '0.0', '0.0', '2021-02-10 08:14:20', '2021-02-10 08:14:20'),
(423, 164, 2, '79.0', '0.0', '0.0', '0.0', '0.0', '2021-02-10 08:14:59', '2021-02-10 08:14:59'),
(424, 164, 4, '6.5', '0.0', '0.0', '0.0', '0.0', '2021-02-10 08:14:59', '2021-02-10 08:14:59'),
(425, 163, 2, '79.0', '0.0', '0.0', '0.0', '0.0', '2021-02-10 08:15:28', '2021-02-10 08:15:28'),
(426, 163, 4, '6.5', '0.0', '0.0', '0.0', '0.0', '2021-02-10 08:15:28', '2021-02-10 08:15:28'),
(427, 162, 2, '79.0', '0.0', '0.0', '0.0', '0.0', '2021-02-10 08:16:10', '2021-02-10 08:16:10'),
(428, 162, 4, '6.5', '0.0', '0.0', '0.0', '0.0', '2021-02-10 08:16:10', '2021-02-10 08:16:10'),
(429, 166, 2, '79.0', '0.0', '0.0', '0.0', '0.0', '2021-02-10 08:20:46', '2021-02-10 08:20:46'),
(430, 166, 4, '6.5', '0.0', '0.0', '0.0', '0.0', '2021-02-10 08:20:47', '2021-02-10 08:20:47'),
(431, 167, 2, '79.0', '0.0', '0.0', '0.0', '0.0', '2021-02-10 08:22:14', '2021-02-10 08:22:14'),
(432, 167, 4, '6.5', '0.0', '0.0', '0.0', '0.0', '2021-02-10 08:22:14', '2021-02-10 08:22:14'),
(441, 171, 2, '79.0', '0.0', '0.0', '0.0', '0.0', '2021-02-10 08:29:10', '2021-02-10 08:29:10'),
(442, 171, 4, '6.5', '0.0', '0.0', '0.0', '0.0', '2021-02-10 08:29:10', '2021-02-10 08:29:10'),
(443, 172, 2, '79.0', '0.0', '0.0', '0.0', '0.0', '2021-02-10 08:49:32', '2021-02-10 08:49:32'),
(444, 172, 4, '6.5', '0.0', '0.0', '0.0', '0.0', '2021-02-10 08:49:32', '2021-02-10 08:49:32'),
(447, 173, 2, '79.0', '0.0', '0.0', '0.0', '0.0', '2021-02-10 08:52:21', '2021-02-10 08:52:21'),
(448, 173, 4, '6.5', '0.0', '0.0', '0.0', '0.0', '2021-02-10 08:52:21', '2021-02-10 08:52:21'),
(449, 174, 2, '79.0', '0.0', '0.0', '0.0', '0.0', '2021-02-10 08:57:59', '2021-02-10 08:57:59'),
(450, 174, 4, '6.5', '0.0', '0.0', '0.0', '0.0', '2021-02-10 08:57:59', '2021-02-10 08:57:59'),
(451, 175, 2, '79.0', '0.0', '0.0', '0.0', '0.0', '2021-02-10 08:59:05', '2021-02-10 08:59:05'),
(452, 175, 4, '6.5', '0.0', '0.0', '0.0', '0.0', '2021-02-10 08:59:05', '2021-02-10 08:59:05'),
(453, 176, 2, '79.0', '0.0', '0.0', '0.0', '0.0', '2021-02-10 08:59:51', '2021-02-10 08:59:51'),
(454, 176, 4, '6.5', '0.0', '0.0', '0.0', '0.0', '2021-02-10 08:59:51', '2021-02-10 08:59:51'),
(455, 177, 2, '79.0', '0.0', '0.0', '0.0', '0.0', '2021-02-10 09:00:46', '2021-02-10 09:00:46'),
(456, 177, 4, '6.5', '0.0', '0.0', '0.0', '0.0', '2021-02-10 09:00:46', '2021-02-10 09:00:46'),
(457, 170, 2, '79.0', '0.0', '0.0', '0.0', '0.0', '2021-02-10 09:04:54', '2021-02-10 09:04:54'),
(458, 170, 4, '6.5', '0.0', '0.0', '0.0', '0.0', '2021-02-10 09:04:54', '2021-02-10 09:04:54'),
(459, 168, 2, '79.0', '0.0', '0.0', '0.0', '0.0', '2021-02-10 09:05:22', '2021-02-10 09:05:22'),
(460, 168, 4, '6.5', '0.0', '0.0', '0.0', '0.0', '2021-02-10 09:05:22', '2021-02-10 09:05:22'),
(461, 178, 2, '79.0', '0.0', '0.0', '0.0', '0.0', '2021-02-10 09:18:25', '2021-02-10 09:18:25'),
(462, 178, 4, '6.5', '0.0', '0.0', '0.0', '0.0', '2021-02-10 09:18:25', '2021-02-10 09:18:25'),
(463, 179, 2, '79.0', '0.0', '0.0', '0.0', '0.0', '2021-02-10 09:20:23', '2021-02-10 09:20:23'),
(464, 179, 4, '6.5', '0.0', '0.0', '0.0', '0.0', '2021-02-10 09:20:23', '2021-02-10 09:20:23'),
(465, 180, 2, '79.0', '0.0', '0.0', '0.0', '0.0', '2021-02-10 09:52:41', '2021-02-10 09:52:41'),
(466, 180, 4, '6.5', '0.0', '0.0', '0.0', '0.0', '2021-02-10 09:52:41', '2021-02-10 09:52:41'),
(467, 181, 2, '79.0', '0.0', '0.0', '0.0', '0.0', '2021-02-10 09:53:22', '2021-02-10 09:53:22'),
(468, 181, 4, '6.5', '0.0', '0.0', '0.0', '0.0', '2021-02-10 09:53:22', '2021-02-10 09:53:22'),
(469, 182, 2, '79.0', '0.0', '0.0', '0.0', '0.0', '2021-02-10 09:53:46', '2021-02-10 09:53:46'),
(470, 182, 4, '6.5', '0.0', '0.0', '0.0', '0.0', '2021-02-10 09:53:46', '2021-02-10 09:53:46'),
(471, 183, 2, '79.0', '0.0', '0.0', '0.0', '0.0', '2021-02-10 09:55:13', '2021-02-10 09:55:13'),
(472, 183, 4, '6.5', '0.0', '0.0', '0.0', '0.0', '2021-02-10 09:55:13', '2021-02-10 09:55:13'),
(473, 184, 2, '79.0', '0.0', '0.0', '0.0', '0.0', '2021-02-10 10:02:10', '2021-02-10 10:02:10'),
(474, 184, 4, '6.5', '0.0', '0.0', '0.0', '0.0', '2021-02-10 10:02:10', '2021-02-10 10:02:10'),
(475, 185, 2, '79.0', '0.0', '0.0', '0.0', '0.0', '2021-02-10 10:25:47', '2021-02-10 10:25:47'),
(476, 185, 4, '6.5', '0.0', '0.0', '0.0', '0.0', '2021-02-10 10:25:47', '2021-02-10 10:25:47'),
(477, 186, 2, '79.0', '0.0', '0.0', '0.0', '0.0', '2021-02-10 10:27:07', '2021-02-10 10:27:07'),
(478, 186, 4, '6.5', '0.0', '0.0', '0.0', '0.0', '2021-02-10 10:27:07', '2021-02-10 10:27:07'),
(479, 187, 2, '79.0', '0.0', '0.0', '0.0', '0.0', '2021-02-10 10:27:44', '2021-02-10 10:27:44'),
(480, 187, 4, '6.5', '0.0', '0.0', '0.0', '0.0', '2021-02-10 10:27:44', '2021-02-10 10:27:44'),
(481, 188, 2, '79.0', '0.0', '0.0', '0.0', '0.0', '2021-02-10 10:28:15', '2021-02-10 10:28:15'),
(482, 188, 4, '6.5', '0.0', '0.0', '0.0', '0.0', '2021-02-10 10:28:15', '2021-02-10 10:28:15'),
(483, 189, 2, '79.0', '0.0', '0.0', '0.0', '0.0', '2021-02-10 10:41:33', '2021-02-10 10:41:33'),
(484, 189, 4, '6.5', '0.0', '0.0', '0.0', '0.0', '2021-02-10 10:41:33', '2021-02-10 10:41:33'),
(485, 190, 2, '79.0', '0.0', '0.0', '0.0', '0.0', '2021-02-10 10:42:17', '2021-02-10 10:42:17'),
(486, 190, 4, '6.5', '0.0', '0.0', '0.0', '0.0', '2021-02-10 10:42:17', '2021-02-10 10:42:17'),
(487, 191, 2, '79.0', '0.0', '0.0', '0.0', '0.0', '2021-02-10 10:46:09', '2021-02-10 10:46:09'),
(488, 191, 4, '6.5', '0.0', '0.0', '0.0', '0.0', '2021-02-10 10:46:09', '2021-02-10 10:46:09'),
(513, 197, 2, '65.0', '0.0', '0.0', '0.0', '0.0', '2021-02-11 06:14:15', '2021-02-11 06:14:15'),
(514, 197, 4, '6.0', '0.0', '0.0', '0.0', '0.0', '2021-02-11 06:14:15', '2021-02-11 06:14:15'),
(515, 198, 2, '50.0', '0.0', '0.0', '0.0', '0.0', '2021-02-11 06:14:33', '2021-02-11 06:14:33'),
(516, 198, 4, '5.5', '0.0', '0.0', '0.0', '0.0', '2021-02-11 06:14:33', '2021-02-11 06:14:33'),
(517, 196, 2, '40.0', '0.0', '0.0', '0.0', '0.0', '2021-02-11 06:14:59', '2021-02-11 06:14:59'),
(518, 196, 4, '5.0', '0.0', '0.0', '0.0', '0.0', '2021-02-11 06:14:59', '2021-02-11 06:14:59'),
(519, 195, 2, '65.0', '0.0', '0.0', '0.0', '0.0', '2021-02-11 06:15:08', '2021-02-11 06:15:08'),
(520, 195, 4, '6.0', '0.0', '0.0', '0.0', '0.0', '2021-02-11 06:15:08', '2021-02-11 06:15:08'),
(521, 194, 2, '50.0', '0.0', '0.0', '0.0', '0.0', '2021-02-11 06:16:03', '2021-02-11 06:16:03'),
(522, 194, 4, '5.5', '0.0', '0.0', '0.0', '0.0', '2021-02-11 06:16:03', '2021-02-11 06:16:03'),
(523, 193, 2, '50.0', '0.0', '0.0', '0.0', '0.0', '2021-02-11 06:16:35', '2021-02-11 06:16:35'),
(524, 193, 4, '5.5', '0.0', '0.0', '0.0', '0.0', '2021-02-11 06:16:35', '2021-02-11 06:16:35'),
(525, 192, 2, '40.0', '0.0', '0.0', '0.0', '0.0', '2021-02-11 06:17:08', '2021-02-11 06:17:08'),
(526, 192, 4, '5.0', '0.0', '0.0', '0.0', '0.0', '2021-02-11 06:17:08', '2021-02-11 06:17:08'),
(529, 199, 2, '80.0', '0.0', '0.0', '0.0', '0.0', '2021-02-11 06:19:10', '2021-02-11 06:19:10'),
(530, 199, 4, '6.5', '0.0', '0.0', '0.0', '0.0', '2021-02-11 06:19:10', '2021-02-11 06:19:10'),
(531, 200, 2, '65.0', '0.0', '0.0', '0.0', '0.0', '2021-02-11 06:31:35', '2021-02-11 06:31:35'),
(532, 200, 4, '6.0', '0.0', '0.0', '0.0', '0.0', '2021-02-11 06:31:35', '2021-02-11 06:31:35'),
(533, 201, 2, '60.0', '0.0', '0.0', '0.0', '0.0', '2021-02-11 07:09:02', '2021-02-11 07:09:02'),
(534, 201, 4, '6.0', '0.0', '0.0', '0.0', '0.0', '2021-02-11 07:09:02', '2021-02-11 07:09:02'),
(535, 202, 2, '60.0', '0.0', '0.0', '0.0', '0.0', '2021-02-11 07:11:11', '2021-02-11 07:11:11'),
(536, 202, 4, '6.0', '0.0', '0.0', '0.0', '0.0', '2021-02-11 07:11:11', '2021-02-11 07:11:11'),
(537, 203, 2, '65.0', '0.0', '0.0', '0.0', '0.0', '2021-02-11 07:41:38', '2021-02-11 07:41:38'),
(538, 203, 4, '6.5', '0.0', '0.0', '0.0', '0.0', '2021-02-11 07:41:38', '2021-02-11 07:41:38'),
(539, 204, 2, '80.0', '0.0', '0.0', '0.0', '0.0', '2021-02-11 07:43:49', '2021-02-11 07:43:49'),
(540, 204, 4, '6.5', '0.0', '0.0', '0.0', '0.0', '2021-02-11 07:43:49', '2021-02-11 07:43:49'),
(541, 205, 2, '60.0', '0.0', '0.0', '0.0', '0.0', '2021-02-11 07:45:24', '2021-02-11 07:45:24'),
(542, 205, 4, '6.0', '0.0', '0.0', '0.0', '0.0', '2021-02-11 07:45:24', '2021-02-11 07:45:24'),
(543, 206, 2, '60.0', '0.0', '0.0', '0.0', '0.0', '2021-02-11 07:46:19', '2021-02-11 07:46:19'),
(544, 206, 4, '6.0', '0.0', '0.0', '0.0', '0.0', '2021-02-11 07:46:19', '2021-02-11 07:46:19'),
(545, 207, 2, '60.0', '0.0', '0.0', '0.0', '0.0', '2021-02-11 07:47:11', '2021-02-11 07:47:11'),
(546, 207, 4, '6.0', '0.0', '0.0', '0.0', '0.0', '2021-02-11 07:47:11', '2021-02-11 07:47:11'),
(547, 208, 2, '60.0', '0.0', '0.0', '0.0', '0.0', '2021-02-11 07:47:46', '2021-02-11 07:47:46'),
(548, 208, 4, '6.0', '0.0', '0.0', '0.0', '0.0', '2021-02-11 07:47:46', '2021-02-11 07:47:46'),
(549, 209, 2, '60.0', '0.0', '0.0', '0.0', '0.0', '2021-02-11 07:51:54', '2021-02-11 07:51:54'),
(550, 209, 4, '6.0', '0.0', '0.0', '0.0', '0.0', '2021-02-11 07:51:54', '2021-02-11 07:51:54'),
(551, 210, 2, '60.0', '0.0', '0.0', '0.0', '0.0', '2021-02-11 07:52:21', '2021-02-11 07:52:21'),
(552, 210, 4, '6.0', '0.0', '0.0', '0.0', '0.0', '2021-02-11 07:52:21', '2021-02-11 07:52:21'),
(553, 211, 2, '60.0', '0.0', '0.0', '0.0', '0.0', '2021-02-11 07:53:08', '2021-02-11 07:53:08'),
(554, 211, 4, '6.0', '0.0', '0.0', '0.0', '0.0', '2021-02-11 07:53:08', '2021-02-11 07:53:08'),
(555, 212, 2, '60.0', '0.0', '0.0', '0.0', '0.0', '2021-02-11 07:53:53', '2021-02-11 07:53:53'),
(556, 212, 4, '6.0', '0.0', '0.0', '0.0', '0.0', '2021-02-11 07:53:53', '2021-02-11 07:53:53'),
(560, 138, 6, '1180.5', '0.0', '0.0', '0.0', '0.0', '2021-02-11 11:52:23', '2021-02-11 11:52:23'),
(563, 214, 2, '60.0', '0.0', '0.0', '0.0', '0.0', '2021-02-12 08:08:07', '2021-02-12 08:08:07'),
(564, 214, 4, '6.0', '0.0', '0.0', '0.0', '0.0', '2021-02-12 08:08:07', '2021-02-12 08:08:07'),
(565, 215, 2, '60.0', '0.0', '0.0', '0.0', '0.0', '2021-02-12 08:08:56', '2021-02-12 08:08:56'),
(566, 215, 4, '6.0', '0.0', '0.0', '0.0', '0.0', '2021-02-12 08:08:56', '2021-02-12 08:08:56'),
(567, 213, 2, '60.0', '0.0', '0.0', '0.0', '0.0', '2021-02-12 08:09:33', '2021-02-12 08:09:33'),
(568, 213, 4, '6.0', '0.0', '0.0', '0.0', '0.0', '2021-02-12 08:09:33', '2021-02-12 08:09:33'),
(569, 216, 2, '60.0', '0.0', '0.0', '0.0', '0.0', '2021-02-12 08:10:12', '2021-02-12 08:10:12'),
(570, 216, 4, '6.0', '0.0', '0.0', '0.0', '0.0', '2021-02-12 08:10:12', '2021-02-12 08:10:12'),
(571, 217, 2, '60.0', '0.0', '0.0', '0.0', '0.0', '2021-02-12 08:10:42', '2021-02-12 08:10:42'),
(572, 217, 4, '6.0', '0.0', '0.0', '0.0', '0.0', '2021-02-12 08:10:42', '2021-02-12 08:10:42'),
(581, 220, 2, '110.0', '0.0', '0.0', '0.0', '0.0', '2021-02-12 08:20:05', '2021-02-12 08:20:05'),
(582, 220, 4, '8.0', '0.0', '0.0', '0.0', '0.0', '2021-02-12 08:20:05', '2021-02-12 08:20:05'),
(583, 219, 2, '60.0', '0.0', '0.0', '0.0', '0.0', '2021-02-12 08:20:51', '2021-02-12 08:20:51'),
(584, 219, 4, '6.0', '0.0', '0.0', '0.0', '0.0', '2021-02-12 08:20:51', '2021-02-12 08:20:51'),
(585, 218, 2, '60.0', '0.0', '0.0', '0.0', '0.0', '2021-02-12 08:21:21', '2021-02-12 08:21:21'),
(586, 218, 4, '6.0', '0.0', '0.0', '0.0', '0.0', '2021-02-12 08:21:21', '2021-02-12 08:21:21'),
(587, 221, 2, '80.0', '0.0', '0.0', '0.0', '0.0', '2021-02-12 08:24:44', '2021-02-12 08:24:44'),
(588, 221, 4, '6.5', '0.0', '0.0', '0.0', '0.0', '2021-02-12 08:24:44', '2021-02-12 08:24:44'),
(589, 222, 2, '40.0', '0.0', '0.0', '0.0', '0.0', '2021-02-12 08:26:51', '2021-02-12 08:26:51'),
(590, 222, 4, '5.0', '0.0', '0.0', '0.0', '0.0', '2021-02-12 08:26:51', '2021-02-12 08:26:51'),
(591, 223, 2, '60.0', '0.0', '0.0', '0.0', '0.0', '2021-02-12 08:29:19', '2021-02-12 08:29:19'),
(592, 223, 4, '6.0', '0.0', '0.0', '0.0', '0.0', '2021-02-12 08:29:19', '2021-02-12 08:29:19'),
(593, 224, 2, '60.0', '0.0', '0.0', '0.0', '0.0', '2021-02-12 08:31:39', '2021-02-12 08:31:39'),
(594, 224, 4, '6.0', '0.0', '0.0', '0.0', '0.0', '2021-02-12 08:31:39', '2021-02-12 08:31:39'),
(595, 225, 2, '60.0', '0.0', '0.0', '0.0', '0.0', '2021-02-12 08:33:23', '2021-02-12 08:33:23'),
(596, 225, 4, '6.0', '0.0', '0.0', '0.0', '0.0', '2021-02-12 08:33:23', '2021-02-12 08:33:23'),
(597, 226, 2, '80.0', '0.0', '0.0', '0.0', '0.0', '2021-02-12 08:35:51', '2021-02-12 08:35:51'),
(598, 226, 4, '6.5', '0.0', '0.0', '0.0', '0.0', '2021-02-12 08:35:51', '2021-02-12 08:35:51'),
(599, 227, 2, '80.0', '0.0', '0.0', '0.0', '0.0', '2021-02-12 08:37:04', '2021-02-12 08:37:04'),
(600, 227, 4, '6.5', '0.0', '0.0', '0.0', '0.0', '2021-02-12 08:37:04', '2021-02-12 08:37:04'),
(601, 228, 2, '50.0', '0.0', '0.0', '0.0', '0.0', '2021-02-12 08:38:57', '2021-02-12 08:38:57'),
(602, 228, 4, '5.5', '0.0', '0.0', '0.0', '0.0', '2021-02-12 08:38:57', '2021-02-12 08:38:57'),
(603, 229, 2, '80.0', '0.0', '0.0', '0.0', '0.0', '2021-02-12 09:08:09', '2021-02-12 09:08:09'),
(604, 229, 4, '6.0', '0.0', '0.0', '0.0', '0.0', '2021-02-12 09:08:09', '2021-02-12 09:08:09'),
(605, 230, 2, '80.0', '0.0', '0.0', '0.0', '0.0', '2021-02-13 06:48:22', '2021-02-13 06:48:22'),
(606, 230, 4, '6.0', '0.0', '0.0', '0.0', '0.0', '2021-02-13 06:48:22', '2021-02-13 06:48:22'),
(607, 231, 2, '80.0', '0.0', '0.0', '0.0', '0.0', '2021-02-13 06:50:52', '2021-02-13 06:50:52'),
(608, 231, 4, '6.0', '0.0', '0.0', '0.0', '0.0', '2021-02-13 06:50:52', '2021-02-13 06:50:52'),
(609, 232, 2, '80.0', '0.0', '0.0', '0.0', '0.0', '2021-02-13 06:58:52', '2021-02-13 06:58:52'),
(610, 232, 4, '6.0', '0.0', '0.0', '0.0', '0.0', '2021-02-13 06:58:52', '2021-02-13 06:58:52'),
(611, 233, 2, '80.0', '0.0', '0.0', '0.0', '0.0', '2021-02-13 06:59:44', '2021-02-13 06:59:44'),
(612, 233, 4, '6.0', '0.0', '0.0', '0.0', '0.0', '2021-02-13 06:59:44', '2021-02-13 06:59:44'),
(613, 234, 2, '80.0', '0.0', '0.0', '0.0', '0.0', '2021-02-13 07:02:28', '2021-02-13 07:02:28'),
(614, 234, 4, '6.0', '0.0', '0.0', '0.0', '0.0', '2021-02-13 07:02:28', '2021-02-13 07:02:28'),
(621, 238, 2, '90.0', '0.0', '0.0', '0.0', '0.0', '2021-02-13 08:23:55', '2021-02-13 08:23:55'),
(622, 238, 4, '6.5', '0.0', '0.0', '0.0', '0.0', '2021-02-13 08:23:55', '2021-02-13 08:23:55'),
(623, 235, 2, '90.0', '0.0', '0.0', '0.0', '0.0', '2021-02-13 08:24:17', '2021-02-13 08:24:17'),
(624, 235, 4, '6.5', '0.0', '0.0', '0.0', '0.0', '2021-02-13 08:24:17', '2021-02-13 08:24:17'),
(625, 236, 2, '90.0', '0.0', '0.0', '0.0', '0.0', '2021-02-13 08:24:24', '2021-02-13 08:24:24'),
(626, 236, 4, '6.5', '0.0', '0.0', '0.0', '0.0', '2021-02-13 08:24:24', '2021-02-13 08:24:24'),
(627, 237, 2, '90.0', '0.0', '0.0', '0.0', '0.0', '2021-02-13 08:24:41', '2021-02-13 08:24:41'),
(628, 237, 4, '6.5', '0.0', '0.0', '0.0', '0.0', '2021-02-13 08:24:41', '2021-02-13 08:24:41'),
(631, 239, 2, '90.0', '0.0', '0.0', '0.0', '0.0', '2021-02-13 08:27:30', '2021-02-13 08:27:30'),
(632, 239, 4, '6.5', '0.0', '0.0', '0.0', '0.0', '2021-02-13 08:27:30', '2021-02-13 08:27:30'),
(641, 240, 2, '70.0', '0.0', '0.0', '0.0', '0.0', '2021-02-15 07:16:48', '2021-02-15 07:16:48'),
(642, 240, 4, '5.5', '0.0', '0.0', '0.0', '0.0', '2021-02-15 07:16:48', '2021-02-15 07:16:48'),
(643, 241, 2, '70.0', '0.0', '0.0', '0.0', '0.0', '2021-02-15 07:22:00', '2021-02-15 07:22:00'),
(644, 241, 4, '5.5', '0.0', '0.0', '0.0', '0.0', '2021-02-15 07:22:00', '2021-02-15 07:22:00'),
(645, 242, 2, '70.0', '0.0', '0.0', '0.0', '0.0', '2021-02-15 07:23:46', '2021-02-15 07:23:46'),
(646, 242, 4, '5.5', '0.0', '0.0', '0.0', '0.0', '2021-02-15 07:23:46', '2021-02-15 07:23:46'),
(647, 243, 2, '70.0', '0.0', '0.0', '0.0', '0.0', '2021-02-15 07:25:30', '2021-02-15 07:25:30'),
(648, 243, 4, '5.5', '0.0', '0.0', '0.0', '0.0', '2021-02-15 07:25:30', '2021-02-15 07:25:30'),
(649, 244, 2, '70.0', '0.0', '0.0', '0.0', '0.0', '2021-02-15 07:26:01', '2021-02-15 07:26:01'),
(650, 244, 4, '5.5', '0.0', '0.0', '0.0', '0.0', '2021-02-15 07:26:01', '2021-02-15 07:26:01'),
(653, 246, 2, '70.0', '0.0', '0.0', '0.0', '0.0', '2021-02-15 07:51:34', '2021-02-15 07:51:34'),
(654, 246, 4, '5.5', '0.0', '0.0', '0.0', '0.0', '2021-02-15 07:51:35', '2021-02-15 07:51:35'),
(655, 247, 2, '70.0', '0.0', '0.0', '0.0', '0.0', '2021-02-15 07:52:39', '2021-02-15 07:52:39'),
(656, 247, 4, '5.5', '0.0', '0.0', '0.0', '0.0', '2021-02-15 07:52:39', '2021-02-15 07:52:39'),
(657, 245, 2, '70.0', '0.0', '0.0', '0.0', '0.0', '2021-02-15 07:53:12', '2021-02-15 07:53:12'),
(658, 245, 4, '5.5', '0.0', '0.0', '0.0', '0.0', '2021-02-15 07:53:12', '2021-02-15 07:53:12'),
(659, 248, 2, '70.0', '0.0', '0.0', '0.0', '0.0', '2021-02-15 07:53:57', '2021-02-15 07:53:57'),
(660, 248, 4, '5.5', '0.0', '0.0', '0.0', '0.0', '2021-02-15 07:53:57', '2021-02-15 07:53:57'),
(661, 249, 2, '70.0', '0.0', '0.0', '0.0', '0.0', '2021-02-15 08:05:19', '2021-02-15 08:05:19'),
(662, 249, 4, '5.5', '0.0', '0.0', '0.0', '0.0', '2021-02-15 08:05:19', '2021-02-15 08:05:19'),
(663, 250, 2, '70.0', '0.0', '0.0', '0.0', '0.0', '2021-02-15 08:05:59', '2021-02-15 08:05:59'),
(664, 250, 4, '5.5', '0.0', '0.0', '0.0', '0.0', '2021-02-15 08:05:59', '2021-02-15 08:05:59'),
(665, 251, 2, '70.0', '0.0', '0.0', '0.0', '0.0', '2021-02-15 08:06:32', '2021-02-15 08:06:32'),
(666, 251, 4, '5.5', '0.0', '0.0', '0.0', '0.0', '2021-02-15 08:06:32', '2021-02-15 08:06:32'),
(667, 252, 2, '70.0', '0.0', '0.0', '0.0', '0.0', '2021-02-15 08:07:42', '2021-02-15 08:07:42'),
(668, 252, 4, '5.5', '0.0', '0.0', '0.0', '0.0', '2021-02-15 08:07:42', '2021-02-15 08:07:42'),
(669, 253, 2, '70.0', '0.0', '0.0', '0.0', '0.0', '2021-02-15 08:08:13', '2021-02-15 08:08:13'),
(670, 253, 4, '5.5', '0.0', '0.0', '0.0', '0.0', '2021-02-15 08:08:13', '2021-02-15 08:08:13'),
(671, 254, 2, '80.0', '0.0', '0.0', '0.0', '0.0', '2021-02-15 09:22:36', '2021-02-15 09:22:36'),
(672, 254, 4, '6.0', '0.0', '0.0', '0.0', '0.0', '2021-02-15 09:22:36', '2021-02-15 09:22:36'),
(673, 255, 2, '80.0', '0.0', '0.0', '0.0', '0.0', '2021-02-15 09:23:41', '2021-02-15 09:23:41'),
(674, 255, 4, '6.0', '0.0', '0.0', '0.0', '0.0', '2021-02-15 09:23:41', '2021-02-15 09:23:41'),
(675, 256, 2, '80.0', '0.0', '0.0', '0.0', '0.0', '2021-02-15 09:33:29', '2021-02-15 09:33:29'),
(676, 256, 4, '6.0', '0.0', '0.0', '0.0', '0.0', '2021-02-15 09:33:29', '2021-02-15 09:33:29'),
(677, 257, 2, '80.0', '0.0', '0.0', '0.0', '0.0', '2021-02-15 09:34:02', '2021-02-15 09:34:02'),
(678, 257, 4, '6.0', '0.0', '0.0', '0.0', '0.0', '2021-02-15 09:34:02', '2021-02-15 09:34:02'),
(679, 258, 2, '80.0', '0.0', '0.0', '0.0', '0.0', '2021-02-15 09:34:58', '2021-02-15 09:34:58'),
(680, 258, 4, '6.0', '0.0', '0.0', '0.0', '0.0', '2021-02-15 09:34:58', '2021-02-15 09:34:58'),
(681, 259, 2, '80.0', '0.0', '0.0', '0.0', '0.0', '2021-02-15 09:36:06', '2021-02-15 09:36:06'),
(682, 259, 4, '6.0', '0.0', '0.0', '0.0', '0.0', '2021-02-15 09:36:06', '2021-02-15 09:36:06'),
(683, 260, 2, '80.0', '0.0', '0.0', '0.0', '0.0', '2021-02-15 09:37:59', '2021-02-15 09:37:59'),
(684, 260, 4, '6.0', '0.0', '0.0', '0.0', '0.0', '2021-02-15 09:37:59', '2021-02-15 09:37:59'),
(685, 261, 2, '80.0', '0.0', '0.0', '0.0', '0.0', '2021-02-15 09:39:00', '2021-02-15 09:39:00'),
(686, 261, 4, '6.0', '0.0', '0.0', '0.0', '0.0', '2021-02-15 09:39:00', '2021-02-15 09:39:00'),
(687, 262, 2, '80.0', '0.0', '0.0', '0.0', '0.0', '2021-02-15 09:39:41', '2021-02-15 09:39:41'),
(688, 262, 4, '6.0', '0.0', '0.0', '0.0', '0.0', '2021-02-15 09:39:41', '2021-02-15 09:39:41'),
(689, 263, 2, '80.0', '0.0', '0.0', '0.0', '0.0', '2021-02-15 09:40:08', '2021-02-15 09:40:08'),
(690, 263, 4, '6.0', '0.0', '0.0', '0.0', '0.0', '2021-02-15 09:40:08', '2021-02-15 09:40:08'),
(705, 268, 2, '70.0', '0.0', '0.0', '0.0', '0.0', '2021-02-15 11:49:52', '2021-02-15 11:49:52'),
(706, 268, 4, '5.5', '0.0', '0.0', '0.0', '0.0', '2021-02-15 11:49:52', '2021-02-15 11:49:52'),
(707, 264, 2, '70.0', '0.0', '0.0', '0.0', '0.0', '2021-02-15 11:50:59', '2021-02-15 11:50:59'),
(708, 264, 4, '5.5', '0.0', '0.0', '0.0', '0.0', '2021-02-15 11:50:59', '2021-02-15 11:50:59'),
(709, 265, 2, '70.0', '0.0', '0.0', '0.0', '0.0', '2021-02-15 11:51:11', '2021-02-15 11:51:11'),
(710, 265, 4, '5.5', '0.0', '0.0', '0.0', '0.0', '2021-02-15 11:51:11', '2021-02-15 11:51:11'),
(711, 266, 2, '70.0', '0.0', '0.0', '0.0', '0.0', '2021-02-15 11:51:22', '2021-02-15 11:51:22'),
(712, 266, 4, '5.5', '0.0', '0.0', '0.0', '0.0', '2021-02-15 11:51:22', '2021-02-15 11:51:22'),
(713, 267, 2, '70.0', '0.0', '0.0', '0.0', '0.0', '2021-02-15 11:51:35', '2021-02-15 11:51:35'),
(714, 267, 4, '5.5', '0.0', '0.0', '0.0', '0.0', '2021-02-15 11:51:35', '2021-02-15 11:51:35'),
(715, 269, 2, '70.0', '0.0', '0.0', '0.0', '0.0', '2021-02-15 11:52:42', '2021-02-15 11:52:42'),
(716, 269, 4, '5.5', '0.0', '0.0', '0.0', '0.0', '2021-02-15 11:52:42', '2021-02-15 11:52:42'),
(717, 270, 2, '80.0', '0.0', '0.0', '0.0', '0.0', '2021-02-17 07:00:03', '2021-02-17 07:00:03'),
(718, 270, 4, '6.5', '0.0', '0.0', '0.0', '0.0', '2021-02-17 07:00:03', '2021-02-17 07:00:03'),
(721, 271, 2, '80.0', '0.0', '0.0', '0.0', '0.0', '2021-02-17 07:39:55', '2021-02-17 07:39:55'),
(722, 271, 4, '6.5', '0.0', '0.0', '0.0', '0.0', '2021-02-17 07:39:55', '2021-02-17 07:39:55'),
(723, 272, 2, '80.0', '0.0', '0.0', '0.0', '0.0', '2021-02-17 07:40:41', '2021-02-17 07:40:41'),
(724, 272, 4, '6.5', '0.0', '0.0', '0.0', '0.0', '2021-02-17 07:40:41', '2021-02-17 07:40:41'),
(725, 273, 2, '80.0', '0.0', '0.0', '0.0', '0.0', '2021-02-17 07:42:03', '2021-02-17 07:42:03'),
(726, 273, 4, '6.5', '0.0', '0.0', '0.0', '0.0', '2021-02-17 07:42:03', '2021-02-17 07:42:03'),
(727, 274, 2, '80.0', '0.0', '0.0', '0.0', '0.0', '2021-02-17 07:42:54', '2021-02-17 07:42:54'),
(728, 274, 4, '6.5', '0.0', '0.0', '0.0', '0.0', '2021-02-17 07:42:54', '2021-02-17 07:42:54'),
(729, 275, 2, '80.0', '0.0', '0.0', '0.0', '0.0', '2021-02-17 07:45:07', '2021-02-17 07:45:07'),
(730, 275, 4, '6.5', '0.0', '0.0', '0.0', '0.0', '2021-02-17 07:45:07', '2021-02-17 07:45:07'),
(731, 276, 2, '80.0', '0.0', '0.0', '0.0', '0.0', '2021-02-17 07:47:03', '2021-02-17 07:47:03'),
(732, 276, 4, '6.5', '0.0', '0.0', '0.0', '0.0', '2021-02-17 07:47:03', '2021-02-17 07:47:03'),
(733, 277, 2, '80.0', '0.0', '0.0', '0.0', '0.0', '2021-02-17 08:33:51', '2021-02-17 08:33:51'),
(734, 277, 4, '6.5', '0.0', '0.0', '0.0', '0.0', '2021-02-17 08:33:51', '2021-02-17 08:33:51'),
(735, 278, 2, '80.0', '0.0', '0.0', '0.0', '0.0', '2021-02-17 08:34:51', '2021-02-17 08:34:51'),
(736, 278, 4, '6.5', '0.0', '0.0', '0.0', '0.0', '2021-02-17 08:34:51', '2021-02-17 08:34:51'),
(737, 279, 2, '80.0', '0.0', '0.0', '0.0', '0.0', '2021-02-17 08:35:38', '2021-02-17 08:35:38'),
(738, 279, 4, '6.5', '0.0', '0.0', '0.0', '0.0', '2021-02-17 08:35:38', '2021-02-17 08:35:38'),
(739, 280, 2, '80.0', '0.0', '0.0', '0.0', '0.0', '2021-02-17 11:38:39', '2021-02-17 11:38:39'),
(740, 280, 4, '6.5', '0.0', '0.0', '0.0', '0.0', '2021-02-17 11:38:39', '2021-02-17 11:38:39'),
(741, 281, 2, '80.0', '0.0', '0.0', '0.0', '0.0', '2021-02-17 11:39:29', '2021-02-17 11:39:29'),
(742, 281, 4, '6.5', '0.0', '0.0', '0.0', '0.0', '2021-02-17 11:39:30', '2021-02-17 11:39:30'),
(751, 282, 2, '50.0', '0.0', '0.0', '0.0', '0.0', '2021-02-25 12:13:29', '2021-02-25 12:13:29'),
(752, 282, 4, '5.5', '0.0', '0.0', '0.0', '0.0', '2021-02-25 12:13:29', '2021-02-25 12:13:29'),
(753, 283, 2, '50.0', '0.0', '0.0', '0.0', '0.0', '2021-02-25 12:13:51', '2021-02-25 12:13:51'),
(754, 283, 4, '5.5', '0.0', '0.0', '0.0', '0.0', '2021-02-25 12:13:51', '2021-02-25 12:13:51'),
(755, 284, 2, '50.0', '0.0', '0.0', '0.0', '0.0', '2021-02-25 13:13:30', '2021-02-25 13:13:30'),
(756, 284, 4, '5.5', '0.0', '0.0', '0.0', '0.0', '2021-02-25 13:13:30', '2021-02-25 13:13:30');

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `institution_program_exam_requirement_details`
--

CREATE TABLE `institution_program_exam_requirement_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `requirement_id` bigint(20) UNSIGNED DEFAULT NULL,
  `subsection_id` bigint(20) UNSIGNED DEFAULT NULL,
  `score` double(8,1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `institution_program_exam_requirement_details`
--

INSERT INTO `institution_program_exam_requirement_details` (`id`, `requirement_id`, `subsection_id`, `score`, `created_at`, `updated_at`, `deleted_at`) VALUES
(10, 187, 3, 60.0, '2020-08-07 13:08:27', '2020-08-07 13:08:27', NULL),
(11, 187, 4, 60.0, '2020-08-07 13:08:27', '2020-08-07 13:08:27', NULL),
(12, 188, 9, 40.0, '2020-08-07 13:08:27', '2020-08-07 13:08:27', NULL),
(13, 191, 3, 40.0, '2020-08-08 09:18:07', '2020-08-08 09:18:07', NULL),
(14, 191, 4, 80.0, '2020-08-08 09:18:07', '2020-08-08 09:18:07', NULL),
(15, 192, 9, 40.0, '2020-08-08 09:18:07', '2020-08-08 09:18:07', NULL),
(16, 193, 3, 60.0, '2020-08-08 09:24:57', '2020-08-08 09:24:57', NULL),
(17, 193, 4, 20.0, '2020-08-08 09:24:57', '2020-08-08 09:24:57', NULL),
(18, 194, 3, 60.0, '2020-08-08 09:28:09', '2020-08-08 09:28:09', NULL),
(19, 194, 4, 20.0, '2020-08-08 09:28:09', '2020-08-08 09:28:09', NULL),
(20, 195, 9, 130.0, '2020-08-08 09:28:09', '2020-08-08 09:28:09', NULL),
(21, 196, 3, NULL, '2020-08-08 17:27:03', '2020-08-08 17:27:03', NULL),
(22, 196, 4, NULL, '2020-08-08 17:27:03', '2020-08-08 17:27:03', NULL),
(23, 196, 10, NULL, '2020-08-08 17:27:03', '2020-08-08 17:27:03', NULL),
(24, 196, 11, NULL, '2020-08-08 17:27:03', '2020-08-08 17:27:03', NULL),
(25, 197, 3, 60.0, '2020-08-10 07:58:50', '2020-08-10 07:58:50', NULL),
(26, 197, 4, 20.0, '2020-08-10 07:58:50', '2020-08-10 07:58:50', NULL),
(27, 197, 10, NULL, '2020-08-10 07:58:50', '2020-08-10 07:58:50', NULL),
(28, 197, 11, NULL, '2020-08-10 07:58:50', '2020-08-10 07:58:50', NULL),
(29, 198, 9, 130.0, '2020-08-10 07:58:50', '2020-08-10 07:58:50', NULL),
(30, 198, 12, NULL, '2020-08-10 07:58:50', '2020-08-10 07:58:50', NULL),
(31, 198, 13, NULL, '2020-08-10 07:58:50', '2020-08-10 07:58:50', NULL),
(32, 198, 14, NULL, '2020-08-10 07:58:50', '2020-08-10 07:58:50', NULL),
(33, 199, 3, 60.0, '2020-08-10 08:14:11', '2020-08-10 08:14:11', NULL),
(34, 199, 4, 20.0, '2020-08-10 08:14:11', '2020-08-10 08:14:11', NULL),
(35, 199, 10, 20.0, '2020-08-10 08:14:11', '2020-08-10 08:14:11', NULL),
(36, 199, 11, 20.0, '2020-08-10 08:14:11', '2020-08-10 08:14:11', NULL),
(37, 200, 9, 100.0, '2020-08-10 08:14:11', '2020-08-10 08:14:11', NULL),
(38, 200, 12, 10.0, '2020-08-10 08:14:11', '2020-08-10 08:14:11', NULL),
(39, 200, 13, 10.0, '2020-08-10 08:14:11', '2020-08-10 08:14:11', NULL),
(40, 200, 14, 10.0, '2020-08-10 08:14:11', '2020-08-10 08:14:11', NULL),
(41, 201, 3, 60.0, '2020-08-10 08:14:48', '2020-08-10 08:14:48', NULL),
(42, 201, 4, 20.0, '2020-08-10 08:14:48', '2020-08-10 08:14:48', NULL),
(43, 201, 10, 20.0, '2020-08-10 08:14:48', '2020-08-10 08:14:48', NULL),
(44, 201, 11, 20.0, '2020-08-10 08:14:48', '2020-08-10 08:14:48', NULL),
(45, 202, 9, 100.0, '2020-08-10 08:14:48', '2020-08-10 08:14:48', NULL),
(46, 202, 12, 10.0, '2020-08-10 08:14:48', '2020-08-10 08:14:48', NULL),
(47, 202, 13, 10.0, '2020-08-10 08:14:48', '2020-08-10 08:14:48', NULL),
(48, 202, 14, 10.0, '2020-08-10 08:14:48', '2020-08-10 08:14:48', NULL),
(49, 203, 3, 20.0, '2020-08-10 17:17:21', '2020-08-10 17:17:21', NULL),
(50, 203, 4, 20.0, '2020-08-10 17:17:21', '2020-08-10 17:17:21', NULL),
(51, 203, 10, 20.0, '2020-08-10 17:17:21', '2020-08-10 17:17:21', NULL),
(52, 203, 11, 20.0, '2020-08-10 17:17:21', '2020-08-10 17:17:21', NULL),
(53, 204, 9, 6.5, '2020-08-10 17:17:21', '2020-08-10 17:17:21', NULL),
(54, 204, 12, 6.5, '2020-08-10 17:17:21', '2020-08-10 17:17:21', NULL),
(55, 204, 13, 6.5, '2020-08-10 17:17:21', '2020-08-10 17:17:21', NULL),
(56, 204, 14, 6.5, '2020-08-10 17:17:21', '2020-08-10 17:17:21', NULL),
(57, 205, 9, 5.0, '2020-08-10 17:32:22', '2020-08-10 17:32:22', NULL),
(58, 205, 12, 5.0, '2020-08-10 17:32:22', '2020-08-10 17:32:22', NULL),
(59, 205, 13, 5.0, '2020-08-10 17:32:22', '2020-08-10 17:32:22', NULL),
(60, 205, 14, 5.0, '2020-08-10 17:32:22', '2020-08-10 17:32:22', NULL),
(61, 206, 9, NULL, '2020-08-10 17:33:09', '2020-08-10 17:33:09', NULL),
(62, 206, 12, NULL, '2020-08-10 17:33:09', '2020-08-10 17:33:09', NULL),
(63, 206, 13, NULL, '2020-08-10 17:33:09', '2020-08-10 17:33:09', NULL),
(64, 206, 14, NULL, '2020-08-10 17:33:09', '2020-08-10 17:33:09', NULL),
(65, 207, 3, 20.0, '2020-08-10 17:37:32', '2020-08-10 17:37:32', NULL),
(66, 207, 4, 20.0, '2020-08-10 17:37:32', '2020-08-10 17:37:32', NULL),
(67, 207, 10, 20.0, '2020-08-10 17:37:32', '2020-08-10 17:37:32', NULL),
(68, 207, 11, 20.0, '2020-08-10 17:37:32', '2020-08-10 17:37:32', NULL),
(69, 208, 9, 6.0, '2020-08-10 17:37:32', '2020-08-10 17:37:32', NULL),
(70, 208, 12, 6.0, '2020-08-10 17:37:32', '2020-08-10 17:37:32', NULL),
(71, 208, 13, 6.0, '2020-08-10 17:37:32', '2020-08-10 17:37:32', NULL),
(72, 208, 14, 6.0, '2020-08-10 17:37:32', '2020-08-10 17:37:32', NULL),
(73, 209, 3, 20.0, '2020-08-10 17:38:40', '2020-08-10 17:38:40', NULL),
(74, 209, 4, 20.0, '2020-08-10 17:38:40', '2020-08-10 17:38:40', NULL),
(75, 209, 10, 20.0, '2020-08-10 17:38:40', '2020-08-10 17:38:40', NULL),
(76, 209, 11, 20.0, '2020-08-10 17:38:40', '2020-08-10 17:38:40', NULL),
(77, 210, 9, 6.0, '2020-08-10 17:38:40', '2020-08-10 17:38:40', NULL),
(78, 210, 12, 6.0, '2020-08-10 17:38:40', '2020-08-10 17:38:40', NULL),
(79, 210, 13, 6.0, '2020-08-10 17:38:40', '2020-08-10 17:38:40', NULL),
(80, 210, 14, 6.0, '2020-08-10 17:38:40', '2020-08-10 17:38:40', NULL),
(81, 211, 3, 20.0, '2020-08-10 17:47:16', '2020-08-10 17:47:16', NULL),
(82, 211, 4, 20.0, '2020-08-10 17:47:16', '2020-08-10 17:47:16', NULL),
(83, 211, 10, 20.0, '2020-08-10 17:47:16', '2020-08-10 17:47:16', NULL),
(84, 211, 11, 20.0, '2020-08-10 17:47:16', '2020-08-10 17:47:16', NULL),
(85, 212, 9, 5.0, '2020-08-10 17:47:16', '2020-08-10 17:47:16', NULL),
(86, 212, 12, 5.0, '2020-08-10 17:47:16', '2020-08-10 17:47:16', NULL),
(87, 212, 13, 5.0, '2020-08-10 17:47:16', '2020-08-10 17:47:16', NULL),
(88, 212, 14, 5.0, '2020-08-10 17:47:16', '2020-08-10 17:47:16', NULL),
(89, 213, 3, 20.0, '2020-08-10 17:48:16', '2020-08-10 17:48:16', NULL),
(90, 213, 4, 20.0, '2020-08-10 17:48:16', '2020-08-10 17:48:16', NULL),
(91, 213, 10, 20.0, '2020-08-10 17:48:16', '2020-08-10 17:48:16', NULL),
(92, 213, 11, 20.0, '2020-08-10 17:48:16', '2020-08-10 17:48:16', NULL),
(93, 214, 9, 5.0, '2020-08-10 17:48:16', '2020-08-10 17:48:16', NULL),
(94, 214, 12, 5.0, '2020-08-10 17:48:16', '2020-08-10 17:48:16', NULL),
(95, 214, 13, 5.0, '2020-08-10 17:48:16', '2020-08-10 17:48:16', NULL),
(96, 214, 14, 5.0, '2020-08-10 17:48:16', '2020-08-10 17:48:16', NULL),
(97, 215, 9, 5.0, '2020-08-10 17:48:47', '2020-08-10 17:48:47', NULL),
(98, 215, 12, 5.0, '2020-08-10 17:48:47', '2020-08-10 17:48:47', NULL),
(99, 215, 13, 5.0, '2020-08-10 17:48:47', '2020-08-10 17:48:47', NULL),
(100, 215, 14, 5.0, '2020-08-10 17:48:47', '2020-08-10 17:48:47', NULL),
(101, 216, 3, 20.0, '2020-08-10 17:56:51', '2020-08-10 17:56:51', NULL),
(102, 216, 4, 20.0, '2020-08-10 17:56:51', '2020-08-10 17:56:51', NULL),
(103, 216, 10, 20.0, '2020-08-10 17:56:51', '2020-08-10 17:56:51', NULL),
(104, 216, 11, 20.0, '2020-08-10 17:56:51', '2020-08-10 17:56:51', NULL),
(105, 217, 9, 5.0, '2020-08-10 17:56:51', '2020-08-10 17:56:51', NULL),
(106, 217, 12, 5.0, '2020-08-10 17:56:51', '2020-08-10 17:56:51', NULL),
(107, 217, 13, 5.0, '2020-08-10 17:56:51', '2020-08-10 17:56:51', NULL),
(108, 217, 14, 5.0, '2020-08-10 17:56:51', '2020-08-10 17:56:51', NULL),
(109, 222, 3, 20.0, '2020-08-10 18:14:33', '2020-08-10 18:14:33', NULL),
(110, 222, 4, 20.0, '2020-08-10 18:14:33', '2020-08-10 18:14:33', NULL),
(111, 222, 10, 20.0, '2020-08-10 18:14:33', '2020-08-10 18:14:33', NULL),
(112, 222, 11, 20.0, '2020-08-10 18:14:33', '2020-08-10 18:14:33', NULL),
(113, 223, 9, 6.0, '2020-08-10 18:14:33', '2020-08-10 18:14:33', NULL),
(114, 223, 12, 6.0, '2020-08-10 18:14:33', '2020-08-10 18:14:33', NULL),
(115, 223, 13, 6.0, '2020-08-10 18:14:33', '2020-08-10 18:14:33', NULL),
(116, 223, 14, 6.0, '2020-08-10 18:14:33', '2020-08-10 18:14:33', NULL),
(117, 224, 3, 20.0, '2020-08-10 18:21:02', '2020-08-10 18:21:02', NULL),
(118, 224, 4, 20.0, '2020-08-10 18:21:02', '2020-08-10 18:21:02', NULL),
(119, 224, 10, 20.0, '2020-08-10 18:21:02', '2020-08-10 18:21:02', NULL),
(120, 224, 11, 20.0, '2020-08-10 18:21:02', '2020-08-10 18:21:02', NULL),
(121, 225, 9, 5.0, '2020-08-10 18:21:02', '2020-08-10 18:21:02', NULL),
(122, 225, 12, 5.0, '2020-08-10 18:21:02', '2020-08-10 18:21:02', NULL),
(123, 225, 13, 5.0, '2020-08-10 18:21:02', '2020-08-10 18:21:02', NULL),
(124, 225, 14, 5.0, '2020-08-10 18:21:02', '2020-08-10 18:21:02', NULL),
(125, 226, 3, 20.0, '2020-08-10 18:47:33', '2020-08-10 18:47:33', NULL),
(126, 226, 4, 20.0, '2020-08-10 18:47:33', '2020-08-10 18:47:33', NULL),
(127, 226, 10, 20.0, '2020-08-10 18:47:33', '2020-08-10 18:47:33', NULL),
(128, 226, 11, 20.0, '2020-08-10 18:47:33', '2020-08-10 18:47:33', NULL),
(129, 227, 9, 5.0, '2020-08-10 18:47:33', '2020-08-10 18:47:33', NULL),
(130, 227, 12, 5.0, '2020-08-10 18:47:33', '2020-08-10 18:47:33', NULL),
(131, 227, 13, 5.0, '2020-08-10 18:47:33', '2020-08-10 18:47:33', NULL),
(132, 227, 14, 5.0, '2020-08-10 18:47:33', '2020-08-10 18:47:33', NULL),
(133, 228, 3, 20.0, '2020-08-10 18:47:53', '2020-08-10 18:47:53', NULL),
(134, 228, 4, 20.0, '2020-08-10 18:47:53', '2020-08-10 18:47:53', NULL),
(135, 228, 10, 20.0, '2020-08-10 18:47:53', '2020-08-10 18:47:53', NULL),
(136, 228, 11, 20.0, '2020-08-10 18:47:53', '2020-08-10 18:47:53', NULL),
(137, 229, 9, 5.0, '2020-08-10 18:47:54', '2020-08-10 18:47:54', NULL),
(138, 229, 12, 5.0, '2020-08-10 18:47:54', '2020-08-10 18:47:54', NULL),
(139, 229, 13, 5.0, '2020-08-10 18:47:54', '2020-08-10 18:47:54', NULL),
(140, 229, 14, 5.0, '2020-08-10 18:47:54', '2020-08-10 18:47:54', NULL),
(141, 231, 9, NULL, '2020-08-10 18:57:45', '2020-08-10 18:57:45', NULL),
(142, 231, 12, NULL, '2020-08-10 18:57:45', '2020-08-10 18:57:45', NULL),
(143, 231, 13, NULL, '2020-08-10 18:57:45', '2020-08-10 18:57:45', NULL),
(144, 231, 14, NULL, '2020-08-10 18:57:45', '2020-08-10 18:57:45', NULL),
(145, 233, 9, 2.0, '2020-08-11 08:11:11', '2020-08-11 08:11:11', NULL),
(146, 233, 12, 2.0, '2020-08-11 08:11:11', '2020-08-11 08:11:11', NULL),
(147, 233, 13, 1.0, '2020-08-11 08:11:11', '2020-08-11 08:11:11', NULL),
(148, 233, 14, 1.0, '2020-08-11 08:11:11', '2020-08-11 08:11:11', NULL),
(149, 234, 3, 20.0, '2020-08-11 09:09:02', '2020-08-11 09:09:02', NULL),
(150, 234, 4, 20.0, '2020-08-11 09:09:02', '2020-08-11 09:09:02', NULL),
(151, 234, 10, 20.0, '2020-08-11 09:09:02', '2020-08-11 09:09:02', NULL),
(152, 234, 11, 20.0, '2020-08-11 09:09:02', '2020-08-11 09:09:02', NULL),
(153, 235, 9, 5.0, '2020-08-11 09:09:02', '2020-08-11 09:09:02', NULL),
(154, 235, 12, 5.0, '2020-08-11 09:09:02', '2020-08-11 09:09:02', NULL),
(155, 235, 13, 5.0, '2020-08-11 09:09:02', '2020-08-11 09:09:02', NULL),
(156, 235, 14, 5.0, '2020-08-11 09:09:02', '2020-08-11 09:09:02', NULL),
(157, 236, 3, 20.0, '2020-08-11 09:22:21', '2020-08-11 09:22:21', NULL),
(158, 236, 4, 20.0, '2020-08-11 09:22:21', '2020-08-11 09:22:21', NULL),
(159, 236, 10, 20.0, '2020-08-11 09:22:21', '2020-08-11 09:22:21', NULL),
(160, 236, 11, 20.0, '2020-08-11 09:22:21', '2020-08-11 09:22:21', NULL),
(161, 237, 9, 5.0, '2020-08-11 09:22:21', '2020-08-11 09:22:21', NULL),
(162, 237, 12, 5.0, '2020-08-11 09:22:21', '2020-08-11 09:22:21', NULL),
(163, 237, 13, 5.0, '2020-08-11 09:22:21', '2020-08-11 09:22:21', NULL),
(164, 237, 14, 5.0, '2020-08-11 09:22:21', '2020-08-11 09:22:21', NULL),
(165, 238, 3, 20.0, '2020-08-11 09:23:03', '2020-08-11 09:23:03', NULL),
(166, 238, 4, 20.0, '2020-08-11 09:23:03', '2020-08-11 09:23:03', NULL),
(167, 238, 10, 20.0, '2020-08-11 09:23:03', '2020-08-11 09:23:03', NULL),
(168, 238, 11, 20.0, '2020-08-11 09:23:03', '2020-08-11 09:23:03', NULL),
(169, 239, 9, 5.0, '2020-08-11 09:23:03', '2020-08-11 09:23:03', NULL),
(170, 239, 12, 5.0, '2020-08-11 09:23:03', '2020-08-11 09:23:03', NULL),
(171, 239, 13, 5.0, '2020-08-11 09:23:03', '2020-08-11 09:23:03', NULL),
(172, 239, 14, 5.0, '2020-08-11 09:23:03', '2020-08-11 09:23:03', NULL),
(173, 240, 3, 20.0, '2020-08-11 10:37:01', '2020-08-11 10:37:01', NULL),
(174, 240, 4, 20.0, '2020-08-11 10:37:01', '2020-08-11 10:37:01', NULL),
(175, 240, 10, 20.0, '2020-08-11 10:37:01', '2020-08-11 10:37:01', NULL),
(176, 240, 11, 20.0, '2020-08-11 10:37:01', '2020-08-11 10:37:01', NULL),
(177, 241, 9, 5.0, '2020-08-11 10:37:01', '2020-08-11 10:37:01', NULL),
(178, 241, 12, 5.0, '2020-08-11 10:37:01', '2020-08-11 10:37:01', NULL),
(179, 241, 13, 5.0, '2020-08-11 10:37:01', '2020-08-11 10:37:01', NULL),
(180, 241, 14, 5.0, '2020-08-11 10:37:01', '2020-08-11 10:37:01', NULL),
(181, 242, 3, 20.0, '2020-08-11 10:38:25', '2020-08-11 10:38:25', NULL),
(182, 242, 4, 20.0, '2020-08-11 10:38:25', '2020-08-11 10:38:25', NULL),
(183, 242, 10, 20.0, '2020-08-11 10:38:25', '2020-08-11 10:38:25', NULL),
(184, 242, 11, 20.0, '2020-08-11 10:38:25', '2020-08-11 10:38:25', NULL),
(185, 243, 9, 5.0, '2020-08-11 10:38:25', '2020-08-11 10:38:25', NULL),
(186, 243, 12, 5.0, '2020-08-11 10:38:25', '2020-08-11 10:38:25', NULL),
(187, 243, 13, 5.0, '2020-08-11 10:38:25', '2020-08-11 10:38:25', NULL),
(188, 243, 14, 5.0, '2020-08-11 10:38:25', '2020-08-11 10:38:25', NULL),
(189, 244, 3, 20.0, '2020-08-11 11:35:51', '2020-08-11 11:35:51', NULL),
(190, 244, 4, 20.0, '2020-08-11 11:35:51', '2020-08-11 11:35:51', NULL),
(191, 244, 10, 20.0, '2020-08-11 11:35:51', '2020-08-11 11:35:51', NULL),
(192, 244, 11, 20.0, '2020-08-11 11:35:51', '2020-08-11 11:35:51', NULL),
(193, 245, 9, 2.0, '2020-08-11 11:35:51', '2020-08-11 11:35:51', NULL),
(194, 245, 12, 2.0, '2020-08-11 11:35:51', '2020-08-11 11:35:51', NULL),
(195, 245, 13, 1.0, '2020-08-11 11:35:51', '2020-08-11 11:35:51', NULL),
(196, 245, 14, 1.0, '2020-08-11 11:35:51', '2020-08-11 11:35:51', NULL),
(197, 246, 3, 20.0, '2020-08-11 11:36:41', '2020-08-11 11:36:41', NULL),
(198, 246, 4, 20.0, '2020-08-11 11:36:41', '2020-08-11 11:36:41', NULL),
(199, 246, 10, 20.0, '2020-08-11 11:36:41', '2020-08-11 11:36:41', NULL),
(200, 246, 11, 20.0, '2020-08-11 11:36:41', '2020-08-11 11:36:41', NULL),
(201, 247, 9, 2.0, '2020-08-11 11:36:41', '2020-08-11 11:36:41', NULL),
(202, 247, 12, 2.0, '2020-08-11 11:36:41', '2020-08-11 11:36:41', NULL),
(203, 247, 13, 1.0, '2020-08-11 11:36:41', '2020-08-11 11:36:41', NULL),
(204, 247, 14, 1.0, '2020-08-11 11:36:41', '2020-08-11 11:36:41', NULL),
(205, 248, 3, 20.0, '2020-08-11 11:37:38', '2020-08-11 11:37:38', NULL),
(206, 248, 4, 20.0, '2020-08-11 11:37:38', '2020-08-11 11:37:38', NULL),
(207, 248, 10, 20.0, '2020-08-11 11:37:38', '2020-08-11 11:37:38', NULL),
(208, 248, 11, 20.0, '2020-08-11 11:37:38', '2020-08-11 11:37:38', NULL),
(209, 249, 9, 2.0, '2020-08-11 11:37:38', '2020-08-11 11:37:38', NULL),
(210, 249, 12, 2.0, '2020-08-11 11:37:38', '2020-08-11 11:37:38', NULL),
(211, 249, 13, 1.0, '2020-08-11 11:37:38', '2020-08-11 11:37:38', NULL),
(212, 249, 14, 1.0, '2020-08-11 11:37:38', '2020-08-11 11:37:38', NULL),
(213, 250, 3, 20.0, '2020-08-11 11:39:40', '2020-08-11 11:39:40', NULL),
(214, 250, 4, 20.0, '2020-08-11 11:39:40', '2020-08-11 11:39:40', NULL),
(215, 250, 10, 20.0, '2020-08-11 11:39:40', '2020-08-11 11:39:40', NULL),
(216, 250, 11, 20.0, '2020-08-11 11:39:40', '2020-08-11 11:39:40', NULL),
(217, 251, 9, 6.0, '2020-08-11 11:39:40', '2020-08-11 11:39:40', NULL),
(218, 251, 12, 6.0, '2020-08-11 11:39:40', '2020-08-11 11:39:40', NULL),
(219, 251, 13, 6.0, '2020-08-11 11:39:40', '2020-08-11 11:39:40', NULL),
(220, 251, 14, 6.0, '2020-08-11 11:39:40', '2020-08-11 11:39:40', NULL),
(221, 252, 3, 20.0, '2020-08-11 11:40:07', '2020-08-11 11:40:07', NULL),
(222, 252, 4, 20.0, '2020-08-11 11:40:07', '2020-08-11 11:40:07', NULL),
(223, 252, 10, 20.0, '2020-08-11 11:40:07', '2020-08-11 11:40:07', NULL),
(224, 252, 11, 20.0, '2020-08-11 11:40:07', '2020-08-11 11:40:07', NULL),
(225, 253, 9, 6.0, '2020-08-11 11:40:07', '2020-08-11 11:40:07', NULL),
(226, 253, 12, 6.0, '2020-08-11 11:40:07', '2020-08-11 11:40:07', NULL),
(227, 253, 13, 6.0, '2020-08-11 11:40:07', '2020-08-11 11:40:07', NULL),
(228, 253, 14, 6.0, '2020-08-11 11:40:07', '2020-08-11 11:40:07', NULL),
(229, 254, 3, 20.0, '2020-08-11 11:42:59', '2020-08-11 11:42:59', NULL),
(230, 254, 4, 20.0, '2020-08-11 11:42:59', '2020-08-11 11:42:59', NULL),
(231, 254, 10, 20.0, '2020-08-11 11:42:59', '2020-08-11 11:42:59', NULL),
(232, 254, 11, 20.0, '2020-08-11 11:42:59', '2020-08-11 11:42:59', NULL),
(233, 255, 9, 6.0, '2020-08-11 11:42:59', '2020-08-11 11:42:59', NULL),
(234, 255, 12, 6.0, '2020-08-11 11:42:59', '2020-08-11 11:42:59', NULL),
(235, 255, 13, 6.0, '2020-08-11 11:42:59', '2020-08-11 11:42:59', NULL),
(236, 255, 14, 6.0, '2020-08-11 11:42:59', '2020-08-11 11:42:59', NULL),
(237, 256, 7, 600.0, '2020-08-11 11:42:59', '2020-08-11 11:42:59', NULL),
(238, 256, 8, 600.0, '2020-08-11 11:42:59', '2020-08-11 11:42:59', NULL),
(239, 256, 15, NULL, '2020-08-11 11:42:59', '2020-08-11 11:42:59', NULL),
(240, 257, 3, 20.0, '2020-08-11 12:41:11', '2020-08-11 12:41:11', NULL),
(241, 257, 4, 20.0, '2020-08-11 12:41:11', '2020-08-11 12:41:11', NULL),
(242, 257, 10, 20.0, '2020-08-11 12:41:11', '2020-08-11 12:41:11', NULL),
(243, 257, 11, 20.0, '2020-08-11 12:41:11', '2020-08-11 12:41:11', NULL),
(244, 258, 9, 5.0, '2020-08-11 12:41:11', '2020-08-11 12:41:11', NULL),
(245, 258, 12, 5.0, '2020-08-11 12:41:11', '2020-08-11 12:41:11', NULL),
(246, 258, 13, 5.0, '2020-08-11 12:41:11', '2020-08-11 12:41:11', NULL),
(247, 258, 14, 5.0, '2020-08-11 12:41:11', '2020-08-11 12:41:11', NULL),
(248, 259, 3, 20.0, '2020-08-11 14:07:53', '2020-08-11 14:07:53', NULL),
(249, 259, 4, 20.0, '2020-08-11 14:07:53', '2020-08-11 14:07:53', NULL),
(250, 259, 10, 20.0, '2020-08-11 14:07:53', '2020-08-11 14:07:53', NULL),
(251, 259, 11, 20.0, '2020-08-11 14:07:53', '2020-08-11 14:07:53', NULL),
(252, 260, 9, 5.0, '2020-08-11 14:07:53', '2020-08-11 14:07:53', NULL),
(253, 260, 12, 5.0, '2020-08-11 14:07:53', '2020-08-11 14:07:53', NULL),
(254, 260, 13, 5.0, '2020-08-11 14:07:54', '2020-08-11 14:07:54', NULL),
(255, 260, 14, 5.0, '2020-08-11 14:07:54', '2020-08-11 14:07:54', NULL),
(256, 261, 3, 20.0, '2020-08-11 14:22:09', '2020-08-11 14:22:09', NULL),
(257, 261, 4, 20.0, '2020-08-11 14:22:09', '2020-08-11 14:22:09', NULL),
(258, 261, 10, 20.0, '2020-08-11 14:22:09', '2020-08-11 14:22:09', NULL),
(259, 261, 11, 20.0, '2020-08-11 14:22:09', '2020-08-11 14:22:09', NULL),
(260, 262, 9, 5.0, '2020-08-11 14:22:09', '2020-08-11 14:22:09', NULL),
(261, 262, 12, 5.0, '2020-08-11 14:22:09', '2020-08-11 14:22:09', NULL),
(262, 262, 13, 5.0, '2020-08-11 14:22:09', '2020-08-11 14:22:09', NULL),
(263, 262, 14, 5.0, '2020-08-11 14:22:09', '2020-08-11 14:22:09', NULL),
(264, 263, 3, 20.0, '2020-08-11 14:22:30', '2020-08-11 14:22:30', NULL),
(265, 263, 4, 20.0, '2020-08-11 14:22:30', '2020-08-11 14:22:30', NULL),
(266, 263, 10, 20.0, '2020-08-11 14:22:30', '2020-08-11 14:22:30', NULL),
(267, 263, 11, 20.0, '2020-08-11 14:22:30', '2020-08-11 14:22:30', NULL),
(268, 264, 9, 5.0, '2020-08-11 14:22:30', '2020-08-11 14:22:30', NULL),
(269, 264, 12, 5.0, '2020-08-11 14:22:30', '2020-08-11 14:22:30', NULL),
(270, 264, 13, 5.0, '2020-08-11 14:22:30', '2020-08-11 14:22:30', NULL),
(271, 264, 14, 5.0, '2020-08-11 14:22:30', '2020-08-11 14:22:30', NULL),
(272, 265, 3, 20.0, '2020-08-11 14:23:16', '2020-08-11 14:23:16', NULL),
(273, 265, 4, 20.0, '2020-08-11 14:23:16', '2020-08-11 14:23:16', NULL),
(274, 265, 10, 20.0, '2020-08-11 14:23:16', '2020-08-11 14:23:16', NULL),
(275, 265, 11, 20.0, '2020-08-11 14:23:16', '2020-08-11 14:23:16', NULL),
(276, 266, 9, 6.0, '2020-08-11 14:23:17', '2020-08-11 14:23:17', NULL),
(277, 266, 12, 6.0, '2020-08-11 14:23:17', '2020-08-11 14:23:17', NULL),
(278, 266, 13, 6.0, '2020-08-11 14:23:17', '2020-08-11 14:23:17', NULL),
(279, 266, 14, 6.0, '2020-08-11 14:23:17', '2020-08-11 14:23:17', NULL),
(280, 267, 3, 20.0, '2020-08-11 14:23:37', '2020-08-11 14:23:37', NULL),
(281, 267, 4, 20.0, '2020-08-11 14:23:37', '2020-08-11 14:23:37', NULL),
(282, 267, 10, 20.0, '2020-08-11 14:23:37', '2020-08-11 14:23:37', NULL),
(283, 267, 11, 20.0, '2020-08-11 14:23:37', '2020-08-11 14:23:37', NULL),
(284, 268, 9, 6.0, '2020-08-11 14:23:37', '2020-08-11 14:23:37', NULL),
(285, 268, 12, 6.0, '2020-08-11 14:23:37', '2020-08-11 14:23:37', NULL),
(286, 268, 13, 6.0, '2020-08-11 14:23:37', '2020-08-11 14:23:37', NULL),
(287, 268, 14, 6.0, '2020-08-11 14:23:37', '2020-08-11 14:23:37', NULL),
(288, 269, 3, 20.0, '2020-08-11 14:23:59', '2020-08-11 14:23:59', NULL),
(289, 269, 4, 20.0, '2020-08-11 14:23:59', '2020-08-11 14:23:59', NULL),
(290, 269, 10, 20.0, '2020-08-11 14:23:59', '2020-08-11 14:23:59', NULL),
(291, 269, 11, 20.0, '2020-08-11 14:23:59', '2020-08-11 14:23:59', NULL),
(292, 270, 9, 6.0, '2020-08-11 14:23:59', '2020-08-11 14:23:59', NULL),
(293, 270, 12, 6.0, '2020-08-11 14:23:59', '2020-08-11 14:23:59', NULL),
(294, 270, 13, 6.0, '2020-08-11 14:23:59', '2020-08-11 14:23:59', NULL),
(295, 270, 14, 6.0, '2020-08-11 14:23:59', '2020-08-11 14:23:59', NULL),
(296, 271, 3, 20.0, '2020-08-11 14:24:29', '2020-08-11 14:24:29', NULL),
(297, 271, 4, 20.0, '2020-08-11 14:24:29', '2020-08-11 14:24:29', NULL),
(298, 271, 10, 20.0, '2020-08-11 14:24:29', '2020-08-11 14:24:29', NULL),
(299, 271, 11, 20.0, '2020-08-11 14:24:29', '2020-08-11 14:24:29', NULL),
(300, 272, 9, 6.0, '2020-08-11 14:24:29', '2020-08-11 14:24:29', NULL),
(301, 272, 12, 6.0, '2020-08-11 14:24:29', '2020-08-11 14:24:29', NULL),
(302, 272, 13, 6.0, '2020-08-11 14:24:29', '2020-08-11 14:24:29', NULL),
(303, 272, 14, 6.0, '2020-08-11 14:24:29', '2020-08-11 14:24:29', NULL),
(304, 273, 3, 20.0, '2020-08-11 14:28:14', '2020-08-11 14:28:14', NULL),
(305, 273, 4, 20.0, '2020-08-11 14:28:15', '2020-08-11 14:28:15', NULL),
(306, 273, 10, 20.0, '2020-08-11 14:28:15', '2020-08-11 14:28:15', NULL),
(307, 273, 11, 20.0, '2020-08-11 14:28:15', '2020-08-11 14:28:15', NULL),
(308, 274, 9, 5.0, '2020-08-11 14:28:15', '2020-08-11 14:28:15', NULL),
(309, 274, 12, 5.0, '2020-08-11 14:28:15', '2020-08-11 14:28:15', NULL),
(310, 274, 13, 5.0, '2020-08-11 14:28:15', '2020-08-11 14:28:15', NULL),
(311, 274, 14, 5.0, '2020-08-11 14:28:15', '2020-08-11 14:28:15', NULL),
(312, 275, 3, 20.0, '2020-08-11 14:28:32', '2020-08-11 14:28:32', NULL),
(313, 275, 4, 20.0, '2020-08-11 14:28:32', '2020-08-11 14:28:32', NULL),
(314, 275, 10, 20.0, '2020-08-11 14:28:32', '2020-08-11 14:28:32', NULL),
(315, 275, 11, 20.0, '2020-08-11 14:28:32', '2020-08-11 14:28:32', NULL),
(316, 276, 9, 5.0, '2020-08-11 14:28:32', '2020-08-11 14:28:32', NULL),
(317, 276, 12, 5.0, '2020-08-11 14:28:32', '2020-08-11 14:28:32', NULL),
(318, 276, 13, 5.0, '2020-08-11 14:28:32', '2020-08-11 14:28:32', NULL),
(319, 276, 14, 5.0, '2020-08-11 14:28:32', '2020-08-11 14:28:32', NULL),
(320, 277, 3, 20.0, '2020-08-11 14:29:01', '2020-08-11 14:29:01', NULL),
(321, 277, 4, 20.0, '2020-08-11 14:29:01', '2020-08-11 14:29:01', NULL),
(322, 277, 10, 20.0, '2020-08-11 14:29:01', '2020-08-11 14:29:01', NULL),
(323, 277, 11, 20.0, '2020-08-11 14:29:01', '2020-08-11 14:29:01', NULL),
(324, 278, 9, 5.0, '2020-08-11 14:29:01', '2020-08-11 14:29:01', NULL),
(325, 278, 12, 5.0, '2020-08-11 14:29:01', '2020-08-11 14:29:01', NULL),
(326, 278, 13, 5.0, '2020-08-11 14:29:01', '2020-08-11 14:29:01', NULL),
(327, 278, 14, 5.0, '2020-08-11 14:29:01', '2020-08-11 14:29:01', NULL),
(328, 279, 3, 20.0, '2020-08-11 14:33:54', '2020-08-11 14:33:54', NULL),
(329, 279, 4, 20.0, '2020-08-11 14:33:54', '2020-08-11 14:33:54', NULL),
(330, 279, 10, 20.0, '2020-08-11 14:33:54', '2020-08-11 14:33:54', NULL),
(331, 279, 11, 20.0, '2020-08-11 14:33:54', '2020-08-11 14:33:54', NULL),
(332, 280, 9, 5.0, '2020-08-11 14:33:54', '2020-08-11 14:33:54', NULL),
(333, 280, 12, 5.0, '2020-08-11 14:33:54', '2020-08-11 14:33:54', NULL),
(334, 280, 13, 5.0, '2020-08-11 14:33:54', '2020-08-11 14:33:54', NULL),
(335, 280, 14, 5.0, '2020-08-11 14:33:54', '2020-08-11 14:33:54', NULL),
(336, 281, 3, 20.0, '2020-08-11 14:34:55', '2020-08-11 14:34:55', NULL),
(337, 281, 4, 20.0, '2020-08-11 14:34:55', '2020-08-11 14:34:55', NULL),
(338, 281, 10, 20.0, '2020-08-11 14:35:00', '2020-08-11 14:35:00', NULL),
(339, 281, 11, 20.0, '2020-08-11 14:35:05', '2020-08-11 14:35:05', NULL),
(340, 282, 9, 5.0, '2020-08-11 14:35:07', '2020-08-11 14:35:07', NULL),
(341, 282, 12, 5.0, '2020-08-11 14:35:07', '2020-08-11 14:35:07', NULL),
(342, 282, 13, 5.0, '2020-08-11 14:35:07', '2020-08-11 14:35:07', NULL),
(343, 282, 14, 5.0, '2020-08-11 14:35:07', '2020-08-11 14:35:07', NULL),
(344, 283, 3, 20.0, '2020-08-11 14:44:31', '2020-08-11 14:44:31', NULL),
(345, 283, 4, 20.0, '2020-08-11 14:44:31', '2020-08-11 14:44:31', NULL),
(346, 283, 10, 20.0, '2020-08-11 14:44:31', '2020-08-11 14:44:31', NULL),
(347, 283, 11, 20.0, '2020-08-11 14:44:31', '2020-08-11 14:44:31', NULL),
(348, 284, 9, 5.0, '2020-08-11 14:44:32', '2020-08-11 14:44:32', NULL),
(349, 284, 12, 5.0, '2020-08-11 14:44:32', '2020-08-11 14:44:32', NULL),
(350, 284, 13, 5.0, '2020-08-11 14:44:32', '2020-08-11 14:44:32', NULL),
(351, 284, 14, 5.0, '2020-08-11 14:44:32', '2020-08-11 14:44:32', NULL),
(352, 285, 3, 20.0, '2020-08-11 15:10:25', '2020-08-11 15:10:25', NULL),
(353, 285, 4, 20.0, '2020-08-11 15:10:25', '2020-08-11 15:10:25', NULL),
(354, 285, 10, 20.0, '2020-08-11 15:10:25', '2020-08-11 15:10:25', NULL),
(355, 285, 11, 20.0, '2020-08-11 15:10:25', '2020-08-11 15:10:25', NULL),
(356, 286, 9, 5.0, '2020-08-11 15:10:25', '2020-08-11 15:10:25', NULL),
(357, 286, 12, 5.0, '2020-08-11 15:10:25', '2020-08-11 15:10:25', NULL),
(358, 286, 13, 5.0, '2020-08-11 15:10:25', '2020-08-11 15:10:25', NULL),
(359, 286, 14, 5.0, '2020-08-11 15:10:25', '2020-08-11 15:10:25', NULL),
(360, 287, 3, NULL, '2020-08-23 15:22:41', '2020-08-23 15:22:41', NULL),
(361, 287, 4, NULL, '2020-08-23 15:22:41', '2020-08-23 15:22:41', NULL),
(362, 287, 10, NULL, '2020-08-23 15:22:41', '2020-08-23 15:22:41', NULL),
(363, 287, 11, NULL, '2020-08-23 15:22:41', '2020-08-23 15:22:41', NULL),
(364, 288, 9, 6.0, '2020-08-23 15:22:41', '2020-08-23 15:22:41', NULL),
(365, 288, 12, 6.0, '2020-08-23 15:22:41', '2020-08-23 15:22:41', NULL),
(366, 288, 13, 6.0, '2020-08-23 15:22:41', '2020-08-23 15:22:41', NULL),
(367, 288, 14, 6.0, '2020-08-23 15:22:41', '2020-08-23 15:22:41', NULL),
(368, 289, 3, NULL, '2020-08-23 15:23:34', '2020-08-23 15:23:34', NULL),
(369, 289, 4, NULL, '2020-08-23 15:23:34', '2020-08-23 15:23:34', NULL),
(370, 289, 10, NULL, '2020-08-23 15:23:34', '2020-08-23 15:23:34', NULL),
(371, 289, 11, NULL, '2020-08-23 15:23:34', '2020-08-23 15:23:34', NULL),
(372, 290, 9, 6.0, '2020-08-23 15:23:34', '2020-08-23 15:23:34', NULL),
(373, 290, 12, 6.0, '2020-08-23 15:23:34', '2020-08-23 15:23:34', NULL),
(374, 290, 13, 6.0, '2020-08-23 15:23:34', '2020-08-23 15:23:34', NULL),
(375, 290, 14, 6.0, '2020-08-23 15:23:34', '2020-08-23 15:23:34', NULL),
(376, 291, 3, NULL, '2020-08-23 15:24:10', '2020-08-23 15:24:10', NULL),
(377, 291, 4, NULL, '2020-08-23 15:24:10', '2020-08-23 15:24:10', NULL),
(378, 291, 10, NULL, '2020-08-23 15:24:10', '2020-08-23 15:24:10', NULL),
(379, 291, 11, NULL, '2020-08-23 15:24:10', '2020-08-23 15:24:10', NULL),
(380, 292, 9, 6.0, '2020-08-23 15:24:10', '2020-08-23 15:24:10', NULL),
(381, 292, 12, 6.0, '2020-08-23 15:24:10', '2020-08-23 15:24:10', NULL),
(382, 292, 13, 6.0, '2020-08-23 15:24:10', '2020-08-23 15:24:10', NULL),
(383, 292, 14, 6.0, '2020-08-23 15:24:10', '2020-08-23 15:24:10', NULL),
(384, 293, 3, NULL, '2020-08-23 15:24:50', '2020-08-23 15:24:50', NULL),
(385, 293, 4, NULL, '2020-08-23 15:24:50', '2020-08-23 15:24:50', NULL),
(386, 293, 10, NULL, '2020-08-23 15:24:50', '2020-08-23 15:24:50', NULL),
(387, 293, 11, NULL, '2020-08-23 15:24:50', '2020-08-23 15:24:50', NULL),
(388, 294, 9, 6.0, '2020-08-23 15:24:50', '2020-08-23 15:24:50', NULL),
(389, 294, 12, 6.0, '2020-08-23 15:24:50', '2020-08-23 15:24:50', NULL),
(390, 294, 13, 6.0, '2020-08-23 15:24:50', '2020-08-23 15:24:50', NULL),
(391, 294, 14, 6.0, '2020-08-23 15:24:50', '2020-08-23 15:24:50', NULL),
(392, 295, 3, NULL, '2020-08-23 15:25:28', '2020-08-23 15:25:28', NULL),
(393, 295, 4, NULL, '2020-08-23 15:25:28', '2020-08-23 15:25:28', NULL),
(394, 295, 10, NULL, '2020-08-23 15:25:28', '2020-08-23 15:25:28', NULL),
(395, 295, 11, NULL, '2020-08-23 15:25:28', '2020-08-23 15:25:28', NULL),
(396, 296, 9, 6.0, '2020-08-23 15:25:28', '2020-08-23 15:25:28', NULL),
(397, 296, 12, 6.0, '2020-08-23 15:25:28', '2020-08-23 15:25:28', NULL),
(398, 296, 13, 6.0, '2020-08-23 15:25:28', '2020-08-23 15:25:28', NULL),
(399, 296, 14, 6.0, '2020-08-23 15:25:28', '2020-08-23 15:25:28', NULL),
(400, 297, 3, NULL, '2020-08-23 15:29:33', '2020-08-23 15:29:33', NULL),
(401, 297, 4, NULL, '2020-08-23 15:29:33', '2020-08-23 15:29:33', NULL),
(402, 297, 10, NULL, '2020-08-23 15:29:33', '2020-08-23 15:29:33', NULL),
(403, 297, 11, NULL, '2020-08-23 15:29:33', '2020-08-23 15:29:33', NULL),
(404, 298, 9, 6.0, '2020-08-23 15:29:33', '2020-08-23 15:29:33', NULL),
(405, 298, 12, 6.0, '2020-08-23 15:29:33', '2020-08-23 15:29:33', NULL),
(406, 298, 13, 6.0, '2020-08-23 15:29:33', '2020-08-23 15:29:33', NULL),
(407, 298, 14, 6.0, '2020-08-23 15:29:33', '2020-08-23 15:29:33', NULL),
(408, 299, 3, NULL, '2020-08-23 15:30:37', '2020-08-23 15:30:37', NULL),
(409, 299, 4, NULL, '2020-08-23 15:30:37', '2020-08-23 15:30:37', NULL),
(410, 299, 10, NULL, '2020-08-23 15:30:37', '2020-08-23 15:30:37', NULL),
(411, 299, 11, NULL, '2020-08-23 15:30:37', '2020-08-23 15:30:37', NULL),
(412, 300, 9, 6.0, '2020-08-23 15:30:37', '2020-08-23 15:30:37', NULL),
(413, 300, 12, 6.0, '2020-08-23 15:30:37', '2020-08-23 15:30:37', NULL),
(414, 300, 13, 6.0, '2020-08-23 15:30:37', '2020-08-23 15:30:37', NULL),
(415, 300, 14, 6.0, '2020-08-23 15:30:37', '2020-08-23 15:30:37', NULL),
(416, 301, 3, NULL, '2020-08-23 15:31:21', '2020-08-23 15:31:21', NULL),
(417, 301, 4, NULL, '2020-08-23 15:31:21', '2020-08-23 15:31:21', NULL),
(418, 301, 10, NULL, '2020-08-23 15:31:21', '2020-08-23 15:31:21', NULL),
(419, 301, 11, NULL, '2020-08-23 15:31:21', '2020-08-23 15:31:21', NULL),
(420, 302, 9, 6.0, '2020-08-23 15:31:21', '2020-08-23 15:31:21', NULL),
(421, 302, 12, 6.0, '2020-08-23 15:31:21', '2020-08-23 15:31:21', NULL),
(422, 302, 13, 6.0, '2020-08-23 15:31:21', '2020-08-23 15:31:21', NULL),
(423, 302, 14, 6.0, '2020-08-23 15:31:21', '2020-08-23 15:31:21', NULL),
(424, 303, 3, NULL, '2020-08-23 15:32:46', '2020-08-23 15:32:46', NULL),
(425, 303, 4, NULL, '2020-08-23 15:32:46', '2020-08-23 15:32:46', NULL),
(426, 303, 10, NULL, '2020-08-23 15:32:46', '2020-08-23 15:32:46', NULL),
(427, 303, 11, NULL, '2020-08-23 15:32:46', '2020-08-23 15:32:46', NULL),
(428, 304, 9, 6.0, '2020-08-23 15:32:46', '2020-08-23 15:32:46', NULL),
(429, 304, 12, 6.0, '2020-08-23 15:32:46', '2020-08-23 15:32:46', NULL),
(430, 304, 13, 6.0, '2020-08-23 15:32:46', '2020-08-23 15:32:46', NULL),
(431, 304, 14, 6.0, '2020-08-23 15:32:46', '2020-08-23 15:32:46', NULL),
(432, 305, 3, NULL, '2020-08-23 15:33:16', '2020-08-23 15:33:16', NULL),
(433, 305, 4, NULL, '2020-08-23 15:33:16', '2020-08-23 15:33:16', NULL),
(434, 305, 10, NULL, '2020-08-23 15:33:16', '2020-08-23 15:33:16', NULL),
(435, 305, 11, NULL, '2020-08-23 15:33:16', '2020-08-23 15:33:16', NULL),
(436, 306, 9, 6.0, '2020-08-23 15:33:16', '2020-08-23 15:33:16', NULL),
(437, 306, 12, 6.0, '2020-08-23 15:33:16', '2020-08-23 15:33:16', NULL),
(438, 306, 13, 6.0, '2020-08-23 15:33:16', '2020-08-23 15:33:16', NULL),
(439, 306, 14, 6.0, '2020-08-23 15:33:16', '2020-08-23 15:33:16', NULL),
(440, 307, 3, NULL, '2020-08-23 15:34:43', '2020-08-23 15:34:43', NULL),
(441, 307, 4, NULL, '2020-08-23 15:34:43', '2020-08-23 15:34:43', NULL),
(442, 307, 10, NULL, '2020-08-23 15:34:43', '2020-08-23 15:34:43', NULL),
(443, 307, 11, NULL, '2020-08-23 15:34:43', '2020-08-23 15:34:43', NULL),
(444, 308, 9, 6.0, '2020-08-23 15:34:43', '2020-08-23 15:34:43', NULL),
(445, 308, 12, 6.0, '2020-08-23 15:34:43', '2020-08-23 15:34:43', NULL),
(446, 308, 13, 6.0, '2020-08-23 15:34:43', '2020-08-23 15:34:43', NULL),
(447, 308, 14, 6.0, '2020-08-23 15:34:43', '2020-08-23 15:34:43', NULL),
(448, 309, 3, NULL, '2020-09-14 08:29:50', '2020-09-14 08:29:50', NULL),
(449, 309, 4, NULL, '2020-09-14 08:29:50', '2020-09-14 08:29:50', NULL),
(450, 309, 10, NULL, '2020-09-14 08:29:50', '2020-09-14 08:29:50', NULL),
(451, 309, 11, NULL, '2020-09-14 08:29:50', '2020-09-14 08:29:50', NULL),
(452, 310, 9, 6.0, '2020-09-14 08:29:50', '2020-09-14 08:29:50', NULL),
(453, 310, 12, 6.0, '2020-09-14 08:29:50', '2020-09-14 08:29:50', NULL),
(454, 310, 13, NULL, '2020-09-14 08:29:50', '2020-09-14 08:29:50', NULL),
(455, 310, 14, NULL, '2020-09-14 08:29:50', '2020-09-14 08:29:50', NULL),
(456, 311, 3, NULL, '2020-09-14 08:41:36', '2020-09-14 08:41:36', NULL),
(457, 311, 4, NULL, '2020-09-14 08:41:36', '2020-09-14 08:41:36', NULL),
(458, 311, 10, NULL, '2020-09-14 08:41:36', '2020-09-14 08:41:36', NULL),
(459, 311, 11, NULL, '2020-09-14 08:41:36', '2020-09-14 08:41:36', NULL),
(460, 312, 9, 6.0, '2020-09-14 08:41:36', '2020-09-14 08:41:36', NULL),
(461, 312, 12, 6.0, '2020-09-14 08:41:36', '2020-09-14 08:41:36', NULL),
(462, 312, 13, NULL, '2020-09-14 08:41:36', '2020-09-14 08:41:36', NULL),
(463, 312, 14, NULL, '2020-09-14 08:41:36', '2020-09-14 08:41:36', NULL),
(464, 313, 3, NULL, '2020-09-14 08:54:39', '2020-09-14 08:54:39', NULL),
(465, 313, 4, NULL, '2020-09-14 08:54:39', '2020-09-14 08:54:39', NULL),
(466, 313, 10, NULL, '2020-09-14 08:54:39', '2020-09-14 08:54:39', NULL),
(467, 313, 11, NULL, '2020-09-14 08:54:39', '2020-09-14 08:54:39', NULL),
(468, 314, 9, 6.0, '2020-09-14 08:54:39', '2020-09-14 08:54:39', NULL),
(469, 314, 12, 6.0, '2020-09-14 08:54:39', '2020-09-14 08:54:39', NULL),
(470, 314, 13, 6.0, '2020-09-14 08:54:39', '2020-09-14 08:54:39', NULL),
(471, 314, 14, 6.0, '2020-09-14 08:54:39', '2020-09-14 08:54:39', NULL),
(472, 315, 3, NULL, '2020-12-30 17:59:46', '2020-12-30 17:59:46', NULL),
(473, 315, 4, NULL, '2020-12-30 17:59:46', '2020-12-30 17:59:46', NULL),
(474, 315, 10, NULL, '2020-12-30 17:59:46', '2020-12-30 17:59:46', NULL),
(475, 315, 11, NULL, '2020-12-30 17:59:46', '2020-12-30 17:59:46', NULL),
(476, 316, 7, 600.0, '2020-12-30 17:59:46', '2020-12-30 17:59:46', NULL),
(477, 316, 8, 600.0, '2020-12-30 17:59:46', '2020-12-30 17:59:46', NULL),
(478, 316, 15, NULL, '2020-12-30 17:59:46', '2020-12-30 17:59:46', NULL),
(479, 317, 3, NULL, '2020-12-30 18:12:16', '2020-12-30 18:12:16', NULL),
(480, 317, 4, NULL, '2020-12-30 18:12:16', '2020-12-30 18:12:16', NULL),
(481, 317, 10, NULL, '2020-12-30 18:12:16', '2020-12-30 18:12:16', NULL),
(482, 317, 11, NULL, '2020-12-30 18:12:16', '2020-12-30 18:12:16', NULL),
(483, 318, 7, 600.0, '2020-12-30 18:12:16', '2020-12-30 18:12:16', NULL),
(484, 318, 8, 600.0, '2020-12-30 18:12:16', '2020-12-30 18:12:16', NULL),
(485, 318, 15, NULL, '2020-12-30 18:12:16', '2020-12-30 18:12:16', NULL),
(486, 319, 3, NULL, '2020-12-30 18:15:50', '2020-12-30 18:15:50', NULL),
(487, 319, 4, NULL, '2020-12-30 18:15:50', '2020-12-30 18:15:50', NULL),
(488, 319, 10, NULL, '2020-12-30 18:15:50', '2020-12-30 18:15:50', NULL),
(489, 319, 11, NULL, '2020-12-30 18:15:50', '2020-12-30 18:15:50', NULL),
(490, 320, 7, 600.0, '2020-12-30 18:15:50', '2020-12-30 18:15:50', NULL),
(491, 320, 8, 600.0, '2020-12-30 18:15:50', '2020-12-30 18:15:50', NULL),
(492, 320, 15, NULL, '2020-12-30 18:15:50', '2020-12-30 18:15:50', NULL),
(493, 321, 3, NULL, '2020-12-31 17:51:51', '2020-12-31 17:51:51', NULL),
(494, 321, 4, NULL, '2020-12-31 17:51:51', '2020-12-31 17:51:51', NULL),
(495, 321, 10, NULL, '2020-12-31 17:51:51', '2020-12-31 17:51:51', NULL),
(496, 321, 11, NULL, '2020-12-31 17:51:51', '2020-12-31 17:51:51', NULL),
(497, 322, 7, 600.0, '2020-12-31 17:51:51', '2020-12-31 17:51:51', NULL),
(498, 322, 8, 600.0, '2020-12-31 17:51:51', '2020-12-31 17:51:51', NULL),
(499, 322, 15, NULL, '2020-12-31 17:51:51', '2020-12-31 17:51:51', NULL),
(500, 323, 3, NULL, '2021-01-04 17:33:07', '2021-01-04 17:33:07', NULL),
(501, 323, 4, NULL, '2021-01-04 17:33:07', '2021-01-04 17:33:07', NULL),
(502, 323, 10, NULL, '2021-01-04 17:33:07', '2021-01-04 17:33:07', NULL),
(503, 323, 11, NULL, '2021-01-04 17:33:07', '2021-01-04 17:33:07', NULL),
(504, 324, 7, 600.0, '2021-01-04 17:33:07', '2021-01-04 17:33:07', NULL),
(505, 324, 8, 600.0, '2021-01-04 17:33:07', '2021-01-04 17:33:07', NULL),
(506, 324, 15, NULL, '2021-01-04 17:33:07', '2021-01-04 17:33:07', NULL),
(507, 325, 3, 17.0, '2021-01-05 14:25:57', '2021-01-05 14:25:57', NULL),
(508, 325, 4, 17.0, '2021-01-05 14:25:57', '2021-01-05 14:25:57', NULL),
(509, 325, 10, 17.0, '2021-01-05 14:25:57', '2021-01-05 14:25:57', NULL),
(510, 325, 11, 17.0, '2021-01-05 14:25:57', '2021-01-05 14:25:57', NULL),
(511, 326, 9, 5.5, '2021-01-05 14:25:57', '2021-01-05 14:25:57', NULL),
(512, 326, 12, 5.5, '2021-01-05 14:25:57', '2021-01-05 14:25:57', NULL),
(513, 326, 13, 5.5, '2021-01-05 14:25:57', '2021-01-05 14:25:57', NULL),
(514, 326, 14, 5.5, '2021-01-05 14:25:57', '2021-01-05 14:25:57', NULL),
(515, 327, 3, 17.0, '2021-01-05 14:30:14', '2021-01-05 14:30:14', NULL),
(516, 327, 4, 17.0, '2021-01-05 14:30:14', '2021-01-05 14:30:14', NULL),
(517, 327, 10, 17.0, '2021-01-05 14:30:14', '2021-01-05 14:30:14', NULL),
(518, 327, 11, 17.0, '2021-01-05 14:30:14', '2021-01-05 14:30:14', NULL),
(519, 328, 9, 5.5, '2021-01-05 14:30:14', '2021-01-05 14:30:14', NULL),
(520, 328, 12, 5.5, '2021-01-05 14:30:14', '2021-01-05 14:30:14', NULL),
(521, 328, 13, 5.5, '2021-01-05 14:30:14', '2021-01-05 14:30:14', NULL),
(522, 328, 14, 5.5, '2021-01-05 14:30:14', '2021-01-05 14:30:14', NULL),
(523, 329, 3, 17.0, '2021-01-05 14:31:18', '2021-01-05 14:31:18', NULL),
(524, 329, 4, 17.0, '2021-01-05 14:31:18', '2021-01-05 14:31:18', NULL),
(525, 329, 10, 17.0, '2021-01-05 14:31:18', '2021-01-05 14:31:18', NULL),
(526, 329, 11, 17.0, '2021-01-05 14:31:18', '2021-01-05 14:31:18', NULL),
(527, 330, 9, 5.5, '2021-01-05 14:31:18', '2021-01-05 14:31:18', NULL),
(528, 330, 12, 5.5, '2021-01-05 14:31:18', '2021-01-05 14:31:18', NULL),
(529, 330, 13, 5.5, '2021-01-05 14:31:18', '2021-01-05 14:31:18', NULL),
(530, 330, 14, 5.5, '2021-01-05 14:31:18', '2021-01-05 14:31:18', NULL),
(531, 331, 3, 17.0, '2021-01-05 14:32:00', '2021-01-05 14:32:00', NULL),
(532, 331, 4, 17.0, '2021-01-05 14:32:00', '2021-01-05 14:32:00', NULL),
(533, 331, 10, 17.0, '2021-01-05 14:32:00', '2021-01-05 14:32:00', NULL),
(534, 331, 11, 17.0, '2021-01-05 14:32:00', '2021-01-05 14:32:00', NULL),
(535, 332, 9, 5.5, '2021-01-05 14:32:00', '2021-01-05 14:32:00', NULL),
(536, 332, 12, 5.5, '2021-01-05 14:32:00', '2021-01-05 14:32:00', NULL),
(537, 332, 13, 5.5, '2021-01-05 14:32:00', '2021-01-05 14:32:00', NULL),
(538, 332, 14, 5.5, '2021-01-05 14:32:00', '2021-01-05 14:32:00', NULL),
(539, 333, 3, 17.0, '2021-01-05 14:35:05', '2021-01-05 14:35:05', NULL),
(540, 333, 4, 17.0, '2021-01-05 14:35:05', '2021-01-05 14:35:05', NULL),
(541, 333, 10, 17.0, '2021-01-05 14:35:05', '2021-01-05 14:35:05', NULL),
(542, 333, 11, 17.0, '2021-01-05 14:35:05', '2021-01-05 14:35:05', NULL),
(543, 334, 9, 5.5, '2021-01-05 14:35:05', '2021-01-05 14:35:05', NULL),
(544, 334, 12, 5.5, '2021-01-05 14:35:05', '2021-01-05 14:35:05', NULL),
(545, 334, 13, 5.5, '2021-01-05 14:35:05', '2021-01-05 14:35:05', NULL),
(546, 334, 14, 5.5, '2021-01-05 14:35:05', '2021-01-05 14:35:05', NULL),
(547, 335, 3, 17.0, '2021-01-05 14:35:58', '2021-01-05 14:35:58', NULL),
(548, 335, 4, 17.0, '2021-01-05 14:35:58', '2021-01-05 14:35:58', NULL),
(549, 335, 10, 17.0, '2021-01-05 14:35:58', '2021-01-05 14:35:58', NULL),
(550, 335, 11, 17.0, '2021-01-05 14:35:58', '2021-01-05 14:35:58', NULL),
(551, 336, 9, 5.5, '2021-01-05 14:35:58', '2021-01-05 14:35:58', NULL),
(552, 336, 12, 5.5, '2021-01-05 14:35:58', '2021-01-05 14:35:58', NULL),
(553, 336, 13, 5.5, '2021-01-05 14:35:58', '2021-01-05 14:35:58', NULL),
(554, 336, 14, 5.5, '2021-01-05 14:35:58', '2021-01-05 14:35:58', NULL),
(555, 337, 3, 17.0, '2021-01-05 14:36:48', '2021-01-05 14:36:48', NULL),
(556, 337, 4, 17.0, '2021-01-05 14:36:48', '2021-01-05 14:36:48', NULL),
(557, 337, 10, 17.0, '2021-01-05 14:36:48', '2021-01-05 14:36:48', NULL),
(558, 337, 11, 17.0, '2021-01-05 14:36:48', '2021-01-05 14:36:48', NULL),
(559, 338, 9, 5.5, '2021-01-05 14:36:48', '2021-01-05 14:36:48', NULL),
(560, 338, 12, 5.5, '2021-01-05 14:36:48', '2021-01-05 14:36:48', NULL),
(561, 338, 13, 5.5, '2021-01-05 14:36:48', '2021-01-05 14:36:48', NULL),
(562, 338, 14, 5.5, '2021-01-05 14:36:48', '2021-01-05 14:36:48', NULL),
(563, 339, 3, 17.0, '2021-01-05 14:37:38', '2021-01-05 14:37:38', NULL),
(564, 339, 4, 17.0, '2021-01-05 14:37:38', '2021-01-05 14:37:38', NULL),
(565, 339, 10, 17.0, '2021-01-05 14:37:38', '2021-01-05 14:37:38', NULL),
(566, 339, 11, 17.0, '2021-01-05 14:37:38', '2021-01-05 14:37:38', NULL),
(567, 340, 9, 5.5, '2021-01-05 14:37:38', '2021-01-05 14:37:38', NULL),
(568, 340, 12, 5.5, '2021-01-05 14:37:38', '2021-01-05 14:37:38', NULL),
(569, 340, 13, 5.5, '2021-01-05 14:37:38', '2021-01-05 14:37:38', NULL),
(570, 340, 14, 5.5, '2021-01-05 14:37:38', '2021-01-05 14:37:38', NULL),
(571, 341, 3, 17.0, '2021-01-05 14:38:10', '2021-01-05 14:38:10', NULL),
(572, 341, 4, 17.0, '2021-01-05 14:38:10', '2021-01-05 14:38:10', NULL),
(573, 341, 10, 17.0, '2021-01-05 14:38:10', '2021-01-05 14:38:10', NULL),
(574, 341, 11, 17.0, '2021-01-05 14:38:10', '2021-01-05 14:38:10', NULL),
(575, 342, 9, 5.5, '2021-01-05 14:38:10', '2021-01-05 14:38:10', NULL),
(576, 342, 12, 5.5, '2021-01-05 14:38:10', '2021-01-05 14:38:10', NULL),
(577, 342, 13, 5.5, '2021-01-05 14:38:10', '2021-01-05 14:38:10', NULL),
(578, 342, 14, 5.5, '2021-01-05 14:38:10', '2021-01-05 14:38:10', NULL),
(579, 343, 3, 17.0, '2021-01-05 14:45:44', '2021-01-05 14:45:44', NULL),
(580, 343, 4, 17.0, '2021-01-05 14:45:44', '2021-01-05 14:45:44', NULL),
(581, 343, 10, 17.0, '2021-01-05 14:45:44', '2021-01-05 14:45:44', NULL),
(582, 343, 11, 17.0, '2021-01-05 14:45:44', '2021-01-05 14:45:44', NULL),
(583, 344, 9, 5.5, '2021-01-05 14:45:44', '2021-01-05 14:45:44', NULL),
(584, 344, 12, 5.5, '2021-01-05 14:45:44', '2021-01-05 14:45:44', NULL),
(585, 344, 13, 5.5, '2021-01-05 14:45:44', '2021-01-05 14:45:44', NULL),
(586, 344, 14, 5.5, '2021-01-05 14:45:44', '2021-01-05 14:45:44', NULL),
(587, 345, 3, NULL, '2021-01-09 17:05:33', '2021-01-09 17:05:33', NULL),
(588, 345, 4, NULL, '2021-01-09 17:05:33', '2021-01-09 17:05:33', NULL),
(589, 345, 10, NULL, '2021-01-09 17:05:33', '2021-01-09 17:05:33', NULL),
(590, 345, 11, NULL, '2021-01-09 17:05:33', '2021-01-09 17:05:33', NULL),
(591, 346, 7, 600.0, '2021-01-09 17:05:33', '2021-01-09 17:05:33', NULL),
(592, 346, 8, 600.0, '2021-01-09 17:05:33', '2021-01-09 17:05:33', NULL),
(593, 346, 15, NULL, '2021-01-09 17:05:33', '2021-01-09 17:05:33', NULL),
(594, 347, 7, 600.0, '2021-01-09 17:42:45', '2021-01-09 17:42:45', NULL),
(595, 347, 8, 580.0, '2021-01-09 17:42:45', '2021-01-09 17:42:45', NULL),
(596, 347, 15, NULL, '2021-01-09 17:42:45', '2021-01-09 17:42:45', NULL),
(597, 348, 7, 600.0, '2021-01-09 17:44:01', '2021-01-09 17:44:01', NULL),
(598, 348, 8, 580.0, '2021-01-09 17:44:01', '2021-01-09 17:44:01', NULL),
(599, 348, 15, NULL, '2021-01-09 17:44:01', '2021-01-09 17:44:01', NULL),
(600, 349, 7, 600.0, '2021-01-09 17:45:01', '2021-01-09 17:45:01', NULL),
(601, 349, 8, 580.0, '2021-01-09 17:45:01', '2021-01-09 17:45:01', NULL),
(602, 349, 15, NULL, '2021-01-09 17:45:01', '2021-01-09 17:45:01', NULL),
(603, 350, 7, 600.0, '2021-01-09 17:46:41', '2021-01-09 17:46:41', NULL),
(604, 350, 8, 580.0, '2021-01-09 17:46:41', '2021-01-09 17:46:41', NULL),
(605, 350, 15, NULL, '2021-01-09 17:46:41', '2021-01-09 17:46:41', NULL),
(606, 351, 7, 600.0, '2021-01-09 17:49:06', '2021-01-09 17:49:06', NULL),
(607, 351, 8, 600.0, '2021-01-09 17:49:06', '2021-01-09 17:49:06', NULL),
(608, 351, 15, NULL, '2021-01-09 17:49:06', '2021-01-09 17:49:06', NULL),
(609, 352, 7, 600.0, '2021-01-09 17:49:52', '2021-01-09 17:49:52', NULL),
(610, 352, 8, 600.0, '2021-01-09 17:49:52', '2021-01-09 17:49:52', NULL),
(611, 352, 15, NULL, '2021-01-09 17:49:52', '2021-01-09 17:49:52', NULL),
(612, 353, 7, 600.0, '2021-01-09 17:50:38', '2021-01-09 17:50:38', NULL),
(613, 353, 8, 600.0, '2021-01-09 17:50:38', '2021-01-09 17:50:38', NULL),
(614, 353, 15, NULL, '2021-01-09 17:50:38', '2021-01-09 17:50:38', NULL),
(615, 354, 7, 600.0, '2021-01-09 17:51:49', '2021-01-09 17:51:49', NULL),
(616, 354, 8, 600.0, '2021-01-09 17:51:49', '2021-01-09 17:51:49', NULL),
(617, 354, 15, NULL, '2021-01-09 17:51:49', '2021-01-09 17:51:49', NULL),
(618, 355, 7, 600.0, '2021-01-09 17:52:47', '2021-01-09 17:52:47', NULL),
(619, 355, 8, 600.0, '2021-01-09 17:52:47', '2021-01-09 17:52:47', NULL),
(620, 355, 15, NULL, '2021-01-09 17:52:47', '2021-01-09 17:52:47', NULL),
(621, 356, 7, 600.0, '2021-01-09 17:53:28', '2021-01-09 17:53:28', NULL),
(622, 356, 8, 600.0, '2021-01-09 17:53:28', '2021-01-09 17:53:28', NULL),
(623, 356, 15, NULL, '2021-01-09 17:53:28', '2021-01-09 17:53:28', NULL),
(624, 357, 7, 600.0, '2021-01-09 17:54:11', '2021-01-09 17:54:11', NULL),
(625, 357, 8, 600.0, '2021-01-09 17:54:11', '2021-01-09 17:54:11', NULL),
(626, 357, 15, NULL, '2021-01-09 17:54:11', '2021-01-09 17:54:11', NULL),
(627, 358, 7, 600.0, '2021-01-09 17:56:00', '2021-01-09 17:56:00', NULL),
(628, 358, 8, 580.0, '2021-01-09 17:56:00', '2021-01-09 17:56:00', NULL),
(629, 358, 15, NULL, '2021-01-09 17:56:00', '2021-01-09 17:56:00', NULL),
(630, 359, 7, 600.0, '2021-01-09 17:57:07', '2021-01-09 17:57:07', NULL),
(631, 359, 8, 580.0, '2021-01-09 17:57:07', '2021-01-09 17:57:07', NULL),
(632, 359, 15, NULL, '2021-01-09 17:57:07', '2021-01-09 17:57:07', NULL),
(633, 360, 7, 600.0, '2021-01-09 17:57:43', '2021-01-09 17:57:43', NULL),
(634, 360, 8, 580.0, '2021-01-09 17:57:43', '2021-01-09 17:57:43', NULL),
(635, 360, 15, NULL, '2021-01-09 17:57:43', '2021-01-09 17:57:43', NULL),
(636, 361, 7, 600.0, '2021-01-09 17:58:56', '2021-01-09 17:58:56', NULL),
(637, 361, 8, 580.0, '2021-01-09 17:58:56', '2021-01-09 17:58:56', NULL),
(638, 361, 15, NULL, '2021-01-09 17:58:56', '2021-01-09 17:58:56', NULL),
(639, 362, 7, 600.0, '2021-01-09 17:59:43', '2021-01-09 17:59:43', NULL),
(640, 362, 8, 580.0, '2021-01-09 17:59:43', '2021-01-09 17:59:43', NULL),
(641, 362, 15, NULL, '2021-01-09 17:59:43', '2021-01-09 17:59:43', NULL),
(642, 363, 7, 600.0, '2021-01-09 18:01:03', '2021-01-09 18:01:03', NULL),
(643, 363, 8, 580.0, '2021-01-09 18:01:03', '2021-01-09 18:01:03', NULL),
(644, 363, 15, NULL, '2021-01-09 18:01:03', '2021-01-09 18:01:03', NULL),
(645, 364, 7, 600.0, '2021-01-09 18:02:08', '2021-01-09 18:02:08', NULL),
(646, 364, 8, 580.0, '2021-01-09 18:02:08', '2021-01-09 18:02:08', NULL),
(647, 364, 15, NULL, '2021-01-09 18:02:08', '2021-01-09 18:02:08', NULL),
(648, 365, 7, 600.0, '2021-01-09 18:02:58', '2021-01-09 18:02:58', NULL),
(649, 365, 8, 580.0, '2021-01-09 18:02:58', '2021-01-09 18:02:58', NULL),
(650, 365, 15, NULL, '2021-01-09 18:02:58', '2021-01-09 18:02:58', NULL),
(651, 366, 7, 600.0, '2021-01-09 18:03:39', '2021-01-09 18:03:39', NULL),
(652, 366, 8, 580.0, '2021-01-09 18:03:39', '2021-01-09 18:03:39', NULL),
(653, 366, 15, NULL, '2021-01-09 18:03:39', '2021-01-09 18:03:39', NULL),
(654, 367, 7, 600.0, '2021-01-09 18:04:19', '2021-01-09 18:04:19', NULL),
(655, 367, 8, 580.0, '2021-01-09 18:04:19', '2021-01-09 18:04:19', NULL),
(656, 367, 15, NULL, '2021-01-09 18:04:19', '2021-01-09 18:04:19', NULL),
(657, 368, 7, 600.0, '2021-01-09 18:05:05', '2021-01-09 18:05:05', NULL),
(658, 368, 8, 580.0, '2021-01-09 18:05:05', '2021-01-09 18:05:05', NULL),
(659, 368, 15, NULL, '2021-01-09 18:05:05', '2021-01-09 18:05:05', NULL),
(660, 369, 7, 600.0, '2021-01-09 18:06:01', '2021-01-09 18:06:01', NULL),
(661, 369, 8, 580.0, '2021-01-09 18:06:01', '2021-01-09 18:06:01', NULL),
(662, 369, 15, NULL, '2021-01-09 18:06:01', '2021-01-09 18:06:01', NULL),
(663, 370, 7, NULL, '2021-01-09 18:07:59', '2021-01-09 18:07:59', NULL),
(664, 370, 8, NULL, '2021-01-09 18:07:59', '2021-01-09 18:07:59', NULL),
(665, 370, 15, NULL, '2021-01-09 18:07:59', '2021-01-09 18:07:59', NULL),
(666, 371, 7, NULL, '2021-01-09 18:09:41', '2021-01-09 18:09:41', NULL),
(667, 371, 8, NULL, '2021-01-09 18:09:41', '2021-01-09 18:09:41', NULL),
(668, 371, 15, NULL, '2021-01-09 18:09:41', '2021-01-09 18:09:41', NULL),
(669, 372, 7, NULL, '2021-01-09 20:18:32', '2021-01-09 20:18:32', NULL),
(670, 372, 8, NULL, '2021-01-09 20:18:32', '2021-01-09 20:18:32', NULL),
(671, 372, 15, NULL, '2021-01-09 20:18:32', '2021-01-09 20:18:32', NULL),
(672, 373, 7, NULL, '2021-01-09 20:18:48', '2021-01-09 20:18:48', NULL),
(673, 373, 8, NULL, '2021-01-09 20:18:48', '2021-01-09 20:18:48', NULL),
(674, 373, 15, NULL, '2021-01-09 20:18:48', '2021-01-09 20:18:48', NULL),
(675, 374, 7, 600.0, '2021-01-09 20:19:02', '2021-01-09 20:19:02', NULL),
(676, 374, 8, 580.0, '2021-01-09 20:19:02', '2021-01-09 20:19:02', NULL),
(677, 374, 15, NULL, '2021-01-09 20:19:02', '2021-01-09 20:19:02', NULL),
(678, 375, 7, 600.0, '2021-01-09 20:19:19', '2021-01-09 20:19:19', NULL),
(679, 375, 8, 580.0, '2021-01-09 20:19:19', '2021-01-09 20:19:19', NULL),
(680, 375, 15, NULL, '2021-01-09 20:19:19', '2021-01-09 20:19:19', NULL),
(681, 376, 7, 600.0, '2021-01-09 20:19:38', '2021-01-09 20:19:38', NULL),
(682, 376, 8, 580.0, '2021-01-09 20:19:38', '2021-01-09 20:19:38', NULL),
(683, 376, 15, NULL, '2021-01-09 20:19:38', '2021-01-09 20:19:38', NULL),
(684, 377, 7, 600.0, '2021-01-20 15:29:08', '2021-01-20 15:29:08', NULL),
(685, 377, 8, 580.0, '2021-01-20 15:29:08', '2021-01-20 15:29:08', NULL),
(686, 377, 15, NULL, '2021-01-20 15:29:08', '2021-01-20 15:29:08', NULL),
(687, 378, 3, 17.0, '2021-01-21 15:31:05', '2021-01-21 15:31:05', NULL),
(688, 378, 4, 17.0, '2021-01-21 15:31:05', '2021-01-21 15:31:05', NULL),
(689, 378, 10, 17.0, '2021-01-21 15:31:05', '2021-01-21 15:31:05', NULL),
(690, 378, 11, 17.0, '2021-01-21 15:31:05', '2021-01-21 15:31:05', NULL),
(691, 379, 9, 5.5, '2021-01-21 15:31:05', '2021-01-21 15:31:05', NULL),
(692, 379, 12, 5.5, '2021-01-21 15:31:05', '2021-01-21 15:31:05', NULL),
(693, 379, 13, 5.5, '2021-01-21 15:31:05', '2021-01-21 15:31:05', NULL),
(694, 379, 14, 5.5, '2021-01-21 15:31:05', '2021-01-21 15:31:05', NULL),
(695, 380, 3, 17.0, '2021-01-21 15:33:04', '2021-01-21 15:33:04', NULL),
(696, 380, 4, 17.0, '2021-01-21 15:33:04', '2021-01-21 15:33:04', NULL),
(697, 380, 10, 17.0, '2021-01-21 15:33:04', '2021-01-21 15:33:04', NULL),
(698, 380, 11, 17.0, '2021-01-21 15:33:04', '2021-01-21 15:33:04', NULL),
(699, 381, 9, 5.5, '2021-01-21 15:33:04', '2021-01-21 15:33:04', NULL),
(700, 381, 12, 5.5, '2021-01-21 15:33:04', '2021-01-21 15:33:04', NULL),
(701, 381, 13, 5.5, '2021-01-21 15:33:04', '2021-01-21 15:33:04', NULL),
(702, 381, 14, 5.5, '2021-01-21 15:33:04', '2021-01-21 15:33:04', NULL),
(703, 382, 3, 17.0, '2021-01-21 15:33:30', '2021-01-21 15:33:30', NULL),
(704, 382, 4, 17.0, '2021-01-21 15:33:30', '2021-01-21 15:33:30', NULL),
(705, 382, 10, 17.0, '2021-01-21 15:33:30', '2021-01-21 15:33:30', NULL),
(706, 382, 11, 17.0, '2021-01-21 15:33:30', '2021-01-21 15:33:30', NULL),
(707, 383, 9, 5.5, '2021-01-21 15:33:30', '2021-01-21 15:33:30', NULL),
(708, 383, 12, 5.5, '2021-01-21 15:33:30', '2021-01-21 15:33:30', NULL),
(709, 383, 13, 5.5, '2021-01-21 15:33:30', '2021-01-21 15:33:30', NULL);
INSERT INTO `institution_program_exam_requirement_details` (`id`, `requirement_id`, `subsection_id`, `score`, `created_at`, `updated_at`, `deleted_at`) VALUES
(710, 383, 14, 5.5, '2021-01-21 15:33:30', '2021-01-21 15:33:30', NULL),
(711, 384, 7, 600.0, '2021-01-22 07:31:01', '2021-01-22 07:31:01', NULL),
(712, 384, 8, 580.0, '2021-01-22 07:31:01', '2021-01-22 07:31:01', NULL),
(713, 384, 15, NULL, '2021-01-22 07:31:01', '2021-01-22 07:31:01', NULL),
(714, 385, 7, NULL, '2021-01-22 17:35:13', '2021-01-22 17:35:13', NULL),
(715, 385, 8, NULL, '2021-01-22 17:35:13', '2021-01-22 17:35:13', NULL),
(716, 385, 15, NULL, '2021-01-22 17:35:13', '2021-01-22 17:35:13', NULL),
(717, 386, 7, NULL, '2021-01-22 17:35:48', '2021-01-22 17:35:48', NULL),
(718, 386, 8, NULL, '2021-01-22 17:35:48', '2021-01-22 17:35:48', NULL),
(719, 386, 15, NULL, '2021-01-22 17:35:48', '2021-01-22 17:35:48', NULL),
(720, 387, 7, 600.0, '2021-01-22 17:36:09', '2021-01-22 17:36:09', NULL),
(721, 387, 8, 580.0, '2021-01-22 17:36:09', '2021-01-22 17:36:09', NULL),
(722, 387, 15, NULL, '2021-01-22 17:36:09', '2021-01-22 17:36:09', NULL),
(723, 388, 7, 600.0, '2021-01-22 17:36:39', '2021-01-22 17:36:39', NULL),
(724, 388, 8, 580.0, '2021-01-22 17:36:39', '2021-01-22 17:36:39', NULL),
(725, 388, 15, NULL, '2021-01-22 17:36:39', '2021-01-22 17:36:39', NULL),
(726, 389, 7, 600.0, '2021-01-22 17:36:51', '2021-01-22 17:36:51', NULL),
(727, 389, 8, 580.0, '2021-01-22 17:36:51', '2021-01-22 17:36:51', NULL),
(728, 389, 15, NULL, '2021-01-22 17:36:51', '2021-01-22 17:36:51', NULL),
(729, 390, 7, 600.0, '2021-01-22 17:37:03', '2021-01-22 17:37:03', NULL),
(730, 390, 8, 580.0, '2021-01-22 17:37:03', '2021-01-22 17:37:03', NULL),
(731, 390, 15, NULL, '2021-01-22 17:37:03', '2021-01-22 17:37:03', NULL),
(732, 391, 7, 600.0, '2021-01-22 17:37:22', '2021-01-22 17:37:22', NULL),
(733, 391, 8, 580.0, '2021-01-22 17:37:22', '2021-01-22 17:37:22', NULL),
(734, 391, 15, NULL, '2021-01-22 17:37:22', '2021-01-22 17:37:22', NULL),
(735, 392, 7, 600.0, '2021-01-22 17:37:49', '2021-01-22 17:37:49', NULL),
(736, 392, 8, 580.0, '2021-01-22 17:37:49', '2021-01-22 17:37:49', NULL),
(737, 392, 15, NULL, '2021-01-22 17:37:49', '2021-01-22 17:37:49', NULL),
(738, 393, 7, 600.0, '2021-01-22 17:38:12', '2021-01-22 17:38:12', NULL),
(739, 393, 8, 580.0, '2021-01-22 17:38:12', '2021-01-22 17:38:12', NULL),
(740, 393, 15, NULL, '2021-01-22 17:38:12', '2021-01-22 17:38:12', NULL),
(741, 394, 7, 600.0, '2021-01-22 17:38:12', '2021-01-22 17:38:12', NULL),
(742, 394, 8, 580.0, '2021-01-22 17:38:12', '2021-01-22 17:38:12', NULL),
(743, 394, 15, NULL, '2021-01-22 17:38:12', '2021-01-22 17:38:12', NULL),
(744, 395, 7, 600.0, '2021-01-22 17:38:34', '2021-01-22 17:38:34', NULL),
(745, 395, 8, 580.0, '2021-01-22 17:38:34', '2021-01-22 17:38:34', NULL),
(746, 395, 15, NULL, '2021-01-22 17:38:34', '2021-01-22 17:38:34', NULL),
(747, 396, 7, 600.0, '2021-01-22 17:38:56', '2021-01-22 17:38:56', NULL),
(748, 396, 8, 580.0, '2021-01-22 17:38:56', '2021-01-22 17:38:56', NULL),
(749, 396, 15, NULL, '2021-01-22 17:38:56', '2021-01-22 17:38:56', NULL),
(750, 397, 3, 17.0, '2021-02-06 10:24:52', '2021-02-06 10:24:52', NULL),
(751, 397, 4, 17.0, '2021-02-06 10:24:52', '2021-02-06 10:24:52', NULL),
(752, 397, 10, 17.0, '2021-02-06 10:24:52', '2021-02-06 10:24:52', NULL),
(753, 397, 11, 17.0, '2021-02-06 10:24:52', '2021-02-06 10:24:52', NULL),
(754, 398, 9, 5.5, '2021-02-06 10:24:52', '2021-02-06 10:24:52', NULL),
(755, 398, 12, 5.5, '2021-02-06 10:24:52', '2021-02-06 10:24:52', NULL),
(756, 398, 13, 5.5, '2021-02-06 10:24:52', '2021-02-06 10:24:52', NULL),
(757, 398, 14, 5.5, '2021-02-06 10:24:52', '2021-02-06 10:24:52', NULL),
(758, 399, 3, NULL, '2021-02-10 06:34:26', '2021-02-10 06:34:26', NULL),
(759, 399, 4, NULL, '2021-02-10 06:34:26', '2021-02-10 06:34:26', NULL),
(760, 399, 10, NULL, '2021-02-10 06:34:26', '2021-02-10 06:34:26', NULL),
(761, 399, 11, NULL, '2021-02-10 06:34:26', '2021-02-10 06:34:26', NULL),
(762, 400, 9, 6.0, '2021-02-10 06:34:26', '2021-02-10 06:34:26', NULL),
(763, 400, 12, 6.0, '2021-02-10 06:34:26', '2021-02-10 06:34:26', NULL),
(764, 400, 13, 6.0, '2021-02-10 06:34:26', '2021-02-10 06:34:26', NULL),
(765, 400, 14, 6.0, '2021-02-10 06:34:26', '2021-02-10 06:34:26', NULL),
(766, 401, 3, NULL, '2021-02-10 07:36:48', '2021-02-10 07:36:48', NULL),
(767, 401, 4, NULL, '2021-02-10 07:36:48', '2021-02-10 07:36:48', NULL),
(768, 401, 10, NULL, '2021-02-10 07:36:48', '2021-02-10 07:36:48', NULL),
(769, 401, 11, NULL, '2021-02-10 07:36:48', '2021-02-10 07:36:48', NULL),
(770, 402, 9, 6.0, '2021-02-10 07:36:48', '2021-02-10 07:36:48', NULL),
(771, 402, 12, 6.0, '2021-02-10 07:36:48', '2021-02-10 07:36:48', NULL),
(772, 402, 13, 6.0, '2021-02-10 07:36:48', '2021-02-10 07:36:48', NULL),
(773, 402, 14, 6.0, '2021-02-10 07:36:48', '2021-02-10 07:36:48', NULL),
(774, 403, 3, NULL, '2021-02-10 07:37:43', '2021-02-10 07:37:43', NULL),
(775, 403, 4, NULL, '2021-02-10 07:37:43', '2021-02-10 07:37:43', NULL),
(776, 403, 10, NULL, '2021-02-10 07:37:43', '2021-02-10 07:37:43', NULL),
(777, 403, 11, NULL, '2021-02-10 07:37:43', '2021-02-10 07:37:43', NULL),
(778, 404, 9, 6.0, '2021-02-10 07:37:43', '2021-02-10 07:37:43', NULL),
(779, 404, 12, 6.0, '2021-02-10 07:37:43', '2021-02-10 07:37:43', NULL),
(780, 404, 13, 6.0, '2021-02-10 07:37:43', '2021-02-10 07:37:43', NULL),
(781, 404, 14, 6.0, '2021-02-10 07:37:43', '2021-02-10 07:37:43', NULL),
(782, 405, 3, NULL, '2021-02-10 07:38:10', '2021-02-10 07:38:10', NULL),
(783, 405, 4, NULL, '2021-02-10 07:38:10', '2021-02-10 07:38:10', NULL),
(784, 405, 10, NULL, '2021-02-10 07:38:10', '2021-02-10 07:38:10', NULL),
(785, 405, 11, NULL, '2021-02-10 07:38:10', '2021-02-10 07:38:10', NULL),
(786, 406, 9, 6.0, '2021-02-10 07:38:10', '2021-02-10 07:38:10', NULL),
(787, 406, 12, 6.0, '2021-02-10 07:38:10', '2021-02-10 07:38:10', NULL),
(788, 406, 13, 6.0, '2021-02-10 07:38:10', '2021-02-10 07:38:10', NULL),
(789, 406, 14, 6.0, '2021-02-10 07:38:10', '2021-02-10 07:38:10', NULL),
(790, 407, 3, NULL, '2021-02-10 07:53:13', '2021-02-10 07:53:13', NULL),
(791, 407, 4, NULL, '2021-02-10 07:53:13', '2021-02-10 07:53:13', NULL),
(792, 407, 10, NULL, '2021-02-10 07:53:13', '2021-02-10 07:53:13', NULL),
(793, 407, 11, NULL, '2021-02-10 07:53:13', '2021-02-10 07:53:13', NULL),
(794, 408, 9, 6.0, '2021-02-10 07:53:13', '2021-02-10 07:53:13', NULL),
(795, 408, 12, 6.0, '2021-02-10 07:53:13', '2021-02-10 07:53:13', NULL),
(796, 408, 13, 6.0, '2021-02-10 07:53:13', '2021-02-10 07:53:13', NULL),
(797, 408, 14, 6.0, '2021-02-10 07:53:13', '2021-02-10 07:53:13', NULL),
(798, 409, 3, NULL, '2021-02-10 07:57:58', '2021-02-10 07:57:58', NULL),
(799, 409, 4, NULL, '2021-02-10 07:57:58', '2021-02-10 07:57:58', NULL),
(800, 409, 10, NULL, '2021-02-10 07:57:58', '2021-02-10 07:57:58', NULL),
(801, 409, 11, NULL, '2021-02-10 07:57:58', '2021-02-10 07:57:58', NULL),
(802, 410, 9, 6.0, '2021-02-10 07:57:58', '2021-02-10 07:57:58', NULL),
(803, 410, 12, 6.0, '2021-02-10 07:57:58', '2021-02-10 07:57:58', NULL),
(804, 410, 13, 6.0, '2021-02-10 07:57:58', '2021-02-10 07:57:58', NULL),
(805, 410, 14, 6.0, '2021-02-10 07:57:58', '2021-02-10 07:57:58', NULL),
(806, 411, 3, NULL, '2021-02-10 07:58:27', '2021-02-10 07:58:27', NULL),
(807, 411, 4, NULL, '2021-02-10 07:58:27', '2021-02-10 07:58:27', NULL),
(808, 411, 10, NULL, '2021-02-10 07:58:27', '2021-02-10 07:58:27', NULL),
(809, 411, 11, NULL, '2021-02-10 07:58:27', '2021-02-10 07:58:27', NULL),
(810, 412, 9, 6.0, '2021-02-10 07:58:27', '2021-02-10 07:58:27', NULL),
(811, 412, 12, 6.0, '2021-02-10 07:58:27', '2021-02-10 07:58:27', NULL),
(812, 412, 13, 6.0, '2021-02-10 07:58:27', '2021-02-10 07:58:27', NULL),
(813, 412, 14, 6.0, '2021-02-10 07:58:27', '2021-02-10 07:58:27', NULL),
(814, 413, 3, NULL, '2021-02-10 08:03:50', '2021-02-10 08:03:50', NULL),
(815, 413, 4, NULL, '2021-02-10 08:03:50', '2021-02-10 08:03:50', NULL),
(816, 413, 10, NULL, '2021-02-10 08:03:50', '2021-02-10 08:03:50', NULL),
(817, 413, 11, NULL, '2021-02-10 08:03:50', '2021-02-10 08:03:50', NULL),
(818, 414, 9, 6.0, '2021-02-10 08:03:50', '2021-02-10 08:03:50', NULL),
(819, 414, 12, 6.0, '2021-02-10 08:03:50', '2021-02-10 08:03:50', NULL),
(820, 414, 13, 6.0, '2021-02-10 08:03:50', '2021-02-10 08:03:50', NULL),
(821, 414, 14, 6.0, '2021-02-10 08:03:50', '2021-02-10 08:03:50', NULL),
(822, 415, 3, NULL, '2021-02-10 08:05:08', '2021-02-10 08:05:08', NULL),
(823, 415, 4, NULL, '2021-02-10 08:05:08', '2021-02-10 08:05:08', NULL),
(824, 415, 10, NULL, '2021-02-10 08:05:08', '2021-02-10 08:05:08', NULL),
(825, 415, 11, NULL, '2021-02-10 08:05:08', '2021-02-10 08:05:08', NULL),
(826, 416, 9, 6.0, '2021-02-10 08:05:08', '2021-02-10 08:05:08', NULL),
(827, 416, 12, 6.0, '2021-02-10 08:05:08', '2021-02-10 08:05:08', NULL),
(828, 416, 13, 6.0, '2021-02-10 08:05:08', '2021-02-10 08:05:08', NULL),
(829, 416, 14, 6.0, '2021-02-10 08:05:08', '2021-02-10 08:05:08', NULL),
(830, 417, 3, NULL, '2021-02-10 08:11:51', '2021-02-10 08:11:51', NULL),
(831, 417, 4, NULL, '2021-02-10 08:11:51', '2021-02-10 08:11:51', NULL),
(832, 417, 10, NULL, '2021-02-10 08:11:51', '2021-02-10 08:11:51', NULL),
(833, 417, 11, NULL, '2021-02-10 08:11:51', '2021-02-10 08:11:51', NULL),
(834, 418, 9, 6.0, '2021-02-10 08:11:51', '2021-02-10 08:11:51', NULL),
(835, 418, 12, 6.0, '2021-02-10 08:11:51', '2021-02-10 08:11:51', NULL),
(836, 418, 13, 6.0, '2021-02-10 08:11:51', '2021-02-10 08:11:51', NULL),
(837, 418, 14, 6.0, '2021-02-10 08:11:51', '2021-02-10 08:11:51', NULL),
(838, 419, 3, NULL, '2021-02-10 08:13:10', '2021-02-10 08:13:10', NULL),
(839, 419, 4, NULL, '2021-02-10 08:13:10', '2021-02-10 08:13:10', NULL),
(840, 419, 10, NULL, '2021-02-10 08:13:10', '2021-02-10 08:13:10', NULL),
(841, 419, 11, NULL, '2021-02-10 08:13:10', '2021-02-10 08:13:10', NULL),
(842, 420, 9, 6.0, '2021-02-10 08:13:10', '2021-02-10 08:13:10', NULL),
(843, 420, 12, 6.0, '2021-02-10 08:13:10', '2021-02-10 08:13:10', NULL),
(844, 420, 13, 6.0, '2021-02-10 08:13:10', '2021-02-10 08:13:10', NULL),
(845, 420, 14, 6.0, '2021-02-10 08:13:10', '2021-02-10 08:13:10', NULL),
(846, 421, 3, NULL, '2021-02-10 08:14:20', '2021-02-10 08:14:20', NULL),
(847, 421, 4, NULL, '2021-02-10 08:14:20', '2021-02-10 08:14:20', NULL),
(848, 421, 10, NULL, '2021-02-10 08:14:20', '2021-02-10 08:14:20', NULL),
(849, 421, 11, NULL, '2021-02-10 08:14:20', '2021-02-10 08:14:20', NULL),
(850, 422, 9, 6.0, '2021-02-10 08:14:20', '2021-02-10 08:14:20', NULL),
(851, 422, 12, 6.0, '2021-02-10 08:14:20', '2021-02-10 08:14:20', NULL),
(852, 422, 13, 6.0, '2021-02-10 08:14:20', '2021-02-10 08:14:20', NULL),
(853, 422, 14, 6.0, '2021-02-10 08:14:20', '2021-02-10 08:14:20', NULL),
(854, 423, 3, NULL, '2021-02-10 08:14:59', '2021-02-10 08:14:59', NULL),
(855, 423, 4, NULL, '2021-02-10 08:14:59', '2021-02-10 08:14:59', NULL),
(856, 423, 10, NULL, '2021-02-10 08:14:59', '2021-02-10 08:14:59', NULL),
(857, 423, 11, NULL, '2021-02-10 08:14:59', '2021-02-10 08:14:59', NULL),
(858, 424, 9, 6.0, '2021-02-10 08:14:59', '2021-02-10 08:14:59', NULL),
(859, 424, 12, 6.0, '2021-02-10 08:14:59', '2021-02-10 08:14:59', NULL),
(860, 424, 13, 6.0, '2021-02-10 08:14:59', '2021-02-10 08:14:59', NULL),
(861, 424, 14, 6.0, '2021-02-10 08:14:59', '2021-02-10 08:14:59', NULL),
(862, 425, 3, NULL, '2021-02-10 08:15:28', '2021-02-10 08:15:28', NULL),
(863, 425, 4, NULL, '2021-02-10 08:15:28', '2021-02-10 08:15:28', NULL),
(864, 425, 10, NULL, '2021-02-10 08:15:28', '2021-02-10 08:15:28', NULL),
(865, 425, 11, NULL, '2021-02-10 08:15:28', '2021-02-10 08:15:28', NULL),
(866, 426, 9, 6.0, '2021-02-10 08:15:28', '2021-02-10 08:15:28', NULL),
(867, 426, 12, 6.0, '2021-02-10 08:15:28', '2021-02-10 08:15:28', NULL),
(868, 426, 13, 6.0, '2021-02-10 08:15:28', '2021-02-10 08:15:28', NULL),
(869, 426, 14, 6.0, '2021-02-10 08:15:28', '2021-02-10 08:15:28', NULL),
(870, 427, 3, NULL, '2021-02-10 08:16:10', '2021-02-10 08:16:10', NULL),
(871, 427, 4, NULL, '2021-02-10 08:16:10', '2021-02-10 08:16:10', NULL),
(872, 427, 10, NULL, '2021-02-10 08:16:10', '2021-02-10 08:16:10', NULL),
(873, 427, 11, NULL, '2021-02-10 08:16:10', '2021-02-10 08:16:10', NULL),
(874, 428, 9, 6.0, '2021-02-10 08:16:10', '2021-02-10 08:16:10', NULL),
(875, 428, 12, 6.0, '2021-02-10 08:16:10', '2021-02-10 08:16:10', NULL),
(876, 428, 13, 6.0, '2021-02-10 08:16:10', '2021-02-10 08:16:10', NULL),
(877, 428, 14, 6.0, '2021-02-10 08:16:10', '2021-02-10 08:16:10', NULL),
(878, 429, 3, NULL, '2021-02-10 08:20:46', '2021-02-10 08:20:46', NULL),
(879, 429, 4, NULL, '2021-02-10 08:20:46', '2021-02-10 08:20:46', NULL),
(880, 429, 10, NULL, '2021-02-10 08:20:46', '2021-02-10 08:20:46', NULL),
(881, 429, 11, NULL, '2021-02-10 08:20:46', '2021-02-10 08:20:46', NULL),
(882, 430, 9, 6.0, '2021-02-10 08:20:47', '2021-02-10 08:20:47', NULL),
(883, 430, 12, 6.0, '2021-02-10 08:20:47', '2021-02-10 08:20:47', NULL),
(884, 430, 13, 6.0, '2021-02-10 08:20:47', '2021-02-10 08:20:47', NULL),
(885, 430, 14, 6.0, '2021-02-10 08:20:47', '2021-02-10 08:20:47', NULL),
(886, 431, 3, NULL, '2021-02-10 08:22:14', '2021-02-10 08:22:14', NULL),
(887, 431, 4, NULL, '2021-02-10 08:22:14', '2021-02-10 08:22:14', NULL),
(888, 431, 10, NULL, '2021-02-10 08:22:14', '2021-02-10 08:22:14', NULL),
(889, 431, 11, NULL, '2021-02-10 08:22:14', '2021-02-10 08:22:14', NULL),
(890, 432, 9, 6.0, '2021-02-10 08:22:14', '2021-02-10 08:22:14', NULL),
(891, 432, 12, 6.0, '2021-02-10 08:22:14', '2021-02-10 08:22:14', NULL),
(892, 432, 13, 6.0, '2021-02-10 08:22:14', '2021-02-10 08:22:14', NULL),
(893, 432, 14, 6.0, '2021-02-10 08:22:14', '2021-02-10 08:22:14', NULL),
(894, 433, 3, NULL, '2021-02-10 08:22:54', '2021-02-10 08:22:54', NULL),
(895, 433, 4, NULL, '2021-02-10 08:22:54', '2021-02-10 08:22:54', NULL),
(896, 433, 10, NULL, '2021-02-10 08:22:54', '2021-02-10 08:22:54', NULL),
(897, 433, 11, NULL, '2021-02-10 08:22:54', '2021-02-10 08:22:54', NULL),
(898, 434, 9, 6.0, '2021-02-10 08:22:54', '2021-02-10 08:22:54', NULL),
(899, 434, 12, 6.0, '2021-02-10 08:22:54', '2021-02-10 08:22:54', NULL),
(900, 434, 13, 6.0, '2021-02-10 08:22:54', '2021-02-10 08:22:54', NULL),
(901, 434, 14, 6.0, '2021-02-10 08:22:54', '2021-02-10 08:22:54', NULL),
(902, 435, 3, NULL, '2021-02-10 08:23:31', '2021-02-10 08:23:31', NULL),
(903, 435, 4, NULL, '2021-02-10 08:23:31', '2021-02-10 08:23:31', NULL),
(904, 435, 10, NULL, '2021-02-10 08:23:31', '2021-02-10 08:23:31', NULL),
(905, 435, 11, NULL, '2021-02-10 08:23:31', '2021-02-10 08:23:31', NULL),
(906, 436, 9, 6.0, '2021-02-10 08:23:31', '2021-02-10 08:23:31', NULL),
(907, 436, 12, 6.0, '2021-02-10 08:23:31', '2021-02-10 08:23:31', NULL),
(908, 436, 13, 6.0, '2021-02-10 08:23:31', '2021-02-10 08:23:31', NULL),
(909, 436, 14, 6.0, '2021-02-10 08:23:31', '2021-02-10 08:23:31', NULL),
(910, 437, 3, NULL, '2021-02-10 08:25:03', '2021-02-10 08:25:03', NULL),
(911, 437, 4, NULL, '2021-02-10 08:25:03', '2021-02-10 08:25:03', NULL),
(912, 437, 10, NULL, '2021-02-10 08:25:03', '2021-02-10 08:25:03', NULL),
(913, 437, 11, NULL, '2021-02-10 08:25:03', '2021-02-10 08:25:03', NULL),
(914, 438, 9, 6.0, '2021-02-10 08:25:03', '2021-02-10 08:25:03', NULL),
(915, 438, 12, 6.0, '2021-02-10 08:25:03', '2021-02-10 08:25:03', NULL),
(916, 438, 13, 6.0, '2021-02-10 08:25:03', '2021-02-10 08:25:03', NULL),
(917, 438, 14, 6.0, '2021-02-10 08:25:03', '2021-02-10 08:25:03', NULL),
(918, 439, 3, NULL, '2021-02-10 08:26:00', '2021-02-10 08:26:00', NULL),
(919, 439, 4, NULL, '2021-02-10 08:26:00', '2021-02-10 08:26:00', NULL),
(920, 439, 10, NULL, '2021-02-10 08:26:00', '2021-02-10 08:26:00', NULL),
(921, 439, 11, NULL, '2021-02-10 08:26:00', '2021-02-10 08:26:00', NULL),
(922, 440, 9, 6.0, '2021-02-10 08:26:00', '2021-02-10 08:26:00', NULL),
(923, 440, 12, 6.0, '2021-02-10 08:26:00', '2021-02-10 08:26:00', NULL),
(924, 440, 13, 6.0, '2021-02-10 08:26:00', '2021-02-10 08:26:00', NULL),
(925, 440, 14, 6.0, '2021-02-10 08:26:00', '2021-02-10 08:26:00', NULL),
(926, 441, 3, NULL, '2021-02-10 08:29:10', '2021-02-10 08:29:10', NULL),
(927, 441, 4, NULL, '2021-02-10 08:29:10', '2021-02-10 08:29:10', NULL),
(928, 441, 10, NULL, '2021-02-10 08:29:10', '2021-02-10 08:29:10', NULL),
(929, 441, 11, NULL, '2021-02-10 08:29:10', '2021-02-10 08:29:10', NULL),
(930, 442, 9, 6.0, '2021-02-10 08:29:10', '2021-02-10 08:29:10', NULL),
(931, 442, 12, 6.0, '2021-02-10 08:29:10', '2021-02-10 08:29:10', NULL),
(932, 442, 13, 6.0, '2021-02-10 08:29:10', '2021-02-10 08:29:10', NULL),
(933, 442, 14, 6.0, '2021-02-10 08:29:10', '2021-02-10 08:29:10', NULL),
(934, 443, 3, NULL, '2021-02-10 08:49:32', '2021-02-10 08:49:32', NULL),
(935, 443, 4, NULL, '2021-02-10 08:49:32', '2021-02-10 08:49:32', NULL),
(936, 443, 10, NULL, '2021-02-10 08:49:32', '2021-02-10 08:49:32', NULL),
(937, 443, 11, NULL, '2021-02-10 08:49:32', '2021-02-10 08:49:32', NULL),
(938, 444, 9, 6.0, '2021-02-10 08:49:32', '2021-02-10 08:49:32', NULL),
(939, 444, 12, 6.0, '2021-02-10 08:49:32', '2021-02-10 08:49:32', NULL),
(940, 444, 13, 6.0, '2021-02-10 08:49:32', '2021-02-10 08:49:32', NULL),
(941, 444, 14, 6.0, '2021-02-10 08:49:32', '2021-02-10 08:49:32', NULL),
(942, 445, 3, NULL, '2021-02-10 08:50:12', '2021-02-10 08:50:12', NULL),
(943, 445, 4, NULL, '2021-02-10 08:50:12', '2021-02-10 08:50:12', NULL),
(944, 445, 10, NULL, '2021-02-10 08:50:12', '2021-02-10 08:50:12', NULL),
(945, 445, 11, NULL, '2021-02-10 08:50:12', '2021-02-10 08:50:12', NULL),
(946, 446, 9, 6.0, '2021-02-10 08:50:12', '2021-02-10 08:50:12', NULL),
(947, 446, 12, 6.0, '2021-02-10 08:50:12', '2021-02-10 08:50:12', NULL),
(948, 446, 13, 6.0, '2021-02-10 08:50:12', '2021-02-10 08:50:12', NULL),
(949, 446, 14, 6.0, '2021-02-10 08:50:12', '2021-02-10 08:50:12', NULL),
(950, 447, 3, NULL, '2021-02-10 08:52:21', '2021-02-10 08:52:21', NULL),
(951, 447, 4, NULL, '2021-02-10 08:52:21', '2021-02-10 08:52:21', NULL),
(952, 447, 10, NULL, '2021-02-10 08:52:21', '2021-02-10 08:52:21', NULL),
(953, 447, 11, NULL, '2021-02-10 08:52:21', '2021-02-10 08:52:21', NULL),
(954, 448, 9, 6.0, '2021-02-10 08:52:21', '2021-02-10 08:52:21', NULL),
(955, 448, 12, 6.0, '2021-02-10 08:52:21', '2021-02-10 08:52:21', NULL),
(956, 448, 13, 6.0, '2021-02-10 08:52:21', '2021-02-10 08:52:21', NULL),
(957, 448, 14, 6.0, '2021-02-10 08:52:21', '2021-02-10 08:52:21', NULL),
(958, 449, 3, NULL, '2021-02-10 08:57:59', '2021-02-10 08:57:59', NULL),
(959, 449, 4, NULL, '2021-02-10 08:57:59', '2021-02-10 08:57:59', NULL),
(960, 449, 10, NULL, '2021-02-10 08:57:59', '2021-02-10 08:57:59', NULL),
(961, 449, 11, NULL, '2021-02-10 08:57:59', '2021-02-10 08:57:59', NULL),
(962, 450, 9, 6.0, '2021-02-10 08:57:59', '2021-02-10 08:57:59', NULL),
(963, 450, 12, 6.0, '2021-02-10 08:57:59', '2021-02-10 08:57:59', NULL),
(964, 450, 13, 6.0, '2021-02-10 08:57:59', '2021-02-10 08:57:59', NULL),
(965, 450, 14, 6.0, '2021-02-10 08:57:59', '2021-02-10 08:57:59', NULL),
(966, 451, 3, NULL, '2021-02-10 08:59:05', '2021-02-10 08:59:05', NULL),
(967, 451, 4, NULL, '2021-02-10 08:59:05', '2021-02-10 08:59:05', NULL),
(968, 451, 10, NULL, '2021-02-10 08:59:05', '2021-02-10 08:59:05', NULL),
(969, 451, 11, NULL, '2021-02-10 08:59:05', '2021-02-10 08:59:05', NULL),
(970, 452, 9, 6.0, '2021-02-10 08:59:05', '2021-02-10 08:59:05', NULL),
(971, 452, 12, 6.0, '2021-02-10 08:59:05', '2021-02-10 08:59:05', NULL),
(972, 452, 13, 6.0, '2021-02-10 08:59:05', '2021-02-10 08:59:05', NULL),
(973, 452, 14, 6.0, '2021-02-10 08:59:05', '2021-02-10 08:59:05', NULL),
(974, 453, 3, NULL, '2021-02-10 08:59:51', '2021-02-10 08:59:51', NULL),
(975, 453, 4, NULL, '2021-02-10 08:59:51', '2021-02-10 08:59:51', NULL),
(976, 453, 10, NULL, '2021-02-10 08:59:51', '2021-02-10 08:59:51', NULL),
(977, 453, 11, NULL, '2021-02-10 08:59:51', '2021-02-10 08:59:51', NULL),
(978, 454, 9, 6.0, '2021-02-10 08:59:51', '2021-02-10 08:59:51', NULL),
(979, 454, 12, 6.0, '2021-02-10 08:59:51', '2021-02-10 08:59:51', NULL),
(980, 454, 13, 6.0, '2021-02-10 08:59:51', '2021-02-10 08:59:51', NULL),
(981, 454, 14, 6.0, '2021-02-10 08:59:51', '2021-02-10 08:59:51', NULL),
(982, 455, 3, NULL, '2021-02-10 09:00:46', '2021-02-10 09:00:46', NULL),
(983, 455, 4, NULL, '2021-02-10 09:00:46', '2021-02-10 09:00:46', NULL),
(984, 455, 10, NULL, '2021-02-10 09:00:46', '2021-02-10 09:00:46', NULL),
(985, 455, 11, NULL, '2021-02-10 09:00:46', '2021-02-10 09:00:46', NULL),
(986, 456, 9, 6.0, '2021-02-10 09:00:46', '2021-02-10 09:00:46', NULL),
(987, 456, 12, 6.0, '2021-02-10 09:00:46', '2021-02-10 09:00:46', NULL),
(988, 456, 13, 6.0, '2021-02-10 09:00:46', '2021-02-10 09:00:46', NULL),
(989, 456, 14, 6.0, '2021-02-10 09:00:46', '2021-02-10 09:00:46', NULL),
(990, 457, 3, NULL, '2021-02-10 09:04:54', '2021-02-10 09:04:54', NULL),
(991, 457, 4, NULL, '2021-02-10 09:04:54', '2021-02-10 09:04:54', NULL),
(992, 457, 10, NULL, '2021-02-10 09:04:54', '2021-02-10 09:04:54', NULL),
(993, 457, 11, NULL, '2021-02-10 09:04:54', '2021-02-10 09:04:54', NULL),
(994, 458, 9, 6.0, '2021-02-10 09:04:54', '2021-02-10 09:04:54', NULL),
(995, 458, 12, 6.0, '2021-02-10 09:04:54', '2021-02-10 09:04:54', NULL),
(996, 458, 13, 6.0, '2021-02-10 09:04:54', '2021-02-10 09:04:54', NULL),
(997, 458, 14, 6.0, '2021-02-10 09:04:54', '2021-02-10 09:04:54', NULL),
(998, 459, 3, NULL, '2021-02-10 09:05:22', '2021-02-10 09:05:22', NULL),
(999, 459, 4, NULL, '2021-02-10 09:05:22', '2021-02-10 09:05:22', NULL),
(1000, 459, 10, NULL, '2021-02-10 09:05:22', '2021-02-10 09:05:22', NULL),
(1001, 459, 11, NULL, '2021-02-10 09:05:22', '2021-02-10 09:05:22', NULL),
(1002, 460, 9, 6.0, '2021-02-10 09:05:22', '2021-02-10 09:05:22', NULL),
(1003, 460, 12, 6.0, '2021-02-10 09:05:22', '2021-02-10 09:05:22', NULL),
(1004, 460, 13, 6.0, '2021-02-10 09:05:22', '2021-02-10 09:05:22', NULL),
(1005, 460, 14, 6.0, '2021-02-10 09:05:22', '2021-02-10 09:05:22', NULL),
(1006, 461, 3, NULL, '2021-02-10 09:18:25', '2021-02-10 09:18:25', NULL),
(1007, 461, 4, NULL, '2021-02-10 09:18:25', '2021-02-10 09:18:25', NULL),
(1008, 461, 10, NULL, '2021-02-10 09:18:25', '2021-02-10 09:18:25', NULL),
(1009, 461, 11, NULL, '2021-02-10 09:18:25', '2021-02-10 09:18:25', NULL),
(1010, 462, 9, 6.0, '2021-02-10 09:18:25', '2021-02-10 09:18:25', NULL),
(1011, 462, 12, 6.0, '2021-02-10 09:18:25', '2021-02-10 09:18:25', NULL),
(1012, 462, 13, 6.0, '2021-02-10 09:18:25', '2021-02-10 09:18:25', NULL),
(1013, 462, 14, 6.0, '2021-02-10 09:18:25', '2021-02-10 09:18:25', NULL),
(1014, 463, 3, NULL, '2021-02-10 09:20:23', '2021-02-10 09:20:23', NULL),
(1015, 463, 4, NULL, '2021-02-10 09:20:23', '2021-02-10 09:20:23', NULL),
(1016, 463, 10, NULL, '2021-02-10 09:20:23', '2021-02-10 09:20:23', NULL),
(1017, 463, 11, NULL, '2021-02-10 09:20:23', '2021-02-10 09:20:23', NULL),
(1018, 464, 9, 6.0, '2021-02-10 09:20:23', '2021-02-10 09:20:23', NULL),
(1019, 464, 12, 6.0, '2021-02-10 09:20:23', '2021-02-10 09:20:23', NULL),
(1020, 464, 13, 6.0, '2021-02-10 09:20:23', '2021-02-10 09:20:23', NULL),
(1021, 464, 14, 6.0, '2021-02-10 09:20:23', '2021-02-10 09:20:23', NULL),
(1022, 465, 3, NULL, '2021-02-10 09:52:41', '2021-02-10 09:52:41', NULL),
(1023, 465, 4, NULL, '2021-02-10 09:52:41', '2021-02-10 09:52:41', NULL),
(1024, 465, 10, NULL, '2021-02-10 09:52:41', '2021-02-10 09:52:41', NULL),
(1025, 465, 11, NULL, '2021-02-10 09:52:41', '2021-02-10 09:52:41', NULL),
(1026, 466, 9, 6.0, '2021-02-10 09:52:41', '2021-02-10 09:52:41', NULL),
(1027, 466, 12, 6.0, '2021-02-10 09:52:41', '2021-02-10 09:52:41', NULL),
(1028, 466, 13, 6.0, '2021-02-10 09:52:41', '2021-02-10 09:52:41', NULL),
(1029, 466, 14, 6.0, '2021-02-10 09:52:41', '2021-02-10 09:52:41', NULL),
(1030, 467, 3, NULL, '2021-02-10 09:53:22', '2021-02-10 09:53:22', NULL),
(1031, 467, 4, NULL, '2021-02-10 09:53:22', '2021-02-10 09:53:22', NULL),
(1032, 467, 10, NULL, '2021-02-10 09:53:22', '2021-02-10 09:53:22', NULL),
(1033, 467, 11, NULL, '2021-02-10 09:53:22', '2021-02-10 09:53:22', NULL),
(1034, 468, 9, 6.0, '2021-02-10 09:53:22', '2021-02-10 09:53:22', NULL),
(1035, 468, 12, 6.0, '2021-02-10 09:53:22', '2021-02-10 09:53:22', NULL),
(1036, 468, 13, 6.0, '2021-02-10 09:53:22', '2021-02-10 09:53:22', NULL),
(1037, 468, 14, 6.0, '2021-02-10 09:53:22', '2021-02-10 09:53:22', NULL),
(1038, 469, 3, NULL, '2021-02-10 09:53:46', '2021-02-10 09:53:46', NULL),
(1039, 469, 4, NULL, '2021-02-10 09:53:46', '2021-02-10 09:53:46', NULL),
(1040, 469, 10, NULL, '2021-02-10 09:53:46', '2021-02-10 09:53:46', NULL),
(1041, 469, 11, NULL, '2021-02-10 09:53:46', '2021-02-10 09:53:46', NULL),
(1042, 470, 9, 6.0, '2021-02-10 09:53:46', '2021-02-10 09:53:46', NULL),
(1043, 470, 12, 6.0, '2021-02-10 09:53:46', '2021-02-10 09:53:46', NULL),
(1044, 470, 13, 6.0, '2021-02-10 09:53:46', '2021-02-10 09:53:46', NULL),
(1045, 470, 14, 6.0, '2021-02-10 09:53:46', '2021-02-10 09:53:46', NULL),
(1046, 471, 3, NULL, '2021-02-10 09:55:13', '2021-02-10 09:55:13', NULL),
(1047, 471, 4, NULL, '2021-02-10 09:55:13', '2021-02-10 09:55:13', NULL),
(1048, 471, 10, NULL, '2021-02-10 09:55:13', '2021-02-10 09:55:13', NULL),
(1049, 471, 11, NULL, '2021-02-10 09:55:13', '2021-02-10 09:55:13', NULL),
(1050, 472, 9, 6.0, '2021-02-10 09:55:13', '2021-02-10 09:55:13', NULL),
(1051, 472, 12, 6.0, '2021-02-10 09:55:13', '2021-02-10 09:55:13', NULL),
(1052, 472, 13, 6.0, '2021-02-10 09:55:13', '2021-02-10 09:55:13', NULL),
(1053, 472, 14, 6.0, '2021-02-10 09:55:13', '2021-02-10 09:55:13', NULL),
(1054, 473, 3, NULL, '2021-02-10 10:02:10', '2021-02-10 10:02:10', NULL),
(1055, 473, 4, NULL, '2021-02-10 10:02:10', '2021-02-10 10:02:10', NULL),
(1056, 473, 10, NULL, '2021-02-10 10:02:10', '2021-02-10 10:02:10', NULL),
(1057, 473, 11, NULL, '2021-02-10 10:02:10', '2021-02-10 10:02:10', NULL),
(1058, 474, 9, 6.0, '2021-02-10 10:02:10', '2021-02-10 10:02:10', NULL),
(1059, 474, 12, 6.0, '2021-02-10 10:02:10', '2021-02-10 10:02:10', NULL),
(1060, 474, 13, 6.0, '2021-02-10 10:02:10', '2021-02-10 10:02:10', NULL),
(1061, 474, 14, 6.0, '2021-02-10 10:02:10', '2021-02-10 10:02:10', NULL),
(1062, 475, 3, NULL, '2021-02-10 10:25:47', '2021-02-10 10:25:47', NULL),
(1063, 475, 4, NULL, '2021-02-10 10:25:47', '2021-02-10 10:25:47', NULL),
(1064, 475, 10, NULL, '2021-02-10 10:25:47', '2021-02-10 10:25:47', NULL),
(1065, 475, 11, NULL, '2021-02-10 10:25:47', '2021-02-10 10:25:47', NULL),
(1066, 476, 9, 6.0, '2021-02-10 10:25:47', '2021-02-10 10:25:47', NULL),
(1067, 476, 12, 6.0, '2021-02-10 10:25:47', '2021-02-10 10:25:47', NULL),
(1068, 476, 13, 6.0, '2021-02-10 10:25:47', '2021-02-10 10:25:47', NULL),
(1069, 476, 14, 6.0, '2021-02-10 10:25:47', '2021-02-10 10:25:47', NULL),
(1070, 477, 3, NULL, '2021-02-10 10:27:07', '2021-02-10 10:27:07', NULL),
(1071, 477, 4, NULL, '2021-02-10 10:27:07', '2021-02-10 10:27:07', NULL),
(1072, 477, 10, NULL, '2021-02-10 10:27:07', '2021-02-10 10:27:07', NULL),
(1073, 477, 11, NULL, '2021-02-10 10:27:07', '2021-02-10 10:27:07', NULL),
(1074, 478, 9, 6.0, '2021-02-10 10:27:07', '2021-02-10 10:27:07', NULL),
(1075, 478, 12, 6.0, '2021-02-10 10:27:07', '2021-02-10 10:27:07', NULL),
(1076, 478, 13, 6.0, '2021-02-10 10:27:07', '2021-02-10 10:27:07', NULL),
(1077, 478, 14, 6.0, '2021-02-10 10:27:07', '2021-02-10 10:27:07', NULL),
(1078, 479, 3, NULL, '2021-02-10 10:27:44', '2021-02-10 10:27:44', NULL),
(1079, 479, 4, NULL, '2021-02-10 10:27:44', '2021-02-10 10:27:44', NULL),
(1080, 479, 10, NULL, '2021-02-10 10:27:44', '2021-02-10 10:27:44', NULL),
(1081, 479, 11, NULL, '2021-02-10 10:27:44', '2021-02-10 10:27:44', NULL),
(1082, 480, 9, 6.0, '2021-02-10 10:27:44', '2021-02-10 10:27:44', NULL),
(1083, 480, 12, 6.0, '2021-02-10 10:27:44', '2021-02-10 10:27:44', NULL),
(1084, 480, 13, 6.0, '2021-02-10 10:27:44', '2021-02-10 10:27:44', NULL),
(1085, 480, 14, 6.0, '2021-02-10 10:27:44', '2021-02-10 10:27:44', NULL),
(1086, 481, 3, NULL, '2021-02-10 10:28:15', '2021-02-10 10:28:15', NULL),
(1087, 481, 4, NULL, '2021-02-10 10:28:15', '2021-02-10 10:28:15', NULL),
(1088, 481, 10, NULL, '2021-02-10 10:28:15', '2021-02-10 10:28:15', NULL),
(1089, 481, 11, NULL, '2021-02-10 10:28:15', '2021-02-10 10:28:15', NULL),
(1090, 482, 9, 6.0, '2021-02-10 10:28:15', '2021-02-10 10:28:15', NULL),
(1091, 482, 12, 6.0, '2021-02-10 10:28:15', '2021-02-10 10:28:15', NULL),
(1092, 482, 13, 6.0, '2021-02-10 10:28:15', '2021-02-10 10:28:15', NULL),
(1093, 482, 14, 6.0, '2021-02-10 10:28:15', '2021-02-10 10:28:15', NULL),
(1094, 483, 3, NULL, '2021-02-10 10:41:33', '2021-02-10 10:41:33', NULL),
(1095, 483, 4, NULL, '2021-02-10 10:41:33', '2021-02-10 10:41:33', NULL),
(1096, 483, 10, NULL, '2021-02-10 10:41:33', '2021-02-10 10:41:33', NULL),
(1097, 483, 11, NULL, '2021-02-10 10:41:33', '2021-02-10 10:41:33', NULL),
(1098, 484, 9, 6.0, '2021-02-10 10:41:33', '2021-02-10 10:41:33', NULL),
(1099, 484, 12, 6.0, '2021-02-10 10:41:33', '2021-02-10 10:41:33', NULL),
(1100, 484, 13, 6.0, '2021-02-10 10:41:33', '2021-02-10 10:41:33', NULL),
(1101, 484, 14, 6.0, '2021-02-10 10:41:33', '2021-02-10 10:41:33', NULL),
(1102, 485, 3, NULL, '2021-02-10 10:42:17', '2021-02-10 10:42:17', NULL),
(1103, 485, 4, NULL, '2021-02-10 10:42:17', '2021-02-10 10:42:17', NULL),
(1104, 485, 10, NULL, '2021-02-10 10:42:17', '2021-02-10 10:42:17', NULL),
(1105, 485, 11, NULL, '2021-02-10 10:42:17', '2021-02-10 10:42:17', NULL),
(1106, 486, 9, 6.0, '2021-02-10 10:42:17', '2021-02-10 10:42:17', NULL),
(1107, 486, 12, 6.0, '2021-02-10 10:42:17', '2021-02-10 10:42:17', NULL),
(1108, 486, 13, 6.0, '2021-02-10 10:42:17', '2021-02-10 10:42:17', NULL),
(1109, 486, 14, 6.0, '2021-02-10 10:42:17', '2021-02-10 10:42:17', NULL),
(1110, 487, 3, NULL, '2021-02-10 10:46:09', '2021-02-10 10:46:09', NULL),
(1111, 487, 4, NULL, '2021-02-10 10:46:09', '2021-02-10 10:46:09', NULL),
(1112, 487, 10, NULL, '2021-02-10 10:46:09', '2021-02-10 10:46:09', NULL),
(1113, 487, 11, NULL, '2021-02-10 10:46:09', '2021-02-10 10:46:09', NULL),
(1114, 488, 9, 6.0, '2021-02-10 10:46:09', '2021-02-10 10:46:09', NULL),
(1115, 488, 12, 6.0, '2021-02-10 10:46:09', '2021-02-10 10:46:09', NULL),
(1116, 488, 13, 6.0, '2021-02-10 10:46:09', '2021-02-10 10:46:09', NULL),
(1117, 488, 14, 6.0, '2021-02-10 10:46:09', '2021-02-10 10:46:09', NULL),
(1118, 489, 3, 40.0, '2021-02-10 12:56:02', '2021-02-10 12:56:02', NULL),
(1119, 489, 4, 40.0, '2021-02-10 12:56:02', '2021-02-10 12:56:02', NULL),
(1120, 489, 10, 40.0, '2021-02-10 12:56:02', '2021-02-10 12:56:02', NULL),
(1121, 489, 11, 40.0, '2021-02-10 12:56:02', '2021-02-10 12:56:02', NULL),
(1122, 490, 9, 5.0, '2021-02-10 12:56:02', '2021-02-10 12:56:02', NULL),
(1123, 490, 12, 5.0, '2021-02-10 12:56:02', '2021-02-10 12:56:02', NULL),
(1124, 490, 13, 5.0, '2021-02-10 12:56:02', '2021-02-10 12:56:02', NULL),
(1125, 490, 14, 5.0, '2021-02-10 12:56:02', '2021-02-10 12:56:02', NULL),
(1126, 491, 3, 50.0, '2021-02-10 13:28:01', '2021-02-10 13:28:01', NULL),
(1127, 491, 4, 50.0, '2021-02-10 13:28:01', '2021-02-10 13:28:01', NULL),
(1128, 491, 10, 50.0, '2021-02-10 13:28:01', '2021-02-10 13:28:01', NULL),
(1129, 491, 11, 50.0, '2021-02-10 13:28:01', '2021-02-10 13:28:01', NULL),
(1130, 492, 9, 5.5, '2021-02-10 13:28:01', '2021-02-10 13:28:01', NULL),
(1131, 492, 12, 5.5, '2021-02-10 13:28:01', '2021-02-10 13:28:01', NULL),
(1132, 492, 13, 5.5, '2021-02-10 13:28:01', '2021-02-10 13:28:01', NULL),
(1133, 492, 14, 5.5, '2021-02-10 13:28:01', '2021-02-10 13:28:01', NULL),
(1134, 493, 3, 40.0, '2021-02-10 13:28:47', '2021-02-10 13:28:47', NULL),
(1135, 493, 4, 40.0, '2021-02-10 13:28:47', '2021-02-10 13:28:47', NULL),
(1136, 493, 10, 40.0, '2021-02-10 13:28:47', '2021-02-10 13:28:47', NULL),
(1137, 493, 11, 40.0, '2021-02-10 13:28:47', '2021-02-10 13:28:47', NULL),
(1138, 494, 9, 5.0, '2021-02-10 13:28:47', '2021-02-10 13:28:47', NULL),
(1139, 494, 12, 5.0, '2021-02-10 13:28:47', '2021-02-10 13:28:47', NULL),
(1140, 494, 13, 5.0, '2021-02-10 13:28:47', '2021-02-10 13:28:47', NULL),
(1141, 494, 14, 5.0, '2021-02-10 13:28:47', '2021-02-10 13:28:47', NULL),
(1142, 495, 3, 50.0, '2021-02-10 13:30:17', '2021-02-10 13:30:17', NULL),
(1143, 495, 4, 50.0, '2021-02-10 13:30:17', '2021-02-10 13:30:17', NULL),
(1144, 495, 10, 50.0, '2021-02-10 13:30:17', '2021-02-10 13:30:17', NULL),
(1145, 495, 11, 50.0, '2021-02-10 13:30:17', '2021-02-10 13:30:17', NULL),
(1146, 496, 9, 5.5, '2021-02-10 13:30:17', '2021-02-10 13:30:17', NULL),
(1147, 496, 12, 5.5, '2021-02-10 13:30:17', '2021-02-10 13:30:17', NULL),
(1148, 496, 13, 5.5, '2021-02-10 13:30:17', '2021-02-10 13:30:17', NULL),
(1149, 496, 14, 5.5, '2021-02-10 13:30:17', '2021-02-10 13:30:17', NULL),
(1150, 497, 3, 65.0, '2021-02-10 13:34:03', '2021-02-10 13:34:03', NULL),
(1151, 497, 4, 65.0, '2021-02-10 13:34:03', '2021-02-10 13:34:03', NULL),
(1152, 497, 10, 65.0, '2021-02-10 13:34:03', '2021-02-10 13:34:03', NULL),
(1153, 497, 11, 65.0, '2021-02-10 13:34:03', '2021-02-10 13:34:03', NULL),
(1154, 498, 9, 6.0, '2021-02-10 13:34:03', '2021-02-10 13:34:03', NULL),
(1155, 498, 12, 6.0, '2021-02-10 13:34:03', '2021-02-10 13:34:03', NULL),
(1156, 498, 13, 6.0, '2021-02-10 13:34:03', '2021-02-10 13:34:03', NULL),
(1157, 498, 14, 6.0, '2021-02-10 13:34:03', '2021-02-10 13:34:03', NULL),
(1158, 499, 3, 65.0, '2021-02-10 13:36:36', '2021-02-10 13:36:36', NULL),
(1159, 499, 4, 65.0, '2021-02-10 13:36:36', '2021-02-10 13:36:36', NULL),
(1160, 499, 10, 65.0, '2021-02-10 13:36:36', '2021-02-10 13:36:36', NULL),
(1161, 499, 11, 65.0, '2021-02-10 13:36:36', '2021-02-10 13:36:36', NULL),
(1162, 500, 9, 6.0, '2021-02-10 13:36:36', '2021-02-10 13:36:36', NULL),
(1163, 500, 12, 6.0, '2021-02-10 13:36:36', '2021-02-10 13:36:36', NULL),
(1164, 500, 13, 6.0, '2021-02-10 13:36:36', '2021-02-10 13:36:36', NULL),
(1165, 500, 14, 6.0, '2021-02-10 13:36:36', '2021-02-10 13:36:36', NULL),
(1166, 501, 3, 40.0, '2021-02-10 13:38:27', '2021-02-10 13:38:27', NULL),
(1167, 501, 4, 40.0, '2021-02-10 13:38:27', '2021-02-10 13:38:27', NULL),
(1168, 501, 10, 40.0, '2021-02-10 13:38:27', '2021-02-10 13:38:27', NULL),
(1169, 501, 11, 40.0, '2021-02-10 13:38:27', '2021-02-10 13:38:27', NULL),
(1170, 502, 9, 5.0, '2021-02-10 13:38:27', '2021-02-10 13:38:27', NULL),
(1171, 502, 12, 5.0, '2021-02-10 13:38:27', '2021-02-10 13:38:27', NULL),
(1172, 502, 13, 5.0, '2021-02-10 13:38:27', '2021-02-10 13:38:27', NULL),
(1173, 502, 14, 5.0, '2021-02-10 13:38:27', '2021-02-10 13:38:27', NULL),
(1174, 503, 3, 50.0, '2021-02-10 13:40:41', '2021-02-10 13:40:41', NULL),
(1175, 503, 4, 50.0, '2021-02-10 13:40:41', '2021-02-10 13:40:41', NULL),
(1176, 503, 10, 50.0, '2021-02-10 13:40:41', '2021-02-10 13:40:41', NULL),
(1177, 503, 11, 50.0, '2021-02-10 13:40:41', '2021-02-10 13:40:41', NULL),
(1178, 504, 9, 5.5, '2021-02-10 13:40:41', '2021-02-10 13:40:41', NULL),
(1179, 504, 12, 5.5, '2021-02-10 13:40:41', '2021-02-10 13:40:41', NULL),
(1180, 504, 13, 5.5, '2021-02-10 13:40:41', '2021-02-10 13:40:41', NULL),
(1181, 504, 14, 5.5, '2021-02-10 13:40:41', '2021-02-10 13:40:41', NULL),
(1182, 505, 3, 40.0, '2021-02-10 13:41:34', '2021-02-10 13:41:34', NULL),
(1183, 505, 4, 40.0, '2021-02-10 13:41:34', '2021-02-10 13:41:34', NULL),
(1184, 505, 10, 40.0, '2021-02-10 13:41:34', '2021-02-10 13:41:34', NULL),
(1185, 505, 11, 40.0, '2021-02-10 13:41:34', '2021-02-10 13:41:34', NULL),
(1186, 506, 9, 5.0, '2021-02-10 13:41:34', '2021-02-10 13:41:34', NULL),
(1187, 506, 12, 5.0, '2021-02-10 13:41:34', '2021-02-10 13:41:34', NULL),
(1188, 506, 13, 5.0, '2021-02-10 13:41:34', '2021-02-10 13:41:34', NULL),
(1189, 506, 14, 5.0, '2021-02-10 13:41:34', '2021-02-10 13:41:34', NULL),
(1190, 507, 3, 65.0, '2021-02-10 13:43:15', '2021-02-10 13:43:15', NULL),
(1191, 507, 4, 65.0, '2021-02-10 13:43:15', '2021-02-10 13:43:15', NULL),
(1192, 507, 10, 65.0, '2021-02-10 13:43:15', '2021-02-10 13:43:15', NULL),
(1193, 507, 11, 65.0, '2021-02-10 13:43:15', '2021-02-10 13:43:15', NULL),
(1194, 508, 9, 6.0, '2021-02-10 13:43:15', '2021-02-10 13:43:15', NULL),
(1195, 508, 12, 6.0, '2021-02-10 13:43:15', '2021-02-10 13:43:15', NULL),
(1196, 508, 13, 6.0, '2021-02-10 13:43:15', '2021-02-10 13:43:15', NULL),
(1197, 508, 14, 6.0, '2021-02-10 13:43:15', '2021-02-10 13:43:15', NULL),
(1198, 509, 3, 50.0, '2021-02-10 13:45:24', '2021-02-10 13:45:24', NULL),
(1199, 509, 4, 50.0, '2021-02-10 13:45:24', '2021-02-10 13:45:24', NULL),
(1200, 509, 10, 50.0, '2021-02-10 13:45:24', '2021-02-10 13:45:24', NULL),
(1201, 509, 11, 50.0, '2021-02-10 13:45:24', '2021-02-10 13:45:24', NULL),
(1202, 510, 9, 5.0, '2021-02-10 13:45:24', '2021-02-10 13:45:24', NULL),
(1203, 510, 12, 5.0, '2021-02-10 13:45:24', '2021-02-10 13:45:24', NULL),
(1204, 510, 13, 5.0, '2021-02-10 13:45:24', '2021-02-10 13:45:24', NULL),
(1205, 510, 14, 5.0, '2021-02-10 13:45:24', '2021-02-10 13:45:24', NULL),
(1206, 511, 3, 50.0, '2021-02-10 13:45:48', '2021-02-10 13:45:48', NULL),
(1207, 511, 4, 50.0, '2021-02-10 13:45:48', '2021-02-10 13:45:48', NULL),
(1208, 511, 10, 50.0, '2021-02-10 13:45:48', '2021-02-10 13:45:48', NULL),
(1209, 511, 11, 50.0, '2021-02-10 13:45:48', '2021-02-10 13:45:48', NULL),
(1210, 512, 9, 5.5, '2021-02-10 13:45:48', '2021-02-10 13:45:48', NULL),
(1211, 512, 12, 5.5, '2021-02-10 13:45:48', '2021-02-10 13:45:48', NULL),
(1212, 512, 13, 5.5, '2021-02-10 13:45:48', '2021-02-10 13:45:48', NULL),
(1213, 512, 14, 5.5, '2021-02-10 13:45:48', '2021-02-10 13:45:48', NULL),
(1214, 513, 3, 65.0, '2021-02-11 06:14:15', '2021-02-11 06:14:15', NULL),
(1215, 513, 4, 65.0, '2021-02-11 06:14:15', '2021-02-11 06:14:15', NULL),
(1216, 513, 10, 65.0, '2021-02-11 06:14:15', '2021-02-11 06:14:15', NULL),
(1217, 513, 11, 65.0, '2021-02-11 06:14:15', '2021-02-11 06:14:15', NULL),
(1218, 514, 9, 6.0, '2021-02-11 06:14:15', '2021-02-11 06:14:15', NULL),
(1219, 514, 12, 6.0, '2021-02-11 06:14:15', '2021-02-11 06:14:15', NULL),
(1220, 514, 13, 6.0, '2021-02-11 06:14:15', '2021-02-11 06:14:15', NULL),
(1221, 514, 14, 6.0, '2021-02-11 06:14:15', '2021-02-11 06:14:15', NULL),
(1222, 515, 3, 50.0, '2021-02-11 06:14:33', '2021-02-11 06:14:33', NULL),
(1223, 515, 4, 50.0, '2021-02-11 06:14:33', '2021-02-11 06:14:33', NULL),
(1224, 515, 10, 50.0, '2021-02-11 06:14:33', '2021-02-11 06:14:33', NULL),
(1225, 515, 11, 50.0, '2021-02-11 06:14:33', '2021-02-11 06:14:33', NULL),
(1226, 516, 9, 5.5, '2021-02-11 06:14:33', '2021-02-11 06:14:33', NULL),
(1227, 516, 12, 5.5, '2021-02-11 06:14:33', '2021-02-11 06:14:33', NULL),
(1228, 516, 13, 5.5, '2021-02-11 06:14:33', '2021-02-11 06:14:33', NULL),
(1229, 516, 14, 5.5, '2021-02-11 06:14:33', '2021-02-11 06:14:33', NULL),
(1230, 517, 3, 40.0, '2021-02-11 06:14:59', '2021-02-11 06:14:59', NULL),
(1231, 517, 4, 40.0, '2021-02-11 06:14:59', '2021-02-11 06:14:59', NULL),
(1232, 517, 10, 40.0, '2021-02-11 06:14:59', '2021-02-11 06:14:59', NULL),
(1233, 517, 11, 40.0, '2021-02-11 06:14:59', '2021-02-11 06:14:59', NULL),
(1234, 518, 9, 5.0, '2021-02-11 06:14:59', '2021-02-11 06:14:59', NULL),
(1235, 518, 12, 5.0, '2021-02-11 06:14:59', '2021-02-11 06:14:59', NULL),
(1236, 518, 13, 5.0, '2021-02-11 06:14:59', '2021-02-11 06:14:59', NULL),
(1237, 518, 14, 5.0, '2021-02-11 06:14:59', '2021-02-11 06:14:59', NULL),
(1238, 519, 3, 65.0, '2021-02-11 06:15:08', '2021-02-11 06:15:08', NULL),
(1239, 519, 4, 65.0, '2021-02-11 06:15:08', '2021-02-11 06:15:08', NULL),
(1240, 519, 10, 65.0, '2021-02-11 06:15:08', '2021-02-11 06:15:08', NULL),
(1241, 519, 11, 65.0, '2021-02-11 06:15:08', '2021-02-11 06:15:08', NULL),
(1242, 520, 9, 6.0, '2021-02-11 06:15:08', '2021-02-11 06:15:08', NULL),
(1243, 520, 12, 6.0, '2021-02-11 06:15:08', '2021-02-11 06:15:08', NULL),
(1244, 520, 13, 6.0, '2021-02-11 06:15:08', '2021-02-11 06:15:08', NULL),
(1245, 520, 14, 6.0, '2021-02-11 06:15:08', '2021-02-11 06:15:08', NULL),
(1246, 521, 3, 50.0, '2021-02-11 06:16:03', '2021-02-11 06:16:03', NULL),
(1247, 521, 4, 50.0, '2021-02-11 06:16:03', '2021-02-11 06:16:03', NULL),
(1248, 521, 10, 50.0, '2021-02-11 06:16:03', '2021-02-11 06:16:03', NULL),
(1249, 521, 11, 50.0, '2021-02-11 06:16:03', '2021-02-11 06:16:03', NULL),
(1250, 522, 9, 5.5, '2021-02-11 06:16:03', '2021-02-11 06:16:03', NULL),
(1251, 522, 12, 5.5, '2021-02-11 06:16:03', '2021-02-11 06:16:03', NULL),
(1252, 522, 13, 5.5, '2021-02-11 06:16:03', '2021-02-11 06:16:03', NULL),
(1253, 522, 14, 5.5, '2021-02-11 06:16:03', '2021-02-11 06:16:03', NULL),
(1254, 523, 3, 50.0, '2021-02-11 06:16:35', '2021-02-11 06:16:35', NULL),
(1255, 523, 4, 50.0, '2021-02-11 06:16:35', '2021-02-11 06:16:35', NULL),
(1256, 523, 10, 50.0, '2021-02-11 06:16:35', '2021-02-11 06:16:35', NULL),
(1257, 523, 11, 50.0, '2021-02-11 06:16:35', '2021-02-11 06:16:35', NULL),
(1258, 524, 9, 5.5, '2021-02-11 06:16:35', '2021-02-11 06:16:35', NULL),
(1259, 524, 12, 5.5, '2021-02-11 06:16:35', '2021-02-11 06:16:35', NULL),
(1260, 524, 13, 5.5, '2021-02-11 06:16:35', '2021-02-11 06:16:35', NULL),
(1261, 524, 14, 5.5, '2021-02-11 06:16:35', '2021-02-11 06:16:35', NULL),
(1262, 525, 3, 40.0, '2021-02-11 06:17:08', '2021-02-11 06:17:08', NULL),
(1263, 525, 4, 40.0, '2021-02-11 06:17:08', '2021-02-11 06:17:08', NULL),
(1264, 525, 10, 40.0, '2021-02-11 06:17:08', '2021-02-11 06:17:08', NULL),
(1265, 525, 11, 40.0, '2021-02-11 06:17:08', '2021-02-11 06:17:08', NULL),
(1266, 526, 9, 5.0, '2021-02-11 06:17:08', '2021-02-11 06:17:08', NULL),
(1267, 526, 12, 5.0, '2021-02-11 06:17:08', '2021-02-11 06:17:08', NULL),
(1268, 526, 13, 5.0, '2021-02-11 06:17:08', '2021-02-11 06:17:08', NULL),
(1269, 526, 14, 5.0, '2021-02-11 06:17:08', '2021-02-11 06:17:08', NULL),
(1270, 527, 3, 80.0, '2021-02-11 06:18:04', '2021-02-11 06:18:04', NULL),
(1271, 527, 4, 80.0, '2021-02-11 06:18:04', '2021-02-11 06:18:04', NULL),
(1272, 527, 10, 80.0, '2021-02-11 06:18:04', '2021-02-11 06:18:04', NULL),
(1273, 527, 11, 80.0, '2021-02-11 06:18:04', '2021-02-11 06:18:04', NULL),
(1274, 528, 9, 6.5, '2021-02-11 06:18:04', '2021-02-11 06:18:04', NULL),
(1275, 528, 12, 6.5, '2021-02-11 06:18:04', '2021-02-11 06:18:04', NULL),
(1276, 528, 13, 6.5, '2021-02-11 06:18:04', '2021-02-11 06:18:04', NULL),
(1277, 528, 14, 6.5, '2021-02-11 06:18:04', '2021-02-11 06:18:04', NULL),
(1278, 529, 3, 80.0, '2021-02-11 06:19:10', '2021-02-11 06:19:10', NULL),
(1279, 529, 4, 80.0, '2021-02-11 06:19:10', '2021-02-11 06:19:10', NULL),
(1280, 529, 10, 80.0, '2021-02-11 06:19:10', '2021-02-11 06:19:10', NULL),
(1281, 529, 11, 80.0, '2021-02-11 06:19:10', '2021-02-11 06:19:10', NULL),
(1282, 530, 9, 6.5, '2021-02-11 06:19:10', '2021-02-11 06:19:10', NULL),
(1283, 530, 12, 6.5, '2021-02-11 06:19:10', '2021-02-11 06:19:10', NULL),
(1284, 530, 13, 6.5, '2021-02-11 06:19:10', '2021-02-11 06:19:10', NULL),
(1285, 530, 14, 6.5, '2021-02-11 06:19:10', '2021-02-11 06:19:10', NULL),
(1286, 531, 3, 65.0, '2021-02-11 06:31:35', '2021-02-11 06:31:35', NULL),
(1287, 531, 4, 65.0, '2021-02-11 06:31:35', '2021-02-11 06:31:35', NULL),
(1288, 531, 10, 65.0, '2021-02-11 06:31:35', '2021-02-11 06:31:35', NULL),
(1289, 531, 11, 65.0, '2021-02-11 06:31:35', '2021-02-11 06:31:35', NULL),
(1290, 532, 9, 6.0, '2021-02-11 06:31:35', '2021-02-11 06:31:35', NULL),
(1291, 532, 12, 6.0, '2021-02-11 06:31:35', '2021-02-11 06:31:35', NULL),
(1292, 532, 13, 6.0, '2021-02-11 06:31:35', '2021-02-11 06:31:35', NULL),
(1293, 532, 14, 6.0, '2021-02-11 06:31:35', '2021-02-11 06:31:35', NULL),
(1294, 533, 3, 60.0, '2021-02-11 07:09:02', '2021-02-11 07:09:02', NULL),
(1295, 533, 4, 60.0, '2021-02-11 07:09:02', '2021-02-11 07:09:02', NULL),
(1296, 533, 10, 60.0, '2021-02-11 07:09:02', '2021-02-11 07:09:02', NULL),
(1297, 533, 11, 60.0, '2021-02-11 07:09:02', '2021-02-11 07:09:02', NULL),
(1298, 534, 9, 6.0, '2021-02-11 07:09:02', '2021-02-11 07:09:02', NULL),
(1299, 534, 12, 6.0, '2021-02-11 07:09:02', '2021-02-11 07:09:02', NULL),
(1300, 534, 13, 6.0, '2021-02-11 07:09:02', '2021-02-11 07:09:02', NULL),
(1301, 534, 14, 6.0, '2021-02-11 07:09:02', '2021-02-11 07:09:02', NULL),
(1302, 535, 3, 60.0, '2021-02-11 07:11:11', '2021-02-11 07:11:11', NULL),
(1303, 535, 4, 60.0, '2021-02-11 07:11:11', '2021-02-11 07:11:11', NULL),
(1304, 535, 10, 60.0, '2021-02-11 07:11:11', '2021-02-11 07:11:11', NULL),
(1305, 535, 11, 60.0, '2021-02-11 07:11:11', '2021-02-11 07:11:11', NULL),
(1306, 536, 9, 6.0, '2021-02-11 07:11:11', '2021-02-11 07:11:11', NULL),
(1307, 536, 12, 6.0, '2021-02-11 07:11:11', '2021-02-11 07:11:11', NULL),
(1308, 536, 13, 6.0, '2021-02-11 07:11:11', '2021-02-11 07:11:11', NULL),
(1309, 536, 14, 6.0, '2021-02-11 07:11:11', '2021-02-11 07:11:11', NULL),
(1310, 537, 3, 65.0, '2021-02-11 07:41:38', '2021-02-11 07:41:38', NULL),
(1311, 537, 4, 65.0, '2021-02-11 07:41:38', '2021-02-11 07:41:38', NULL),
(1312, 537, 10, 65.0, '2021-02-11 07:41:38', '2021-02-11 07:41:38', NULL),
(1313, 537, 11, 65.0, '2021-02-11 07:41:38', '2021-02-11 07:41:38', NULL),
(1314, 538, 9, 6.0, '2021-02-11 07:41:38', '2021-02-11 07:41:38', NULL),
(1315, 538, 12, 6.0, '2021-02-11 07:41:38', '2021-02-11 07:41:38', NULL),
(1316, 538, 13, 6.0, '2021-02-11 07:41:38', '2021-02-11 07:41:38', NULL),
(1317, 538, 14, 6.0, '2021-02-11 07:41:38', '2021-02-11 07:41:38', NULL),
(1318, 539, 3, 80.0, '2021-02-11 07:43:49', '2021-02-11 07:43:49', NULL),
(1319, 539, 4, 80.0, '2021-02-11 07:43:49', '2021-02-11 07:43:49', NULL),
(1320, 539, 10, 80.0, '2021-02-11 07:43:49', '2021-02-11 07:43:49', NULL),
(1321, 539, 11, 80.0, '2021-02-11 07:43:49', '2021-02-11 07:43:49', NULL),
(1322, 540, 9, 6.5, '2021-02-11 07:43:49', '2021-02-11 07:43:49', NULL),
(1323, 540, 12, 6.5, '2021-02-11 07:43:49', '2021-02-11 07:43:49', NULL),
(1324, 540, 13, 6.5, '2021-02-11 07:43:49', '2021-02-11 07:43:49', NULL),
(1325, 540, 14, 6.5, '2021-02-11 07:43:49', '2021-02-11 07:43:49', NULL),
(1326, 541, 3, 60.0, '2021-02-11 07:45:24', '2021-02-11 07:45:24', NULL),
(1327, 541, 4, 60.0, '2021-02-11 07:45:24', '2021-02-11 07:45:24', NULL),
(1328, 541, 10, 60.0, '2021-02-11 07:45:24', '2021-02-11 07:45:24', NULL),
(1329, 541, 11, 60.0, '2021-02-11 07:45:24', '2021-02-11 07:45:24', NULL),
(1330, 542, 9, 6.0, '2021-02-11 07:45:24', '2021-02-11 07:45:24', NULL),
(1331, 542, 12, 6.0, '2021-02-11 07:45:24', '2021-02-11 07:45:24', NULL),
(1332, 542, 13, 6.0, '2021-02-11 07:45:24', '2021-02-11 07:45:24', NULL),
(1333, 542, 14, 6.0, '2021-02-11 07:45:24', '2021-02-11 07:45:24', NULL),
(1334, 543, 3, 60.0, '2021-02-11 07:46:19', '2021-02-11 07:46:19', NULL),
(1335, 543, 4, 60.0, '2021-02-11 07:46:19', '2021-02-11 07:46:19', NULL),
(1336, 543, 10, 60.0, '2021-02-11 07:46:19', '2021-02-11 07:46:19', NULL),
(1337, 543, 11, 60.0, '2021-02-11 07:46:19', '2021-02-11 07:46:19', NULL),
(1338, 544, 9, 6.0, '2021-02-11 07:46:19', '2021-02-11 07:46:19', NULL),
(1339, 544, 12, 6.0, '2021-02-11 07:46:19', '2021-02-11 07:46:19', NULL),
(1340, 544, 13, 6.0, '2021-02-11 07:46:19', '2021-02-11 07:46:19', NULL),
(1341, 544, 14, 6.0, '2021-02-11 07:46:19', '2021-02-11 07:46:19', NULL),
(1342, 545, 3, 60.0, '2021-02-11 07:47:11', '2021-02-11 07:47:11', NULL),
(1343, 545, 4, 60.0, '2021-02-11 07:47:11', '2021-02-11 07:47:11', NULL),
(1344, 545, 10, 60.0, '2021-02-11 07:47:11', '2021-02-11 07:47:11', NULL),
(1345, 545, 11, 60.0, '2021-02-11 07:47:11', '2021-02-11 07:47:11', NULL),
(1346, 546, 9, 6.0, '2021-02-11 07:47:11', '2021-02-11 07:47:11', NULL),
(1347, 546, 12, 6.0, '2021-02-11 07:47:11', '2021-02-11 07:47:11', NULL),
(1348, 546, 13, 6.0, '2021-02-11 07:47:11', '2021-02-11 07:47:11', NULL),
(1349, 546, 14, 6.0, '2021-02-11 07:47:11', '2021-02-11 07:47:11', NULL),
(1350, 547, 3, 60.0, '2021-02-11 07:47:46', '2021-02-11 07:47:46', NULL),
(1351, 547, 4, 60.0, '2021-02-11 07:47:46', '2021-02-11 07:47:46', NULL),
(1352, 547, 10, 60.0, '2021-02-11 07:47:46', '2021-02-11 07:47:46', NULL),
(1353, 547, 11, 60.0, '2021-02-11 07:47:46', '2021-02-11 07:47:46', NULL),
(1354, 548, 9, 6.0, '2021-02-11 07:47:46', '2021-02-11 07:47:46', NULL),
(1355, 548, 12, 6.0, '2021-02-11 07:47:46', '2021-02-11 07:47:46', NULL),
(1356, 548, 13, 6.0, '2021-02-11 07:47:46', '2021-02-11 07:47:46', NULL),
(1357, 548, 14, 6.0, '2021-02-11 07:47:46', '2021-02-11 07:47:46', NULL),
(1358, 549, 3, 60.0, '2021-02-11 07:51:54', '2021-02-11 07:51:54', NULL),
(1359, 549, 4, 60.0, '2021-02-11 07:51:54', '2021-02-11 07:51:54', NULL),
(1360, 549, 10, 60.0, '2021-02-11 07:51:54', '2021-02-11 07:51:54', NULL),
(1361, 549, 11, 60.0, '2021-02-11 07:51:54', '2021-02-11 07:51:54', NULL),
(1362, 550, 9, 6.0, '2021-02-11 07:51:54', '2021-02-11 07:51:54', NULL),
(1363, 550, 12, 6.0, '2021-02-11 07:51:54', '2021-02-11 07:51:54', NULL),
(1364, 550, 13, 6.0, '2021-02-11 07:51:54', '2021-02-11 07:51:54', NULL),
(1365, 550, 14, 6.0, '2021-02-11 07:51:54', '2021-02-11 07:51:54', NULL),
(1366, 551, 3, 60.0, '2021-02-11 07:52:21', '2021-02-11 07:52:21', NULL),
(1367, 551, 4, 60.0, '2021-02-11 07:52:21', '2021-02-11 07:52:21', NULL),
(1368, 551, 10, 60.0, '2021-02-11 07:52:21', '2021-02-11 07:52:21', NULL),
(1369, 551, 11, 60.0, '2021-02-11 07:52:21', '2021-02-11 07:52:21', NULL),
(1370, 552, 9, 6.0, '2021-02-11 07:52:21', '2021-02-11 07:52:21', NULL),
(1371, 552, 12, 6.0, '2021-02-11 07:52:21', '2021-02-11 07:52:21', NULL),
(1372, 552, 13, 6.0, '2021-02-11 07:52:21', '2021-02-11 07:52:21', NULL),
(1373, 552, 14, 6.0, '2021-02-11 07:52:21', '2021-02-11 07:52:21', NULL),
(1374, 553, 3, 60.0, '2021-02-11 07:53:08', '2021-02-11 07:53:08', NULL),
(1375, 553, 4, 60.0, '2021-02-11 07:53:08', '2021-02-11 07:53:08', NULL),
(1376, 553, 10, 60.0, '2021-02-11 07:53:08', '2021-02-11 07:53:08', NULL),
(1377, 553, 11, 60.0, '2021-02-11 07:53:08', '2021-02-11 07:53:08', NULL),
(1378, 554, 9, 6.0, '2021-02-11 07:53:08', '2021-02-11 07:53:08', NULL),
(1379, 554, 12, 6.0, '2021-02-11 07:53:08', '2021-02-11 07:53:08', NULL),
(1380, 554, 13, 6.0, '2021-02-11 07:53:08', '2021-02-11 07:53:08', NULL),
(1381, 554, 14, 6.0, '2021-02-11 07:53:08', '2021-02-11 07:53:08', NULL),
(1382, 555, 3, 60.0, '2021-02-11 07:53:53', '2021-02-11 07:53:53', NULL),
(1383, 555, 4, 60.0, '2021-02-11 07:53:53', '2021-02-11 07:53:53', NULL),
(1384, 555, 10, 60.0, '2021-02-11 07:53:53', '2021-02-11 07:53:53', NULL),
(1385, 555, 11, 60.0, '2021-02-11 07:53:53', '2021-02-11 07:53:53', NULL),
(1386, 556, 9, 6.0, '2021-02-11 07:53:53', '2021-02-11 07:53:53', NULL),
(1387, 556, 12, 6.0, '2021-02-11 07:53:53', '2021-02-11 07:53:53', NULL),
(1388, 556, 13, 6.0, '2021-02-11 07:53:53', '2021-02-11 07:53:53', NULL),
(1389, 556, 14, 6.0, '2021-02-11 07:53:53', '2021-02-11 07:53:53', NULL),
(1390, 557, 3, 39.9, '2021-02-11 11:51:12', '2021-02-11 11:51:12', NULL),
(1391, 557, 4, 39.9, '2021-02-11 11:51:12', '2021-02-11 11:51:12', NULL),
(1392, 557, 10, 40.2, '2021-02-11 11:51:12', '2021-02-11 11:51:12', NULL),
(1393, 557, 11, 10.5, '2021-02-11 11:51:12', '2021-02-11 11:51:12', NULL),
(1394, 558, 7, 600.0, '2021-02-11 11:51:12', '2021-02-11 11:51:12', NULL),
(1395, 558, 8, 580.0, '2021-02-11 11:51:12', '2021-02-11 11:51:12', NULL),
(1396, 558, 15, NULL, '2021-02-11 11:51:12', '2021-02-11 11:51:12', NULL),
(1397, 559, 7, 600.0, '2021-02-11 11:52:23', '2021-02-11 11:52:23', NULL),
(1398, 559, 8, 580.0, '2021-02-11 11:52:23', '2021-02-11 11:52:23', NULL),
(1399, 559, 15, NULL, '2021-02-11 11:52:23', '2021-02-11 11:52:23', NULL),
(1400, 560, 7, 600.0, '2021-02-11 11:52:23', '2021-02-11 11:52:23', NULL),
(1401, 560, 8, 580.0, '2021-02-11 11:52:23', '2021-02-11 11:52:23', NULL),
(1402, 560, 15, NULL, '2021-02-11 11:52:23', '2021-02-11 11:52:23', NULL),
(1403, 561, 3, 60.0, '2021-02-12 08:07:32', '2021-02-12 08:07:32', NULL);
INSERT INTO `institution_program_exam_requirement_details` (`id`, `requirement_id`, `subsection_id`, `score`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1404, 561, 4, 60.0, '2021-02-12 08:07:32', '2021-02-12 08:07:32', NULL),
(1405, 561, 10, 60.0, '2021-02-12 08:07:32', '2021-02-12 08:07:32', NULL),
(1406, 561, 11, 60.0, '2021-02-12 08:07:32', '2021-02-12 08:07:32', NULL),
(1407, 562, 9, 6.0, '2021-02-12 08:07:32', '2021-02-12 08:07:32', NULL),
(1408, 562, 12, 6.0, '2021-02-12 08:07:32', '2021-02-12 08:07:32', NULL),
(1409, 562, 13, 6.0, '2021-02-12 08:07:32', '2021-02-12 08:07:32', NULL),
(1410, 562, 14, 6.0, '2021-02-12 08:07:32', '2021-02-12 08:07:32', NULL),
(1411, 563, 3, 60.0, '2021-02-12 08:08:07', '2021-02-12 08:08:07', NULL),
(1412, 563, 4, 60.0, '2021-02-12 08:08:07', '2021-02-12 08:08:07', NULL),
(1413, 563, 10, 60.0, '2021-02-12 08:08:07', '2021-02-12 08:08:07', NULL),
(1414, 563, 11, 60.0, '2021-02-12 08:08:07', '2021-02-12 08:08:07', NULL),
(1415, 564, 9, 6.0, '2021-02-12 08:08:07', '2021-02-12 08:08:07', NULL),
(1416, 564, 12, 6.0, '2021-02-12 08:08:07', '2021-02-12 08:08:07', NULL),
(1417, 564, 13, 6.0, '2021-02-12 08:08:07', '2021-02-12 08:08:07', NULL),
(1418, 564, 14, 6.0, '2021-02-12 08:08:07', '2021-02-12 08:08:07', NULL),
(1419, 565, 3, 60.0, '2021-02-12 08:08:56', '2021-02-12 08:08:56', NULL),
(1420, 565, 4, 60.0, '2021-02-12 08:08:56', '2021-02-12 08:08:56', NULL),
(1421, 565, 10, 60.0, '2021-02-12 08:08:56', '2021-02-12 08:08:56', NULL),
(1422, 565, 11, 60.0, '2021-02-12 08:08:56', '2021-02-12 08:08:56', NULL),
(1423, 566, 9, 6.0, '2021-02-12 08:08:56', '2021-02-12 08:08:56', NULL),
(1424, 566, 12, 6.0, '2021-02-12 08:08:56', '2021-02-12 08:08:56', NULL),
(1425, 566, 13, 6.0, '2021-02-12 08:08:56', '2021-02-12 08:08:56', NULL),
(1426, 566, 14, 6.0, '2021-02-12 08:08:56', '2021-02-12 08:08:56', NULL),
(1427, 567, 3, 60.0, '2021-02-12 08:09:33', '2021-02-12 08:09:33', NULL),
(1428, 567, 4, 60.0, '2021-02-12 08:09:33', '2021-02-12 08:09:33', NULL),
(1429, 567, 10, 60.0, '2021-02-12 08:09:33', '2021-02-12 08:09:33', NULL),
(1430, 567, 11, 60.0, '2021-02-12 08:09:33', '2021-02-12 08:09:33', NULL),
(1431, 568, 9, 6.0, '2021-02-12 08:09:33', '2021-02-12 08:09:33', NULL),
(1432, 568, 12, 6.0, '2021-02-12 08:09:33', '2021-02-12 08:09:33', NULL),
(1433, 568, 13, 6.0, '2021-02-12 08:09:33', '2021-02-12 08:09:33', NULL),
(1434, 568, 14, 6.0, '2021-02-12 08:09:33', '2021-02-12 08:09:33', NULL),
(1435, 569, 3, 60.0, '2021-02-12 08:10:12', '2021-02-12 08:10:12', NULL),
(1436, 569, 4, 60.0, '2021-02-12 08:10:12', '2021-02-12 08:10:12', NULL),
(1437, 569, 10, 60.0, '2021-02-12 08:10:12', '2021-02-12 08:10:12', NULL),
(1438, 569, 11, 60.0, '2021-02-12 08:10:12', '2021-02-12 08:10:12', NULL),
(1439, 570, 9, 6.0, '2021-02-12 08:10:12', '2021-02-12 08:10:12', NULL),
(1440, 570, 12, 6.0, '2021-02-12 08:10:12', '2021-02-12 08:10:12', NULL),
(1441, 570, 13, 6.0, '2021-02-12 08:10:12', '2021-02-12 08:10:12', NULL),
(1442, 570, 14, 6.0, '2021-02-12 08:10:12', '2021-02-12 08:10:12', NULL),
(1443, 571, 3, 60.0, '2021-02-12 08:10:42', '2021-02-12 08:10:42', NULL),
(1444, 571, 4, 60.0, '2021-02-12 08:10:42', '2021-02-12 08:10:42', NULL),
(1445, 571, 10, 60.0, '2021-02-12 08:10:42', '2021-02-12 08:10:42', NULL),
(1446, 571, 11, 60.0, '2021-02-12 08:10:42', '2021-02-12 08:10:42', NULL),
(1447, 572, 9, 6.0, '2021-02-12 08:10:42', '2021-02-12 08:10:42', NULL),
(1448, 572, 12, 6.0, '2021-02-12 08:10:42', '2021-02-12 08:10:42', NULL),
(1449, 572, 13, 6.0, '2021-02-12 08:10:42', '2021-02-12 08:10:42', NULL),
(1450, 572, 14, 6.0, '2021-02-12 08:10:42', '2021-02-12 08:10:42', NULL),
(1451, 573, 3, 60.0, '2021-02-12 08:12:29', '2021-02-12 08:12:29', NULL),
(1452, 573, 4, 60.0, '2021-02-12 08:12:29', '2021-02-12 08:12:29', NULL),
(1453, 573, 10, 60.0, '2021-02-12 08:12:29', '2021-02-12 08:12:29', NULL),
(1454, 573, 11, 60.0, '2021-02-12 08:12:29', '2021-02-12 08:12:29', NULL),
(1455, 574, 9, 6.0, '2021-02-12 08:12:29', '2021-02-12 08:12:29', NULL),
(1456, 574, 12, 6.0, '2021-02-12 08:12:29', '2021-02-12 08:12:29', NULL),
(1457, 574, 13, 6.0, '2021-02-12 08:12:29', '2021-02-12 08:12:29', NULL),
(1458, 574, 14, 6.0, '2021-02-12 08:12:29', '2021-02-12 08:12:29', NULL),
(1459, 575, 3, 60.0, '2021-02-12 08:13:24', '2021-02-12 08:13:24', NULL),
(1460, 575, 4, 60.0, '2021-02-12 08:13:24', '2021-02-12 08:13:24', NULL),
(1461, 575, 10, 60.0, '2021-02-12 08:13:24', '2021-02-12 08:13:24', NULL),
(1462, 575, 11, 60.0, '2021-02-12 08:13:24', '2021-02-12 08:13:24', NULL),
(1463, 576, 9, 6.0, '2021-02-12 08:13:24', '2021-02-12 08:13:24', NULL),
(1464, 576, 12, 6.0, '2021-02-12 08:13:24', '2021-02-12 08:13:24', NULL),
(1465, 576, 13, 6.0, '2021-02-12 08:13:24', '2021-02-12 08:13:24', NULL),
(1466, 576, 14, 6.0, '2021-02-12 08:13:24', '2021-02-12 08:13:24', NULL),
(1467, 577, 3, 60.0, '2021-02-12 08:14:48', '2021-02-12 08:14:48', NULL),
(1468, 577, 4, 60.0, '2021-02-12 08:14:48', '2021-02-12 08:14:48', NULL),
(1469, 577, 10, 60.0, '2021-02-12 08:14:48', '2021-02-12 08:14:48', NULL),
(1470, 577, 11, 60.0, '2021-02-12 08:14:48', '2021-02-12 08:14:48', NULL),
(1471, 578, 9, 6.0, '2021-02-12 08:14:48', '2021-02-12 08:14:48', NULL),
(1472, 578, 12, 6.0, '2021-02-12 08:14:48', '2021-02-12 08:14:48', NULL),
(1473, 578, 13, 6.0, '2021-02-12 08:14:48', '2021-02-12 08:14:48', NULL),
(1474, 578, 14, 6.0, '2021-02-12 08:14:48', '2021-02-12 08:14:48', NULL),
(1475, 579, 3, 60.0, '2021-02-12 08:15:25', '2021-02-12 08:15:25', NULL),
(1476, 579, 4, 60.0, '2021-02-12 08:15:25', '2021-02-12 08:15:25', NULL),
(1477, 579, 10, 60.0, '2021-02-12 08:15:25', '2021-02-12 08:15:25', NULL),
(1478, 579, 11, 60.0, '2021-02-12 08:15:25', '2021-02-12 08:15:25', NULL),
(1479, 580, 9, 6.0, '2021-02-12 08:15:25', '2021-02-12 08:15:25', NULL),
(1480, 580, 12, 6.0, '2021-02-12 08:15:26', '2021-02-12 08:15:26', NULL),
(1481, 580, 13, 6.0, '2021-02-12 08:15:26', '2021-02-12 08:15:26', NULL),
(1482, 580, 14, 6.0, '2021-02-12 08:15:26', '2021-02-12 08:15:26', NULL),
(1483, 581, 3, 110.0, '2021-02-12 08:20:05', '2021-02-12 08:20:05', NULL),
(1484, 581, 4, 110.0, '2021-02-12 08:20:05', '2021-02-12 08:20:05', NULL),
(1485, 581, 10, 110.0, '2021-02-12 08:20:05', '2021-02-12 08:20:05', NULL),
(1486, 581, 11, 110.0, '2021-02-12 08:20:05', '2021-02-12 08:20:05', NULL),
(1487, 582, 9, 8.0, '2021-02-12 08:20:05', '2021-02-12 08:20:05', NULL),
(1488, 582, 12, 8.0, '2021-02-12 08:20:05', '2021-02-12 08:20:05', NULL),
(1489, 582, 13, 8.0, '2021-02-12 08:20:05', '2021-02-12 08:20:05', NULL),
(1490, 582, 14, 8.0, '2021-02-12 08:20:05', '2021-02-12 08:20:05', NULL),
(1491, 583, 3, 60.0, '2021-02-12 08:20:51', '2021-02-12 08:20:51', NULL),
(1492, 583, 4, 60.0, '2021-02-12 08:20:51', '2021-02-12 08:20:51', NULL),
(1493, 583, 10, 60.0, '2021-02-12 08:20:51', '2021-02-12 08:20:51', NULL),
(1494, 583, 11, 60.0, '2021-02-12 08:20:51', '2021-02-12 08:20:51', NULL),
(1495, 584, 9, 6.0, '2021-02-12 08:20:51', '2021-02-12 08:20:51', NULL),
(1496, 584, 12, 6.0, '2021-02-12 08:20:51', '2021-02-12 08:20:51', NULL),
(1497, 584, 13, 6.0, '2021-02-12 08:20:51', '2021-02-12 08:20:51', NULL),
(1498, 584, 14, 6.0, '2021-02-12 08:20:51', '2021-02-12 08:20:51', NULL),
(1499, 585, 3, 60.0, '2021-02-12 08:21:21', '2021-02-12 08:21:21', NULL),
(1500, 585, 4, 60.0, '2021-02-12 08:21:21', '2021-02-12 08:21:21', NULL),
(1501, 585, 10, 60.0, '2021-02-12 08:21:21', '2021-02-12 08:21:21', NULL),
(1502, 585, 11, 60.0, '2021-02-12 08:21:21', '2021-02-12 08:21:21', NULL),
(1503, 586, 9, 6.0, '2021-02-12 08:21:21', '2021-02-12 08:21:21', NULL),
(1504, 586, 12, 6.0, '2021-02-12 08:21:21', '2021-02-12 08:21:21', NULL),
(1505, 586, 13, 6.0, '2021-02-12 08:21:21', '2021-02-12 08:21:21', NULL),
(1506, 586, 14, 6.0, '2021-02-12 08:21:21', '2021-02-12 08:21:21', NULL),
(1507, 587, 3, 80.0, '2021-02-12 08:24:44', '2021-02-12 08:24:44', NULL),
(1508, 587, 4, 80.0, '2021-02-12 08:24:44', '2021-02-12 08:24:44', NULL),
(1509, 587, 10, 80.0, '2021-02-12 08:24:44', '2021-02-12 08:24:44', NULL),
(1510, 587, 11, 80.0, '2021-02-12 08:24:44', '2021-02-12 08:24:44', NULL),
(1511, 588, 9, 6.5, '2021-02-12 08:24:44', '2021-02-12 08:24:44', NULL),
(1512, 588, 12, 6.5, '2021-02-12 08:24:44', '2021-02-12 08:24:44', NULL),
(1513, 588, 13, 6.5, '2021-02-12 08:24:44', '2021-02-12 08:24:44', NULL),
(1514, 588, 14, 6.5, '2021-02-12 08:24:44', '2021-02-12 08:24:44', NULL),
(1515, 589, 3, 40.0, '2021-02-12 08:26:51', '2021-02-12 08:26:51', NULL),
(1516, 589, 4, 40.0, '2021-02-12 08:26:51', '2021-02-12 08:26:51', NULL),
(1517, 589, 10, 40.0, '2021-02-12 08:26:51', '2021-02-12 08:26:51', NULL),
(1518, 589, 11, 40.0, '2021-02-12 08:26:51', '2021-02-12 08:26:51', NULL),
(1519, 590, 9, 5.0, '2021-02-12 08:26:51', '2021-02-12 08:26:51', NULL),
(1520, 590, 12, 5.0, '2021-02-12 08:26:51', '2021-02-12 08:26:51', NULL),
(1521, 590, 13, 5.0, '2021-02-12 08:26:51', '2021-02-12 08:26:51', NULL),
(1522, 590, 14, 5.0, '2021-02-12 08:26:51', '2021-02-12 08:26:51', NULL),
(1523, 591, 3, 60.0, '2021-02-12 08:29:19', '2021-02-12 08:29:19', NULL),
(1524, 591, 4, 60.0, '2021-02-12 08:29:19', '2021-02-12 08:29:19', NULL),
(1525, 591, 10, 60.0, '2021-02-12 08:29:19', '2021-02-12 08:29:19', NULL),
(1526, 591, 11, 60.0, '2021-02-12 08:29:19', '2021-02-12 08:29:19', NULL),
(1527, 592, 9, 6.0, '2021-02-12 08:29:19', '2021-02-12 08:29:19', NULL),
(1528, 592, 12, 6.0, '2021-02-12 08:29:19', '2021-02-12 08:29:19', NULL),
(1529, 592, 13, 6.0, '2021-02-12 08:29:19', '2021-02-12 08:29:19', NULL),
(1530, 592, 14, 6.0, '2021-02-12 08:29:19', '2021-02-12 08:29:19', NULL),
(1531, 593, 3, 60.0, '2021-02-12 08:31:39', '2021-02-12 08:31:39', NULL),
(1532, 593, 4, 60.0, '2021-02-12 08:31:39', '2021-02-12 08:31:39', NULL),
(1533, 593, 10, 60.0, '2021-02-12 08:31:39', '2021-02-12 08:31:39', NULL),
(1534, 593, 11, 60.0, '2021-02-12 08:31:39', '2021-02-12 08:31:39', NULL),
(1535, 594, 9, 6.0, '2021-02-12 08:31:39', '2021-02-12 08:31:39', NULL),
(1536, 594, 12, 6.0, '2021-02-12 08:31:39', '2021-02-12 08:31:39', NULL),
(1537, 594, 13, 6.0, '2021-02-12 08:31:39', '2021-02-12 08:31:39', NULL),
(1538, 594, 14, 6.0, '2021-02-12 08:31:39', '2021-02-12 08:31:39', NULL),
(1539, 595, 3, 60.0, '2021-02-12 08:33:23', '2021-02-12 08:33:23', NULL),
(1540, 595, 4, 60.0, '2021-02-12 08:33:23', '2021-02-12 08:33:23', NULL),
(1541, 595, 10, 60.0, '2021-02-12 08:33:23', '2021-02-12 08:33:23', NULL),
(1542, 595, 11, 60.0, '2021-02-12 08:33:23', '2021-02-12 08:33:23', NULL),
(1543, 596, 9, 6.0, '2021-02-12 08:33:23', '2021-02-12 08:33:23', NULL),
(1544, 596, 12, 6.0, '2021-02-12 08:33:23', '2021-02-12 08:33:23', NULL),
(1545, 596, 13, 6.0, '2021-02-12 08:33:23', '2021-02-12 08:33:23', NULL),
(1546, 596, 14, 6.0, '2021-02-12 08:33:23', '2021-02-12 08:33:23', NULL),
(1547, 597, 3, 80.0, '2021-02-12 08:35:51', '2021-02-12 08:35:51', NULL),
(1548, 597, 4, 80.0, '2021-02-12 08:35:51', '2021-02-12 08:35:51', NULL),
(1549, 597, 10, 80.0, '2021-02-12 08:35:51', '2021-02-12 08:35:51', NULL),
(1550, 597, 11, 80.0, '2021-02-12 08:35:51', '2021-02-12 08:35:51', NULL),
(1551, 598, 9, 6.5, '2021-02-12 08:35:51', '2021-02-12 08:35:51', NULL),
(1552, 598, 12, 6.5, '2021-02-12 08:35:51', '2021-02-12 08:35:51', NULL),
(1553, 598, 13, 6.5, '2021-02-12 08:35:51', '2021-02-12 08:35:51', NULL),
(1554, 598, 14, 6.5, '2021-02-12 08:35:51', '2021-02-12 08:35:51', NULL),
(1555, 599, 3, 80.0, '2021-02-12 08:37:04', '2021-02-12 08:37:04', NULL),
(1556, 599, 4, 80.0, '2021-02-12 08:37:04', '2021-02-12 08:37:04', NULL),
(1557, 599, 10, 80.0, '2021-02-12 08:37:04', '2021-02-12 08:37:04', NULL),
(1558, 599, 11, 80.0, '2021-02-12 08:37:04', '2021-02-12 08:37:04', NULL),
(1559, 600, 9, 6.5, '2021-02-12 08:37:04', '2021-02-12 08:37:04', NULL),
(1560, 600, 12, 6.5, '2021-02-12 08:37:04', '2021-02-12 08:37:04', NULL),
(1561, 600, 13, 6.5, '2021-02-12 08:37:04', '2021-02-12 08:37:04', NULL),
(1562, 600, 14, 6.5, '2021-02-12 08:37:04', '2021-02-12 08:37:04', NULL),
(1563, 601, 3, 50.0, '2021-02-12 08:38:57', '2021-02-12 08:38:57', NULL),
(1564, 601, 4, 50.0, '2021-02-12 08:38:57', '2021-02-12 08:38:57', NULL),
(1565, 601, 10, 50.0, '2021-02-12 08:38:57', '2021-02-12 08:38:57', NULL),
(1566, 601, 11, 50.0, '2021-02-12 08:38:57', '2021-02-12 08:38:57', NULL),
(1567, 602, 9, 5.5, '2021-02-12 08:38:57', '2021-02-12 08:38:57', NULL),
(1568, 602, 12, 5.5, '2021-02-12 08:38:57', '2021-02-12 08:38:57', NULL),
(1569, 602, 13, 5.5, '2021-02-12 08:38:57', '2021-02-12 08:38:57', NULL),
(1570, 602, 14, 5.5, '2021-02-12 08:38:57', '2021-02-12 08:38:57', NULL),
(1571, 603, 3, 80.0, '2021-02-12 09:08:09', '2021-02-12 09:08:09', NULL),
(1572, 603, 4, 80.0, '2021-02-12 09:08:09', '2021-02-12 09:08:09', NULL),
(1573, 603, 10, 80.0, '2021-02-12 09:08:09', '2021-02-12 09:08:09', NULL),
(1574, 603, 11, 80.0, '2021-02-12 09:08:09', '2021-02-12 09:08:09', NULL),
(1575, 604, 9, 6.0, '2021-02-12 09:08:09', '2021-02-12 09:08:09', NULL),
(1576, 604, 12, 6.0, '2021-02-12 09:08:09', '2021-02-12 09:08:09', NULL),
(1577, 604, 13, 6.0, '2021-02-12 09:08:09', '2021-02-12 09:08:09', NULL),
(1578, 604, 14, 6.0, '2021-02-12 09:08:09', '2021-02-12 09:08:09', NULL),
(1579, 605, 3, 80.0, '2021-02-13 06:48:22', '2021-02-13 06:48:22', NULL),
(1580, 605, 4, 80.0, '2021-02-13 06:48:22', '2021-02-13 06:48:22', NULL),
(1581, 605, 10, 80.0, '2021-02-13 06:48:22', '2021-02-13 06:48:22', NULL),
(1582, 605, 11, 80.0, '2021-02-13 06:48:22', '2021-02-13 06:48:22', NULL),
(1583, 606, 9, 6.0, '2021-02-13 06:48:22', '2021-02-13 06:48:22', NULL),
(1584, 606, 12, 6.0, '2021-02-13 06:48:22', '2021-02-13 06:48:22', NULL),
(1585, 606, 13, 6.0, '2021-02-13 06:48:22', '2021-02-13 06:48:22', NULL),
(1586, 606, 14, 6.0, '2021-02-13 06:48:22', '2021-02-13 06:48:22', NULL),
(1587, 607, 3, 80.0, '2021-02-13 06:50:52', '2021-02-13 06:50:52', NULL),
(1588, 607, 4, 80.0, '2021-02-13 06:50:52', '2021-02-13 06:50:52', NULL),
(1589, 607, 10, 80.0, '2021-02-13 06:50:52', '2021-02-13 06:50:52', NULL),
(1590, 607, 11, 80.0, '2021-02-13 06:50:52', '2021-02-13 06:50:52', NULL),
(1591, 608, 9, 6.0, '2021-02-13 06:50:52', '2021-02-13 06:50:52', NULL),
(1592, 608, 12, 6.0, '2021-02-13 06:50:52', '2021-02-13 06:50:52', NULL),
(1593, 608, 13, 6.0, '2021-02-13 06:50:52', '2021-02-13 06:50:52', NULL),
(1594, 608, 14, 6.0, '2021-02-13 06:50:52', '2021-02-13 06:50:52', NULL),
(1595, 609, 3, 80.0, '2021-02-13 06:58:52', '2021-02-13 06:58:52', NULL),
(1596, 609, 4, 80.0, '2021-02-13 06:58:52', '2021-02-13 06:58:52', NULL),
(1597, 609, 10, 80.0, '2021-02-13 06:58:52', '2021-02-13 06:58:52', NULL),
(1598, 609, 11, 80.0, '2021-02-13 06:58:52', '2021-02-13 06:58:52', NULL),
(1599, 610, 9, 6.0, '2021-02-13 06:58:52', '2021-02-13 06:58:52', NULL),
(1600, 610, 12, 6.0, '2021-02-13 06:58:52', '2021-02-13 06:58:52', NULL),
(1601, 610, 13, 6.0, '2021-02-13 06:58:52', '2021-02-13 06:58:52', NULL),
(1602, 610, 14, 6.0, '2021-02-13 06:58:52', '2021-02-13 06:58:52', NULL),
(1603, 611, 3, 80.0, '2021-02-13 06:59:44', '2021-02-13 06:59:44', NULL),
(1604, 611, 4, 80.0, '2021-02-13 06:59:44', '2021-02-13 06:59:44', NULL),
(1605, 611, 10, 80.0, '2021-02-13 06:59:44', '2021-02-13 06:59:44', NULL),
(1606, 611, 11, 80.0, '2021-02-13 06:59:44', '2021-02-13 06:59:44', NULL),
(1607, 612, 9, 6.0, '2021-02-13 06:59:44', '2021-02-13 06:59:44', NULL),
(1608, 612, 12, 6.0, '2021-02-13 06:59:44', '2021-02-13 06:59:44', NULL),
(1609, 612, 13, 6.0, '2021-02-13 06:59:44', '2021-02-13 06:59:44', NULL),
(1610, 612, 14, 6.0, '2021-02-13 06:59:44', '2021-02-13 06:59:44', NULL),
(1611, 613, 3, 80.0, '2021-02-13 07:02:28', '2021-02-13 07:02:28', NULL),
(1612, 613, 4, 80.0, '2021-02-13 07:02:28', '2021-02-13 07:02:28', NULL),
(1613, 613, 10, 80.0, '2021-02-13 07:02:28', '2021-02-13 07:02:28', NULL),
(1614, 613, 11, 80.0, '2021-02-13 07:02:28', '2021-02-13 07:02:28', NULL),
(1615, 614, 9, 6.0, '2021-02-13 07:02:28', '2021-02-13 07:02:28', NULL),
(1616, 614, 12, 6.0, '2021-02-13 07:02:28', '2021-02-13 07:02:28', NULL),
(1617, 614, 13, 6.0, '2021-02-13 07:02:28', '2021-02-13 07:02:28', NULL),
(1618, 614, 14, 6.0, '2021-02-13 07:02:28', '2021-02-13 07:02:28', NULL),
(1619, 615, 3, 90.0, '2021-02-13 08:07:43', '2021-02-13 08:07:43', NULL),
(1620, 615, 4, 90.0, '2021-02-13 08:07:43', '2021-02-13 08:07:43', NULL),
(1621, 615, 10, 90.0, '2021-02-13 08:07:43', '2021-02-13 08:07:43', NULL),
(1622, 615, 11, 90.0, '2021-02-13 08:07:43', '2021-02-13 08:07:43', NULL),
(1623, 616, 9, 6.5, '2021-02-13 08:07:43', '2021-02-13 08:07:43', NULL),
(1624, 616, 12, 6.5, '2021-02-13 08:07:43', '2021-02-13 08:07:43', NULL),
(1625, 616, 13, 6.5, '2021-02-13 08:07:43', '2021-02-13 08:07:43', NULL),
(1626, 616, 14, 6.5, '2021-02-13 08:07:43', '2021-02-13 08:07:43', NULL),
(1627, 617, 3, 90.0, '2021-02-13 08:09:07', '2021-02-13 08:09:07', NULL),
(1628, 617, 4, 90.0, '2021-02-13 08:09:07', '2021-02-13 08:09:07', NULL),
(1629, 617, 10, 90.0, '2021-02-13 08:09:07', '2021-02-13 08:09:07', NULL),
(1630, 617, 11, 90.0, '2021-02-13 08:09:07', '2021-02-13 08:09:07', NULL),
(1631, 618, 9, 6.5, '2021-02-13 08:09:07', '2021-02-13 08:09:07', NULL),
(1632, 618, 12, 6.5, '2021-02-13 08:09:07', '2021-02-13 08:09:07', NULL),
(1633, 618, 13, 6.5, '2021-02-13 08:09:07', '2021-02-13 08:09:07', NULL),
(1634, 618, 14, 6.5, '2021-02-13 08:09:07', '2021-02-13 08:09:07', NULL),
(1635, 619, 3, 90.0, '2021-02-13 08:10:41', '2021-02-13 08:10:41', NULL),
(1636, 619, 4, 90.0, '2021-02-13 08:10:41', '2021-02-13 08:10:41', NULL),
(1637, 619, 10, 90.0, '2021-02-13 08:10:41', '2021-02-13 08:10:41', NULL),
(1638, 619, 11, 90.0, '2021-02-13 08:10:41', '2021-02-13 08:10:41', NULL),
(1639, 620, 9, 6.5, '2021-02-13 08:10:41', '2021-02-13 08:10:41', NULL),
(1640, 620, 12, 6.5, '2021-02-13 08:10:41', '2021-02-13 08:10:41', NULL),
(1641, 620, 13, 6.5, '2021-02-13 08:10:41', '2021-02-13 08:10:41', NULL),
(1642, 620, 14, 6.5, '2021-02-13 08:10:41', '2021-02-13 08:10:41', NULL),
(1643, 621, 3, 90.0, '2021-02-13 08:23:55', '2021-02-13 08:23:55', NULL),
(1644, 621, 4, 90.0, '2021-02-13 08:23:55', '2021-02-13 08:23:55', NULL),
(1645, 621, 10, 90.0, '2021-02-13 08:23:55', '2021-02-13 08:23:55', NULL),
(1646, 621, 11, 90.0, '2021-02-13 08:23:55', '2021-02-13 08:23:55', NULL),
(1647, 622, 9, 6.5, '2021-02-13 08:23:55', '2021-02-13 08:23:55', NULL),
(1648, 622, 12, 6.5, '2021-02-13 08:23:55', '2021-02-13 08:23:55', NULL),
(1649, 622, 13, 6.5, '2021-02-13 08:23:55', '2021-02-13 08:23:55', NULL),
(1650, 622, 14, 6.5, '2021-02-13 08:23:55', '2021-02-13 08:23:55', NULL),
(1651, 623, 3, 90.0, '2021-02-13 08:24:17', '2021-02-13 08:24:17', NULL),
(1652, 623, 4, 90.0, '2021-02-13 08:24:17', '2021-02-13 08:24:17', NULL),
(1653, 623, 10, 90.0, '2021-02-13 08:24:17', '2021-02-13 08:24:17', NULL),
(1654, 623, 11, 90.0, '2021-02-13 08:24:17', '2021-02-13 08:24:17', NULL),
(1655, 624, 9, 6.5, '2021-02-13 08:24:17', '2021-02-13 08:24:17', NULL),
(1656, 624, 12, 6.5, '2021-02-13 08:24:17', '2021-02-13 08:24:17', NULL),
(1657, 624, 13, 6.5, '2021-02-13 08:24:17', '2021-02-13 08:24:17', NULL),
(1658, 624, 14, 6.5, '2021-02-13 08:24:17', '2021-02-13 08:24:17', NULL),
(1659, 625, 3, 90.0, '2021-02-13 08:24:24', '2021-02-13 08:24:24', NULL),
(1660, 625, 4, 90.0, '2021-02-13 08:24:24', '2021-02-13 08:24:24', NULL),
(1661, 625, 10, 90.0, '2021-02-13 08:24:24', '2021-02-13 08:24:24', NULL),
(1662, 625, 11, 90.0, '2021-02-13 08:24:24', '2021-02-13 08:24:24', NULL),
(1663, 626, 9, 6.5, '2021-02-13 08:24:24', '2021-02-13 08:24:24', NULL),
(1664, 626, 12, 6.5, '2021-02-13 08:24:24', '2021-02-13 08:24:24', NULL),
(1665, 626, 13, 6.5, '2021-02-13 08:24:24', '2021-02-13 08:24:24', NULL),
(1666, 626, 14, 6.5, '2021-02-13 08:24:24', '2021-02-13 08:24:24', NULL),
(1667, 627, 3, 90.0, '2021-02-13 08:24:41', '2021-02-13 08:24:41', NULL),
(1668, 627, 4, 90.0, '2021-02-13 08:24:41', '2021-02-13 08:24:41', NULL),
(1669, 627, 10, 90.0, '2021-02-13 08:24:41', '2021-02-13 08:24:41', NULL),
(1670, 627, 11, 90.0, '2021-02-13 08:24:41', '2021-02-13 08:24:41', NULL),
(1671, 628, 9, 6.5, '2021-02-13 08:24:41', '2021-02-13 08:24:41', NULL),
(1672, 628, 12, 6.5, '2021-02-13 08:24:41', '2021-02-13 08:24:41', NULL),
(1673, 628, 13, 6.5, '2021-02-13 08:24:41', '2021-02-13 08:24:41', NULL),
(1674, 628, 14, 6.5, '2021-02-13 08:24:41', '2021-02-13 08:24:41', NULL),
(1675, 629, 3, 90.0, '2021-02-13 08:26:35', '2021-02-13 08:26:35', NULL),
(1676, 629, 4, 90.0, '2021-02-13 08:26:35', '2021-02-13 08:26:35', NULL),
(1677, 629, 10, 90.0, '2021-02-13 08:26:35', '2021-02-13 08:26:35', NULL),
(1678, 629, 11, 90.0, '2021-02-13 08:26:35', '2021-02-13 08:26:35', NULL),
(1679, 630, 9, 6.5, '2021-02-13 08:26:35', '2021-02-13 08:26:35', NULL),
(1680, 630, 12, 6.5, '2021-02-13 08:26:35', '2021-02-13 08:26:35', NULL),
(1681, 630, 13, 6.5, '2021-02-13 08:26:35', '2021-02-13 08:26:35', NULL),
(1682, 630, 14, 6.5, '2021-02-13 08:26:35', '2021-02-13 08:26:35', NULL),
(1683, 631, 3, 90.0, '2021-02-13 08:27:30', '2021-02-13 08:27:30', NULL),
(1684, 631, 4, 90.0, '2021-02-13 08:27:30', '2021-02-13 08:27:30', NULL),
(1685, 631, 10, 90.0, '2021-02-13 08:27:30', '2021-02-13 08:27:30', NULL),
(1686, 631, 11, 90.0, '2021-02-13 08:27:30', '2021-02-13 08:27:30', NULL),
(1687, 632, 9, 6.5, '2021-02-13 08:27:30', '2021-02-13 08:27:30', NULL),
(1688, 632, 12, 6.5, '2021-02-13 08:27:30', '2021-02-13 08:27:30', NULL),
(1689, 632, 13, 6.5, '2021-02-13 08:27:30', '2021-02-13 08:27:30', NULL),
(1690, 632, 14, 6.5, '2021-02-13 08:27:30', '2021-02-13 08:27:30', NULL),
(1691, 633, 3, NULL, '2021-02-13 10:28:53', '2021-02-13 10:28:53', NULL),
(1692, 633, 4, NULL, '2021-02-13 10:28:53', '2021-02-13 10:28:53', NULL),
(1693, 633, 10, NULL, '2021-02-13 10:28:53', '2021-02-13 10:28:53', NULL),
(1694, 633, 11, NULL, '2021-02-13 10:28:53', '2021-02-13 10:28:53', NULL),
(1695, 634, 9, 5.0, '2021-02-13 10:28:53', '2021-02-13 10:28:53', NULL),
(1696, 634, 12, 5.0, '2021-02-13 10:28:53', '2021-02-13 10:28:53', NULL),
(1697, 634, 13, 5.0, '2021-02-13 10:28:53', '2021-02-13 10:28:53', NULL),
(1698, 634, 14, 5.0, '2021-02-13 10:28:53', '2021-02-13 10:28:53', NULL),
(1699, 635, 3, NULL, '2021-02-13 10:29:38', '2021-02-13 10:29:38', NULL),
(1700, 635, 4, NULL, '2021-02-13 10:29:38', '2021-02-13 10:29:38', NULL),
(1701, 635, 10, NULL, '2021-02-13 10:29:38', '2021-02-13 10:29:38', NULL),
(1702, 635, 11, NULL, '2021-02-13 10:29:38', '2021-02-13 10:29:38', NULL),
(1703, 636, 9, 5.5, '2021-02-13 10:29:38', '2021-02-13 10:29:38', NULL),
(1704, 636, 12, 5.5, '2021-02-13 10:29:38', '2021-02-13 10:29:38', NULL),
(1705, 636, 13, 5.5, '2021-02-13 10:29:38', '2021-02-13 10:29:38', NULL),
(1706, 636, 14, 5.5, '2021-02-13 10:29:38', '2021-02-13 10:29:38', NULL),
(1707, 637, 3, NULL, '2021-02-13 10:30:36', '2021-02-13 10:30:36', NULL),
(1708, 637, 4, NULL, '2021-02-13 10:30:36', '2021-02-13 10:30:36', NULL),
(1709, 637, 10, NULL, '2021-02-13 10:30:36', '2021-02-13 10:30:36', NULL),
(1710, 637, 11, NULL, '2021-02-13 10:30:36', '2021-02-13 10:30:36', NULL),
(1711, 638, 9, 5.5, '2021-02-13 10:30:36', '2021-02-13 10:30:36', NULL),
(1712, 638, 12, 5.5, '2021-02-13 10:30:36', '2021-02-13 10:30:36', NULL),
(1713, 638, 13, 5.5, '2021-02-13 10:30:36', '2021-02-13 10:30:36', NULL),
(1714, 638, 14, 5.5, '2021-02-13 10:30:36', '2021-02-13 10:30:36', NULL),
(1715, 639, 3, NULL, '2021-02-13 10:45:36', '2021-02-13 10:45:36', NULL),
(1716, 639, 4, NULL, '2021-02-13 10:45:36', '2021-02-13 10:45:36', NULL),
(1717, 639, 10, NULL, '2021-02-13 10:45:36', '2021-02-13 10:45:36', NULL),
(1718, 639, 11, NULL, '2021-02-13 10:45:36', '2021-02-13 10:45:36', NULL),
(1719, 640, 9, 5.5, '2021-02-13 10:45:36', '2021-02-13 10:45:36', NULL),
(1720, 640, 12, 5.5, '2021-02-13 10:45:36', '2021-02-13 10:45:36', NULL),
(1721, 640, 13, 5.5, '2021-02-13 10:45:36', '2021-02-13 10:45:36', NULL),
(1722, 640, 14, 5.5, '2021-02-13 10:45:36', '2021-02-13 10:45:36', NULL),
(1723, 641, 3, NULL, '2021-02-15 07:16:48', '2021-02-15 07:16:48', NULL),
(1724, 641, 4, NULL, '2021-02-15 07:16:48', '2021-02-15 07:16:48', NULL),
(1725, 641, 10, NULL, '2021-02-15 07:16:48', '2021-02-15 07:16:48', NULL),
(1726, 641, 11, NULL, '2021-02-15 07:16:48', '2021-02-15 07:16:48', NULL),
(1727, 642, 9, 5.5, '2021-02-15 07:16:48', '2021-02-15 07:16:48', NULL),
(1728, 642, 12, 5.5, '2021-02-15 07:16:48', '2021-02-15 07:16:48', NULL),
(1729, 642, 13, 5.5, '2021-02-15 07:16:48', '2021-02-15 07:16:48', NULL),
(1730, 642, 14, 5.5, '2021-02-15 07:16:48', '2021-02-15 07:16:48', NULL),
(1731, 643, 3, NULL, '2021-02-15 07:22:00', '2021-02-15 07:22:00', NULL),
(1732, 643, 4, NULL, '2021-02-15 07:22:00', '2021-02-15 07:22:00', NULL),
(1733, 643, 10, NULL, '2021-02-15 07:22:00', '2021-02-15 07:22:00', NULL),
(1734, 643, 11, NULL, '2021-02-15 07:22:00', '2021-02-15 07:22:00', NULL),
(1735, 644, 9, 5.5, '2021-02-15 07:22:00', '2021-02-15 07:22:00', NULL),
(1736, 644, 12, 5.5, '2021-02-15 07:22:00', '2021-02-15 07:22:00', NULL),
(1737, 644, 13, 5.5, '2021-02-15 07:22:00', '2021-02-15 07:22:00', NULL),
(1738, 644, 14, 5.5, '2021-02-15 07:22:00', '2021-02-15 07:22:00', NULL),
(1739, 645, 3, NULL, '2021-02-15 07:23:46', '2021-02-15 07:23:46', NULL),
(1740, 645, 4, NULL, '2021-02-15 07:23:46', '2021-02-15 07:23:46', NULL),
(1741, 645, 10, NULL, '2021-02-15 07:23:46', '2021-02-15 07:23:46', NULL),
(1742, 645, 11, NULL, '2021-02-15 07:23:46', '2021-02-15 07:23:46', NULL),
(1743, 646, 9, 5.5, '2021-02-15 07:23:46', '2021-02-15 07:23:46', NULL),
(1744, 646, 12, 5.5, '2021-02-15 07:23:46', '2021-02-15 07:23:46', NULL),
(1745, 646, 13, 5.5, '2021-02-15 07:23:46', '2021-02-15 07:23:46', NULL),
(1746, 646, 14, 5.5, '2021-02-15 07:23:46', '2021-02-15 07:23:46', NULL),
(1747, 647, 3, NULL, '2021-02-15 07:25:30', '2021-02-15 07:25:30', NULL),
(1748, 647, 4, NULL, '2021-02-15 07:25:30', '2021-02-15 07:25:30', NULL),
(1749, 647, 10, NULL, '2021-02-15 07:25:30', '2021-02-15 07:25:30', NULL),
(1750, 647, 11, NULL, '2021-02-15 07:25:30', '2021-02-15 07:25:30', NULL),
(1751, 648, 9, 5.5, '2021-02-15 07:25:30', '2021-02-15 07:25:30', NULL),
(1752, 648, 12, 5.5, '2021-02-15 07:25:30', '2021-02-15 07:25:30', NULL),
(1753, 648, 13, 5.5, '2021-02-15 07:25:30', '2021-02-15 07:25:30', NULL),
(1754, 648, 14, 5.5, '2021-02-15 07:25:30', '2021-02-15 07:25:30', NULL),
(1755, 649, 3, NULL, '2021-02-15 07:26:01', '2021-02-15 07:26:01', NULL),
(1756, 649, 4, NULL, '2021-02-15 07:26:01', '2021-02-15 07:26:01', NULL),
(1757, 649, 10, NULL, '2021-02-15 07:26:01', '2021-02-15 07:26:01', NULL),
(1758, 649, 11, NULL, '2021-02-15 07:26:01', '2021-02-15 07:26:01', NULL),
(1759, 650, 9, 5.5, '2021-02-15 07:26:01', '2021-02-15 07:26:01', NULL),
(1760, 650, 12, 5.5, '2021-02-15 07:26:01', '2021-02-15 07:26:01', NULL),
(1761, 650, 13, 5.5, '2021-02-15 07:26:01', '2021-02-15 07:26:01', NULL),
(1762, 650, 14, 5.5, '2021-02-15 07:26:01', '2021-02-15 07:26:01', NULL),
(1763, 651, 3, NULL, '2021-02-15 07:32:48', '2021-02-15 07:32:48', NULL),
(1764, 651, 4, NULL, '2021-02-15 07:32:48', '2021-02-15 07:32:48', NULL),
(1765, 651, 10, NULL, '2021-02-15 07:32:48', '2021-02-15 07:32:48', NULL),
(1766, 651, 11, NULL, '2021-02-15 07:32:48', '2021-02-15 07:32:48', NULL),
(1767, 652, 9, 5.5, '2021-02-15 07:32:48', '2021-02-15 07:32:48', NULL),
(1768, 652, 12, 5.5, '2021-02-15 07:32:48', '2021-02-15 07:32:48', NULL),
(1769, 652, 13, 5.5, '2021-02-15 07:32:48', '2021-02-15 07:32:48', NULL),
(1770, 652, 14, 5.5, '2021-02-15 07:32:48', '2021-02-15 07:32:48', NULL),
(1771, 653, 3, NULL, '2021-02-15 07:51:35', '2021-02-15 07:51:35', NULL),
(1772, 653, 4, NULL, '2021-02-15 07:51:35', '2021-02-15 07:51:35', NULL),
(1773, 653, 10, NULL, '2021-02-15 07:51:35', '2021-02-15 07:51:35', NULL),
(1774, 653, 11, NULL, '2021-02-15 07:51:35', '2021-02-15 07:51:35', NULL),
(1775, 654, 9, 5.5, '2021-02-15 07:51:35', '2021-02-15 07:51:35', NULL),
(1776, 654, 12, 5.5, '2021-02-15 07:51:35', '2021-02-15 07:51:35', NULL),
(1777, 654, 13, 5.5, '2021-02-15 07:51:35', '2021-02-15 07:51:35', NULL),
(1778, 654, 14, 5.5, '2021-02-15 07:51:35', '2021-02-15 07:51:35', NULL),
(1779, 655, 3, NULL, '2021-02-15 07:52:39', '2021-02-15 07:52:39', NULL),
(1780, 655, 4, NULL, '2021-02-15 07:52:39', '2021-02-15 07:52:39', NULL),
(1781, 655, 10, NULL, '2021-02-15 07:52:39', '2021-02-15 07:52:39', NULL),
(1782, 655, 11, NULL, '2021-02-15 07:52:39', '2021-02-15 07:52:39', NULL),
(1783, 656, 9, 5.5, '2021-02-15 07:52:39', '2021-02-15 07:52:39', NULL),
(1784, 656, 12, 5.5, '2021-02-15 07:52:39', '2021-02-15 07:52:39', NULL),
(1785, 656, 13, 5.5, '2021-02-15 07:52:39', '2021-02-15 07:52:39', NULL),
(1786, 656, 14, 5.5, '2021-02-15 07:52:39', '2021-02-15 07:52:39', NULL),
(1787, 657, 3, NULL, '2021-02-15 07:53:12', '2021-02-15 07:53:12', NULL),
(1788, 657, 4, NULL, '2021-02-15 07:53:12', '2021-02-15 07:53:12', NULL),
(1789, 657, 10, NULL, '2021-02-15 07:53:12', '2021-02-15 07:53:12', NULL),
(1790, 657, 11, NULL, '2021-02-15 07:53:12', '2021-02-15 07:53:12', NULL),
(1791, 658, 9, 5.5, '2021-02-15 07:53:12', '2021-02-15 07:53:12', NULL),
(1792, 658, 12, 5.5, '2021-02-15 07:53:12', '2021-02-15 07:53:12', NULL),
(1793, 658, 13, 5.5, '2021-02-15 07:53:12', '2021-02-15 07:53:12', NULL),
(1794, 658, 14, 5.5, '2021-02-15 07:53:12', '2021-02-15 07:53:12', NULL),
(1795, 659, 3, NULL, '2021-02-15 07:53:57', '2021-02-15 07:53:57', NULL),
(1796, 659, 4, NULL, '2021-02-15 07:53:57', '2021-02-15 07:53:57', NULL),
(1797, 659, 10, NULL, '2021-02-15 07:53:57', '2021-02-15 07:53:57', NULL),
(1798, 659, 11, NULL, '2021-02-15 07:53:57', '2021-02-15 07:53:57', NULL),
(1799, 660, 9, 5.5, '2021-02-15 07:53:57', '2021-02-15 07:53:57', NULL),
(1800, 660, 12, 5.5, '2021-02-15 07:53:57', '2021-02-15 07:53:57', NULL),
(1801, 660, 13, 5.5, '2021-02-15 07:53:57', '2021-02-15 07:53:57', NULL),
(1802, 660, 14, 5.5, '2021-02-15 07:53:57', '2021-02-15 07:53:57', NULL),
(1803, 661, 3, NULL, '2021-02-15 08:05:19', '2021-02-15 08:05:19', NULL),
(1804, 661, 4, NULL, '2021-02-15 08:05:19', '2021-02-15 08:05:19', NULL),
(1805, 661, 10, NULL, '2021-02-15 08:05:19', '2021-02-15 08:05:19', NULL),
(1806, 661, 11, NULL, '2021-02-15 08:05:19', '2021-02-15 08:05:19', NULL),
(1807, 662, 9, 5.5, '2021-02-15 08:05:19', '2021-02-15 08:05:19', NULL),
(1808, 662, 12, 5.5, '2021-02-15 08:05:19', '2021-02-15 08:05:19', NULL),
(1809, 662, 13, 5.5, '2021-02-15 08:05:19', '2021-02-15 08:05:19', NULL),
(1810, 662, 14, 5.5, '2021-02-15 08:05:19', '2021-02-15 08:05:19', NULL),
(1811, 663, 3, NULL, '2021-02-15 08:05:59', '2021-02-15 08:05:59', NULL),
(1812, 663, 4, NULL, '2021-02-15 08:05:59', '2021-02-15 08:05:59', NULL),
(1813, 663, 10, NULL, '2021-02-15 08:05:59', '2021-02-15 08:05:59', NULL),
(1814, 663, 11, NULL, '2021-02-15 08:05:59', '2021-02-15 08:05:59', NULL),
(1815, 664, 9, 5.5, '2021-02-15 08:05:59', '2021-02-15 08:05:59', NULL),
(1816, 664, 12, 5.5, '2021-02-15 08:05:59', '2021-02-15 08:05:59', NULL),
(1817, 664, 13, 5.5, '2021-02-15 08:05:59', '2021-02-15 08:05:59', NULL),
(1818, 664, 14, 5.5, '2021-02-15 08:05:59', '2021-02-15 08:05:59', NULL),
(1819, 665, 3, NULL, '2021-02-15 08:06:32', '2021-02-15 08:06:32', NULL),
(1820, 665, 4, NULL, '2021-02-15 08:06:32', '2021-02-15 08:06:32', NULL),
(1821, 665, 10, NULL, '2021-02-15 08:06:32', '2021-02-15 08:06:32', NULL),
(1822, 665, 11, NULL, '2021-02-15 08:06:32', '2021-02-15 08:06:32', NULL),
(1823, 666, 9, 5.5, '2021-02-15 08:06:32', '2021-02-15 08:06:32', NULL),
(1824, 666, 12, 5.5, '2021-02-15 08:06:32', '2021-02-15 08:06:32', NULL),
(1825, 666, 13, 5.5, '2021-02-15 08:06:32', '2021-02-15 08:06:32', NULL),
(1826, 666, 14, 5.5, '2021-02-15 08:06:32', '2021-02-15 08:06:32', NULL),
(1827, 667, 3, NULL, '2021-02-15 08:07:42', '2021-02-15 08:07:42', NULL),
(1828, 667, 4, NULL, '2021-02-15 08:07:42', '2021-02-15 08:07:42', NULL),
(1829, 667, 10, NULL, '2021-02-15 08:07:42', '2021-02-15 08:07:42', NULL),
(1830, 667, 11, NULL, '2021-02-15 08:07:42', '2021-02-15 08:07:42', NULL),
(1831, 668, 9, 5.5, '2021-02-15 08:07:42', '2021-02-15 08:07:42', NULL),
(1832, 668, 12, 5.5, '2021-02-15 08:07:42', '2021-02-15 08:07:42', NULL),
(1833, 668, 13, 5.5, '2021-02-15 08:07:42', '2021-02-15 08:07:42', NULL),
(1834, 668, 14, 5.5, '2021-02-15 08:07:42', '2021-02-15 08:07:42', NULL),
(1835, 669, 3, NULL, '2021-02-15 08:08:13', '2021-02-15 08:08:13', NULL),
(1836, 669, 4, NULL, '2021-02-15 08:08:13', '2021-02-15 08:08:13', NULL),
(1837, 669, 10, NULL, '2021-02-15 08:08:13', '2021-02-15 08:08:13', NULL),
(1838, 669, 11, NULL, '2021-02-15 08:08:13', '2021-02-15 08:08:13', NULL),
(1839, 670, 9, 5.5, '2021-02-15 08:08:13', '2021-02-15 08:08:13', NULL),
(1840, 670, 12, 5.5, '2021-02-15 08:08:13', '2021-02-15 08:08:13', NULL),
(1841, 670, 13, 5.5, '2021-02-15 08:08:13', '2021-02-15 08:08:13', NULL),
(1842, 670, 14, 5.5, '2021-02-15 08:08:13', '2021-02-15 08:08:13', NULL),
(1843, 671, 3, NULL, '2021-02-15 09:22:36', '2021-02-15 09:22:36', NULL),
(1844, 671, 4, NULL, '2021-02-15 09:22:36', '2021-02-15 09:22:36', NULL),
(1845, 671, 10, NULL, '2021-02-15 09:22:36', '2021-02-15 09:22:36', NULL),
(1846, 671, 11, NULL, '2021-02-15 09:22:36', '2021-02-15 09:22:36', NULL),
(1847, 672, 9, 6.0, '2021-02-15 09:22:36', '2021-02-15 09:22:36', NULL),
(1848, 672, 12, 6.0, '2021-02-15 09:22:36', '2021-02-15 09:22:36', NULL),
(1849, 672, 13, 6.0, '2021-02-15 09:22:36', '2021-02-15 09:22:36', NULL),
(1850, 672, 14, 6.0, '2021-02-15 09:22:36', '2021-02-15 09:22:36', NULL),
(1851, 673, 3, NULL, '2021-02-15 09:23:41', '2021-02-15 09:23:41', NULL),
(1852, 673, 4, NULL, '2021-02-15 09:23:41', '2021-02-15 09:23:41', NULL),
(1853, 673, 10, NULL, '2021-02-15 09:23:41', '2021-02-15 09:23:41', NULL),
(1854, 673, 11, NULL, '2021-02-15 09:23:41', '2021-02-15 09:23:41', NULL),
(1855, 674, 9, 6.0, '2021-02-15 09:23:41', '2021-02-15 09:23:41', NULL),
(1856, 674, 12, 6.0, '2021-02-15 09:23:41', '2021-02-15 09:23:41', NULL),
(1857, 674, 13, 6.0, '2021-02-15 09:23:41', '2021-02-15 09:23:41', NULL),
(1858, 674, 14, 6.0, '2021-02-15 09:23:41', '2021-02-15 09:23:41', NULL),
(1859, 675, 3, NULL, '2021-02-15 09:33:29', '2021-02-15 09:33:29', NULL),
(1860, 675, 4, NULL, '2021-02-15 09:33:29', '2021-02-15 09:33:29', NULL),
(1861, 675, 10, NULL, '2021-02-15 09:33:29', '2021-02-15 09:33:29', NULL),
(1862, 675, 11, NULL, '2021-02-15 09:33:29', '2021-02-15 09:33:29', NULL),
(1863, 676, 9, 6.0, '2021-02-15 09:33:29', '2021-02-15 09:33:29', NULL),
(1864, 676, 12, 6.0, '2021-02-15 09:33:29', '2021-02-15 09:33:29', NULL),
(1865, 676, 13, 6.0, '2021-02-15 09:33:29', '2021-02-15 09:33:29', NULL),
(1866, 676, 14, 6.0, '2021-02-15 09:33:29', '2021-02-15 09:33:29', NULL),
(1867, 677, 3, NULL, '2021-02-15 09:34:02', '2021-02-15 09:34:02', NULL),
(1868, 677, 4, NULL, '2021-02-15 09:34:02', '2021-02-15 09:34:02', NULL),
(1869, 677, 10, NULL, '2021-02-15 09:34:02', '2021-02-15 09:34:02', NULL),
(1870, 677, 11, NULL, '2021-02-15 09:34:02', '2021-02-15 09:34:02', NULL),
(1871, 678, 9, 6.0, '2021-02-15 09:34:02', '2021-02-15 09:34:02', NULL),
(1872, 678, 12, 6.0, '2021-02-15 09:34:02', '2021-02-15 09:34:02', NULL),
(1873, 678, 13, 6.0, '2021-02-15 09:34:02', '2021-02-15 09:34:02', NULL),
(1874, 678, 14, 6.0, '2021-02-15 09:34:02', '2021-02-15 09:34:02', NULL),
(1875, 679, 3, NULL, '2021-02-15 09:34:58', '2021-02-15 09:34:58', NULL),
(1876, 679, 4, NULL, '2021-02-15 09:34:58', '2021-02-15 09:34:58', NULL),
(1877, 679, 10, NULL, '2021-02-15 09:34:58', '2021-02-15 09:34:58', NULL),
(1878, 679, 11, NULL, '2021-02-15 09:34:58', '2021-02-15 09:34:58', NULL),
(1879, 680, 9, 6.0, '2021-02-15 09:34:58', '2021-02-15 09:34:58', NULL),
(1880, 680, 12, 6.0, '2021-02-15 09:34:58', '2021-02-15 09:34:58', NULL),
(1881, 680, 13, 6.0, '2021-02-15 09:34:58', '2021-02-15 09:34:58', NULL),
(1882, 680, 14, 6.0, '2021-02-15 09:34:58', '2021-02-15 09:34:58', NULL),
(1883, 681, 3, NULL, '2021-02-15 09:36:06', '2021-02-15 09:36:06', NULL),
(1884, 681, 4, NULL, '2021-02-15 09:36:06', '2021-02-15 09:36:06', NULL),
(1885, 681, 10, NULL, '2021-02-15 09:36:06', '2021-02-15 09:36:06', NULL),
(1886, 681, 11, NULL, '2021-02-15 09:36:06', '2021-02-15 09:36:06', NULL),
(1887, 682, 9, 6.0, '2021-02-15 09:36:06', '2021-02-15 09:36:06', NULL),
(1888, 682, 12, 6.0, '2021-02-15 09:36:06', '2021-02-15 09:36:06', NULL),
(1889, 682, 13, 6.0, '2021-02-15 09:36:06', '2021-02-15 09:36:06', NULL),
(1890, 682, 14, 6.0, '2021-02-15 09:36:06', '2021-02-15 09:36:06', NULL),
(1891, 683, 3, NULL, '2021-02-15 09:37:59', '2021-02-15 09:37:59', NULL),
(1892, 683, 4, NULL, '2021-02-15 09:37:59', '2021-02-15 09:37:59', NULL),
(1893, 683, 10, NULL, '2021-02-15 09:37:59', '2021-02-15 09:37:59', NULL),
(1894, 683, 11, NULL, '2021-02-15 09:37:59', '2021-02-15 09:37:59', NULL),
(1895, 684, 9, 6.0, '2021-02-15 09:37:59', '2021-02-15 09:37:59', NULL),
(1896, 684, 12, 6.0, '2021-02-15 09:37:59', '2021-02-15 09:37:59', NULL),
(1897, 684, 13, 6.0, '2021-02-15 09:37:59', '2021-02-15 09:37:59', NULL),
(1898, 684, 14, 6.0, '2021-02-15 09:37:59', '2021-02-15 09:37:59', NULL),
(1899, 685, 3, NULL, '2021-02-15 09:39:00', '2021-02-15 09:39:00', NULL),
(1900, 685, 4, NULL, '2021-02-15 09:39:00', '2021-02-15 09:39:00', NULL),
(1901, 685, 10, NULL, '2021-02-15 09:39:00', '2021-02-15 09:39:00', NULL),
(1902, 685, 11, NULL, '2021-02-15 09:39:00', '2021-02-15 09:39:00', NULL),
(1903, 686, 9, 6.0, '2021-02-15 09:39:00', '2021-02-15 09:39:00', NULL),
(1904, 686, 12, 6.0, '2021-02-15 09:39:00', '2021-02-15 09:39:00', NULL),
(1905, 686, 13, 6.0, '2021-02-15 09:39:00', '2021-02-15 09:39:00', NULL),
(1906, 686, 14, 6.0, '2021-02-15 09:39:00', '2021-02-15 09:39:00', NULL),
(1907, 687, 3, NULL, '2021-02-15 09:39:41', '2021-02-15 09:39:41', NULL),
(1908, 687, 4, NULL, '2021-02-15 09:39:41', '2021-02-15 09:39:41', NULL),
(1909, 687, 10, NULL, '2021-02-15 09:39:41', '2021-02-15 09:39:41', NULL),
(1910, 687, 11, NULL, '2021-02-15 09:39:41', '2021-02-15 09:39:41', NULL),
(1911, 688, 9, 6.0, '2021-02-15 09:39:41', '2021-02-15 09:39:41', NULL),
(1912, 688, 12, 6.0, '2021-02-15 09:39:41', '2021-02-15 09:39:41', NULL),
(1913, 688, 13, 6.0, '2021-02-15 09:39:41', '2021-02-15 09:39:41', NULL),
(1914, 688, 14, 6.0, '2021-02-15 09:39:41', '2021-02-15 09:39:41', NULL),
(1915, 689, 3, NULL, '2021-02-15 09:40:08', '2021-02-15 09:40:08', NULL),
(1916, 689, 4, NULL, '2021-02-15 09:40:08', '2021-02-15 09:40:08', NULL),
(1917, 689, 10, NULL, '2021-02-15 09:40:08', '2021-02-15 09:40:08', NULL),
(1918, 689, 11, NULL, '2021-02-15 09:40:08', '2021-02-15 09:40:08', NULL),
(1919, 690, 9, 6.0, '2021-02-15 09:40:08', '2021-02-15 09:40:08', NULL),
(1920, 690, 12, 6.0, '2021-02-15 09:40:08', '2021-02-15 09:40:08', NULL),
(1921, 690, 13, 6.0, '2021-02-15 09:40:08', '2021-02-15 09:40:08', NULL),
(1922, 690, 14, 6.0, '2021-02-15 09:40:08', '2021-02-15 09:40:08', NULL),
(1923, 691, 3, NULL, '2021-02-15 10:52:01', '2021-02-15 10:52:01', NULL),
(1924, 691, 4, NULL, '2021-02-15 10:52:01', '2021-02-15 10:52:01', NULL),
(1925, 691, 10, NULL, '2021-02-15 10:52:01', '2021-02-15 10:52:01', NULL),
(1926, 691, 11, NULL, '2021-02-15 10:52:01', '2021-02-15 10:52:01', NULL),
(1927, 692, 9, NULL, '2021-02-15 10:52:01', '2021-02-15 10:52:01', NULL),
(1928, 692, 12, NULL, '2021-02-15 10:52:01', '2021-02-15 10:52:01', NULL),
(1929, 692, 13, NULL, '2021-02-15 10:52:01', '2021-02-15 10:52:01', NULL),
(1930, 692, 14, NULL, '2021-02-15 10:52:01', '2021-02-15 10:52:01', NULL),
(1931, 693, 3, NULL, '2021-02-15 11:00:58', '2021-02-15 11:00:58', NULL),
(1932, 693, 4, NULL, '2021-02-15 11:00:58', '2021-02-15 11:00:58', NULL),
(1933, 693, 10, NULL, '2021-02-15 11:00:58', '2021-02-15 11:00:58', NULL),
(1934, 693, 11, NULL, '2021-02-15 11:00:58', '2021-02-15 11:00:58', NULL),
(1935, 694, 9, NULL, '2021-02-15 11:00:58', '2021-02-15 11:00:58', NULL),
(1936, 694, 12, NULL, '2021-02-15 11:00:58', '2021-02-15 11:00:58', NULL),
(1937, 694, 13, NULL, '2021-02-15 11:00:58', '2021-02-15 11:00:58', NULL),
(1938, 694, 14, NULL, '2021-02-15 11:00:58', '2021-02-15 11:00:58', NULL),
(1939, 695, 3, NULL, '2021-02-15 11:38:44', '2021-02-15 11:38:44', NULL),
(1940, 695, 4, NULL, '2021-02-15 11:38:44', '2021-02-15 11:38:44', NULL),
(1941, 695, 10, NULL, '2021-02-15 11:38:44', '2021-02-15 11:38:44', NULL),
(1942, 695, 11, NULL, '2021-02-15 11:38:44', '2021-02-15 11:38:44', NULL),
(1943, 696, 9, NULL, '2021-02-15 11:38:44', '2021-02-15 11:38:44', NULL),
(1944, 696, 12, NULL, '2021-02-15 11:38:44', '2021-02-15 11:38:44', NULL),
(1945, 696, 13, NULL, '2021-02-15 11:38:44', '2021-02-15 11:38:44', NULL),
(1946, 696, 14, NULL, '2021-02-15 11:38:44', '2021-02-15 11:38:44', NULL),
(1947, 697, 3, NULL, '2021-02-15 11:46:13', '2021-02-15 11:46:13', NULL),
(1948, 697, 4, NULL, '2021-02-15 11:46:13', '2021-02-15 11:46:13', NULL),
(1949, 697, 10, NULL, '2021-02-15 11:46:13', '2021-02-15 11:46:13', NULL),
(1950, 697, 11, NULL, '2021-02-15 11:46:13', '2021-02-15 11:46:13', NULL),
(1951, 698, 9, NULL, '2021-02-15 11:46:13', '2021-02-15 11:46:13', NULL),
(1952, 698, 12, NULL, '2021-02-15 11:46:13', '2021-02-15 11:46:13', NULL),
(1953, 698, 13, NULL, '2021-02-15 11:46:13', '2021-02-15 11:46:13', NULL),
(1954, 698, 14, NULL, '2021-02-15 11:46:13', '2021-02-15 11:46:13', NULL),
(1955, 699, 3, NULL, '2021-02-15 11:47:05', '2021-02-15 11:47:05', NULL),
(1956, 699, 4, NULL, '2021-02-15 11:47:05', '2021-02-15 11:47:05', NULL),
(1957, 699, 10, NULL, '2021-02-15 11:47:05', '2021-02-15 11:47:05', NULL),
(1958, 699, 11, NULL, '2021-02-15 11:47:05', '2021-02-15 11:47:05', NULL),
(1959, 700, 9, NULL, '2021-02-15 11:47:05', '2021-02-15 11:47:05', NULL),
(1960, 700, 12, NULL, '2021-02-15 11:47:05', '2021-02-15 11:47:05', NULL),
(1961, 700, 13, NULL, '2021-02-15 11:47:05', '2021-02-15 11:47:05', NULL),
(1962, 700, 14, NULL, '2021-02-15 11:47:05', '2021-02-15 11:47:05', NULL),
(1963, 701, 3, NULL, '2021-02-15 11:48:21', '2021-02-15 11:48:21', NULL),
(1964, 701, 4, NULL, '2021-02-15 11:48:21', '2021-02-15 11:48:21', NULL),
(1965, 701, 10, NULL, '2021-02-15 11:48:21', '2021-02-15 11:48:21', NULL),
(1966, 701, 11, NULL, '2021-02-15 11:48:21', '2021-02-15 11:48:21', NULL),
(1967, 702, 9, NULL, '2021-02-15 11:48:21', '2021-02-15 11:48:21', NULL),
(1968, 702, 12, NULL, '2021-02-15 11:48:21', '2021-02-15 11:48:21', NULL),
(1969, 702, 13, NULL, '2021-02-15 11:48:21', '2021-02-15 11:48:21', NULL),
(1970, 702, 14, NULL, '2021-02-15 11:48:21', '2021-02-15 11:48:21', NULL),
(1971, 703, 3, NULL, '2021-02-15 11:48:41', '2021-02-15 11:48:41', NULL),
(1972, 703, 4, NULL, '2021-02-15 11:48:41', '2021-02-15 11:48:41', NULL),
(1973, 703, 10, NULL, '2021-02-15 11:48:41', '2021-02-15 11:48:41', NULL),
(1974, 703, 11, NULL, '2021-02-15 11:48:41', '2021-02-15 11:48:41', NULL),
(1975, 704, 9, NULL, '2021-02-15 11:48:41', '2021-02-15 11:48:41', NULL),
(1976, 704, 12, NULL, '2021-02-15 11:48:41', '2021-02-15 11:48:41', NULL),
(1977, 704, 13, NULL, '2021-02-15 11:48:41', '2021-02-15 11:48:41', NULL),
(1978, 704, 14, NULL, '2021-02-15 11:48:41', '2021-02-15 11:48:41', NULL),
(1979, 705, 3, NULL, '2021-02-15 11:49:52', '2021-02-15 11:49:52', NULL),
(1980, 705, 4, NULL, '2021-02-15 11:49:52', '2021-02-15 11:49:52', NULL),
(1981, 705, 10, NULL, '2021-02-15 11:49:52', '2021-02-15 11:49:52', NULL),
(1982, 705, 11, NULL, '2021-02-15 11:49:52', '2021-02-15 11:49:52', NULL),
(1983, 706, 9, NULL, '2021-02-15 11:49:52', '2021-02-15 11:49:52', NULL),
(1984, 706, 12, NULL, '2021-02-15 11:49:52', '2021-02-15 11:49:52', NULL),
(1985, 706, 13, NULL, '2021-02-15 11:49:52', '2021-02-15 11:49:52', NULL),
(1986, 706, 14, NULL, '2021-02-15 11:49:52', '2021-02-15 11:49:52', NULL),
(1987, 707, 3, NULL, '2021-02-15 11:50:59', '2021-02-15 11:50:59', NULL),
(1988, 707, 4, NULL, '2021-02-15 11:50:59', '2021-02-15 11:50:59', NULL),
(1989, 707, 10, NULL, '2021-02-15 11:50:59', '2021-02-15 11:50:59', NULL),
(1990, 707, 11, NULL, '2021-02-15 11:50:59', '2021-02-15 11:50:59', NULL),
(1991, 708, 9, NULL, '2021-02-15 11:50:59', '2021-02-15 11:50:59', NULL),
(1992, 708, 12, NULL, '2021-02-15 11:50:59', '2021-02-15 11:50:59', NULL),
(1993, 708, 13, NULL, '2021-02-15 11:50:59', '2021-02-15 11:50:59', NULL),
(1994, 708, 14, NULL, '2021-02-15 11:50:59', '2021-02-15 11:50:59', NULL),
(1995, 709, 3, NULL, '2021-02-15 11:51:11', '2021-02-15 11:51:11', NULL),
(1996, 709, 4, NULL, '2021-02-15 11:51:11', '2021-02-15 11:51:11', NULL),
(1997, 709, 10, NULL, '2021-02-15 11:51:11', '2021-02-15 11:51:11', NULL),
(1998, 709, 11, NULL, '2021-02-15 11:51:11', '2021-02-15 11:51:11', NULL),
(1999, 710, 9, NULL, '2021-02-15 11:51:11', '2021-02-15 11:51:11', NULL),
(2000, 710, 12, NULL, '2021-02-15 11:51:11', '2021-02-15 11:51:11', NULL),
(2001, 710, 13, NULL, '2021-02-15 11:51:11', '2021-02-15 11:51:11', NULL),
(2002, 710, 14, NULL, '2021-02-15 11:51:11', '2021-02-15 11:51:11', NULL),
(2003, 711, 3, NULL, '2021-02-15 11:51:22', '2021-02-15 11:51:22', NULL),
(2004, 711, 4, NULL, '2021-02-15 11:51:22', '2021-02-15 11:51:22', NULL),
(2005, 711, 10, NULL, '2021-02-15 11:51:22', '2021-02-15 11:51:22', NULL),
(2006, 711, 11, NULL, '2021-02-15 11:51:22', '2021-02-15 11:51:22', NULL),
(2007, 712, 9, NULL, '2021-02-15 11:51:22', '2021-02-15 11:51:22', NULL),
(2008, 712, 12, NULL, '2021-02-15 11:51:23', '2021-02-15 11:51:23', NULL),
(2009, 712, 13, NULL, '2021-02-15 11:51:23', '2021-02-15 11:51:23', NULL),
(2010, 712, 14, NULL, '2021-02-15 11:51:23', '2021-02-15 11:51:23', NULL),
(2011, 713, 3, NULL, '2021-02-15 11:51:35', '2021-02-15 11:51:35', NULL),
(2012, 713, 4, NULL, '2021-02-15 11:51:35', '2021-02-15 11:51:35', NULL),
(2013, 713, 10, NULL, '2021-02-15 11:51:35', '2021-02-15 11:51:35', NULL),
(2014, 713, 11, NULL, '2021-02-15 11:51:35', '2021-02-15 11:51:35', NULL),
(2015, 714, 9, NULL, '2021-02-15 11:51:35', '2021-02-15 11:51:35', NULL),
(2016, 714, 12, NULL, '2021-02-15 11:51:35', '2021-02-15 11:51:35', NULL),
(2017, 714, 13, NULL, '2021-02-15 11:51:35', '2021-02-15 11:51:35', NULL),
(2018, 714, 14, NULL, '2021-02-15 11:51:35', '2021-02-15 11:51:35', NULL),
(2019, 715, 3, NULL, '2021-02-15 11:52:42', '2021-02-15 11:52:42', NULL),
(2020, 715, 4, NULL, '2021-02-15 11:52:42', '2021-02-15 11:52:42', NULL),
(2021, 715, 10, NULL, '2021-02-15 11:52:42', '2021-02-15 11:52:42', NULL),
(2022, 715, 11, NULL, '2021-02-15 11:52:42', '2021-02-15 11:52:42', NULL),
(2023, 716, 9, NULL, '2021-02-15 11:52:42', '2021-02-15 11:52:42', NULL),
(2024, 716, 12, NULL, '2021-02-15 11:52:42', '2021-02-15 11:52:42', NULL),
(2025, 716, 13, NULL, '2021-02-15 11:52:42', '2021-02-15 11:52:42', NULL),
(2026, 716, 14, NULL, '2021-02-15 11:52:42', '2021-02-15 11:52:42', NULL),
(2027, 717, 3, NULL, '2021-02-17 07:00:03', '2021-02-17 07:00:03', NULL),
(2028, 717, 4, NULL, '2021-02-17 07:00:03', '2021-02-17 07:00:03', NULL),
(2029, 717, 10, NULL, '2021-02-17 07:00:03', '2021-02-17 07:00:03', NULL),
(2030, 717, 11, NULL, '2021-02-17 07:00:03', '2021-02-17 07:00:03', NULL),
(2031, 718, 9, 6.5, '2021-02-17 07:00:03', '2021-02-17 07:00:03', NULL),
(2032, 718, 12, 6.5, '2021-02-17 07:00:03', '2021-02-17 07:00:03', NULL),
(2033, 718, 13, 6.5, '2021-02-17 07:00:03', '2021-02-17 07:00:03', NULL),
(2034, 718, 14, 6.5, '2021-02-17 07:00:03', '2021-02-17 07:00:03', NULL),
(2035, 719, 3, NULL, '2021-02-17 07:39:12', '2021-02-17 07:39:12', NULL),
(2036, 719, 4, NULL, '2021-02-17 07:39:12', '2021-02-17 07:39:12', NULL),
(2037, 719, 10, NULL, '2021-02-17 07:39:12', '2021-02-17 07:39:12', NULL),
(2038, 719, 11, NULL, '2021-02-17 07:39:12', '2021-02-17 07:39:12', NULL),
(2039, 720, 9, 6.5, '2021-02-17 07:39:12', '2021-02-17 07:39:12', NULL),
(2040, 720, 12, 6.5, '2021-02-17 07:39:12', '2021-02-17 07:39:12', NULL),
(2041, 720, 13, 6.5, '2021-02-17 07:39:12', '2021-02-17 07:39:12', NULL),
(2042, 720, 14, 6.5, '2021-02-17 07:39:12', '2021-02-17 07:39:12', NULL),
(2043, 721, 3, NULL, '2021-02-17 07:39:55', '2021-02-17 07:39:55', NULL),
(2044, 721, 4, NULL, '2021-02-17 07:39:55', '2021-02-17 07:39:55', NULL),
(2045, 721, 10, NULL, '2021-02-17 07:39:55', '2021-02-17 07:39:55', NULL),
(2046, 721, 11, NULL, '2021-02-17 07:39:55', '2021-02-17 07:39:55', NULL),
(2047, 722, 9, 6.5, '2021-02-17 07:39:55', '2021-02-17 07:39:55', NULL),
(2048, 722, 12, 6.5, '2021-02-17 07:39:55', '2021-02-17 07:39:55', NULL),
(2049, 722, 13, 6.5, '2021-02-17 07:39:55', '2021-02-17 07:39:55', NULL),
(2050, 722, 14, 6.5, '2021-02-17 07:39:55', '2021-02-17 07:39:55', NULL),
(2051, 723, 3, NULL, '2021-02-17 07:40:41', '2021-02-17 07:40:41', NULL),
(2052, 723, 4, NULL, '2021-02-17 07:40:41', '2021-02-17 07:40:41', NULL),
(2053, 723, 10, NULL, '2021-02-17 07:40:41', '2021-02-17 07:40:41', NULL),
(2054, 723, 11, NULL, '2021-02-17 07:40:41', '2021-02-17 07:40:41', NULL),
(2055, 724, 9, 6.5, '2021-02-17 07:40:41', '2021-02-17 07:40:41', NULL),
(2056, 724, 12, 6.5, '2021-02-17 07:40:41', '2021-02-17 07:40:41', NULL),
(2057, 724, 13, 6.5, '2021-02-17 07:40:41', '2021-02-17 07:40:41', NULL),
(2058, 724, 14, 6.5, '2021-02-17 07:40:41', '2021-02-17 07:40:41', NULL),
(2059, 725, 3, NULL, '2021-02-17 07:42:03', '2021-02-17 07:42:03', NULL),
(2060, 725, 4, NULL, '2021-02-17 07:42:03', '2021-02-17 07:42:03', NULL),
(2061, 725, 10, NULL, '2021-02-17 07:42:03', '2021-02-17 07:42:03', NULL),
(2062, 725, 11, NULL, '2021-02-17 07:42:03', '2021-02-17 07:42:03', NULL),
(2063, 726, 9, 6.5, '2021-02-17 07:42:04', '2021-02-17 07:42:04', NULL),
(2064, 726, 12, 6.5, '2021-02-17 07:42:04', '2021-02-17 07:42:04', NULL),
(2065, 726, 13, 6.5, '2021-02-17 07:42:04', '2021-02-17 07:42:04', NULL),
(2066, 726, 14, 6.5, '2021-02-17 07:42:04', '2021-02-17 07:42:04', NULL),
(2067, 727, 3, NULL, '2021-02-17 07:42:54', '2021-02-17 07:42:54', NULL),
(2068, 727, 4, NULL, '2021-02-17 07:42:54', '2021-02-17 07:42:54', NULL),
(2069, 727, 10, NULL, '2021-02-17 07:42:54', '2021-02-17 07:42:54', NULL),
(2070, 727, 11, NULL, '2021-02-17 07:42:54', '2021-02-17 07:42:54', NULL),
(2071, 728, 9, 6.5, '2021-02-17 07:42:54', '2021-02-17 07:42:54', NULL),
(2072, 728, 12, 6.5, '2021-02-17 07:42:54', '2021-02-17 07:42:54', NULL),
(2073, 728, 13, 6.5, '2021-02-17 07:42:54', '2021-02-17 07:42:54', NULL),
(2074, 728, 14, 6.5, '2021-02-17 07:42:54', '2021-02-17 07:42:54', NULL),
(2075, 729, 3, NULL, '2021-02-17 07:45:07', '2021-02-17 07:45:07', NULL),
(2076, 729, 4, NULL, '2021-02-17 07:45:07', '2021-02-17 07:45:07', NULL),
(2077, 729, 10, NULL, '2021-02-17 07:45:07', '2021-02-17 07:45:07', NULL),
(2078, 729, 11, NULL, '2021-02-17 07:45:07', '2021-02-17 07:45:07', NULL),
(2079, 730, 9, 6.5, '2021-02-17 07:45:07', '2021-02-17 07:45:07', NULL),
(2080, 730, 12, 6.5, '2021-02-17 07:45:07', '2021-02-17 07:45:07', NULL),
(2081, 730, 13, 6.5, '2021-02-17 07:45:07', '2021-02-17 07:45:07', NULL),
(2082, 730, 14, 6.5, '2021-02-17 07:45:07', '2021-02-17 07:45:07', NULL),
(2083, 731, 3, NULL, '2021-02-17 07:47:03', '2021-02-17 07:47:03', NULL),
(2084, 731, 4, NULL, '2021-02-17 07:47:03', '2021-02-17 07:47:03', NULL),
(2085, 731, 10, NULL, '2021-02-17 07:47:03', '2021-02-17 07:47:03', NULL),
(2086, 731, 11, NULL, '2021-02-17 07:47:03', '2021-02-17 07:47:03', NULL),
(2087, 732, 9, 6.5, '2021-02-17 07:47:03', '2021-02-17 07:47:03', NULL),
(2088, 732, 12, 6.5, '2021-02-17 07:47:03', '2021-02-17 07:47:03', NULL),
(2089, 732, 13, 6.5, '2021-02-17 07:47:03', '2021-02-17 07:47:03', NULL),
(2090, 732, 14, 6.5, '2021-02-17 07:47:03', '2021-02-17 07:47:03', NULL),
(2091, 733, 3, NULL, '2021-02-17 08:33:51', '2021-02-17 08:33:51', NULL),
(2092, 733, 4, NULL, '2021-02-17 08:33:51', '2021-02-17 08:33:51', NULL),
(2093, 733, 10, NULL, '2021-02-17 08:33:51', '2021-02-17 08:33:51', NULL);
INSERT INTO `institution_program_exam_requirement_details` (`id`, `requirement_id`, `subsection_id`, `score`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2094, 733, 11, NULL, '2021-02-17 08:33:51', '2021-02-17 08:33:51', NULL),
(2095, 734, 9, 6.5, '2021-02-17 08:33:51', '2021-02-17 08:33:51', NULL),
(2096, 734, 12, 6.5, '2021-02-17 08:33:51', '2021-02-17 08:33:51', NULL),
(2097, 734, 13, 6.5, '2021-02-17 08:33:51', '2021-02-17 08:33:51', NULL),
(2098, 734, 14, 6.5, '2021-02-17 08:33:51', '2021-02-17 08:33:51', NULL),
(2099, 735, 3, NULL, '2021-02-17 08:34:51', '2021-02-17 08:34:51', NULL),
(2100, 735, 4, NULL, '2021-02-17 08:34:51', '2021-02-17 08:34:51', NULL),
(2101, 735, 10, NULL, '2021-02-17 08:34:51', '2021-02-17 08:34:51', NULL),
(2102, 735, 11, NULL, '2021-02-17 08:34:51', '2021-02-17 08:34:51', NULL),
(2103, 736, 9, 6.5, '2021-02-17 08:34:51', '2021-02-17 08:34:51', NULL),
(2104, 736, 12, 6.5, '2021-02-17 08:34:51', '2021-02-17 08:34:51', NULL),
(2105, 736, 13, 6.5, '2021-02-17 08:34:51', '2021-02-17 08:34:51', NULL),
(2106, 736, 14, 6.5, '2021-02-17 08:34:51', '2021-02-17 08:34:51', NULL),
(2107, 737, 3, NULL, '2021-02-17 08:35:38', '2021-02-17 08:35:38', NULL),
(2108, 737, 4, NULL, '2021-02-17 08:35:38', '2021-02-17 08:35:38', NULL),
(2109, 737, 10, NULL, '2021-02-17 08:35:38', '2021-02-17 08:35:38', NULL),
(2110, 737, 11, NULL, '2021-02-17 08:35:38', '2021-02-17 08:35:38', NULL),
(2111, 738, 9, 6.5, '2021-02-17 08:35:38', '2021-02-17 08:35:38', NULL),
(2112, 738, 12, 6.5, '2021-02-17 08:35:38', '2021-02-17 08:35:38', NULL),
(2113, 738, 13, 6.5, '2021-02-17 08:35:38', '2021-02-17 08:35:38', NULL),
(2114, 738, 14, 6.5, '2021-02-17 08:35:38', '2021-02-17 08:35:38', NULL),
(2115, 739, 3, NULL, '2021-02-17 11:38:39', '2021-02-17 11:38:39', NULL),
(2116, 739, 4, NULL, '2021-02-17 11:38:39', '2021-02-17 11:38:39', NULL),
(2117, 739, 10, NULL, '2021-02-17 11:38:39', '2021-02-17 11:38:39', NULL),
(2118, 739, 11, NULL, '2021-02-17 11:38:39', '2021-02-17 11:38:39', NULL),
(2119, 740, 9, 6.5, '2021-02-17 11:38:39', '2021-02-17 11:38:39', NULL),
(2120, 740, 12, 6.5, '2021-02-17 11:38:39', '2021-02-17 11:38:39', NULL),
(2121, 740, 13, 6.5, '2021-02-17 11:38:39', '2021-02-17 11:38:39', NULL),
(2122, 740, 14, 6.5, '2021-02-17 11:38:39', '2021-02-17 11:38:39', NULL),
(2123, 741, 3, NULL, '2021-02-17 11:39:29', '2021-02-17 11:39:29', NULL),
(2124, 741, 4, NULL, '2021-02-17 11:39:29', '2021-02-17 11:39:29', NULL),
(2125, 741, 10, NULL, '2021-02-17 11:39:29', '2021-02-17 11:39:29', NULL),
(2126, 741, 11, NULL, '2021-02-17 11:39:30', '2021-02-17 11:39:30', NULL),
(2127, 742, 9, 6.5, '2021-02-17 11:39:30', '2021-02-17 11:39:30', NULL),
(2128, 742, 12, 6.5, '2021-02-17 11:39:30', '2021-02-17 11:39:30', NULL),
(2129, 742, 13, 6.5, '2021-02-17 11:39:30', '2021-02-17 11:39:30', NULL),
(2130, 742, 14, 6.5, '2021-02-17 11:39:30', '2021-02-17 11:39:30', NULL),
(2131, 743, 3, NULL, '2021-02-25 11:54:15', '2021-02-25 11:54:15', NULL),
(2132, 743, 4, NULL, '2021-02-25 11:54:15', '2021-02-25 11:54:15', NULL),
(2133, 743, 10, NULL, '2021-02-25 11:54:15', '2021-02-25 11:54:15', NULL),
(2134, 743, 11, NULL, '2021-02-25 11:54:15', '2021-02-25 11:54:15', NULL),
(2135, 744, 3, NULL, '2021-02-25 12:03:42', '2021-02-25 12:03:42', NULL),
(2136, 744, 4, NULL, '2021-02-25 12:03:42', '2021-02-25 12:03:42', NULL),
(2137, 744, 10, NULL, '2021-02-25 12:03:42', '2021-02-25 12:03:42', NULL),
(2138, 744, 11, NULL, '2021-02-25 12:03:42', '2021-02-25 12:03:42', NULL),
(2139, 745, 3, NULL, '2021-02-25 12:05:13', '2021-02-25 12:05:13', NULL),
(2140, 745, 4, NULL, '2021-02-25 12:05:13', '2021-02-25 12:05:13', NULL),
(2141, 745, 10, NULL, '2021-02-25 12:05:13', '2021-02-25 12:05:13', NULL),
(2142, 745, 11, NULL, '2021-02-25 12:05:13', '2021-02-25 12:05:13', NULL),
(2143, 746, 9, NULL, '2021-02-25 12:05:13', '2021-02-25 12:05:13', NULL),
(2144, 746, 12, NULL, '2021-02-25 12:05:13', '2021-02-25 12:05:13', NULL),
(2145, 746, 13, NULL, '2021-02-25 12:05:13', '2021-02-25 12:05:13', NULL),
(2146, 746, 14, NULL, '2021-02-25 12:05:13', '2021-02-25 12:05:13', NULL),
(2147, 747, 3, NULL, '2021-02-25 12:13:01', '2021-02-25 12:13:01', NULL),
(2148, 747, 4, NULL, '2021-02-25 12:13:01', '2021-02-25 12:13:01', NULL),
(2149, 747, 10, NULL, '2021-02-25 12:13:01', '2021-02-25 12:13:01', NULL),
(2150, 747, 11, NULL, '2021-02-25 12:13:01', '2021-02-25 12:13:01', NULL),
(2151, 748, 9, NULL, '2021-02-25 12:13:01', '2021-02-25 12:13:01', NULL),
(2152, 748, 12, NULL, '2021-02-25 12:13:01', '2021-02-25 12:13:01', NULL),
(2153, 748, 13, NULL, '2021-02-25 12:13:01', '2021-02-25 12:13:01', NULL),
(2154, 748, 14, NULL, '2021-02-25 12:13:01', '2021-02-25 12:13:01', NULL),
(2155, 749, 3, NULL, '2021-02-25 12:13:16', '2021-02-25 12:13:16', NULL),
(2156, 749, 4, NULL, '2021-02-25 12:13:16', '2021-02-25 12:13:16', NULL),
(2157, 749, 10, NULL, '2021-02-25 12:13:16', '2021-02-25 12:13:16', NULL),
(2158, 749, 11, NULL, '2021-02-25 12:13:16', '2021-02-25 12:13:16', NULL),
(2159, 750, 9, NULL, '2021-02-25 12:13:16', '2021-02-25 12:13:16', NULL),
(2160, 750, 12, NULL, '2021-02-25 12:13:16', '2021-02-25 12:13:16', NULL),
(2161, 750, 13, NULL, '2021-02-25 12:13:16', '2021-02-25 12:13:16', NULL),
(2162, 750, 14, NULL, '2021-02-25 12:13:16', '2021-02-25 12:13:16', NULL),
(2163, 751, 3, NULL, '2021-02-25 12:13:29', '2021-02-25 12:13:29', NULL),
(2164, 751, 4, NULL, '2021-02-25 12:13:29', '2021-02-25 12:13:29', NULL),
(2165, 751, 10, NULL, '2021-02-25 12:13:29', '2021-02-25 12:13:29', NULL),
(2166, 751, 11, NULL, '2021-02-25 12:13:29', '2021-02-25 12:13:29', NULL),
(2167, 752, 9, NULL, '2021-02-25 12:13:29', '2021-02-25 12:13:29', NULL),
(2168, 752, 12, NULL, '2021-02-25 12:13:29', '2021-02-25 12:13:29', NULL),
(2169, 752, 13, NULL, '2021-02-25 12:13:29', '2021-02-25 12:13:29', NULL),
(2170, 752, 14, NULL, '2021-02-25 12:13:29', '2021-02-25 12:13:29', NULL),
(2171, 753, 3, NULL, '2021-02-25 12:13:51', '2021-02-25 12:13:51', NULL),
(2172, 753, 4, NULL, '2021-02-25 12:13:51', '2021-02-25 12:13:51', NULL),
(2173, 753, 10, NULL, '2021-02-25 12:13:51', '2021-02-25 12:13:51', NULL),
(2174, 753, 11, NULL, '2021-02-25 12:13:51', '2021-02-25 12:13:51', NULL),
(2175, 754, 9, NULL, '2021-02-25 12:13:51', '2021-02-25 12:13:51', NULL),
(2176, 754, 12, NULL, '2021-02-25 12:13:51', '2021-02-25 12:13:51', NULL),
(2177, 754, 13, NULL, '2021-02-25 12:13:51', '2021-02-25 12:13:51', NULL),
(2178, 754, 14, NULL, '2021-02-25 12:13:51', '2021-02-25 12:13:51', NULL),
(2179, 755, 3, NULL, '2021-02-25 13:13:30', '2021-02-25 13:13:30', NULL),
(2180, 755, 4, NULL, '2021-02-25 13:13:30', '2021-02-25 13:13:30', NULL),
(2181, 755, 10, NULL, '2021-02-25 13:13:30', '2021-02-25 13:13:30', NULL),
(2182, 755, 11, NULL, '2021-02-25 13:13:30', '2021-02-25 13:13:30', NULL),
(2183, 756, 9, NULL, '2021-02-25 13:13:30', '2021-02-25 13:13:30', NULL),
(2184, 756, 12, NULL, '2021-02-25 13:13:30', '2021-02-25 13:13:30', NULL),
(2185, 756, 13, NULL, '2021-02-25 13:13:30', '2021-02-25 13:13:30', NULL),
(2186, 756, 14, NULL, '2021-02-25 13:13:30', '2021-02-25 13:13:30', NULL);

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `institution_program_notify_tracks`
--

CREATE TABLE `institution_program_notify_tracks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `institution_program_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `institution_program_study_areas`
--

CREATE TABLE `institution_program_study_areas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `institution_program_id` bigint(20) UNSIGNED NOT NULL,
  `study_area_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `institution_program_study_areas`
--

INSERT INTO `institution_program_study_areas` (`id`, `institution_program_id`, `study_area_id`, `created_at`, `updated_at`) VALUES
(140, 127, 4, NULL, NULL),
(141, 128, 2, NULL, NULL),
(142, 128, 5, NULL, NULL),
(143, 129, 2, NULL, NULL),
(144, 130, 2, NULL, NULL),
(145, 131, 2, NULL, NULL),
(146, 132, 4, NULL, NULL),
(147, 133, 2, NULL, NULL),
(148, 133, 4, NULL, NULL),
(149, 134, 2, NULL, NULL),
(150, 135, 4, NULL, NULL),
(151, 136, 2, NULL, NULL),
(155, 138, 2, NULL, NULL),
(156, 139, 2, NULL, NULL),
(157, 140, 1, NULL, NULL),
(158, 140, 6, NULL, NULL),
(159, 141, 8, NULL, NULL),
(160, 142, 8, NULL, NULL),
(161, 143, 8, NULL, NULL),
(162, 144, 8, NULL, NULL),
(163, 145, 8, NULL, NULL),
(164, 146, 6, NULL, NULL),
(165, 147, 6, NULL, NULL),
(166, 148, 6, NULL, NULL),
(167, 149, 6, NULL, NULL),
(168, 150, 1, NULL, NULL),
(169, 150, 6, NULL, NULL),
(170, 151, 1, NULL, NULL),
(171, 151, 6, NULL, NULL),
(172, 152, 1, NULL, NULL),
(173, 152, 6, NULL, NULL),
(174, 153, 1, NULL, NULL),
(175, 153, 6, NULL, NULL),
(176, 154, 1, NULL, NULL),
(177, 154, 6, NULL, NULL),
(178, 155, 1, NULL, NULL),
(179, 155, 6, NULL, NULL),
(180, 156, 1, NULL, NULL),
(181, 156, 6, NULL, NULL),
(182, 157, 7, NULL, NULL),
(183, 158, 3, NULL, NULL),
(184, 159, 2, NULL, NULL),
(185, 160, 3, NULL, NULL),
(186, 160, 6, NULL, NULL),
(187, 161, 2, NULL, NULL),
(188, 162, 3, NULL, NULL),
(190, 163, 3, NULL, NULL),
(191, 164, 3, NULL, NULL),
(192, 165, 3, NULL, NULL),
(193, 165, 8, NULL, NULL),
(194, 164, 6, NULL, NULL),
(195, 163, 6, NULL, NULL),
(196, 162, 6, NULL, NULL),
(197, 166, 2, NULL, NULL),
(198, 167, 2, NULL, NULL),
(199, 168, 2, NULL, NULL),
(201, 170, 2, NULL, NULL),
(202, 171, 8, NULL, NULL),
(203, 172, 8, NULL, NULL),
(204, 173, 8, NULL, NULL),
(205, 174, 8, NULL, NULL),
(206, 175, 8, NULL, NULL),
(207, 176, 8, NULL, NULL),
(208, 177, 8, NULL, NULL),
(209, 178, 4, NULL, NULL),
(210, 178, 8, NULL, NULL),
(211, 179, 8, NULL, NULL),
(212, 180, 8, NULL, NULL),
(213, 181, 8, NULL, NULL),
(214, 182, 8, NULL, NULL),
(215, 183, 2, NULL, NULL),
(216, 183, 8, NULL, NULL),
(217, 184, 10, NULL, NULL),
(218, 185, 6, NULL, NULL),
(219, 186, 3, NULL, NULL),
(220, 186, 8, NULL, NULL),
(221, 187, 3, NULL, NULL),
(222, 187, 6, NULL, NULL),
(223, 188, 6, NULL, NULL),
(224, 189, 6, NULL, NULL),
(225, 190, 6, NULL, NULL),
(226, 191, 2, NULL, NULL),
(227, 192, 4, NULL, NULL),
(228, 192, 8, NULL, NULL),
(229, 193, 6, NULL, NULL),
(230, 194, 6, NULL, NULL),
(231, 195, 1, NULL, NULL),
(232, 195, 6, NULL, NULL),
(233, 196, 8, NULL, NULL),
(234, 197, 2, NULL, NULL),
(235, 198, 1, NULL, NULL),
(236, 199, 1, NULL, NULL),
(237, 200, 6, NULL, NULL),
(238, 201, 6, NULL, NULL),
(239, 202, 6, NULL, NULL),
(240, 203, 1, NULL, NULL),
(241, 204, 1, NULL, NULL),
(242, 204, 6, NULL, NULL),
(243, 205, 4, NULL, NULL),
(244, 205, 8, NULL, NULL),
(245, 206, 4, NULL, NULL),
(246, 206, 8, NULL, NULL),
(247, 207, 4, NULL, NULL),
(248, 207, 8, NULL, NULL),
(249, 208, 4, NULL, NULL),
(250, 208, 8, NULL, NULL),
(251, 209, 4, NULL, NULL),
(252, 209, 8, NULL, NULL),
(253, 210, 4, NULL, NULL),
(254, 210, 8, NULL, NULL),
(255, 211, 4, NULL, NULL),
(256, 211, 8, NULL, NULL),
(257, 212, 4, NULL, NULL),
(258, 212, 8, NULL, NULL),
(259, 213, 4, NULL, NULL),
(260, 213, 8, NULL, NULL),
(261, 214, 4, NULL, NULL),
(262, 214, 8, NULL, NULL),
(263, 215, 4, NULL, NULL),
(264, 215, 8, NULL, NULL),
(265, 216, 4, NULL, NULL),
(266, 216, 8, NULL, NULL),
(267, 217, 4, NULL, NULL),
(268, 217, 8, NULL, NULL),
(273, 218, 6, NULL, NULL),
(274, 219, 6, NULL, NULL),
(275, 220, 6, NULL, NULL),
(276, 221, 1, NULL, NULL),
(277, 222, 6, NULL, NULL),
(278, 223, 1, NULL, NULL),
(279, 223, 9, NULL, NULL),
(280, 224, 1, NULL, NULL),
(281, 225, 7, NULL, NULL),
(282, 226, 1, NULL, NULL),
(283, 226, 9, NULL, NULL),
(284, 227, 1, NULL, NULL),
(285, 228, 6, NULL, NULL),
(286, 229, 2, NULL, NULL),
(287, 230, 2, NULL, NULL),
(288, 231, 2, NULL, NULL),
(289, 232, 2, NULL, NULL),
(290, 233, 2, NULL, NULL),
(291, 234, 2, NULL, NULL),
(292, 235, 2, NULL, NULL),
(293, 236, 2, NULL, NULL),
(294, 236, 4, NULL, NULL),
(295, 237, 2, NULL, NULL),
(296, 238, 2, NULL, NULL),
(298, 239, 2, NULL, NULL),
(299, 240, 6, NULL, NULL),
(300, 241, 6, NULL, NULL),
(301, 242, 2, NULL, NULL),
(302, 243, 2, NULL, NULL),
(303, 244, 2, NULL, NULL),
(305, 246, 10, NULL, NULL),
(306, 247, 10, NULL, NULL),
(307, 245, 5, NULL, NULL),
(308, 248, 10, NULL, NULL),
(309, 249, 10, NULL, NULL),
(310, 250, 10, NULL, NULL),
(311, 251, 10, NULL, NULL),
(312, 252, 10, NULL, NULL),
(313, 253, 10, NULL, NULL),
(314, 254, 10, NULL, NULL),
(315, 255, 2, NULL, NULL),
(316, 256, 2, NULL, NULL),
(317, 257, 2, NULL, NULL),
(318, 258, 2, NULL, NULL),
(319, 259, 5, NULL, NULL),
(320, 260, 10, NULL, NULL),
(321, 261, 10, NULL, NULL),
(322, 262, 10, NULL, NULL),
(323, 263, 10, NULL, NULL),
(324, 264, 2, NULL, NULL),
(325, 265, 2, NULL, NULL),
(326, 266, 6, NULL, NULL),
(328, 267, 2, NULL, NULL),
(329, 268, 6, NULL, NULL),
(330, 269, 6, NULL, NULL),
(331, 270, 2, NULL, NULL),
(332, 270, 4, NULL, NULL),
(333, 271, 6, NULL, NULL),
(334, 272, 2, NULL, NULL),
(335, 273, 2, NULL, NULL),
(336, 274, 2, NULL, NULL),
(337, 275, 6, NULL, NULL),
(338, 276, 2, NULL, NULL),
(339, 277, 6, NULL, NULL),
(340, 278, 2, NULL, NULL),
(341, 278, 6, NULL, NULL),
(342, 279, 2, NULL, NULL),
(343, 280, 2, NULL, NULL),
(344, 280, 6, NULL, NULL),
(345, 281, 6, NULL, NULL),
(348, 282, 2, NULL, NULL),
(349, 283, 8, NULL, NULL),
(350, 284, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `institution_program_translations`
--

CREATE TABLE `institution_program_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `institution_program_id` bigint(20) UNSIGNED NOT NULL,
  `locale` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `institution_program_translations`
--

INSERT INTO `institution_program_translations` (`id`, `institution_program_id`, `locale`, `title`, `description`, `created_at`, `updated_at`) VALUES
(132, 127, 'en', 'Computer Science', 'Bachelor of Computer Science:\r\nToday, we are living through a time of progressive cyber-physical convergence, with the lines between “online” and “offline” becoming more and more blurred. With the field of Computer Science in a state of constant evolution, and in turn changing the world around us, software and hardware engineers alike find themselves in ever-greater demand. The Bachelor’s degree in Computer Science at IUBH is designed to train students in the fundamentals of the field, while also teaching them the practical application of these scientific principles. Graduates from the programme will be able to understand and develop a variety of IT systems, with a strong focus on software technologies. They will also explore such cutting-edge and timely topics as AI, cloud computing, and more. Via the unique combination of theoretical foundations and practical skills that this programme imparts, students will be given a competitive advantage in the market, dually familiarised with the basics of software development as well as the management and maintenance of software.', '2021-01-05 14:25:57', '2021-01-05 14:25:57'),
(133, 128, 'en', 'Hospitality Management', 'The focus of “hospitality” is always on the guest and the associated services. In addition to the classic hotel sector, this includes the hospitality industry as well as adjacent industries, such as amusement parks, casinos or airlines, and service providers such as hospitality consulting or IT service providers. That means Hospitality Management covers a very wide field with countless, often cross-industry opportunities.', '2021-01-05 14:30:14', '2021-01-05 14:30:14'),
(134, 129, 'en', 'Aviation Management', 'Lift yourself up, where you belong\r\nBringing customers and goods to their destination in the shortest, safest and most convenient way.\r\n\r\nAs a graduate of the Aviation Management degree programme, you work for traditional airlines such as Lufthansa and Air France-KLM, for low-budget airlines such as Eurowings, as well as for handling companies, aircraft manufacturers and maintenance companies. Our innovative programme gives you everything you need in the dynamic world of airport and airline business and qualifies you for an international career. Our professors and lecturers attach great importance to the close integration of theory and practice. Most of them have themselves gained many years of specialist and management experience on an international level – and would like to share it. They do this for example through case studies, projects and field trips to renowned companies.', '2021-01-05 14:31:18', '2021-01-05 14:31:18'),
(135, 130, 'en', 'International Management', 'Start your international career with our Bachelor in International Management. Marketing, sales and public relations, accounting, finance and controlling or HR – you can specialise and later work in these areas. You choose! Projects, excursions and lectures ensure a high practical relevance during the programme. English as a language of instruction, an internship with international companies and a semester abroad are just a few aspects that will have a positive effect on your future career.', '2021-01-05 14:32:00', '2021-01-05 14:32:00'),
(136, 131, 'en', 'Business Administration', 'Business Administration', '2021-01-05 14:35:05', '2021-01-05 14:35:05'),
(137, 132, 'en', 'Robotics', 'The IUBH Bachelor in Robotics builds your knowledge in mechanical, electrical, and control engineering and expertise in computer science, data science, and artificial in- telligence. Through a mix of theory and practical projects, you’ll acquire necessary skills to manage projects, lead innovative new technologies, and become a robotics specialist with excellent interpersonal skills.', '2021-01-05 14:35:57', '2021-01-05 14:35:57'),
(138, 133, 'en', 'Business and IT', 'The IUBH Bachelor of Business and IT prepares you for top career roles in IT and tech- nical companies around the world. You’ll gain fundamental technical expertise and skills in communication, management, and business processes that will make you an attractive candidate in the fast-paced and rapidly developing IT industry.', '2021-01-05 14:36:48', '2021-01-05 14:36:48'),
(139, 134, 'en', 'Industrial Engineering and Management', 'Our Bachelor in Industrial Engineering and Management delivers essential knowledge needed for the revolutionary new phase of industry. Learn smart technologies used in manufacturing, construction, and supply chains across the globe and become an ex- pert in Industry 4.0. You’ll build skills in planning, implementing, and managing pro- jects relating to this field and position yourself as a specialist in industrial engineer- ing management.', '2021-01-05 14:37:38', '2021-01-05 14:37:38'),
(140, 135, 'en', 'Data Science', 'Data is one of the greatest strengths in the digital age. In this study programme you will acquire mathematical and statistical knowledge, expertise in different data processing technologies and an overview of different machine learning techniques. A wide range of electives allows you to expand your knowledge in application areas and to be an ex- pert in this field at the end of your studies.', '2021-01-05 14:38:10', '2021-01-05 14:38:10'),
(141, 136, 'en', 'Master of Management', 'Management skills are highly sought after by companies worldwide—no matter the in- dustry. With a Master’s in management on your resume, you show potential employ- ers that you are a decision maker with motivation and the right mindset to manage re- sources, projects, or people and drive business success. This well-rounded degree can top off your existing knowledge in your specialist area.', '2021-01-05 14:45:44', '2021-01-05 14:45:44'),
(143, 138, 'en', 'Economics', 'The BA Program in Economics aims to equip its graduates with the fundamental tools and concepts of economic analysis for generating original solutions to new problems and situations that they may face during their future experiences. Our students are envisioned to develop a unique perspective that will allow them to analyze diverse situations as part of their active learning process. The program also aims to prepare students to function as active decision-makers in the highly competitive environment that prevails in the global economy, and to endow them with the ability to function in areas that are not directly related to their main area of expertise.', '2021-01-09 17:42:45', '2021-01-09 17:42:45'),
(144, 139, 'en', 'Business Administration', 'The goal of the Business Administration program is to: (i) stimulate intellectual curiosity, (ii) develop proficiency in the use of analytical techniques, (iii) integrate theory and practice in the exercise of managerial responsibilities, and (iv) enable students to recognize and appreciate an organization’s ethical and social responsibilities. By building upon student’s broad foundation in the liberal arts and by investigating major functional areas of business activity a well-rounded education is provided.', '2021-01-09 17:45:01', '2021-01-09 17:45:01'),
(145, 140, 'en', 'International Relations', 'The vision of International Relations department is to equip its graduates  with a  unique combination of attributes, such as advanced problem solving ability, conceptual and analytical skills, in-depth country and global knowledge and well developed writing and language skills that enable them to pursue competitive careers and leadership roles in academic, business,  policy  and NGO environments in domestic and international settings.', '2021-01-09 17:46:41', '2021-01-09 17:46:41'),
(146, 141, 'en', 'Chemical and Biological Engineering', 'Chemical and Biological Engineering at Koç University is a discipline built on the fields of engineering, chemistry, biology and mathematics. The integration of the biology with chemical engineering creates a wide range of research outcomes for the benefit of humanity. This integration also creates employment opportunities for chemical and biological engineering graduates in the industry. Our mission includes educating the next generation of Chemical-Biological Engineers in the broad areas of energy, biotechnology, catalysis, polymers, material science, computer modeling, process control and drug design.', '2021-01-09 17:49:06', '2021-01-09 17:49:06'),
(147, 142, 'en', 'Computer Engineering', 'Computer Science and Engineering at Koç University strive for excellence in research and teaching. The digital revolution has been changing world  and the impact of computing on society is being felt significantly.. We aim to advance knowledge in Computer Science, and  apply  it in interdisciplinary areas that extends the scope of Computer Science to be ready to attack the complex challenges of the  changing world.', '2021-01-09 17:49:52', '2021-01-09 17:54:11'),
(148, 143, 'en', 'Electrical and Electronics Engineering', 'The Electrical and Electronics Engineering Program aims at giving the students a strong background in physical sciences, mathematics, and computational methods as well as the basic area concepts, such as electronic circuits, analog and digital systems, communications, electromagnetics, and control systems. In addition, the program also offers a variety of undergraduate courses which are designed to emphasize state-of-the-art electronics technologies. These include Signal and Image Processing, Information Technologies, Telecommunication Systems, Optoelectronics, Microwaves, Antennas, and Microelectronics.', '2021-01-09 17:50:38', '2021-01-09 17:53:28'),
(149, 144, 'en', 'Industrial Engineering', 'Koç University Industrial Engineering Graduates Win INFORMS Prize Honorable Mention The Institute for Operations Research and the Management Sciences (INFORMS) is the largest professional society in the world for individuals in the field of operations research, management science and analytics. INFORMS Undergraduate Operations Research Prize is held annually to recognize a student or group of students who have conducted a significant applied project in operations research or management science and/or original, important theoretical or applied research in operations research or management science while enrolled as an undergraduate.', '2021-01-09 17:51:49', '2021-01-09 17:51:49'),
(150, 145, 'en', 'Mechanical Engineering', 'The Mechanical Engineering Program at Koç University aims to graduate high-caliber mechanical engineers for a demanding profession. We want our students to identify, formulate, and solve engineering design problems that are encountered during product design, system analysis and manufacturing processes. The undergraduate curriculum emphasizes the basic principles of the discipline and educates students in the use of these principles to solve complex engineering problems. Emphasis in the freshman and sophomore years is on mathematics, chemistry, physics, engineering mechanics, CAD/CAM design, materials, and thermodynamics. The junior and senior years are devoted to machine design, heat transfer, fluid mechanics, system dynamics and control. Throughout the curriculum, laboratory work and design projects are stressed. The students learn how to design and conduct experiments and to collect, analyse, and interpret data. During their senior year, students work in teams on industrially sponsored design projects. Elective area courses in advanced materials, mechatronics, computational fluid dynamics, vibration, robotics, nanotechnology, micromechanics, computer integrated manufacturing and automation provide a holistic perspective on mechanical engineering. The Mechanical Engineering faculty actively conducts research in the areas of materials processing and materials behaviour, fluid and thermal systems, control and vibration, mechatronics, micro/nano electromechanical systems, and manufacturing/automation.', '2021-01-09 17:52:47', '2021-01-09 17:52:47'),
(151, 146, 'en', 'Chemistry', 'The Department of Chemistry offers an undergraduate program that provides a broad, rigorous and flexible education for work and advanced study in a variety of fields and invaluable training in the laboratory for today’s increasingly technical world. Parallel to the mission of a liberal arts education at Koç University, the Chemistry undergraduate program has the ability to adapt to the specific interests and career goals of the students.\r\n\r\nFor a Bachelor of Science degree, the undergraduate students in the Chemistry program must complete eight required and two elective courses in Chemistry, as well as two semesters of an independent study project under the supervision of one of the Chemistry faculty, in addition to the core courses and other electives. All of the required courses in chemistry (General Chemistry I-II, Physical Chemistry I-ii, Organic Chemistry I-II, Inorganic Chemistry and Instrumental Analysis) have laboratory sessions providing practical skills beyond classroom study. The area electives prepare the students research skills and the excitement of research and might lead to publications. Opportunities in research include quantum chemistry, polymer syntheses and characterization, solid state chemistry, computational biology and surface physical chemistry. By appropriate choice of other electives, students have the opportunity to complete a double major program or concentrate on a topic of interest as a minor.', '2021-01-09 17:56:00', '2021-01-09 17:56:00'),
(152, 147, 'en', 'Physics', 'Every year, very few and highly qualified students are admitted to our department with full scholarship. In general accordance with the liberal arts educational philosophy of Koç University, our program offers our graduates a solid physics background, and prepares them with a broad knowledge base to follow up careers in various related disciplines. In addition to the area courses, we also offer independent study courses where the student works closely with a faculty member on a research project to develop research skills. The program is flexible and allows a double major with other disciplines such as mathematics, chemistry, electrical engineering, mechanical engineering, and computer science. Students from other departments are also encouraged (with an extension of their scholarship into the fifth year) to obtain a second major in physics or, alternatively, complete a minor program in physics by taking six courses some of which they are free to choose.', '2021-01-09 17:57:07', '2021-01-09 17:57:07'),
(153, 148, 'en', 'Mathematics', 'We aim to provide undergraduate students with a solid foundation where they become comfortable with basic mathematical structures. Our undergraduate program is flexible enough to give students freedom to choose their courses in which they can prepare themselves for their post-graduate life. This could be a Ph.D. study in pure or applied mathematics, or a somewhat related field such as computer science, economics, or industrial engineering. If the student would like to enter the public or private sector immediately after graduation, we note that our program is diverse and well-balanced enough to give them an edge in the constantly changing demands of the work life.', '2021-01-09 17:58:56', '2021-01-09 17:58:56'),
(154, 149, 'en', 'Molecular Biology and Genetics', 'Students in Molecular Biology and Genetics program will take classes that provide fundamental knowledge of the different branches of biology. These courses include: biochemistry,  molecular biology, genetics, cell biology and developmental biology.\r\n\r\nThe Molecular Biology and Genetics program also offers various elective courses for advanced students who wish to focus on specific areas, such as cancer biology, neuroscience, proteomics, and bioinformatics.\r\n\r\nStudents in the Molecular Biology and Genetics program will have opportunities to further develop their skills and knowledge by working with faculty members in their cutting-edge research programs.\r\n\r\nOur Molecular Biology and Genetics faculty have recently won several prestigious awards, including the ERC Starting Grant, the Turkish Academcy of Sciences Young Scientist Award, the L’Oreal Young Women in Science Award, the EMBO Installation Grant, and the Marie Curie Reintegration Grant.', '2021-01-09 17:59:43', '2021-01-09 17:59:43'),
(155, 150, 'en', 'Archeology and History of Art', 'The Department of Archaeology and History of Art offers a multi-disciplinary approach to the study of archaeology, the history of art and visual culture, cultural heritage management, and museum studies by employing the most recent theoretical and methodological approaches and a hands-on approach to learning. Our faculty consists of specialists in the archaeology and history of art of the civilizations that have flourished in the area of modern Turkey. Students will learn about prehistoric Anatolian archaeology, the Greek and Roman eras, Late Antique and Byzantine studies, and the Ottoman period, and can decide to focus more specifically on one of these time periods. Cultural heritage management practices and museum operations are inseparable from the study of archaeology and the history of art, and students will also be instructed in these areas during their four-year undergraduate program. Students in our department have the opportunity to take courses in ancient languages of the Mediterranean and Anatolian worlds such as Greek, Latin, and Ottoman Turkish. Our lectures are enriched through field trips to archaeological sites and museum excursions, and participation in conferences and workshops organized by visiting lecturers and specialists from Turkey and abroad. We provide hands-on training in methods of analysis and conservation in our archaeological laboratory. Our students are also encouraged to participate in one of our archaeological excavation projects during the summer or to complete internships with museums or cultural heritage organizations.', '2021-01-09 18:01:03', '2021-01-09 18:01:03'),
(156, 151, 'en', 'English Language & Comparative Literature', 'Welcome to the Department of Comparative Literature. In this age of global exchange, the CL program promotes a study of literature that expands cultural connections among societies and bridges disciplines. The departmental course offerings include classes in world literature, critical theory and interdisciplinary studies where students work intensively with a distinguished faculty of scholars in Turkish, Ottoman, European, Anglo-American and Postcolonial literary and cultural studies. At the same time, the major encourages students to take advantage of the rich offerings of courses in other KU departments or study abroad. Our major leads to the advanced study of literature at the graduate level and provides a strong basis for advanced degrees and/or careers in publishing, journalism, cultural studies, philosophy, education, international relations, film and entertainment.', '2021-01-09 18:02:08', '2021-01-09 18:02:08'),
(157, 152, 'en', 'History', 'The department offers courses in the History and Visual Culture of the Byzantine, Ottoman, Modern Turkish, Arab, Russian, and European Worlds, as well as ancient languages such as Greek, Latin, and Ottoman Turkish. Students have also an opportunity to take courses in Archaeology, Art and Architectural History of the Mediterranean, Europe and the Middle East from the Archaeology and History of Art Department. The department offers several elective courses such as history of modern diplomacy, history of ideologies, gender, culture and politics, and state and society in the Middle East. Many of the undergraduate history courses are cross listed with the Sociology, Economics and International Relations departments which facilitate the history student’s pursuit of a double major. The required core course of the university, the History of the Turkish Revolution, as well as a variety of elective core courses in History are administrated and offered by the department.', '2021-01-09 18:02:58', '2021-01-09 18:02:58'),
(158, 153, 'en', 'Psychology', 'The Department of Psychology aims at producing theoretical and applied research, scholarship, and teaching at a quality that meets and even exceeds the national and international academic standards and at addressing issues that are relevant to national and human development. The Department seeks active participation of the students in such research projects, to help them gain first-hand experience in conducting research and to familiarize them with issues that are of concern to human development.\r\nThe department expects the students to gain knowledge in almost all fields of psychology and to be aware of different approaches to psychology. The interests of the faculty include a wide range of areas such as cognitive, social, cross-cultural, organizational, developmental psychology, and psychology of language. Students get a chance to actively participate in national and international research projects that are conducted by our faculty. The department also regularly invites leading national and international scholars in psychology to introduce students to the field at large.', '2021-01-09 18:03:39', '2021-01-09 18:03:39'),
(159, 154, 'en', 'Philosophy', 'We are a young department, founded in 2008, but in that short time we have built a reputation as one of Turkey’s leading philosophy departments, with a record both for producing high quality research for international journals and publishers and for providing world-class education to our students.\r\nOur undergraduate program provides students a foundation in philosophical thinking, introducing them to the full range of philosophy’s sub-disciplines, from ethics to metaphysics. Students learn to think clearly, logically, and independently. Interested students will be prepared for graduate level study in philosophy and related areas; many of our students have gone on to join prestigious international graduate programs. We also provide the opportunity to take one or more of the following interdisciplinary specialisations: Classical Studies; Philosophy, Politics, and Economics; and Cognitive and Brain Science.', '2021-01-09 18:04:19', '2021-01-09 18:04:19'),
(160, 155, 'en', 'Sociology', 'The department’s mission is to help students acquire the necessary competencies for a critical analysis of human society and social life. Consistent with the University’s liberal educational philosophy, students will also develop valuable conceptual and analytic skills that they can use in many different settings upon graduation.\r\nThe goal of the program is to provide a solid foundation in the substantive scope, key concepts, theoretical perspectives, and research methods used in Sociology. The core training is complemented by elective courses that take advantage of specific areas of faculty expertise, including globalization, population dynamics, the political economy of media and communication, educational sociology, cultural sociology, race/ethnicity, urban poverty and social exclusion, disabilities studies, the sociology of development, social movements and the sociology of migration and refugees. Double-majoring is an also option for those who wish to combine Sociology with another field of study. Those who complete the requirements are awarded a degree in both fields.', '2021-01-09 18:05:05', '2021-01-09 18:05:05'),
(161, 156, 'en', 'Media and Visual Arts', 'The current growth of media technologies promises a wide range of possibilities for the creative industry. Global markets have been focusing on 8 core areas for the growth of the creative industry: (1) Design, (2) Film Production, (3) Music, (4) Moving and Interactive Media, (5) Computer Games, (6) Advertising, (7) Gastronomy, and (8) Tourism. The creative industry particularly needs professionals who are well versed and have the capacity to engage in innovative uses of new displaying technologies, social networks, and computerized entertainment. Also, the creative industry requires professionals who are able to think across different communication platforms, who are highly knowledgeable about consumption trends and who can develop new methods to be responsive to expectations and the needs of the consumers, not only in Turkey but all over the world.\r\nThe market for creative entertainment products have been growing steadily since 2000 and is projected to continue to be one of the fastest growing sectors in contemporary economies. According to UNESCO, when “cultural services” are included in the calculations, USA is the largest exporter of creative entertainment products; followed by Europe (EU15) which has the leading position in many continents. Also, data suggests that expansion of creative industries has recently been most rapid in Asia. According to the recent projections, Turkey is expected to become one of the important actors in digital entertainment, especially in the Eastern Europe, Middle-east and the Turkic region in Central Asia.', '2021-01-09 18:06:01', '2021-01-09 18:06:01'),
(162, 157, 'en', 'Law', 'Koç University Law School aims to nurture creative and sophisticated lawyers with its content-rich courses in public law, private law, and its core program, which enables students to excel in a variety of disciplines. The law school program responds adeptly to meet Turkey’s need for lawyers who possess both professional language competency and an international perspective. More than 30% of the total courses offered with international content are lectured in English, thus international career opportunities may be possible for all students. The law school also provides a high level of proficiency in national law topics with its courses lectured in Turkish. Law school students have the opportunity to meet professional lawyers in regular seminars for their academic and career development. Further, exchange programs in partnership with outstanding universities around the world and international internship opportunities are designed to support international experiences for students. The law school also works to instill professional ethic values in its graduates thus enabling them to work in all fields of law- public or private- without exception.', '2021-01-09 18:07:59', '2021-01-09 18:07:59'),
(163, 158, 'en', 'Medicine', 'Our Medical School was set up to bring a different perspective to medical education in Turkey. We prioritize research, discovery, and service to public health. Our outstanding teaching staff also aims to meet universal standards of education and health by training tomorrow’s leaders in medical science. Since October 2014, Koç University Hospital has been functioning with its highly advanced equipment and the latest technology. Our university hospital is on its way to becoming a prominent center point in the international health service and research fields.', '2021-01-09 18:09:41', '2021-01-09 18:09:41'),
(164, 159, 'en', 'BSc. Management', 'The undergraduate major in Management prepares students to manage and lead all aspects of organizations. It also prepares students for graduate study in business and other fields. Mastery of course content enables students to inspire themselves, others, teams, and organizations to coordinate efforts to provide effective outcomes. Content covered includes ethics and virtue, organizational behavior, human resources, domestic and international cultural differences, and negotiating skills. A capstone course integrates the learning objectives of the major in a study of a real company where students demonstrate that they can now apply effectively what they have learned.', '2021-02-10 06:34:26', '2021-02-10 06:34:26'),
(165, 160, 'en', 'BSc. Biomedical Sciences', 'The Biomedical Sciences degree serves as a gateway into a variety of health-professional programs such as Medicine, Pharmacy, Dentistry, and Physical Therapy. Required courses include Biology, Chemistry, Math and Physics. This degree provides the flexibility to choose advanced-level science coursework based on academic and professional interests. Students contemplating graduate study should pursue a major in the discipline of their interest, such as Biology, Chemistry, or Microbiology.', '2021-02-10 07:36:48', '2021-02-10 07:36:48'),
(166, 161, 'en', 'BSc. Accounting', 'The Lynn Pippenger School of Accountancy prepares undergraduates for a variety of career options under the accounting umbrella, including auditing, tax, forensics, business consulting, and corporate compliance. Students are immersed in a high-quality, diverse learning environment that focuses on innovation and critical thinking skills, which prepares them to impact not only the accounting profession but also the greater community. \r\n\r\nThrough additional coursework, accounting graduates are eligible to sit for several different professional certification exams, notably the Certified Public Accountant (CPA) exam. In addition, accounting majors are prepared to enter the Master of Accountancy (MAcc). Further study at the graduate level not only enables students to continue developing knowledge and skills, but also positions them to become leaders in the profession.', '2021-02-10 07:53:13', '2021-02-10 07:53:13'),
(167, 162, 'en', 'BSc. Cell and Molecular Biology', 'This degree provides a strong foundation in general biology, with an emphasis on biomedical related areas, but focuses on the cellular and molecular processes that occur within cells. Many of the breakthroughs in the field of biology over the past several decades have shed light on how cells function in the context of the whole organism. The fields of genomics and computational biology have begun to solve the mystery of how networks of genes are regulated and how cells interact with each other and the how complex organisms react to their environment. Advances in cell and molecular biology continually lead to new treatments for age-related diseases such as cancer and Alzheimer’s. This degree prepares students for application to medical school, dental school, graduate school and careers in biotechnology, science policy, biomedical research, teaching, science writing and illustration. Many of our students continue their studies by attending graduate school in biology and other related disciplines.', '2021-02-10 07:57:58', '2021-02-10 07:57:58'),
(168, 163, 'en', 'BSc. Microbiology', 'This degree specializes in the study of bacteria and other microbes, primarily at the cell and molecular level, and focuses on disease causing microbes. The Microbiology core and elective requirements include specialized microbiology courses necessary to qualify for certification by the National Registry of Microbiologists, American Society of Microbiology, and employment in microbiology and related fields. Many microbiology majors plan to apply to medical or dental school, while others plan careers as professional microbiologists in industry and government. Others become teachers or aspire to graduate training in microbiology.', '2021-02-10 08:03:50', '2021-02-10 08:05:08'),
(169, 164, 'en', 'BSc. Marine Biology', 'Students majoring in Marine Biology study life in the oceans. The program of study explores the unique marine environment and the nature of the organisms that inhabit the oceans. The objective of the program is to provide students with a firm foundation in basic biology and the tools necessary to function as professional biologists, with special emphasis on marine ecosystems. The program will prepare students for further education (e.g., ecology, environmental science, biological oceanography, evolutionary biology) or for careers in fields such as aquaculture, aquarium biology and education, conservation biology and education, environmental consulting, and wildlife biology.', '2021-02-10 08:11:51', '2021-02-10 08:11:51'),
(170, 165, 'en', 'BSc. Biomedical Engineering', 'The overall objective of the major in Biomedical Engineering at the University of South Florida is to prepare graduates for successful careers in the biomedical engineering and related professions. Accordingly, graduates of the BME major who have chosen to pursue a career in engineering shall achieve the following within a few years after graduation:\r\n\r\nDemonstrate professional biomedical engineering competence by holding positions of increasing responsibility in industry, business, government and/or educational institutions. Publish papers, reports, patents and/or technical presentations at local, national, international meetings or within the professional organization/company that they are affiliated with. Continue to improve their technical skills, knowledge and understanding through continuing education, pursuit of advanced degrees, and/or pursuit of professional license in their chosen profession.', '2021-02-10 08:13:10', '2021-02-10 08:13:10'),
(171, 166, 'en', 'BSc. Marketing', 'Marketing is a dynamic field with many dimensions, including product selection and planning, product distribution, branding, pricing and promotion. Marketing poses many challenges and yields generous rewards for those who meet these challenges. Marketing operations are carried out domestically and internationally in virtually all business organizations that offer a product or service. Many marketing concepts are applicable to the operations of non-profit organizations such as governmental, educational, and health care institutions, as well as charitable and political campaigns.\r\n\r\nMarketing operations provide the most visible links between the firm or institution and its many publics. Marketing deals with people who are constantly changing in their needs, wants, and desires; and coupled with these changing tastes is a fiercely competitive environment sustained by all the resources of a rapidly evolving technology. These forces lead to much of the challenge and dynamic nature of marketing.', '2021-02-10 08:20:46', '2021-02-10 08:20:46'),
(172, 167, 'en', 'BSc. Finance', 'The Finance major provides a broad-based, analytical program for students anticipating a career in the management of both large and small organizations. Finance provides a good background for students seeking general careers in business. Finance majors can elect to take courses in the following areas that prepare them for entry and advanced careers in: financial management of corporations, management of financial institutions, investments, financial services, insurance, and real estate.\r\n\r\nIn addition, the program in Finance is designed to provide the skills required by students earning degrees in other business disciplines and by students who seek professional degrees in areas such as law and public administration.', '2021-02-10 08:22:14', '2021-02-10 08:22:14'),
(173, 168, 'en', 'BA Global Business', 'The Bachelor of Arts in Global Business provides students with the knowledge, skills and experience necessary for successful careers in the global business environment.\r\n\r\nGraduates will have not only a Global Business major, but also a concentration in one of the functional areas of business (Finance, Management, Marketing, and Business Analytics and Information Systems). With this preparation, graduates will find employment in many manufacturing, service or knowledge-based industries with global markets, global suppliers, global sources of finance and/or a globally diverse workforce.\r\n\r\nThe Global Business program is unique in that it combines preparation in business administration with language studies and a meaningful overseas work or study experience.', '2021-02-10 08:22:54', '2021-02-10 09:05:22'),
(175, 170, 'en', 'BA Economics', 'Economics offers a clear and logical way of thinking about complicated issues such as unemployment, inflation, pollution, and crime. The Department of Economics offers broad course choices allowing students to tailor their programs to provide training for professional careers in business, teaching, government, and law.', '2021-02-10 08:26:00', '2021-02-10 09:04:54'),
(176, 171, 'en', 'BSc. Chemical Engineering', 'Students pursuing the Bachelor of Science in Chemical Engineering take coursework in advanced chemistry, thermodynamics, fluids, heat, and mass transfer, numerical methods, separation processes, reacting systems, instrumentation, control, and plant design. Students must also satisfactorily complete a design project as part of their program. Chemical and Biomedical engineering students must maintain a GPA of 2.0 in required departmental courses. Therefore, it is imperative that the students retain close contact with their advisor.', '2021-02-10 08:29:10', '2021-02-10 08:29:10'),
(177, 172, 'en', 'BSc. Chemistry', 'The Bachelor of Science in Chemistry is designed for students wishing to continue with graduate training in chemistry and closely allied disciplines and the degree is certified by the American Chemical Society.\r\n\r\nThe Bachelor of Science in Chemistry provides a firm foundation in all five disciplines of chemistry: organic, physical chemistry, inorganic, analytical and biochemistry. Students interested in research, the pursuit of an advanced degree, employment in the chemical industry, or who want to teach at the secondary education level may find this degree attractive. The curriculum for the B.S. degree in Chemistry meets the requirements for degree certification by the American Chemical Society.', '2021-02-10 08:49:32', '2021-02-10 08:49:32'),
(178, 173, 'en', 'BSc. Civil Engineering', 'Civil engineers will be entrusted by society to create a sustainable world and enhance the global quality of life. Civil engineers will serve as master planners, designers, constructors, and operators of society’s economic and social engine, the built environment (i.e., infrastructure); innovators and integrators of ideas and technology across the public, private, and academic sectors; managers of risk and uncertainty caused by natural events, accidents, and other threats; stewards of the natural environment and its resources; and, leaders in discussions and decisions shaping public environmental and infrastructure policy.\r\n\r\nThe Civil Engineering Program of the Department of Civil and Environmental Engineering at the University of South Florida will provide undergraduate students with strong, broad-based, engineering education which gives them the basic intellectual and organization skills that allow them to work with complex systems with technological, social and environmental components.', '2021-02-10 08:52:21', '2021-02-10 08:52:21'),
(179, 174, 'en', 'BA Journalism - News Editorial', 'The Zimmerman School of Advertising & Mass Communications at the University of South Florida is located in the Tampa Bay metro area, the 14th largest media market in the country with abundant opportunities for internships with media organizations, public relations firms, advertising agencies, professional sports teams, and other major organizations. Our students also benefit from relationships with on-campus organizations and departments such as University Communications and Marketing, the USF College of Health Sciences, the USF Department of Athletics, WUSF-TV, WBUL-AM radio, and our award-winning campus newspaper, The Oracle.', '2021-02-10 08:57:59', '2021-02-10 08:57:59'),
(180, 175, 'en', 'BA Public Relations', 'The Zimmerman School of Advertising & Mass Communications at the University of South Florida is located in the Tampa Bay metro area, the 14th largest media market in the country with abundant opportunities for internships with media organizations, public relations firms, advertising agencies, professional sports teams, and other major organizations. Our students also benefit from relationships with on-campus organizations and departments such as University Communications and Marketing, the USF College of Health Sciences, the USF Department of Athletics, WUSF-TV, WBUL-AM radio, and our award-winning campus newspaper, The Oracle.', '2021-02-10 08:59:05', '2021-02-10 08:59:05'),
(181, 176, 'en', 'BA Communication', 'The Bachelor of Arts in Communication is a liberal arts degree that prepares students to communicate effectively and ethically in personal, professional, and public relationships in both face-to-face and mediated contexts. More specifically this degree prepares students to:\r\nwork and lead in culturally-diverse teams and organizations;\r\ndevelop advanced oral, interpersonal, written, visual, digital, and electronic communication skills and competencies;\r\ncreate and analyze messages, content, and persuasive communication strategies;\r\nunderstand, build, and strengthen personal and professional identities and relationships;\r\nstudy and critique culture and media institutions, processes, technologies, and content, (e.g., television, film, music, print, computer, Internet, and social media);\r\napply communication knowledge and skills in one or more specialized contexts (e.g, health care; advertising and marketing; law and politics; public advocacy and social movements; religion and church; world cafés and public dialogues; performance and improv; media and media literacy; intimate and family relationships);\r\nengage in undergraduate communication research; and\r\nbecome active and productive U.S. and global citizens.', '2021-02-10 08:59:51', '2021-02-10 08:59:51'),
(182, 177, 'en', 'BA Advertising', 'The Advertising major in the Muma College of Business is unique in that it is a collaborative effort between the Zimmerman School of Advertising and Mass Communications in the College of Arts and Sciences and the Marketing Department in the Muma College of Business. The major complements an existing Advertising track in the Mass Communications major and provides students the opportunity to combine the creative, media, and account planning aspects of advertising with knowledge, skills, and abilities in accounting, economics, finance, information systems, management, marketing and strategy.', '2021-02-10 09:00:46', '2021-02-10 09:00:46'),
(183, 178, 'en', 'BSc. Computer Science', 'The Computer Science program focuses on the design, development, and application of software systems. Additional course work in algorithms, discrete structures, object oriented design, data structures, operating systems, digital logic design, computer architecture, and a wide range of advanced electives extend and supplement the core.', '2021-02-10 09:18:25', '2021-02-10 09:18:25'),
(184, 179, 'en', 'BSc. Electrical Engineering', 'The Electrical Engineering program offers study in all areas fundamental to Electrical Engineering and the electrical sciences: circuit analysis and design, electronics, communications, electromagnetics, controls, solid state, system analysis, and microelectromechanical systems (MEMS), bioelectrical devices and systems, and power engineering. Basic concepts are augmented with well-equipped laboratories in circuits, electronics, digital systems, microwave techniques, wireless circuits & systems, and controls and communications. In addition, a general-purpose computer facility, a microprocessor and digital signal processing laboratory, and a microelectronics fabrication, design/test and metrology laboratory are available.', '2021-02-10 09:20:23', '2021-02-10 09:20:23'),
(185, 180, 'en', 'BSc. Mechanical Engineering', 'Students pursuing the Bachelor of Science in Mechanical Engineering program take coursework in thermodynamics, heat transfer, instrumentation, measurements, solid and fluid mechanics, dynamics, machine analysis and design, mechanical design, manufacturing processes, vibrations and controls. This is supplemented by elective coursework in such areas as sustainability, internal combustion engines, refrigeration and air conditioning, mechanical design, robotics, propulsion, computer-aided design, manufacturing, bio-engineering, alternative energy, thermal design, composite materials, and tribology. Laboratories are available for basic instrumentation, thermal and fluid sciences, solid mechanics, data acquisition, controls, CAD/CAE, and vibrations.', '2021-02-10 09:52:41', '2021-02-10 09:52:41'),
(186, 181, 'en', 'BSc. Computer Engineering', 'The Computer Engineering program emphasizes the application of engineering principles to the design of computer hardware and software, and devotes additional time to issues of computer architecture and advanced topics in hardware design, including extensive laboratory work. Students in this program also acquire a broad background in engineering topics through related coursework in the College.', '2021-02-10 09:53:22', '2021-02-10 09:53:22'),
(187, 182, 'en', 'BSc. Industrial Engineering', 'Industrial engineering (IE) is a field of study intended for individuals who are interested in formulating mathematical, statistical, and computer simulation models of complex systems in manufacturing, logistics, information, healthcare, transportation, financial, utilities, entertainment, and service. IEs connect big data sets and models to make engineering decisions for improving system performance and developing public policies. Unlike traditional disciplines in engineering, the scope of the industrial engineering field is very broad.', '2021-02-10 09:53:46', '2021-02-10 09:53:46'),
(188, 183, 'en', 'BSc. Business Analytics and Information Systems', 'Industrial engineering (IE) is a field of study intended for individuals who are interested in formulating mathematical, statistical, and computer simulation models of complex systems in manufacturing, logistics, information, healthcare, transportation, financial, utilities, entertainment, and service. IEs connect big data sets and models to make engineering decisions for improving system performance and developing public policies. Unlike traditional disciplines in engineering, the scope of the industrial engineering field is very broad.', '2021-02-10 09:55:13', '2021-02-10 09:55:13'),
(189, 184, 'en', 'BA Theatre - Design', 'Through its curriculum and production program, students have the opportunity to prepare for a professional career in the theatre or to continue their studies at the graduate level. Our exclusively undergraduate program boasts intensive studies in the disciplines of performance, design and theatre arts as well as a close working relationship with our nationally and internationally recognized faculty.', '2021-02-10 10:02:10', '2021-02-10 10:02:10'),
(190, 185, 'en', 'BA Political Science', 'The undergraduate program leading to the B.A. degree in political science offers a general purpose degree, and a number of more specialized alternatives. The program is designed for students interested in and seeking to understand political problems, issues, and the nature of the political process, as well as the philosophical and legal basis of political structures and processes at local, state, national, and international levels. Satisfying the degree requirements prepares students for positions in the public and private sectors, for law school, for graduate work in political science, international relations, public administration, and related disciplines, for positions in education, and for applied political activity.', '2021-02-10 10:25:47', '2021-02-10 10:25:47'),
(191, 186, 'en', 'BSc. Medical Technology', 'The University of South Florida offers a four year program leading to the Bachelor of Science degree in Medical Technology. The first three years are completed on campus; the fourth year (12 months) is completed at one of three affiliated hospitals in Florida, located in Tampa, St. Petersburg, and Jacksonville. Admission to the fourth year is limited by the number of openings in affiliated hospitals and, at the present time, is competitive. Selection for the clinical program is made by the hospitals and students not admitted to a clinical program will need to select an alternate degree. Generally, hospitals require a minimum GPA of 2.50 to a 2.75, and our students admitted to clinical programs in recent years have had a mean GPA of 3.4 or higher.', '2021-02-10 10:27:07', '2021-02-10 10:27:07'),
(192, 187, 'en', 'BSc.Public Health', 'International Year One allows you to begin earning credits toward your degree even if you do not meet the academic and English requirements for direct entry. You will receive additional support to help you successfully complete your first year and graduate in the same amount of time as direct entry students.\r\n\r\nThe Public Health degree program is designed to educate students on the very many facets of public health, including but not limited to: public health programs & policies, environmental health, epidemiology, global health, biostatistics in society, and many more. Every public health student will learn the foundation of public health writing, the intricacies of critical issues in public health, and the foundation of evaluation and research.', '2021-02-10 10:27:44', '2021-02-10 10:27:44'),
(193, 188, 'en', 'BA Criminology', 'The undergraduate program leading to the B.A. degree in political science offers a general purpose degree, and a number of more specialized alternatives. The program is designed for students interested in and seeking to understand political problems, issues, and the nature of the political process, as well as the philosophical and legal basis of political structures and processes at local, state, national, and international levels. Satisfying the degree requirements prepares students for positions in the public and private sectors, for law school, for graduate work in political science, international relations, public administration, and related disciplines, for positions in education, and for applied political activity.', '2021-02-10 10:28:15', '2021-02-10 10:28:15');
INSERT INTO `institution_program_translations` (`id`, `institution_program_id`, `locale`, `title`, `description`, `created_at`, `updated_at`) VALUES
(194, 189, 'en', 'BA Physics', 'The Bachelor of Arts program provides a general overview of the core ideas in physics, offering a wide flexibility in electives with a lot of space for courses outside the major. This gives you the possibility to combine the physics major together with a concentration in another area (such as business, computer science, biology, chemistry, mathematics, engineering, geology, social sciences, etc), and gain employment immediately following graduation. The B.A. is also ideal for students who plan to pursue professional post-graduate study in medicine, law, or education.', '2021-02-10 10:41:33', '2021-02-10 10:41:33'),
(195, 190, 'en', 'BA Mathematics', 'The mathematics program offers a diversity of courses designed not only to enable the student to pursue a profession in mathematics itself, but also to enhance the student\'s competence in the fields of engineering, the physical sciences, the life sciences, and the social sciences. The program emphasizes the broad nature of modern mathematics and its close associations with the real world and prepares students for careers in industry or secondary education as well as entry into graduate school. \r\n\r\nThis concentration is designed for students whose interests lie in both applications and theory. Students who complete this concentration will be exposed to a variety of topics to help prepare the student for future endeavors in either aspect.', '2021-02-10 10:42:17', '2021-02-10 10:42:17'),
(196, 191, 'en', 'MA Assurance', 'The objective of the Master of Accountancy (M.Acc.) Degree Program is to provide candidates with greater breadth and depth of knowledge in accountancy than is possible in the baccalaureate program. The major is designed to meet the increasing needs of business, government, and public accounting. Students entering the Accountancy major must already have the equivalent of an undergraduate degree in accounting from an AACSB accredited school. The major may also be structured to satisfy the requirements to sit for the CPA Examination in Florida.', '2021-02-10 10:46:09', '2021-02-10 10:46:09'),
(197, 192, 'en', 'BSc. Computer Science', 'The objective is to train Computer Scientists with a professional knowledge based on a solid theoretical background knowledge.  They have the skills to take part in software development, in developing information systems and system management in various areas. Computer Scientists often acts as mediators between the customers of information systems and the producers. In this way, the job of a Computer Scientist synthesises the constructive activity of engineers with the general problem-solving attitude of mathematicians while participating in teams of large-scale projects.\r\n\r\nThe program provides students with a broad education in Computer Science and Software Engineering in combination with specialised work in computer and information processing techniques, programming languages, data structures, information retrieval, operating systems, compiler design etc. Students learn the theory as well as the methodologies and techniques in the development and implementation of computer systems. The more practical programming courses are aided by several courses in pure and applied mathematics and theoretical computer science courses throughout the curriculum.', '2021-02-10 12:56:01', '2021-02-10 13:28:47'),
(198, 193, 'en', 'BA Sociology', 'The goal of this program is to train professional sociologists at the bachelor level. Successful graduates of the program should have a solid grasp of the concepts and principles of sociology and have mastered (at the appropriate level) its methods, and they should be able to identify and interpret social problems meaningfully. Besides the traditional lectures and seminars, the program is based on project-based teaching methods, and includes one semester of intensive project work.', '2021-02-10 13:28:01', '2021-02-10 13:28:01'),
(199, 194, 'en', 'BA International Relations', 'The goal of this programme is to offer to students the opportunity to develop specialized knowledge in international politics, security studies, EU politics, ethnic conflict, global justice and human rights. It enables them to understand and analyze complex political and social dynamics that go beyond state borders and cultural boundaries. The structure of the programme offers to students the opportunity to choose from a wide range of elective seminars, following introductory courses in the first academic year.', '2021-02-10 13:34:03', '2021-02-10 13:40:41'),
(200, 195, 'en', 'BA Motion Pictures', 'This program is recommended to applicants who wish to enter the motion picture industry, which is one of the most attractive fields of creative industry of our times and is in continuous transformation and expansion, inviting new talents and creative ideas. Students enrolling in the BA in Motion Pictures Studies at ELTE can gain knowledge in the making of motion pictures focusing on directorial skills with the help of well-prepared professors and small group education. Students will get acquainted with the creative, artistic approaches and the technological skills of the creation of motion pictures through practices of storytelling and direction of different forms of motion pictures and will gain basic knowledge in cinematography, editing and production.\r\nThis program enables students to gain experience in the field of the motion picture production including creative artistic, technical and financial decisions. During their studies they will also get acquainted with the history of motion pictures and the intermedial relations of film and other arts, like music, fine arts or literature. The BA in Motion Picture Studies will enable them to produce works in different fields of creative industry such as short or long feature films or documentaries, television or online media products, music videos, and other motion picture products.', '2021-02-10 13:36:36', '2021-02-10 13:36:36'),
(201, 196, 'en', 'BSc. Mechanical Engineering', 'The goal of this program is to train mechanical engineers with a professional knowledge based on a solid theoretical and industrial background. As the output of the program, the graduated engineers will have the skills to take part in designing and manufacturing complete machines or machine elements, use Computer Aided Engineering (CAE) tools, operate and develop complete production chains in various engineering fields. Mechanical Engineers must have a general problem-solving attitude while also need to be able to participate in teams of large-scale projects.', '2021-02-10 13:38:27', '2021-02-10 13:38:27'),
(202, 197, 'en', 'BA International Business Economics', 'The primary goals of the International Business Economics Programme at Eötvös Loránd University are to familiarise students with the challenging issues of international economic processes both on macro and micro level and to get them acquainted with the European business environment in order to be able to perform successfully in a multinational business environment.\r\n\r\nThis program is recommended to applicants who are keen to become specialists in economics and are open to multi-cultural business environments, and includes a semester for professional practice in an international work environment..\r\n\r\nThis program enables students to become experts in international market processes, the operation of the EU and the economic, political, and cultural impacts of globalization.', '2021-02-10 13:43:15', '2021-02-10 13:43:15'),
(203, 198, 'en', 'BA English and American Studies', 'The program is offered by the School of English and American Studies. The program can be completed either as a major or a minor program, the latter is only available for students who study in other major programs at ELTE. Students taking the program as a major opt for either the English or the American track at the end of the first term. The three-year long program does not provide teaching qualifications.', '2021-02-10 13:45:24', '2021-02-10 13:45:24'),
(204, 199, 'en', 'MA American Studies', 'The robust presence of the United States throughout the world, well observable in the contexts of politics, economy, and culture, calls for a body of experts who – aside from having excellent English language skills – have a specialised knowledge in the history, politics, society, culture, language, and literature of the United States. With this aim in mind, the American Studies MA program seeks to impart its graduates with the necessary theoretical knowledge and practical skills that can be fruitfully utilised in both private and public sector establishments interested in the communication and/or representation of American values and interests.\r\nThe two-year long program does not confer teaching qualifications. Students are eligible for admission to PhD programs. In the scope of the Master Course students will have opportunities of preparation for doctoral studies.\r\nThe aim of this course is to train high-level specialists capable of meeting the specific demands of the labor market in the fields of cultural and intercultural exchange. In addition to local, national or international authorities in the public sector, it is important to underline the growing need for French graduates in the private sector, e.g. with multinational companies.\r\nThe training will also prepare the student to continue in one of the Doctoral Schools of the Faculty.\r\nOur graduates find positions mainly in the sectors of education and research, tourism management, banking and finance, and intercultural communications.\r\nThis program gives a comprehensive overview over all areas of American studies — literature, culture, politics, history and language – and trains specialists well-versed in both the critical and applied theory concerning the United States of America. Degree holders will have solid skills to conduct independent research, to assess and process relevant information, and communicate their findings according to high academic standards.', '2021-02-11 06:18:04', '2021-02-11 06:18:04'),
(205, 200, 'en', 'M.Sc. Applied Mathematics', 'The program gives a comprehensive knowledge of several areas in applied mathematics. The advanced courses present state of the art issues of the given area, e.g. in statistical methods, financial mathematics, code theory, numerical methods etc.\r\n\r\nThe goal of this program is to  develop a student’s mathematical  skills to solve industrial and other real-life problems and development tasks in innovative ways.', '2021-02-11 06:31:35', '2021-02-11 06:31:35'),
(206, 201, 'en', 'M.Sc. Biology', 'Students participate in intensive advanced and high level courses in the different fields of biology, which are the most relevant for their specialization, to make them informed about the recent developments and frontline problems. Some 60 % of time is practical hours (spent on laboratory/field practice and on research) ensuring knowledge of state of the art methods. The curriculum is assembled from intensive advanced level courses on the theoretical aspects of selected disciplines and special seminar series on problems in a narrower field of science. The program also involves practical courses and a supervised research activity, which is needed for the preparation of the “M.Sc. Thesis”. In the first two semesters emphasis is on theory and basic laboratory or field practice.  The third and the fourth semesters are devoted to research and preparation of thesis. The training medium is English so students can gain a better command of the academic English in different fields of biology.', '2021-02-11 07:09:02', '2021-02-11 07:09:02'),
(207, 202, 'en', 'M.Sc. Chemistry', 'The goal of this program is to give an advanced level knowledge in the major fields of analytical, inorganic, organic and physical chemistry. The program involves obligatory lectures and laboratory practices in all four fields. (Semi)elective courses offer the opportunity of tuning the program content according to interest.\r\n\r\nThis program is recommended to applicants who are willing to organize their own course schedule. A good background in BSc level chemistry enables the student to focus on his/her topic of interest right from the beginning. Those who are less knowledgeable in basic chemistry must complete resuming courses.', '2021-02-11 07:11:11', '2021-02-11 07:11:11'),
(208, 203, 'en', 'MA Communication and Media Studies', 'The master\'s degree prepares you for a high-level of intellectual activity and scientific careers. For those who want to work after completing their training, the media and communications industry offers a wide range of employment opportunities. The training also prepares you to continue your studies at the doctoral level.\r\nThose who choose the specialization in communication and media studies will become professionals with a thorough social science background, who will orient themselves in the medialization processes that can be considered a crucial issue of contemporary social phenomena, research and teach them independently as lecturers or researchers.\r\nThe communication and media specialist specialization trains professionals with a social and humanities background and practical skills who work in various fields of the contemporary media and communication industry as leaders, editors, programmers, international project managers, communication experts, media consultants, specialist journalists.', '2021-02-11 07:41:38', '2021-02-11 07:41:38'),
(209, 204, 'en', 'M.Sc. Computational and Cognitive Neuroscience', 'This programme involves different scientific fields of natural sciences, technological sciences, and humanities as well. The focus of investigations is on the phenomena of cognition - perception, attention, memory, reasoning, thinking, and behaviour - from an interdisciplinary perspective: Anthropology, Artificial Intelligence, Biology, Linguistics, Neuroscience, Philosophy, and Psychology have contributed to its development as core disciplines. The relevance of such an approach gains support from the constant need of building a knowledge-based society.', '2021-02-11 07:43:49', '2021-02-11 07:43:49'),
(210, 205, 'en', 'M.Sc. Computer Science', 'The goal of this program is to train Computer Scientist with a professional knowledge based on a solid theoretical background knowledge.  They have the skills to take part in program development, in developing information systems and system management in various areas. The Computer Scientist often acts as a mediator between the customers of information systems and the producers. In this way, the job of a Computer Scientist synthesizes the constructive activity of engineers with the general problem-solving attitude of mathematicians while participating in teams of large-scale projects.\r\n\r\nOur programs provide students with a broad education in Computer Science in combination with specialized work in programming languages, cyber security, data science, web engineering, autonomous systems, multimedia design etc.', '2021-02-11 07:45:24', '2021-02-11 07:45:24'),
(211, 206, 'en', 'M.Sc. Computer Science - Digital Factory', 'The goal of this program is to train Computer Scientist with a professional knowledge based on a solid theoretical background knowledge. The Computer Scientist often acts as a mediator between the customers of information systems and the producers. In this way, the job of a Computer Scientist synthesizes the constructive activity of engineers with the general problem-solving attitude of mathematicians while participating in teams of large-scale projects.\r\n\r\nOur programs provide students with a broad education in Computer Science in combination with specialized work in manufacturing and predictive use of data arising from the Industrial Assets, and the Computer Science tools to develop Decision Making and Artificial Intelligence for Industry.', '2021-02-11 07:46:19', '2021-02-11 07:46:19'),
(212, 207, 'en', 'M.Sc. Computer Science - Financial Technology specialization', 'The goal of this program is to teach Computer Scientists with professional knowledge on a solid theoretical background. The Computer Scientist often acts as a mediator between the clients of information systems and the implementors. In this way, the job of a Computer Scientist synthesizes the constructive activity of engineers with the general problem-solving attitude of mathematicians while participating in teams of large-scale projects.\r\n\r\nOur programs provide students with a comprehensive education in Computer Science in combination with specializations in Artificial Intelligence, Programming Languages, Cyber Security, Data Science, Web Engineering, Autonomous Systems, Multimedia Design, Financial Technologies, etc.', '2021-02-11 07:47:11', '2021-02-11 07:47:11'),
(213, 208, 'en', 'M.Sc. Computer Science - ARTIFICIAL INTELLIGENCE SPECIALIZATION', 'The goal of this program is to train Computer Scientist with a professional knowledge based on a solid theoretical background knowledge. The Computer Scientist often acts as a mediator between the customers of information systems and the producers. In this way, the job of a Computer Scientist synthesizes the constructive activity of engineers with the general problem-solving attitude of mathematicians while participating in teams of large-scale projects.\r\nOur programs provide students with a broad education in Computer Science in combination with specialized work in artificial intelligence, programming languages, cyber security, data science, web engineering, autonomous systems, multimedia design etc.\r\nStudents learn the theory as well as the methodologies and techniques in the development and implementation of computer systems. The more practical programming courses are aided by several courses in pure and applied mathematics and theoretical computer science courses throughout the curriculum.', '2021-02-11 07:47:46', '2021-02-11 07:47:46'),
(214, 209, 'en', 'M.Sc. Computer Science - CYBERSECURITY SPECIALIZATION', 'The goal of this program is to train Computer Scientist with a professional knowledge based on a solid theoretical background knowledge.  They have the skills to take part in program development, in developing information systems and system management in various areas. The Computer Scientist often acts as a mediator between the customers of information systems and the producers. In this way, the job of a Computer Scientist synthesizes the constructive activity of engineers with the general problem-solving attitude of mathematicians while participating in teams of large-scale projects.\r\n\r\nOur programs provide students with a broad education in Computer Science in combination with specialized work in programming languages, cyber security, data science, web engineering, autonomous systems, multimedia design etc.', '2021-02-11 07:51:53', '2021-02-11 07:51:53'),
(215, 210, 'en', 'M.Sc. Computer Science - Data Science specialization', 'The goal of this program is to train Computer Scientist with a professional knowledge based on a solid theoretical background knowledge. They have the skills to take part in program development, in developing information systems and system management in various areas. The Computer Scientist often acts as a mediator between the customers of information systems and the producers. In this way, the job of a Computer Scientist synthesizes the constructive activity of engineers with the general problem-solving attitude of mathematicians while participating in teams of large-scale projects.\r\n\r\nOur programs provide students with a broad education in Computer Science in combination with specialized work in programming languages, cyber security, data science, web engineering, autonomous systems, multimedia design etc.', '2021-02-11 07:52:21', '2021-02-11 07:52:21'),
(216, 211, 'en', 'M.Sc. Computer Science - Software and Service Architectures specialization', 'The goal of this program is to train Computer Scientist with a professional knowledge based on a solid theoretical background knowledge.  They have the skills to take part in program development, in developing information systems and system management in various areas. The Computer Scientist often acts as a mediator between the customers of information systems and the producers. In this way, the job of a Computer Scientist synthesizes the constructive activity of engineers with the general problem-solving attitude of mathematicians while participating in teams of large-scale projects.\r\n\r\nOur programs provide students with a broad education in Computer Science in combination with specialized work in programming languages, cyber security, data science, web engineering, autonomous systems, multimedia design etc.', '2021-02-11 07:53:08', '2021-02-11 07:53:08'),
(217, 212, 'en', 'M.Sc. Computer Science for Autonomous Systems', 'The goal of this program is to prepare students for the design and development of software for intelligent systems including, e.g. autonomous cars. Students will get up-to-date knowledge in one of the fastest growing and dominant technological trends of the future. The training offers students the opportunity to acquire valuable knowledge and competences in software technology, real-time systems, artificial intelligence, robotics and deep learning, data mining, computer image and signal processing, process control, computer graphics and vision. Electives include GIS systems, autonomous systems security issues and industrial mathematics. Students will be involved in the work of the research labs and can work on real industrial research together with professionals of leading companies interested in autonomous systems and autonomous driving.\r\n\r\nThis program is recommended to applicants who are interested in a career related to self-driving cars, robotics or artificial intelligence.', '2021-02-11 07:53:53', '2021-02-11 07:53:53'),
(218, 213, 'en', 'M.Sc. Financial Technology', 'Digital technology and finance have been inextricably linked for decades, but we are entering a new era. Technologies like machine learning, data analytics, biometrics or blockchain are creating new possibilities to address credit and risk management, identity management, information security, secure payments or portfolio management. \r\n\r\nThe new Fintech programme is designed to provide graduates with a holistic skill set, a cross-functional perspective and an entrepreneurial mindset that will enable them to lead organisations in this new paradigm. They will not only be able to imagine these new technology applications, but to develop them and bring them to market.', '2021-02-12 08:07:32', '2021-02-12 08:07:32'),
(219, 214, 'en', 'M.Sc. Digital Factory', 'This Digital Manufacturing (DM) Master Program could be considered aligned with other initiatives at National and International level to develop and promote the implementation of digitalization technologies in EU industry, that could lead to an increase of productivity on every sector. A key factor on this process is going to be the engineering profile of the people that will lead this transformation, a real integrated curriculum among Industrial and Manufacturing technologies, together with computer science and telecommunications technologies. The aim of this Program is to provide this truly integrated curriculum on student.', '2021-02-12 08:08:07', '2021-02-12 08:08:07'),
(220, 215, 'en', 'M.Sc. Data Science', 'Data abounds. Social media, manufacturing systems, medical devices, logistic services, and countless others generate petabytes of data on a daily basis. With a wealth of data available, we are at a point in history, where we can conduct analyses to detect, discover, and, ultimately, better understand the world around us.\r\n\r\nThe Data Science Masters offers a unique two-year academic programme, whereby students study data science, innovation and entrepreneurship at two different leading European universities.', '2021-02-12 08:08:56', '2021-02-12 08:08:56'),
(221, 216, 'en', 'M.Sc. Cyber Security', 'Cybersecurity is one of the cornerstones of creating a safe and inclusive digital society. The omnipresence of digital technology has made that cybersecurity has even become an essential ingredient in defending our democratic values.\r\n\r\nTherefor program focuses on the study of the design, development and evaluation of secure computer systems, which are also capable of ensuring privacy for future ICT systems. Students are provided with an understanding of the concepts and technologies for achieving confidentiality, integrity, authenticity, and privacy protection for information processed across networks.', '2021-02-12 08:10:12', '2021-02-12 08:10:12'),
(222, 217, 'en', 'M.Sc. Autonomous Systems', 'AUS is a combination of computer science and electronic engineering. During the programme, students will gain new skills in both areas. In computer science, relevant skills include Internet of Things (IoT), machine learning, artificial intelligence and robot vision. In electronic engineering, relevant fields are automation, control, embedded systems and communications.\r\n\r\nStudents learn the latest theoretical knowledge and know how to apply their skills in practical real-life problems. Typical application areas of autonomous systems include autonomous vehicles, intelligent robots, industrial IoT and autonomous software systems.\r\n\r\nThis program is recommended to applicants who already have a BSc degree in Computer Science and would like to expand their opportunities in the field of above mentioned areas.', '2021-02-12 08:10:42', '2021-02-12 08:10:42'),
(223, 218, 'en', 'M.Sc. Materials Science', 'The Materials Science program is an interdisciplinary M.S. program aimed at providing a rigorous education in materials science and the fundamental physics and chemistry that underlie this discipline. Educational goals are achieved through both coursework and training in cross-disciplinary research supervised by one science faculty member. The courses offer an overview of the types of materials; their chemical and physical structures; and properties.\r\n\r\nThe successful applicant must have a BSc. degree in Chemistry, in Chemical and Environmental Process Engineering, in Physics, in Materials Engineering or in any similar degree including reasonable amount of natural science (at least 40 ECTS) in the curriculum.', '2021-02-12 08:12:29', '2021-02-12 08:12:29'),
(224, 219, 'en', 'M.Sc. Mathematics', 'The program gives a comprehensive knowledge of several areas in mathematics and introduces the students into doing research in theoretical and/or applied mathematics. Besides purely theoretical courses, many courses are application oriented. Courses are offered in algebra, number theory, real and complex analysis, topology, geometry, probability theory and statistics, discrete mathematics and operations research but also in such interdisciplinary subjects as bioinformatics and theoretical computer science. The students may also choose from high-level application-oriented courses, which present state of the art issues of the given area, like complex systems, financial mathematics etc. The program is aimed at students who have at least a BSc degree in mathematics or a related field (physics, computer science, engineering etc.) In the latter case a certain number (65) of mathematical credits is required from earlier studes.', '2021-02-12 08:13:24', '2021-02-12 08:13:24'),
(225, 220, 'en', 'M.Sc. Meteorology', 'The goal of this program is to extend the knowledge of BSc level students, and to learn about different meteorological phenomena, their driving forces, and to gain knowledge on the state-of-the-art methodology that is used in the practice and also about climate change and its environmental consequences. Students have to learn about the multidisciplinary nature of meteorology and the possible connections with different other scientific fields and sectors. \r\n\r\nThis program is recommended to applicants who have strong background in physics, mathematics and meteorology or environmental science. Applicants should have deep motivation and ability to learn about the theory of weather forecast and climate modelling, and they should be able to apply their knowledge in the practice. Applicants should be able to understand the different spatial scales that are associated with the variety of meteorological phenomena.', '2021-02-12 08:20:05', '2021-02-12 08:20:05'),
(226, 221, 'en', 'MA Philosophy', 'The MA course offered by the Institute of Philosophy at the Faculty of Humanities is a two-year, full-time program comprising four semesters. Students need to have some philosophical background – a minimum of 30 credits as part of their BA studies. Students will have the opportunity to draw up their study and research programme under the supervision of a supervisor of their studies (in most cases different to their thesis supervisor). The aim of this setup is to give flexibility, and at the same time guidance so that students gain a thorough coverage and a sound grounding in the major fields of philosophy. At the same time students are required to engage in research either in some areas of history of philosophy, or in some field of systematic philosophy. These studies lead up to the MA thesis project.', '2021-02-12 08:24:44', '2021-02-12 08:24:44'),
(227, 222, 'en', 'M.Sc. Physics', 'The goal of this program is to train professional physicists who have a broad overview of contemporary physics and are able to join research on their specialized fields.\r\n\r\nThis program is recommended to applicants who already have their BSc in physics and want to be research physicists by deepening their knowledge.\r\n\r\nThis program enables students to have  broad background in the major fields of physics (atomic and molecular physics, condensed matter physics, nuclear physics, particle physics, statistical physics) and being being specialized in selected areas (astrophysics, atomic and molecular physics, nuclear and heavy ion physics, biophysics, condensed matter physics, computational physics, environmental physics, particle physics, statistical physics and complex system).', '2021-02-12 08:26:51', '2021-02-12 08:26:51'),
(228, 223, 'en', 'MA Psychology', 'The aim of the program is to train psychologist professionals who master the theories and methods of the science of psychology at an advanced level, who are proficient in the various fields of psychology, who possess the skills and techniques of the psychologist profession and are able to apply these to help individuals, groups or organizations develop and improve.\r\n\r\nFurther aims are to present recent theoretical and practical material, to establish professional skills and commitment for the profession within the field of psychology at a level that gives a solid foundation of knowledge that enables the student to practice psychology as a vocation independently at a master level, to participate in postgraduate courses and to attend further training in doctoral schools.', '2021-02-12 08:29:19', '2021-02-12 08:29:19'),
(229, 224, 'en', 'MA English Studies', 'English is the lingua franca, the most important language for communication in the globalised 21st century. It is a fact of life that everywhere experts are needed who not only speak English correctly, but who are also familiar with the societies and cultures of those countries where English is the first language. Experience has shown that an extraordinarily large number of employers seek experts with not merely an excellent command of the language, but also with the ability to make good use of their knowledge of the English-speaking world. The transmission of such cultural knowledge is the foundation of this program.\r\nIn this program, students become proficient in understanding and producing academic and media-oriented publications in the fields of English literature, socio-cultural history of the English language-based cultures (especially Great Britain, Ireland, Canada and Australia), applied and theoretical linguistics, mediating in English and their native language in specialised cultural, economic and political areas, teaching and transmitting knowledge concerning English literature and linguistics, and English language-based cultures and societies.', '2021-02-12 08:31:39', '2021-02-12 08:31:39'),
(230, 225, 'en', 'MA European and International Business Law', 'The goal of this program is to shape internationally renowned legal experts who are ready to take challenges in global scale and confident to handle complex issues in international regulatory environment with high level of confidence.\r\n\r\nThis is the first LL.M in European and International Business Law in Hungary and it offers an in-depth education covering the complex legal environment of European and International economies.\r\n\r\nThe European and International Business Law LL.M is designed to prepare an international group of legal practitioners for the global challenges of the 21st century. The program combines state-of-the-art knowledge and skills with an international orientation. It will help to develop the participants\' analytical as well as interpersonal skills in areas such as logical reasoning, argumentation and dispute settlement.', '2021-02-12 08:33:23', '2021-02-12 08:33:23'),
(231, 226, 'en', 'MA Human Resource Counselling', 'The aim of the programme is to train experts, who, in possession of their human, economic and developed interdisciplinary approach, are able to make detailed analyses, to find global and special correlations and to carry out advising and assessing activities in the world of organisations, work, employment and education. They apply their professional skills, support the macro-level processes of human resource management and education according to the different professional requirements of the given workplace. They are able to identify special professional problems and define practical solutions to them. They provide help for individuals to make career planning decisions. Their advising activity is determined by their knowledge of the HR market and organisational processes. They are prepared to continue their studies in a PhD programme.', '2021-02-12 08:35:51', '2021-02-12 08:35:51'),
(232, 227, 'en', 'MA Instruction of English as a Foreign Language', 'This full-time master’s degree program is designed to provide participants with the knowledge, skills and experience that will enable them to become fully-fledged professionals in the field of teaching of English as a foreign language. It includes three main components:\r\n\r\nA series of taught modules (on-campus seminars and lectures) covering relevant subject areas in both semesters;\r\nA period of supervised hands-on teaching practice (50 hours during the second semester) during which participants work with real learners of English as a foreign language;\r\nA research-based dissertation or other project-based work, to be submitted any time within two years after the participant has earned all the credits on the taught courses.', '2021-02-12 08:37:04', '2021-02-12 08:37:04'),
(233, 228, 'en', 'MA International Relations', 'The goal of this programme is to offer students in-depth knowledge on the topics of globalization, international institutions, security, development studies, and human rights. It enables our graduate students to understand and analyze complex political and social problems that go beyond state borders and cultural boundaries.\r\n\r\nThis programme is recommended to applicants who are interested in politics, social problems and interactions between different nations and cultures. While preference is given to students with prior knowledge in political science or international relations, students with a different background will complete foundational courses in our BA programme in the first semester in order to acquire the necessary knowledge.', '2021-02-12 08:38:57', '2021-02-12 08:38:57'),
(234, 229, 'en', 'BSc. Corporate Finance', 'As a graduate of this financial management programme, you will develop your ability to read and understand financial statements, evaluate business propositions and acquire knowledge about how capital and money markets work.\r\n\r\nWe give considerable importance to increasing students\' employability skills. IBS has set up SIDE (Skills Identification Development Exhibition), that enhances and develops the skills which are most demandable in the job arena to ensure that our graduates have an advantage over others in job applications.', '2021-02-12 09:08:09', '2021-02-12 09:08:09'),
(235, 230, 'en', 'BSc. Business and Diplomatic Studies', 'This programme will lead you to a sophisticated, interdisciplinary understanding of international business, providing you with a contextual understanding of contemporary international relations, and equipping you with skills, traditionally required in international diplomacy. You will have in-depth knowledge of a geographical region of your choice.\r\n\r\nWe give considerable importance to increasing students\' employability skills. IBS has set up SIDE (Skills Identification Development Exhibition), that enhances and develops the skills which are most demandable in the job arena to ensure that our graduates have an advantage over others in job applications.', '2021-02-13 06:48:22', '2021-02-13 06:48:22'),
(236, 231, 'en', 'BSc. Business Management', 'Management is sometimes defined as the achievement of results with, and through, others. Whether the challenge is beating the competitors or educating future professionals, the answer often comes down to management.\r\n\r\nWe give considerable importance to increasing students\' employability skills. IBS has set up SIDE (Skills Identification Development Exhibition), that enhances and develops the skills which are most demandable in the job arena to ensure that our graduates have an advantage over others in job applications.', '2021-02-13 06:50:52', '2021-02-13 06:50:52'),
(237, 232, 'en', 'BSc. Business Management with HRM and Business Psychology', 'This is a specialisation of the Business Management programme.\r\n\r\nThis programme delivers an interdisciplinary understanding of generic business issues, providing you with a contextual understanding of the latest knowledge of psychology.\r\n\r\nWe give considerable importance to increasing students\' employability skills. IBS has set up SIDE (Skills Identification Development Exhibition), that enhances and develops the skills which are most demandable in the job arena to ensure that our graduates have an advantage over others in job applications.', '2021-02-13 06:58:52', '2021-02-13 06:58:52'),
(238, 233, 'en', 'BSc. Business Management with Marketing', 'This is a specialisation of the Business Management programme.\r\n\r\nWe give considerable importance to increasing students\' employability skills. IBS has set up SIDE (Skills Identification Development Exhibition), which enhances and develops the skills which are most demandable in the job arena to ensure that our graduates have an advantage over others in job applications.', '2021-02-13 06:59:44', '2021-02-13 06:59:44'),
(239, 234, 'en', 'BSc. Business Management with Tourism', 'This is a specialisation of the Business Management programme.\r\n\r\nTourism is a sector that is at the heart of many of the big moments in modern life such as major music or sports events, family weekends or a dream holiday on an island. We will ensure that you have the necessary skills to manage operations and businesses across a diverse range of contexts including tourism, cultural heritage, festivals and events.\r\n\r\nWe give considerable importance to increasing students\' employability skills. IBS has set up SIDE (Skills Identification Development Exhibition), that enhances and develops the skills which are most demandable in the job arena to ensure that our graduates have an advantage over others in job applications.', '2021-02-13 07:02:28', '2021-02-13 07:02:28'),
(240, 235, 'en', 'M.Sc. Strategic Finance', 'MSc in Strategic Finance (TOP 100 - Global ranking ranked N°70 in Financial Markets, Worldwide!*) is suitable for those intending to develop their careers in finance, broadly defined as corporate finance, security analysis, portfolio management, treasury management, the functioning of financial institutions and markets, and financial decision-making in the public or not-for-profit sectors. For those already working in finance, the programme will enhance their effectiveness by covering the latest developments in the field, encouraging them to question traditional techniques and take an analytical approach to problem-solving.', '2021-02-13 08:07:43', '2021-02-13 08:07:43'),
(241, 236, 'en', 'M.Sc. IT for Business Data Analytics', 'MSc in IT for Business Data Analytics programme’s goal is to (re-)train young professionals, who will be able to occupy junior software developer/business analyst positions, thanks to their ability to perform various coding tasks and simultaneously interpret business information and identify business insights. The programme will, therefore, be a conversion programme addressed to young people seeking career advancement or career change and will train IT professionals with strong business foundations.  \r\n\r\nIn collaboration with one of the largest coding academies in Hungary, the prestigious Green Fox Academy, we believe that any person can reach the level of junior software developer regardless of their prior qualifications. Along with Green Fox Academy, we prepare students from all fields for various in-demand positions of the job market in one year.', '2021-02-13 08:09:07', '2021-02-13 08:09:07'),
(242, 237, 'en', 'M.Sc. Strategic Marketing', 'MSc in Strategic Marketing programme (ranked no. 7 in Eastern Europe!*)  develops knowledge and skills in business and marketing and directs students towards the commercial environment. The programme also seeks to encourage one\'s creative expression and help smooth a path to this exciting sector. Our graduates are represented in an extremely diverse range of multinational, national and local organisations the world over, including sales, advertising, account management, PR, and market research.', '2021-02-13 08:10:41', '2021-02-13 08:10:41'),
(243, 238, 'en', 'M.Sc. Strategic International Management', 'MSc in Strategic International Management (ranked no. 11 in Eastern Europe!*) attracts a culturally diverse mix of international students. It is an ideal choice if you want to progress in your career from entry-level to a managerial position. Graduates go on to pursue a variety of successful careers in corporate organisations or perform managerial roles in smaller and medium-sized organisations throughout the world.', '2021-02-13 08:23:55', '2021-02-13 08:23:55'),
(244, 239, 'en', 'M.Sc. Strategic Human Resource Management', 'MSc in Strategic Human Resource Management (ranked no. 4 in Eastern Europe!*), mixing theory and practice successfully, offers an opportunity for in-depth study of organisations and the management of work. Graduates are equipped to pursue a wide variety of career options in the HR arena, including employee relations, employee development, assessment and recruitment.', '2021-02-13 08:26:35', '2021-02-13 08:26:35'),
(245, 240, 'en', 'BA Communication and Media Science', 'Communication and the media have become an integral part of our everyday life. They are not only indispensable for work but they play an essential role in almost every activity imaginable. The latest developments in technology provide an opportunity for an immediate reaction to any event.\r\nTherefore, new applications, such as Web 2.0 based technology, are of paramount importance for us. Our aim is to transfer the in-depth knowledge and skills needed to understand and master the constantly evolving tools of communication in a spirit that enables graduates to use the novel means of communication and the media in a responsible way preparing students to face any future challenge.', '2021-02-13 10:28:53', '2021-02-13 10:29:38'),
(246, 241, 'en', 'BA International Relations', 'Our program offers a truly global approach to international political and social challenges. With courses that reflect the increasingly multicultural and globalized nature of the contemporary world order, it brings together students from all over the world to study and discuss the most pressing contemporary political issues from perspectives reflecting the diversity of today’s world. The broad foundations in many disciplines from political science to history, from law to economics, from communication to research and analysis, gives our graduates a clear advantage in our complex and fast-paced world. Armed with the knowledge and skills necessary to understand and make use of the inner logic of global relations, our students are able to anticipate the direction in which the world develops, and to draw on the opportunities these changes bring, whether in official interstate relations, international business or civil society.', '2021-02-15 07:22:00', '2021-02-15 07:22:00'),
(247, 242, 'en', 'B.Sc Business Administration and Management', 'Success has many components. If you want to succeed in business, you should be ready to think big, capable of comprehending far-reaching processes and have analytical, organizational and managerial skills in order to deliver business results.\r\n\r\nThis is inconceivable without cutting-edge knowledge and effective management and communication training. Our courses prepare our students to meet any business challenge imaginable. In addition to receiving a thorough grounding in economics, students will also learn how to make powerful presentations, handle business negotiations, organize events and write press releases. We teach you how to compete to succeed in a professional environment, how to develop winning strategies and how to realize your business goals.', '2021-02-15 07:23:46', '2021-02-15 07:23:46'),
(248, 243, 'en', 'B.Sc Finance and Accounting', 'Understanding the nature of money and capital market is an exciting and rewarding adventure of a lifetime. This program makes students understand the financial culture through an analytical approach so they are capable of comprehending the domestic and international financial processes in their diversity.\r\n\r\nWe consider it important that our students have the opportunity to work with the latest tools and software. These advanced financial tools are essential for understanding today\'s most dynamically developing sector, with special emphasis on e-business. We focus on fostering independent strategic, business planning and analytical skills. Besides becoming familiar with all the major secrets of investment, financing and taxation decisions, you will be able to organize and manage a company\'s financial, accounting and taxation processes.', '2021-02-15 07:25:30', '2021-02-15 07:25:30'),
(249, 244, 'en', 'B.Sc Commerce and Marketing', 'Marketing is essential in every aspect of life – we are surrounded by brands which influence our decisions, and in certain situations we can only succeed if we learn how to sell our personal brand. Commerce and Marketing provides fundamental business and economic knowledge that offers an unrivalled range of potential directions of career and further training. Students can develop their skills during practical trainings in groups with the guidance of recognized industry experts. The areas of marketing, PR, advertising and communication are all open highways for our graduates.', '2021-02-15 07:26:01', '2021-02-15 07:26:01'),
(250, 245, 'en', 'B.Sc Tourism and Catering', 'Budapest is the vibrant capital of Hungary and one of the most popular tourist destinations in Europe. Consequently, tourism and catering is one of the most popular degree programs in Hungary as well as in Budapest. This is also due to the colourful, diverse nature and human- centered view of tourism.\r\n\r\nThis bachelor program offers thorough grounding in all important subjects and topics in tourism and catering. What makes the program really unique is the host of specializations available for students including Health Tourism and International Hotel Management drawing heavily on Hungary having a world renowned reputation due to its rich thermal healing water assets or its number one position in international dental tourism. Furthermore, we place emphasis on the development of practical skills, therefore our students will have the opportunity to undertake project-based learning, challenge themselves in professional competitions, attend workshops, or take part in hotel visits.', '2021-02-15 07:32:48', '2021-02-15 07:32:48'),
(251, 246, 'en', 'BA Animation', 'Are you interested in how a drawing becomes a motion picture, are you attracted by film tricks, video games, making apps? As an animation designer, you can become the designer of complex productions in advertising, the electronic media, motion pictures, digital post-production or game design, or the specialist of a special field.', '2021-02-15 07:51:34', '2021-02-15 07:51:34'),
(252, 247, 'en', 'BA Environmental Design', 'We aim to teach professionals who design and decorate the interior and exterior of our built environment whether independently or as a creative associate. Emphasis is put on personal contact and consultancy.', '2021-02-15 07:52:39', '2021-02-15 07:52:39'),
(253, 248, 'en', 'BA Graphic Design', 'In the age of desktop publishing (DTP), graphic design became the most innovative branch of design, with a strong presence of its’ intellectual products in everyday life, both in the online and offline media.', '2021-02-15 07:53:57', '2021-02-15 07:53:57');
INSERT INTO `institution_program_translations` (`id`, `institution_program_id`, `locale`, `title`, `description`, `created_at`, `updated_at`) VALUES
(254, 249, 'en', 'BA Media Design', 'Media designers are the polyhistors of the 21st century. In the age of constant technological revolution, their role is not only to follow but to shape that with artistic sensibility: to make the new digital world modest for us, from the World Wide Web through the post-production of films to game development.', '2021-02-15 08:05:19', '2021-02-15 08:05:19'),
(255, 250, 'en', 'BA Motion Picture (Cameraman Specialization)', 'During the filmmaking process the most important partner of the director is the cinematographer. He has a significant role in transferring a film idea into reality successfully in an environment where technology develops day by day. The cinematographer is the person who creates a coherent visual world using his/her own talent within the framework of the opportunities provided by the script.  \r\n\r\nIn our University at the cameraman specialization the development of the artistic sense is equally important as gaining the proper knowledge of the technology. In order to be able of creating a film at a high level, not only stable technical knowledge and facing new challenges is needed but also a great dedication to filmmaking. Our University emphasis on introducing all relevant elements of the filmmaking, like editing, scriptwriting and directing in order to make our students capable of working in a team later.\r\n\r\nOrigo Film Studio provides an excellent professional background for the filmmaking training of the university.', '2021-02-15 08:05:59', '2021-02-15 08:05:59'),
(256, 251, 'en', 'BA Motion Picture (Cameraman Specialization)', 'Photography', '2021-02-15 08:06:32', '2021-02-15 08:06:32'),
(257, 252, 'en', 'BA Visual Representation (specializing in Film and Media)', 'You can acquire comprehensive theoretical and practical knowledge on the areas of traditional imagery and portrayal as well as study the world of electronic imagery, motion picture and media. Our department offers a strong foundation for students to find their way in the traditional and digital visual world. Besides the classic genres of imaging, you can get to know the motion picture, multimedia and interactive segments of visual representation.', '2021-02-15 08:07:42', '2021-02-15 08:07:42'),
(258, 253, 'en', 'BA Visual Representation (specializing in Film and Media)', 'You can acquire comprehensive theoretical and practical knowledge on the areas of traditional imagery and portrayal as well as study the world of electronic imagery, motion picture and media. Our department offers a strong foundation for students to find their way in the traditional and digital visual world. Besides the classic genres of imaging, you can get to know the motion picture, multimedia and interactive segments of visual representation.', '2021-02-15 08:08:13', '2021-02-15 08:08:13'),
(259, 254, 'en', 'Ma Communication and Media Studies', 'For a successful professional it is an essential tool to have strong communication skills, for a successful professional in the media sciences this is fundamental. The Masters of Communication program offers theoretical knowledge with a strong focus on practical, professional skills and competences.\r\n\r\n\r\nThe educational program of the course is strongly media-oriented which is based on a thorough grounding in social and behavioral sciences and present issues of intercultural communication. \r\n\r\nComplying with current social and labor market demands, the course integrates the fields of communication theory, media studies, social sciences, political science, sociology, psychology and cultural studies within the field of social sciences offering a knowledge of high standard, which can be put to a profitable and practical use in various areas.\r\n\r\nThe communication master course offers theoretical knowledge with a strong focus on practical, professional skills and competences. In order to achieve that objective\r\n\r\nIn accordance with the educational objectives of the programme, the module places special emphasis on developing the cross-cultural and intercultural competences of students who are also introduced to the complex system of international organizations and the intricate processes that shape international relations.', '2021-02-15 09:22:36', '2021-02-15 09:22:36'),
(260, 255, 'en', 'M.Sc Management and Leadership', 'To be a chief executive of any organisation is a complex challenge, let it be a small enterprise or a large one or organization in the public sector. Managing any of them requires an expert in analyzing, planning, coordinating, solving conflicts and problems, sustaining workflow. We present this approach to our students, so they can cope with all areas of business management, and turn into true leaders of enterprises, all on a professional level.', '2021-02-15 09:23:41', '2021-02-15 09:23:41'),
(261, 256, 'en', 'MBA Master of Business Administration', 'The most cutting-edge theoretical and practical knowledge and skills that encompass all sectors of business are incorporated to our MBA. In addition to the important foundational courses (Economic Policy, Research Methodology, Qualitative Methods, Business Economics, Business Law, etc.), we have included other essential skills (Modern Corporate Finance, Financial Analysis, Strategic Management, etc.) and have included a focus on leadership development. After fully understanding the fundamentals of business, students will be exposed to a diversity of experiential learning through practical examples, case studies, and hands-on projects. These allow students to master the skills necessary to become confident and successful business professionals.', '2021-02-15 09:33:29', '2021-02-15 09:33:29'),
(262, 257, 'en', 'M.Sc Marketing', 'Marketing is an exciting and diverse world. In this master’s program we present the newest trends of the profession in order to provide a deeper understanding of marketing processes and an overview of the latest developments. In addition, you get a perspective that prepares you to adapt to the ever-changing business environment quickly and creatively, and find the most appropriate solutions in accordance with the brand and the target group.', '2021-02-15 09:34:02', '2021-02-15 09:34:02'),
(263, 258, 'en', 'MBA Master of Business Administration', 'The most cutting-edge theoretical and practical knowledge and skills that encompass all sectors of business are incorporated to our MBA. In addition to the important foundational courses (Economic Policy, Research Methodology, Qualitative Methods, Business Economics, Business Law, etc.), we have included other essential skills (Modern Corporate Finance, Financial Analysis, Strategic Management, etc.) and have included a focus on leadership development. After fully understanding the fundamentals of business, students will be exposed to a diversity of experiential learning through practical examples, case studies, and hands-on projects. These allow students to master the skills necessary to become confident and successful business professionals.', '2021-02-15 09:34:58', '2021-02-15 09:34:58'),
(264, 259, 'en', 'M.Sc Tourism Management', 'Budapest is one of the most exciting tourism destinations in the world and the number of international tourists, as well as students, is growing. As well as its beautiful heritage sites and Danube river views, the city is the only capital city in the world which has so many thermal baths or spas, it was nominated as City of Design by UNESCO Creative Cities Network, and the city offers a lively cultural scene and nightlife with its world-famous ’ruin bars’.\r\n\r\nThe MSc Tourism Management Programme combines a number of courses, which are especially designed to give students a strong foundation in global business and tourism, creative thinking and innovation, as well as Budapest-specific knowledge.', '2021-02-15 09:36:06', '2021-02-15 09:36:06'),
(265, 260, 'en', 'Ma Design', 'During your studies you are free to design furniture pieces, hand tools, vehicles, labor-saving devices or complex customer service systems. With the aid of your creativity you can imagine and work out objects and environments of the future, such as robots and digital technology-based tools and devices. You will get familiar with current trends in industrial and product design. In addition, you can improve your skills in handmade and computer-based 3D modelling, 3D printing and persuasive presentation techniques.', '2021-02-15 09:37:59', '2021-02-15 09:37:59'),
(266, 261, 'en', 'Ma Art and Design Management', 'Design in a broader sense - meaning all creative solutions as a whole - is indispensable in today’s global economics. The design and creative thinking of the global product structure and national and international relations of for-profit and non-profit actors of the art sector require professionals who are familiar with contemporary social and art theories, design thinking, art and design scenes and trends all over the world.', '2021-02-15 09:39:00', '2021-02-15 09:39:00'),
(267, 262, 'en', 'Ma Fashion and Textile Design', 'The task of the Fashion and Textile Department is to train designers who are capable of solving high-level design and creative processes in the fields of textile culture based on their education and creativity. Through their work, they contribute to the development of general object culture and to the enrichment of the Hungarian artistic life. Their works also have an impact on the international design market.', '2021-02-15 09:39:41', '2021-02-15 09:39:41'),
(268, 263, 'en', 'Ma Graphic Design', 'During our course, you can become a graphic designer artist who is able to respond to actual situations and present creative and artistic solutions, and who is able to create and implement high quality work on every job platform', '2021-02-15 09:40:08', '2021-02-15 09:40:08'),
(269, 264, 'en', 'B.Sc Applied Economics', 'In this program we will introduce you relevant economic concepts, theories, principles, equations and models which will be the foundation of your work. Not only that but you will have the possibility to take part in a double degree program with Bamberg University in Bamberg, Germany! Roles that you as a graduate can pursue include analyst in a bank or consulting firm, economic advisor to a government minister, insurance broker for a major provider or management trainee across a range of industries.', '2021-02-15 10:52:01', '2021-02-15 11:50:59'),
(270, 265, 'en', 'B.Sc Business and Management', 'An EFMD accredited general management programme geared towards an international career, with an emphasis on transferable skills and a practice oriented integrated learning approach, locat-ed in the centre of Europe and in the centre of Budapest, ensuring great value for money. Our typical students are freshly graduated from high-school, equipped with good mathematical skills and strong English proficiency, planning to embark on an international business career.', '2021-02-15 11:38:44', '2021-02-15 11:51:11'),
(271, 266, 'en', 'B.Sc Communication and Media science', 'Our core program provides competitive knowledge in the field of organizational and public communication with renowned representatives of the discipline, the involvement of economic expertise, psychological knowledge, as well as a professional media studio. Uniquely in the studies of this program may be pursued at the master\'s and then doctoral levels as well. This program is recommended for those who want to work in the field of media and communication. Our program covers personal and digital communication, visual and virtual communication, the phenomena of social, public and intercultural communication based on the latest research; this allows our students to acquire strategic communication skills and crucial knowledge of digital public life and organizational communication.', '2021-02-15 11:46:13', '2021-02-15 11:51:22'),
(272, 267, 'en', 'B.Sc international business', 'The program prepares you for an international business career. It introduces you step by step to the exciting world of international business, illuminating its global economic and corporate business background. Unlike traditional education, our students learn the necessary theoretical knowledge through international business examples and cases, and put them into practice through the solution of business situations and problems. The multicultural experience is completed by a semester spent abroad.', '2021-02-15 11:48:21', '2021-02-15 11:51:35'),
(273, 268, 'en', 'BA international relations', 'The aim of the International Relations BA programme is to train intellectuals who know their way around the world of international relations, are able to appropriately represent national and regional interests, are sensitive to global problems, can handle challenges arising from the European integration process, and are open to learn more about other cultures. The programme is best suited for people who learn foreign languages with pleasure, and are interested in a career in foreign affairs.', '2021-02-15 11:49:52', '2021-02-15 11:49:52'),
(274, 269, 'en', 'B.Sc Sociolog', 'The purpose of the program is to introduce those theories, research methodologies and data analysis skills which are necessary to understand and analyse social problems. We recommend this program to those who are interested in social issues such as inequality, poverty, sexism, racism, as well as for those who consider evidence-based thinking important.', '2021-02-15 11:52:42', '2021-02-15 11:52:42'),
(275, 270, 'en', 'M.Sc Business informatics', 'The aim of the course is to prepare students to solve business problems with IT tools. The program provides up-to-date methodological and practical knowledge in the fields of business analysis, IT management, digitalisation, business intelligence, IT project management, IT audit, and business applications (e.g. ERP). In addition to technical interest, managerial skills and the ability to perform organisational and management tasks are also important.', '2021-02-17 07:00:03', '2021-02-17 07:00:03'),
(276, 271, 'en', 'MA Communication and Media studies', 'This two-year practice-oriented Communication and Media Studies Master’s programme aims to train communication and media experts and provide them with a precious master’s degree. Professional experts who can adapt to the volatile challenges of the labour market and possess the ability to work for and lead various communication and media organisations by gaining an internationally recognised academic qualification.', '2021-02-17 07:39:12', '2021-02-17 07:39:55'),
(277, 272, 'en', 'MA Economic Analysis', 'With the arrival of the data revolution, more and more firms and policy institutions employ economic analysts to foster fact-based decision-making. The goal of this two-year program is to provide students with the understanding of economic processes and the ability to carry on empirical economic analysis. This is achieved by learning up-to-date economic theory, data analysis, and their application to real-world analysis. If you have an interest in data analysis and economic theory, this program may match your interests. You can apply for full coverage of the tuition and scholarship at Stipendium Hungaricum.', '2021-02-17 07:40:41', '2021-02-17 07:40:41'),
(278, 273, 'en', 'MA Economics of Family Policy and Public Policies for Human Development', 'With the arrival of the data revolution, more and more firms and policy institutions employ economic analysts to foster fact-based decision-making. The goal of this two-year program is to provide students with the understanding of economic processes and the ability to carry on empirical economic analysis. This is achieved by learning up-to-date economic theory, data analysis, and their application to real-world analysis. If you have an interest in data analysis and economic theory, this program may match your interests. You can apply for full coverage of the tuition and scholarship at Stipendium Hungaricum.', '2021-02-17 07:42:03', '2021-02-17 07:42:03'),
(279, 274, 'en', 'M.Sc Finance', 'The aim of the program is to equip professionals with a holistic oversight onto financial processes in the corporates, the banking industry, and in public finance sectors. With solid theoretical foundations and practical skills, students are able to analyze and solve complex financial problems and support decision-making. Graduates are prepared to work according to international professional standards.', '2021-02-17 07:42:54', '2021-02-17 07:42:54'),
(280, 275, 'en', 'MA Health Policy Planning and Financing', 'The purpose of the program is to teach how to adapt to the rapidly changing technological trends in the healthcare and biotechnology sectors. We recommend this program to those who envisage a career in a health care institution or would take part in the preparation of health policy and health insurance decisions.', '2021-02-17 07:45:07', '2021-02-17 07:45:07'),
(281, 276, 'en', 'MA International Economy and Business', 'The program aims to acquaint students with the micro- and macroeconomic - , international business and financial relationships and processes, as well as with the relationship between global and regional institutional cycles. The program prepares students for entry into the field of international economic analysis and international business decision-making processes.', '2021-02-17 07:47:02', '2021-02-17 07:47:02'),
(282, 277, 'en', 'MA International Relations', 'The aim of the program is to train professionals of international relations on a multidisciplinary basis. We recommend this program to those who are preparing for a diplomatic or international career and follow international events, political and economic tendencies not only at the level of news but want to acquire deeper knowledge of the background and root causes of these trends. Graduates will have a deep understanding of Hungary’s place in Europe and the international system.', '2021-02-17 08:33:51', '2021-02-17 08:33:51'),
(283, 278, 'en', 'MA International Taxation', 'The aim of the course is to provide knowledge about how to proceed fiscal representative issues of international companies or how to manage investments and business transactions related to the field of taxation.', '2021-02-17 08:34:51', '2021-02-17 08:34:51'),
(284, 279, 'en', 'MA Marketing', 'The aim of the course is to provide knowledge about how to proceed fiscal representative issues of international companies or how to manage investments and business transactions related to the field of taxation.', '2021-02-17 08:35:38', '2021-02-17 08:35:38'),
(285, 280, 'en', 'MA Public Policy and Management', 'This course enables you to analyze different issues of public policy and public administration at a professional level, as it will provide you with an understanding of the principles and methods of modern public policy and management. You will be able to take part in two double degree programs, one in Babes-Bolyai University in Cluj-Napoca, Romania or another one in the University of Palermo in Palermo, Italy. As a successful graduate of ours you may seek employment at various international organizations like the UN, the EU and the OECD as well. What are you waiting for? Apply now!', '2021-02-17 11:38:39', '2021-02-17 11:38:39'),
(286, 281, 'en', 'MA Sociology', 'The aim of the program is to analyze social and technological challenges and processes arising from globalisation, as well as the theories, methods and results of investigating global social change.', '2021-02-17 11:39:29', '2021-02-17 11:39:29'),
(287, 282, 'en', 'BSc Business Administration and Management', 'The program prepares specialists in economics and business who, using the skills acquired in the fields of economics, social sciences, applied economics, methodology and their chosen specialization are able to analyze, plan, organize, coordinate and accomplish the activities of business organizations and institutions.', '2021-02-25 11:54:15', '2021-02-25 12:05:13'),
(288, 283, 'en', 'BSc Biochemical Engineering', 'The aim of the program is to enable students to be competent in all fields of biotechnology by providing them with deep theoretical knowledge and practical skills (engineering and technological). Students will experience laboratory and manufacturing practices for themselves that a biochemical engineer might encounter in everyday work. Students will get acquainted with the equipment and apparatus used in the biotechnological industry and understand their optimal operation.', '2021-02-25 12:03:42', '2021-02-25 12:13:01'),
(289, 284, 'en', 'BSc Biology', 'The aim of the program is to provide students with basic knowledge in the most important biological fields. Students will attain skills in the fundamental methods of laboratory and applied biology and come to understand the most important processes of biochemistry, cytology and components of living organisms. The Biology BSc program covers a broad range of biological science including the most important concepts in modern biology; the biological levels of organization; the fundamental principles of structure and function and the development of ecosystems.', '2021-02-25 13:13:30', '2021-02-25 13:13:30');

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `institution_translations`
--

CREATE TABLE `institution_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `institution_id` bigint(20) UNSIGNED NOT NULL,
  `locale` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `institution_translations`
--

INSERT INTO `institution_translations` (`id`, `institution_id`, `locale`, `title`, `description`, `created_at`, `updated_at`) VALUES
(27, 26, 'en', 'IUBH University', '<p>IUBH University of Applied Sciences&nbsp;(&ldquo;IUBH Internationale Hochschule&rdquo;) is a private, state-accredited university of applied sciences in Germany.</p>\r\n<p>It offers English-language campus-based courses, dual German-language study programs as well as part-time and distance-learning courses in German and English.&nbsp;</p>\r\n<p>Would you like to have an international career? We can prepare you for it. With English taught programmes, stays abroad and international educational content.</p>', '2021-01-05 14:16:49', '2021-01-05 14:16:49'),
(28, 27, 'en', 'Koc University', '<p style=\"margin: 0.5em 0px; color: #202122; font-family: sans-serif; font-size: 14px; text-align: justify;\"><span style=\"color: #4a4a4a; font-family: bookFont, \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-size: 16px;\">Ko&ccedil; University was founded in 1993 as a non-profit private university in Istanbul, Turkey. Since its establishment, Ko&ccedil; University has become one of the leading universities in Turkey, distinguished by notable contributions to the elevation of education, knowledge and service both domestically and beyond.</span></p>\r\n<p style=\"margin: 0.5em 0px; color: #202122; font-family: sans-serif; font-size: 14px; text-align: justify;\">&nbsp;</p>\r\n<p style=\"margin: 0.5em 0px; color: #202122; font-family: sans-serif; font-size: 14px; text-align: justify;\"><span style=\"color: #4a4a4a; font-family: bookFont, \'Helvetica Neue\', Helvetica, Arial, sans-serif; font-size: 16px; text-align: start;\">The principle mission of Ko&ccedil; University is to cultivate Turkey&rsquo;s most competent graduates, well-rounded adults who are internationally qualified; who can think creatively, independently and objectively; and who are confident leaders. Concurrently, research conducted at Ko&ccedil; University contributes to scientific development on an international scale and bolsters technological, economic and social development. Ko&ccedil; University consistently strives to advance knowledge through its efforts and to serve Turkey and humanity as a model of institutional excellence.</span></p>', '2021-01-09 17:32:17', '2021-01-09 17:32:17'),
(29, 28, 'en', 'Ozyegin University', '<p style=\"box-sizing: border-box; padding: 0px; font-family: Roboto, sans-serif; font-size: 14px; line-height: 1.5; text-rendering: optimizelegibility; max-width: 100%; text-align: justify; margin: 0px 0px 20px !important 0px;\"><strong><span style=\"box-sizing: border-box; line-height: 1.5; max-width: 100%;\">The H&uuml;sn&uuml; M. &Ouml;zyeğin Foundation</span>&nbsp;began its efforts to establish &Ouml;zyeğin University in the fall of 2005. The foundation for &Ouml;zyeğin University entailed comprehensive surveys conducted with more than 500 subjects including businessmen, faculty members, and university and high school students, in addition to a study on \"Developing Sectors and Professions in Turkey and in the World\". Based on the results of these studies, ARAMA Consulting began the designing process. The University&rsquo;s fundamental values and vision were discussed and identified in collaboration with all of the stakeholders. &Ouml;zyeğin University shaped its vision through a series of workshops. More than 300 participants attended these workshops, including businessmen, faculty members, university students, and new graduates.</strong></p>\r\n<p style=\"box-sizing: border-box; padding: 0px; font-family: Roboto, sans-serif; font-size: 14px; line-height: 1.5; text-rendering: optimizelegibility; max-width: 100%; text-align: justify; margin: 0px 0px 20px !important 0px;\"><strong>In line with its collectively-shaped vision, &Ouml;zyeğin University was officially established on May 18, 2007 to serve as a unique university that would contribute to social development through its modern education system, innovative structure integrated with life, academic approach intertwined with sectors, and academic programs tailored accordingly.</strong></p>\r\n<p style=\"box-sizing: border-box; padding: 0px; font-family: Roboto, sans-serif; font-size: 14px; line-height: 1.5; text-rendering: optimizelegibility; max-width: 100%; text-align: justify; margin: 0px 0px 20px !important 0px;\"><strong>&Ouml;zyeğin University welcomed its first students on its Altunizade Campus in September 2008, and opened the doors of its &Ccedil;ekmek&ouml;y Campus in September 2011.</strong></p>\r\n<p style=\"box-sizing: border-box; padding: 0px; font-family: Roboto, sans-serif; font-size: 14px; line-height: 1.5; text-rendering: optimizelegibility; max-width: 100%; text-align: justify; margin: 0px 0px 20px !important 0px;\"><strong><span style=\"box-sizing: border-box; line-height: 1.5; max-width: 100%;\">&Ccedil;ekmek&ouml;y Campus</span></strong></p>\r\n<p style=\"box-sizing: border-box; padding: 0px; font-family: Roboto, sans-serif; font-size: 14px; line-height: 1.5; text-rendering: optimizelegibility; max-width: 100%; text-align: justify; margin: 0px 0px 20px !important 0px;\"><strong>The &Ouml;zyeğin University &Ccedil;ekmek&ouml;y Campus is a quiet, peaceful, and tranquil university campus. Created by a leading architecture firm, which also designed the buildings of the University of Cambridge and Princeton University, the OzU &Ccedil;ekmek&ouml;y Campus is Turkey&rsquo;s first LEED-certified campus. Situated on 283,000 square meters of land, the campus offers all the amenities and facilities necessary to foster students&rsquo; academic development, and their exposure to social, sportive, and cultural events, through its quiet and comfortable study rooms, modern classrooms, and laboratories, 15,000 square meter Athletic Center, 2,825 square meter library, and its two auditoriums with a 350- and 372-person capacity, respectively.</strong></p>', '2021-01-09 20:22:06', '2021-01-09 20:22:06'),
(30, 29, 'en', 'Istanbul Bilgi University', '<p style=\"text-align: justify;\"><strong><span style=\"font-family: Montserrat, sans-serif; font-size: 14px;\">Adopting the principle of \'Non scholae, sed vitae discimus\' (learning not for school but for life), İstanbul Bilgi University took its place within the Turkish system of higher education as a civil corporation after the application made by the Bilgi Education and Culture Foundation on 7 June 1996 and the subsequent approval by the Turkish Grand National Assembly as per the Law number 4142.</span></strong></p>\r\n<p style=\"text-align: justify;\"><strong><span style=\"font-family: Montserrat, sans-serif; font-size: 14px;\">İstanbul Bilgi University undertakes to contribute to science, artistic production, and the development of technology; to educate individuals whose research and problem solving skills have developed in an atmosphere of free thought and an awareness of social responsibility, whose competencies meet international standards, and who in addition to respecting the rules of ethics and of professional objectivity are also open to multi-disciplinary approaches; and to serve society within multi-dimensional standards of quality.</span></strong></p>', '2021-01-09 20:30:33', '2021-01-09 20:30:33'),
(31, 30, 'en', 'Sabanci University', '<p class=\"description\" style=\"box-sizing: border-box; margin: 0px 0px 20px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 18px; line-height: 32px; font-family: Roboto, sans-serif; vertical-align: baseline; color: #313131; display: inline-block; width: 1140px; text-align: justify;\"><strong>With science, technology, and social structures advancing day by day, the world needs more qualified individuals who possess the knowledge and skills required to pursue a career anywhere in the world. Aware of this pressing issue, in 1994 the Sabancı Group decided to establish a \"world university\" led by the Sabancı Foundation.</strong><strong><span style=\"color: #313131; font-family: Roboto, sans-serif; font-size: 14px;\">&nbsp;</span></strong></p>\r\n<p class=\"description\" style=\"box-sizing: border-box; margin: 0px 0px 20px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 18px; line-height: 32px; font-family: Roboto, sans-serif; vertical-align: baseline; color: #313131; display: inline-block; width: 1140px; text-align: justify;\"><strong>The seeds of Sabancı University, the Sabancı Group\'s most comprehensive social responsibility project in the field of education, were sown in the summer of 1995, at a search conference in which 50 academics from 22 countries as well as students and representatives from the private sector participated. The conference, however, was just the beginning, as it marked the start of an extensive process during which the leading educational institutions in Turkey and across the world were examined to find out how they work and identify the fundamentals that made them successful.</strong></p>\r\n<p class=\"description\" style=\"box-sizing: border-box; margin: 0px 0px 20px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 18px; line-height: 32px; font-family: Roboto, sans-serif; vertical-align: baseline; color: #313131; display: inline-block; width: 1140px; text-align: justify;\"><strong>In the end, instead of choosing one university as a template or replicating existing examples and institutions, a new and unique university was designed.&nbsp;</strong><strong>Since 1999, when students began enrolling, Sabancı University itself has set an example for many universities.</strong></p>', '2021-01-09 20:37:02', '2021-01-09 20:37:02'),
(32, 31, 'en', 'Medipol University', '<p style=\"box-sizing: border-box; margin: 0px 0px 22px; font-size: 16px; line-height: 1.88; font-family: Arsenal, sans-serif; color: #434648; text-align: justify;\"><strong>In the whole history of modern society the concept university was understood as the cradle of knowledge, aplace of wisdom, and a workshop of humanity.&nbsp;However, only the application of true wisdom on the acquired knowledge and decision patterns could secure the happiness and the future of people.Therefore, the goal of Istanbul Medipol University staff is to &ldquo;pave the path&rdquo; towards gaining wisdom for all its students.&nbsp;</strong></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 22px; font-size: 16px; line-height: 1.88; font-family: Arsenal, sans-serif; color: #434648; text-align: justify;\"><strong>To achieve this, IMU has adapted an innovative learning and teaching model and has created a real &ldquo;knowledgesociety&rdquo; of successful academicians. Each member of our faculty is committed to train their students according to the real world conditions and to help them acquire the information and skills they will needfor a bright career for a brighter future. Informational technologies are extensively used in the education process. Students&rsquo; facilitated access to the multimedia libraries, as well as their training in multiplex and computer classrooms with state-of-the-art equipment increase the quality of education and research.</strong></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 22px; font-size: 16px; line-height: 1.88; font-family: Arsenal, sans-serif; color: #434648; text-align: justify;\"><strong>One of the key tasks of the university is to increase the students&rsquo; mobility in developing the &ldquo;integrated&rdquo;educational model. Also, by establishing e-learning programs and providing education without barriers for all, IMU will have a significant influence in the development of the region. This approach is essential for a university that welcomes students from all over the world and respects diversity.</strong></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 22px; font-size: 16px; line-height: 1.88; font-family: Arsenal, sans-serif; color: #434648; text-align: justify;\"><strong>As we prepare our students for lives of leadership and service, we know that it will be them to determine the near and distant future.</strong></p>', '2021-01-09 20:40:20', '2021-01-09 20:40:20'),
(33, 32, 'en', 'Bahçeşehir University', '<p style=\"position: relative; box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 15px; line-height: 2.5; font-family: Gilroy; vertical-align: baseline; color: #737882; text-align: justify;\"><strong>The slogan &ldquo;At the heart of Istanbul&rdquo; is suitable for a university like Bahcesehir University (BAU)&hellip; With its main campus on the edge of the Bosphorus in Besiktas each day begins early with rapid mobility and continues throughout the day. Moreover, it is possible to encounter an event at almost every part of the university.</strong></p>\r\n<p style=\"position: relative; box-sizing: border-box; margin: 1em 0px 1rem; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 15px; line-height: 2.5; font-family: Gilroy; vertical-align: baseline; color: #737882; text-align: justify;\"><strong>The first thing that will strike your eye when you enter our university will be the large number of foreign students. From the United States to China, from France to South Korea from a wide geographical area extending over a thousand foreign students are studying at BAU. When asked why they prefer BAU we always receive the same answer: &ldquo;<span style=\"position: relative; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">The central location and international power</span>.&rdquo; BAU&rsquo;s location is apparent. In order to understand the international collaborations of our university, a short tour of our campus or website would be sufficient.</strong></p>\r\n<p style=\"position: relative; box-sizing: border-box; margin: 1em 0px 1rem; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 15px; line-height: 2.5; font-family: Gilroy; vertical-align: baseline; color: #737882; text-align: justify;\"><strong>&ldquo;<span style=\"position: relative; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">BAU GLOBAL</span>&rdquo; provides BAU students with a chance to receive education from very different points. BAU Global is able to achieve this through Berlin, Toronto, Washington DC, Batumi, Cyprus, Hanoi, Kyiv, Puebla, Brockwille. &ldquo;<span style=\"position: relative; box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;\">BAU Global</span>&rdquo; allows students to continue their education in all BAU Global Centers overseas and provides all support related to the programs.</strong></p>\r\n<p style=\"position: relative; box-sizing: border-box; margin: 1em 0px 1rem; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 15px; line-height: 2.5; font-family: Gilroy; vertical-align: baseline; color: #737882; text-align: justify;\"><strong>You have the opportunity to take a course in your department in Istanbul, Berlin or Washington DC. Also towards the end of each academic year you have the chance to apply for BAU&rsquo;s summer abroad programs. Moreover, BAU&rsquo;s summer abroad program is not only for our own students, but is open to students from all over the world!</strong></p>', '2021-01-09 20:46:10', '2021-01-09 20:46:10'),
(35, 34, 'en', 'University of South Florida', '<p><span style=\"color: #606a84; font-family: Montserrat; font-size: 16px;\">The University of South Florida (USF) is a large, public 4-year university offering undergraduate, graduate, specialist and doctoral level degrees. The University of South Florida System includes three, separately accredited institutions: USF; USF St. Petersburg; and USF Sarasota-Manatee. Serving more than 50,000 students, the USF System has an annual budget of $1.7 billion and is ranked 45th in the nation for research expenditures among all universities, public or private.</span></p>', '2021-02-10 06:26:15', '2021-02-10 06:26:15'),
(36, 35, 'en', 'ELTE University - Eötvös Loránd University', '<p><span style=\"color: #202122; font-family: sans-serif;\"><span style=\"font-size: 14px;\">E&ouml;tv&ouml;s Lor&aacute;nd University (Hungarian: E&ouml;tv&ouml;s Lor&aacute;nd Tudom&aacute;nyegyetem, ELTE) is a Hungarian public research university based in Budapest. Founded in 1635, ELTE is one of the largest and most prestigious[3] public higher education institutions in Hungary. The 28,000 students at ELTE are organized into eight faculties, and into research institutes located throughout Budapest and on the scenic banks of the Danube. ELTE is affiliated with 5 Nobel laureates, as well as winners of the Wolf Prize, Fulkerson Prize and Abel Prize, the latest of which was Abel Prize winner Endre Szemer&eacute;di in 2012.</span></span></p>', '2021-02-10 11:43:01', '2021-02-10 11:43:01'),
(37, 36, 'en', 'IBS International Business School Budapest', '<p>International Business School (Hungarian: IBS Nemzetk&ouml;zi &Uuml;zleti Főiskola) is an accredited private college in Budapest, Hungary. It was founded in 1991 by Prof. Istv&aacute;n Tam&aacute;s, a Hungarian businessman.</p>\r\n<p>IBS International Business School Budapest campus</p>\r\n<p>International Business School Budapest (Hungary) offers degree programmes in partnership with The University of Buckingham (UK) in Budapest and Vienna campuses. It was accredited in Hungary, UK, EU and USA. The graduates of this university receive diploma of the University of Buckingham.</p>', '2021-02-12 08:54:40', '2021-02-12 08:54:40'),
(38, 37, 'en', 'METU -Budapest Metropolitan University', '<p>Budapest Metropolitan University (Hungarian: Budapesti Metropolitan Egyetem) is an accredited private institute of higher education in Budapest, Hungary. It is formally known as the Budapest Metropolitan University or budapesti Metropolitan Egyetem.</p>', '2021-02-13 09:33:39', '2021-02-13 09:33:39'),
(39, 38, 'en', 'Corvinus University of Budapest', '<p>Corvinus University of Budapest (Hungarian: Budapesti Corvinus Egyetem) is a university in Budapest, Hungary. Corvinus University of Budapest is a research university oriented towards education. The university currently has an enrollment of approximately 14,500 students, offering educational programmes in business administration, economics, and social sciences.</p>\r\n<p>Corvinus University accepts students at six faculties and offer courses leading to degrees at the bachelor, master and doctoral level in specialisations taught in Hungarian, English, French or German.</p>', '2021-02-15 09:59:28', '2021-02-15 09:59:28'),
(40, 39, 'en', 'University of Debrecen', '<p>The University of Debrecen (Hungarian: Debreceni Egyetem) is a university located in Debrecen, Hungary. It is the oldest continuously operating institution of higher education in Hungary (since 1538). The university has a well established programme in the English language for international students, particularly in the Medical field, which first established education in English in 1986. There are nearly 6000 international students studying at the university. Until 2014 technical Academy Awards (Oscars) have been awarded to five former students.</p>', '2021-02-18 06:20:11', '2021-02-18 06:20:11');

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `institution_types`
--

CREATE TABLE `institution_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `institution_types`
--

INSERT INTO `institution_types` (`id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '2020-03-21 12:43:43', '2020-03-21 12:43:43', NULL),
(2, '2020-03-23 16:42:17', '2020-03-23 16:42:17', NULL),
(3, '2020-07-04 13:06:05', '2020-07-04 13:06:05', NULL);

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `institution_type_translations`
--

CREATE TABLE `institution_type_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `institution_type_id` bigint(20) UNSIGNED NOT NULL,
  `locale` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `institution_type_translations`
--

INSERT INTO `institution_type_translations` (`id`, `institution_type_id`, `locale`, `title`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'en', 'School', '<p>School</p>', '2020-03-21 12:43:43', '2020-03-21 12:43:43', NULL),
(2, 2, 'en', 'University', '<p>ss</p>', '2020-03-23 16:42:17', '2020-03-23 16:42:17', NULL),
(3, 3, 'en', 'College', '<p>college</p>', '2020-07-04 13:06:05', '2020-07-04 13:06:05', NULL);

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `labels`
--

CREATE TABLE `labels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `labels`
--

INSERT INTO `labels` (`id`, `color`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '#000000', '2020-03-21 12:44:36', '2020-03-21 12:44:36', NULL),
(2, '#6a464d', '2020-05-01 15:53:39', '2020-05-01 15:53:39', NULL);

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `label_translations`
--

CREATE TABLE `label_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `label_id` bigint(20) UNSIGNED NOT NULL,
  `locale` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `label_translations`
--

INSERT INTO `label_translations` (`id`, `label_id`, `locale`, `title`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'en', 'Test', '2020-03-21 12:44:36', '2020-03-21 12:44:36', NULL),
(2, 2, 'en', '100% discount', '2020-05-01 15:53:39', '2020-05-01 15:53:39', NULL);

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `languages`
--

INSERT INTO `languages` (`id`, `title`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'English', '2020-03-23 16:38:00', '2020-03-23 16:38:00', NULL),
(2, 'Turkish', '2020-04-08 10:59:40', '2020-12-31 18:08:21', NULL),
(3, 'Russian', '2020-04-08 11:01:27', '2020-04-08 11:34:10', '2020-04-08 11:34:10'),
(4, 'Russian', '2020-04-08 11:44:34', '2020-04-08 11:44:34', NULL),
(5, 'Azerbaijani', '2020-04-21 10:21:54', '2020-04-21 10:21:54', NULL);

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `locales`
--

CREATE TABLE `locales` (
  `locale` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `locales`
--

INSERT INTO `locales` (`locale`, `title`, `is_default`) VALUES
('az', 'Azerbaijani', 0),
('en', 'English', 0),
('ru', 'Russian', 1),
('tr', 'Turkish', 0);

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `mails`
--

CREATE TABLE `mails` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `mails`
--

INSERT INTO `mails` (`id`, `email`, `created_at`, `updated_at`) VALUES
(1, 'admin@admin.com', '2020-03-26 08:37:09', '2020-03-26 08:37:09'),
(2, 'elgunulu@gmail.com', '2020-06-28 12:07:54', '2020-06-28 12:07:54'),
(3, 'azat@celt.az', '2020-06-28 12:43:17', '2020-06-28 12:43:17'),
(4, 'test@mailinator.com', '2020-07-02 07:43:35', '2020-07-02 07:43:35'),
(5, 'celtabroad.com@domstat.su', '2020-08-23 10:03:21', '2020-08-23 10:03:21'),
(6, 'terdetalo2009@gmail.com', '2020-10-08 22:23:29', '2020-10-08 22:23:29'),
(7, 'beciterandqd@gmail.com', '2020-10-21 14:32:08', '2020-10-21 14:32:08'),
(8, 'victoriabaldwin148@gmail.com', '2020-11-04 14:25:01', '2020-11-04 14:25:01'),
(9, 'denisnorman3856@gmail.com', '2020-12-06 19:04:28', '2020-12-06 19:04:28');

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2020_01_24_034802_create_admins_table', 1),
(10, '2020_01_24_124230_create_countries_table', 1),
(11, '2020_01_25_050140_create_states_table', 1),
(12, '2020_01_25_104539_create_cities_table', 1),
(13, '2020_01_27_042829_create_currencies_table', 1),
(14, '2020_01_27_064001_create_languages_table', 1),
(15, '2020_01_28_104555_create_locales_table', 1),
(16, '2020_01_28_104658_create_country_translations_table', 1),
(17, '2020_01_29_095010_create_state_translations_table', 1),
(18, '2020_01_29_095338_create_city_translations_table', 1),
(19, '2020_01_30_051544_create_study_areas_table', 1),
(20, '2020_01_30_051600_create_study_area_translations_table', 1),
(21, '2020_01_30_070848_create_education_levels_table', 1),
(22, '2020_01_30_070911_create_education_level_translations_table', 1),
(23, '2020_01_30_083118_create_institution_types_table', 1),
(24, '2020_01_30_083132_create_institution_type_translations_table', 1),
(25, '2020_01_30_094211_create_study_types_table', 1),
(26, '2020_01_30_094228_create_study_type_translations_table', 1),
(27, '2020_01_30_103810_create_bonuses_table', 1),
(28, '2020_01_30_103840_create_bonus_translations_table', 1),
(29, '2020_02_04_055556_create_study_durations_table', 1),
(30, '2020_02_04_055608_create_tution_fees_table', 1),
(31, '2020_02_04_055610_create_study_duration_translations_table', 1),
(32, '2020_02_04_055623_create_tution_fee_translations_table', 1),
(33, '2020_02_04_110101_create_exams_table', 1),
(34, '2020_02_04_110126_create_exam_translations_table', 1),
(35, '2020_02_04_110621_create_labels_table', 1),
(36, '2020_02_04_110642_create_label_translations_table', 1),
(37, '2020_02_05_085735_create_grading_schemes_table', 1),
(38, '2020_02_05_085855_create_grading_scheme_data_table', 1),
(39, '2020_02_05_101656_create_grading_scheme_counrty_education_levels_table', 1),
(40, '2020_02_05_101831_create_grading_scheme_data_translations_table', 1),
(41, '2020_02_05_104720_create_prefilled_dates_table', 1),
(42, '2020_02_24_065956_create_university_representative_table', 1),
(43, '2020_02_28_101323_add_otp_field_to_users', 1),
(44, '2020_03_02_075307_create_tution_fees_periods_table', 1),
(45, '2020_03_02_075331_create_tution_fees_period_translations_table', 1),
(46, '2020_03_03_072207_create_user_education_details_table', 1),
(47, '2020_03_03_074851_create_user_schools_attendeds_table', 1),
(48, '2020_03_03_081641_create_user_test_scores_table', 1),
(49, '2020_03_03_100621_create_institutions_table', 1),
(50, '2020_03_03_100703_create_institution_images_table', 1),
(51, '2020_03_05_053221_create_institution_programs_table', 1),
(52, '2020_03_05_121701_create_institution_program_study_areas_table', 1),
(53, '2020_03_05_121724_create_institution_program_deadlines_table', 1),
(54, '2020_03_05_121942_create_institution_program_bonuses_table', 1),
(55, '2020_03_05_122308_create_institution_program_exam_requirements_table', 1),
(56, '2020_03_06_041714_create_institution_program_translations_table', 1),
(57, '2020_03_06_122410_add_study_start_date_to_user_education_details_table', 1),
(58, '2020_03_09_091446_add_at_edu_to_date_to_user_schools_attendeds_table', 1),
(59, '2020_03_09_101152_add_image_to_users_table', 1),
(60, '2020_03_11_042551_add_country_to_users_table', 1),
(61, '2020_03_16_122751_add_profile_progress_to_users_table', 1),
(62, '2020_03_17_091350_create_blog_categories_table', 1),
(63, '2020_03_17_091350_create_blog_category_translations_table', 1),
(64, '2020_03_17_091351_create_blogs_table', 1),
(65, '2020_03_17_091422_create_blog_translations_table', 1),
(66, '2020_03_18_050417_add_image_to_blogs_table', 1),
(67, '2020_03_18_072527_add_used_rate_field_in_currencies', 1),
(68, '2020_03_18_072816_add_field_in_institution_programs', 1),
(69, '2020_03_19_040242_create_faqs_table', 1),
(70, '2020_03_19_040255_create_faq_translations_table', 1),
(71, '2020_03_19_071428_add_is_feature_in_institutions', 1),
(72, '2020_03_19_071512_add_is_feature_in_institution_programs', 1),
(73, '2020_03_19_092222_add_image_to_countries_table', 1),
(74, '2020_03_19_092240_add_image_to_states_table', 1),
(75, '2020_03_19_092300_add_image_to_cities_table', 1),
(76, '2020_03_19_095203_create_institution_translations_table', 1),
(77, '2020_03_19_095254_remove_name_in_institutions_table', 1),
(78, '2020_03_23_051539_create_contact_us_table', 2),
(79, '2020_03_23_111221_create_mails_table', 2),
(80, '2020_03_23_112919_create_applications_table', 2),
(81, '2020_03_24_080843_add_field_in_applications_table', 2),
(82, '2020_03_24_185938_add_email_to_mails_table', 2),
(83, '2020_03_25_054818_add_amount_applications_table', 2),
(88, '2020_03_26_103720_create_student_favorite_programs_table', 3),
(89, '2020_03_26_103818_create_student_favorite_universities_table', 3),
(90, '2020_03_27_132424_add_field_in_university_representatives_table', 4),
(91, '2020_03_28_054053_change_phone_type_in_users_table', 4),
(92, '2020_03_28_093434_add_softdelete_in_university_represetatives', 5),
(93, '2020_03_30_123606_create_table_program_ratings_table', 6),
(94, '2020_04_04_060234_change_description_type_in_institution_program_translations_table', 7),
(95, '2020_04_04_074654_add_status_to_users_table', 7),
(96, '2020_04_10_094914_add_fields_in_faqs_table', 8),
(97, '2020_04_05_202047_add_nullable_state_id_to_cities', 9),
(98, '2020_04_14_110248_create_table_application_bonuses', 10),
(99, '2020_04_15_053208_add_nullable_state_id_to_institutions', 11),
(100, '2020_04_17_014328_add_state_id_and_city_id_to_institution_programs_table', 12),
(101, '2020_04_17_020014_add_currency_to_countries_table', 13),
(102, '2020_05_09_160603_add_start_month_and_last_month_in_institution_program_deadlines_table', 14),
(103, '2020_06_02_123654_create_institution_program_notify_tracks_table', 15),
(104, '2020_06_08_121913_change_last_name_in_users_table', 16),
(105, '2020_06_08_124555_change_password_in_users_table', 17),
(107, '2020_06_09_102901_add_year_and_season_column_in_user_education_details_table', 18),
(110, '2020_06_18_115025_add_social_id_in_users_table', 19),
(111, '2020_06_19_061918_change_email_nullable_in_users_table', 20),
(112, '2020_06_29_044329_remove_start_date_and_end_date_in_institution_program_deadlines_table', 21),
(113, '2020_07_01_130919_add_dest_country_id_in_user_education_details_table', 22),
(114, '2020_07_03_041723_add_gpa_per_in_user_education_details_table', 22),
(115, '2020_07_03_093023_add_is_residential_in_countries_table', 23),
(116, '2020_07_08_114148_change_study_area_id_in_user_education_details_table', 24),
(118, '2020_07_23_094529_add_degree_sequence_in_countries_table', 25),
(119, '2020_07_30_053903_create_foundation_routes_table', 26),
(120, '2020_07_30_193033_add_is_foundation_in_education_levels_table', 27),
(121, '2020_07_30_201821_add_foundation_degrees_in_foundation_routes_table', 28),
(122, '2020_08_06_061055_create_exam_sub_sections_table', 29),
(123, '2020_08_06_063138_create_exam_sub_section_translations_table', 29),
(124, '2020_08_07_041000_create_user_test_score_details_table', 30),
(125, '2020_08_07_064930_create_institution_program_exam_requirement_details_table', 31),
(126, '2020_08_07_090001_change_type_in_exams_table', 32),
(128, '2020_08_10_065430_create_country_wise_education_table', 33),
(130, '2020_08_12_063031_add_is_guest_in_users_table', 34),
(131, '2020_09_03_122217_add_sholorship_column_institution_programs', 35),
(132, '2020_09_12_101608_add_application_fee_in_institution_programs', 36),
(133, '2020_09_14_042727_add_language_in_users', 37),
(134, '2020_09_17_065700_create_user_documents_table', 38),
(135, '2020_12_10_121226_create_application_messages_table', 39),
(136, '2020_12_15_123231_add_country_id_in_faq', 40);

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('hazriulu@celt.az', '$2y$10$O3t0XBSri7OKgmAcJfENO.orLHASyHp8cMovcp9Id435uH0WIW.zu', '2020-07-09 12:53:23'),
('elgun@celt.az', '$2y$10$5fMUjhb7TZ5hX9oZ/AIYZOqolurCoc6G54j1tAd6afdCPOTsavXvG', '2020-07-12 15:25:04');

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `prefilled_dates`
--

CREATE TABLE `prefilled_dates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` int(11) NOT NULL COMMENT '1-start period 2-end period',
  `period` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `prefilled_dates`
--

INSERT INTO `prefilled_dates` (`id`, `type`, `period`, `created_at`, `updated_at`) VALUES
(1, 1, '07', '2020-03-23 16:41:50', '2020-07-12 17:08:56'),
(2, 2, '09-11', '2020-03-23 16:41:58', '2020-07-12 17:08:40');

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `program_ratings`
--

CREATE TABLE `program_ratings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `review` text COLLATE utf8mb4_unicode_ci,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `institution_program_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `states`
--

CREATE TABLE `states` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `states`
--

INSERT INTO `states` (`id`, `image`, `country_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(11, 'jOJn7apxleCVKba5h33RZS2s5erwAsH7ih7pxt0j.jpeg', 1, '2020-07-06 10:16:16', '2020-07-06 10:16:16', NULL),
(12, 'j3K0aqAnhTWP18TRHzxLhoUtXAHoBNht6DNAEcnG.jpeg', 1, '2020-07-12 16:35:43', '2020-07-12 16:35:43', NULL),
(13, 'TkSTq1YFqdOCwmQHXfqoZiRPhBQjyCEF40Der7vz.jpeg', 4, '2020-07-26 12:13:05', '2020-07-26 12:13:05', NULL),
(14, 'ozi74R5LfZmkxyV6exbwED7vM4q8XK5s0qQolc1V.jpeg', 4, '2020-07-26 12:14:19', '2020-07-26 12:14:19', NULL),
(15, 'nDnYUGRqMAcCmxubynZcpY8BRS4HUEWNGBL2jZC9.jpeg', 4, '2020-07-26 12:15:53', '2020-07-26 12:15:53', NULL),
(16, 'WSiUGHzzQrHXEyi8rluuuPiMEOOr2qWQx0yQQNDK.jpeg', 5, '2020-08-23 21:03:33', '2020-08-23 21:03:33', NULL),
(17, 'QDCT7JfT22ePWqCovIYuuINvdrseIqNG6j45DnSe.jpeg', 2, '2020-12-23 16:17:39', '2020-12-30 17:51:03', '2020-12-30 17:51:03'),
(18, '1612955602_YYpJDOiQIkTEdV36M9IPVQwoKpkrVUUHAl1mrrVR.webp', 5, '2021-02-10 11:13:22', '2021-02-10 11:13:22', NULL),
(19, '1612955677_WVh8ZZEaGgTuA95ELdELRDXUxEdGUsZOSSzmAJWg.webp', 5, '2021-02-10 11:14:38', '2021-02-10 11:14:38', NULL);

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `state_translations`
--

CREATE TABLE `state_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `state_id` bigint(20) UNSIGNED NOT NULL,
  `locale` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `state_translations`
--

INSERT INTO `state_translations` (`id`, `state_id`, `locale`, `title`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(27, 11, 'az', 'Maryland', '<p>Maryland</p>', '2020-07-06 10:16:16', '2020-07-06 10:16:16', NULL),
(28, 11, 'en', 'Maryland', '<p>Maryland</p>', '2020-07-06 10:16:16', '2020-07-06 10:16:16', NULL),
(29, 12, 'en', 'Florida', '<p>florida</p>', '2020-07-12 16:35:43', '2020-07-12 16:35:43', NULL),
(30, 13, 'en', 'England', '<p>England</p>', '2020-07-26 12:13:05', '2020-07-26 12:13:05', NULL),
(31, 14, 'en', 'Wales', '<p>Wales</p>', '2020-07-26 12:14:19', '2020-07-26 12:14:19', NULL),
(32, 15, 'en', 'Scotland', '<p>Scotland</p>', '2020-07-26 12:15:53', '2020-07-26 12:15:53', NULL),
(33, 16, 'en', 'Berlin', '<p>Berlin</p>', '2020-08-23 21:03:33', '2020-08-23 21:03:33', NULL),
(34, 17, 'en', 'Istanbul', '<p>Istanbul</p>', '2020-12-23 16:17:39', '2020-12-30 17:51:03', '2020-12-30 17:51:03'),
(35, 18, 'en', 'Bavaria', '<p>bavaria</p>', '2021-02-10 11:13:22', '2021-02-10 11:13:22', NULL),
(36, 19, 'en', 'Bremen', '<p>Bremen</p>', '2021-02-10 11:14:38', '2021-02-10 11:14:38', NULL);

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `student_favorite_programs`
--

CREATE TABLE `student_favorite_programs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `program_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `student_favorite_universities`
--

CREATE TABLE `student_favorite_universities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `institution_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `study_areas`
--

CREATE TABLE `study_areas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `study_areas`
--

INSERT INTO `study_areas` (`id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '2020-03-21 12:41:38', '2020-03-21 12:41:38', NULL),
(2, '2020-05-01 15:49:55', '2020-05-01 15:49:55', NULL),
(3, '2020-05-01 15:50:10', '2020-05-01 15:50:10', NULL),
(4, '2020-07-04 12:55:30', '2020-07-04 12:55:30', NULL),
(5, '2020-07-04 12:56:23', '2020-07-04 12:56:23', NULL),
(6, '2020-07-04 12:56:42', '2020-07-04 12:56:42', NULL),
(7, '2020-07-04 12:56:56', '2020-07-04 12:56:56', NULL),
(8, '2020-07-04 12:57:29', '2020-07-04 12:57:29', NULL),
(9, '2020-07-04 12:57:47', '2020-07-04 12:57:47', NULL),
(10, '2020-07-04 12:58:01', '2020-07-04 12:58:01', NULL);

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `study_area_translations`
--

CREATE TABLE `study_area_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `study_area_id` bigint(20) UNSIGNED NOT NULL,
  `locale` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `study_area_translations`
--

INSERT INTO `study_area_translations` (`id`, `study_area_id`, `locale`, `title`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'en', 'Humanities', '<h1 style=\"margin: 0px 0px 0.25rem; padding: 0px; border: 0px; vertical-align: baseline; line-height: 3rem; color: #313233; font-weight: 400; font-size: 1.8rem; text-align: center; position: relative; font-family: \'open sans\', Helvetica, Arial, sans-serif;\">Humanities</h1>', '2020-03-21 12:41:38', '2020-07-04 12:56:06', NULL),
(2, 1, 'ru', 'MBA', '<pre id=\"tw-target-text\" class=\"tw-data-text tw-text-large tw-ta\" dir=\"ltr\" style=\"unicode-bidi: isolate; font-size: 28px; line-height: 36px; background-color: #f8f9fa; border: none; padding: 2px 0.14em 2px 0px; position: relative; margin-top: -2px; margin-bottom: -2px; resize: none; font-family: inherit; overflow: hidden; width: 277px; white-space: pre-wrap; overflow-wrap: break-word; color: #222222;\" data-placeholder=\"Translation\"><span lang=\"tr\">MBA</span></pre>', '2020-04-09 12:34:55', '2020-04-09 12:34:55', NULL),
(3, 1, 'tr', 'MBA', '<pre id=\"tw-target-text\" class=\"tw-data-text tw-text-large tw-ta\" dir=\"ltr\" style=\"unicode-bidi: isolate; font-size: 28px; line-height: 36px; background-color: #f8f9fa; border: none; padding: 2px 0.14em 2px 0px; position: relative; margin-top: -2px; margin-bottom: -2px; resize: none; font-family: inherit; overflow: hidden; width: 277px; white-space: pre-wrap; overflow-wrap: break-word; color: #222222;\" data-placeholder=\"Translation\"><span lang=\"tr\">MBA</span></pre>', '2020-04-09 12:34:55', '2020-04-09 12:34:55', NULL),
(4, 2, 'en', 'Business Management & Economics', '<p>s</p>', '2020-05-01 15:49:55', '2021-02-10 08:12:52', NULL),
(5, 3, 'en', 'Medicine & Health', '<h1 style=\"margin: 0px 0px 0.25rem; padding: 0px; border: 0px; vertical-align: baseline; line-height: 3rem; color: #313233; font-weight: 400; font-size: 1.8rem; text-align: center; position: relative; font-family: \'open sans\', Helvetica, Arial, sans-serif;\">Medicine &amp; Health</h1>', '2020-05-01 15:50:10', '2020-07-04 12:57:14', NULL),
(6, 4, 'en', 'Computer Science & IT', '<h1 style=\"margin: 0px 0px 0.25rem; padding: 0px; border: 0px; vertical-align: baseline; line-height: 3rem; color: #313233; font-weight: 400; font-size: 1.8rem; text-align: center; position: relative; font-family: \'open sans\', Helvetica, Arial, sans-serif;\">Computer Science &amp; IT</h1>', '2020-07-04 12:55:30', '2020-07-04 12:55:30', NULL),
(7, 5, 'en', 'Hospitality, Leisure & Sports', '<h1 style=\"margin: 0px 0px 0.25rem; padding: 0px; border: 0px; vertical-align: baseline; line-height: 3rem; color: #313233; font-weight: 400; font-size: 1.8rem; text-align: center; position: relative; font-family: \'open sans\', Helvetica, Arial, sans-serif;\">Hospitality, Leisure &amp; Sports</h1>', '2020-07-04 12:56:24', '2020-07-04 12:56:24', NULL),
(8, 6, 'en', 'Social and General Sciences', '<h1 style=\"margin: 0px 0px 0.25rem; padding: 0px; border: 0px; vertical-align: baseline; line-height: 3rem; color: #313233; font-weight: 400; font-size: 1.8rem; text-align: center; position: relative; font-family: \'open sans\', Helvetica, Arial, sans-serif;\">Social Sciences</h1>', '2020-07-04 12:56:43', '2021-02-10 08:11:39', NULL),
(9, 7, 'en', 'Law', '<h1 style=\"margin: 0px 0px 0.25rem; padding: 0px; border: 0px; vertical-align: baseline; line-height: 3rem; color: #313233; font-weight: 400; font-size: 1.8rem; text-align: center; position: relative; font-family: \'open sans\', Helvetica, Arial, sans-serif;\">Law</h1>', '2020-07-04 12:56:56', '2020-07-04 12:56:56', NULL),
(10, 8, 'en', 'Engineering & Technology', '<h1 style=\"margin: 0px 0px 0.25rem; padding: 0px; border: 0px; vertical-align: baseline; line-height: 3rem; color: #313233; font-weight: 400; font-size: 1.8rem; text-align: center; position: relative; font-family: \'open sans\', Helvetica, Arial, sans-serif;\">Engineering &amp; Technology</h1>', '2020-07-04 12:57:29', '2020-07-04 12:57:29', NULL),
(11, 9, 'en', 'Education & Training', '<h1 style=\"margin: 0px 0px 0.25rem; padding: 0px; border: 0px; vertical-align: baseline; line-height: 3rem; color: #313233; font-weight: 400; font-size: 1.8rem; text-align: center; position: relative; font-family: \'open sans\', Helvetica, Arial, sans-serif;\">Education &amp; Training</h1>', '2020-07-04 12:57:47', '2020-07-04 12:57:47', NULL),
(12, 10, 'en', 'Arts, Design & Architecture', '<h1 style=\"margin: 0px 0px 0.25rem; padding: 0px; border: 0px; vertical-align: baseline; line-height: 3rem; color: #313233; font-weight: 400; font-size: 1.8rem; text-align: center; position: relative; font-family: \'open sans\', Helvetica, Arial, sans-serif;\">Arts, Design &amp; Architecture</h1>', '2020-07-04 12:58:01', '2020-07-04 12:58:01', NULL);

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `study_durations`
--

CREATE TABLE `study_durations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `study_durations`
--

INSERT INTO `study_durations` (`id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '2020-03-21 12:44:08', '2020-03-21 12:44:08', NULL),
(2, '2020-03-23 16:43:38', '2020-03-23 16:43:38', NULL),
(3, '2020-04-08 12:10:35', '2020-04-08 12:10:35', NULL),
(4, '2020-08-23 16:18:38', '2020-08-23 16:18:38', NULL),
(5, '2020-12-31 18:21:52', '2020-12-31 18:21:52', NULL),
(6, '2020-12-31 18:22:19', '2020-12-31 18:22:19', NULL),
(7, '2021-02-10 13:39:42', '2021-02-10 13:39:42', NULL);

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `study_duration_translations`
--

CREATE TABLE `study_duration_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `study_duration_id` bigint(20) UNSIGNED NOT NULL,
  `locale` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `study_duration_translations`
--

INSERT INTO `study_duration_translations` (`id`, `study_duration_id`, `locale`, `title`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'en', '2 years', '2020-03-21 12:44:08', '2021-02-10 13:40:12', NULL),
(2, 2, 'en', '4 years', '2020-03-23 16:43:38', '2021-02-10 13:40:20', NULL),
(3, 3, 'en', '1 year', '2020-04-08 12:10:35', '2021-02-10 13:40:31', NULL),
(4, 4, 'en', '3 years', '2020-08-23 16:18:38', '2021-02-10 13:40:43', NULL),
(5, 5, 'en', '5 years', '2020-12-31 18:21:52', '2021-02-10 13:40:53', NULL),
(6, 6, 'en', '6 years', '2020-12-31 18:22:19', '2021-02-10 13:39:54', NULL),
(7, 7, 'en', '3.5 years', '2021-02-10 13:39:42', '2021-02-10 13:39:42', NULL);

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `study_types`
--

CREATE TABLE `study_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `study_types`
--

INSERT INTO `study_types` (`id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '2020-03-21 12:43:28', '2020-03-21 12:43:28', NULL),
(2, '2020-04-08 12:11:11', '2020-04-08 12:11:11', NULL),
(3, '2020-08-08 16:08:34', '2020-08-08 16:08:34', NULL);

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `study_type_translations`
--

CREATE TABLE `study_type_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `study_type_id` bigint(20) UNSIGNED NOT NULL,
  `locale` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `study_type_translations`
--

INSERT INTO `study_type_translations` (`id`, `study_type_id`, `locale`, `title`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'en', 'Full Time', '2020-03-21 12:43:28', '2020-03-21 12:43:28', NULL),
(2, 2, 'en', 'Part Time', '2020-04-08 12:11:12', '2020-04-08 12:11:12', NULL),
(3, 3, 'en', 'Online', '2020-08-08 16:08:34', '2020-08-08 16:08:34', NULL);

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `tution_fees`
--

CREATE TABLE `tution_fees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `tution_fees`
--

INSERT INTO `tution_fees` (`id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '2020-03-23 16:43:55', '2020-03-23 16:43:55', NULL),
(2, '2020-04-08 12:10:03', '2020-04-08 12:10:03', NULL),
(3, '2020-12-31 18:23:03', '2020-12-31 18:23:03', NULL);

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `tution_fees_periods`
--

CREATE TABLE `tution_fees_periods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `tution_fees_periods`
--

INSERT INTO `tution_fees_periods` (`id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '2020-03-21 12:44:24', '2020-03-21 12:44:24', NULL),
(2, '2020-06-28 13:04:14', '2020-06-28 13:04:14', NULL),
(3, '2020-06-28 13:04:35', '2020-06-28 13:04:35', NULL);

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `tution_fees_period_translations`
--

CREATE TABLE `tution_fees_period_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tution_fees_period_id` bigint(20) UNSIGNED NOT NULL,
  `locale` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `tution_fees_period_translations`
--

INSERT INTO `tution_fees_period_translations` (`id`, `tution_fees_period_id`, `locale`, `title`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'en', 'Monthly', '2020-03-21 12:44:24', '2020-03-21 12:44:24', NULL),
(2, 2, 'en', 'Yearly', '2020-06-28 13:04:14', '2020-08-23 16:19:27', NULL),
(3, 3, 'en', 'Weekly', '2020-06-28 13:04:35', '2020-08-23 16:19:37', NULL);

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `tution_fee_translations`
--

CREATE TABLE `tution_fee_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tution_fee_id` bigint(20) UNSIGNED NOT NULL,
  `locale` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `tution_fee_translations`
--

INSERT INTO `tution_fee_translations` (`id`, `tution_fee_id`, `locale`, `title`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'en', 'Yearly', '2020-03-23 16:43:55', '2020-12-31 18:22:46', NULL),
(2, 2, 'en', 'Monthly', '2020-04-08 12:10:05', '2020-04-08 12:10:05', NULL),
(3, 3, 'en', 'Semester', '2020-12-31 18:23:03', '2020-12-31 18:23:03', NULL);

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `university_representatives`
--

CREATE TABLE `university_representatives` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipcode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` bigint(20) UNSIGNED DEFAULT NULL,
  `state_id` bigint(20) UNSIGNED DEFAULT NULL,
  `city_id` bigint(20) UNSIGNED DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `university_representatives`
--

INSERT INTO `university_representatives` (`id`, `name`, `email`, `email_verified_at`, `password`, `image`, `first_name`, `last_name`, `phone`, `title`, `address`, `zipcode`, `country_id`, `state_id`, `city_id`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(7, 'Elgun Karim', 'karimov.e@celt.az', NULL, '$2y$10$elHPzMcwV2y.JajfHN4nc.o0lhLuyv1EEuu5cux2rN3O2QMC5o6kq', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'qeENPf38TWVLm2964AmLcIpnAOhzwrxvRA7Do09SwCTrYgS3detefgbDGkzf', '2020-07-04 12:44:59', '2020-12-31 18:23:46', '2020-12-31 18:23:46'),
(8, 'test', 'test.uni@mailinator.com', NULL, '$2y$10$Y84WbSeNPYkEEDMBXEWoKuR0XlPM13Vndd7BUoc7gFEa/PwU2.1.e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'M8VxTNxQiVfnDucwjbvOFIVM7tIVsheXfrxpnU0BlQga3zx89mRuI7pEAYnH', '2020-07-06 10:18:14', '2020-12-31 18:23:32', '2020-12-31 18:23:32'),
(9, 'Elgun UniREP', 'elgunulu@gmail.com', NULL, '$2y$10$xyrLOi5m.Uc9pEsigbrymOtbhdS7fBRBIpRD.48MYfydiXN5Ai3Bm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-06 16:17:43', '2020-12-31 18:23:51', '2020-12-31 18:23:51'),
(10, 'Farid Karimov', 'farid@celt.az', NULL, '$2y$10$uSWh3K1lzhSHz0.z2jfHTe0.pbJd8kSUTtw.2jtUZpD10XuY8hiPu', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-23 16:09:42', '2020-12-23 16:09:42', NULL),
(11, 'Elgun Karimov', 'karimov.mb@gmail.com', NULL, '$2y$10$kHpnKTsSXfVik1dlm6Kbjux5st7rkgR1s..iguC11lqmxR3rPAz4m', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-31 18:25:12', '2020-12-31 18:25:12', NULL);

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_lang` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `social_type` enum('facebook','google') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci,
  `country` bigint(20) UNSIGNED DEFAULT NULL,
  `state` bigint(20) UNSIGNED DEFAULT NULL,
  `city` bigint(20) UNSIGNED DEFAULT NULL,
  `zipcode` int(11) DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_progress` int(11) DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=active, 0=in-active',
  `is_guest` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `email`, `default_lang`, `social_type`, `social_id`, `email_verified_at`, `address`, `country`, `state`, `city`, `zipcode`, `image`, `profile_progress`, `password`, `otp`, `status`, `is_guest`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(53, 'Altay', 'English', NULL, 'altayenglish@gmail.com', 'en', 'google', '104459609041029999765', '2020-07-06 04:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2020-07-06 17:45:43', '2020-07-12 15:21:46', '2020-07-12 15:21:46'),
(54, 'Hazri', NULL, NULL, 'hazriulu@celt.az', 'en', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2020-07-08 13:28:40', '2020-07-12 15:21:49', '2020-07-12 15:21:49'),
(55, 'Hazri', NULL, NULL, 'hazir@celt.az', 'en', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2020-07-08 13:30:24', '2020-07-12 15:21:59', '2020-07-12 15:21:59'),
(56, 'Altay', 'ULU', '0505035939', 'altay@celt.az', 'en', NULL, NULL, '2020-07-08 04:00:00', 'Molla gürani', 2, NULL, 16, 34742, NULL, 100, '$2y$10$NlvWFnyCgIcX2pMInd7YHuQw0Up.IL.0AvGN7uAygioC9guRjJE7e', 9031, 1, 0, NULL, '2020-07-08 13:32:42', '2020-07-12 15:22:07', '2020-07-12 15:22:07'),
(57, 'Elgun', 'Karimov', '5444564', 'karimov.e@celt.az', 'en', 'google', '117250184887236817281', '2020-07-09 04:00:00', '45343', 2, NULL, 16, 343434, NULL, 100, '$2y$10$qbmRRBPjtlrmgyFIy5sq/enbOnYLPfTdXh2zHbCcMAFXQn4WHXHAi', 6508, 1, 0, 'AoYUd4hktstJIPRsOH17kJRxgHWTSB8nX5y71udBsLaTlz2gfxcAJvtRoH4D', '2020-07-09 12:54:09', '2020-12-31 18:01:33', '2020-12-31 18:01:33'),
(58, 'Aakash', 'Gandhi', '9879879876', 'test@mailinator.com', 'en', NULL, NULL, '2020-07-09 04:00:00', '', 2, NULL, 21, 999888, NULL, 100, '$2y$10$1tycMi6.AwskS.4TUSXAweiRsYmfrAEU8l.MCJ2uFQpyK5e3VRewi', 9152, 1, 0, NULL, '2020-07-09 16:04:37', '2020-12-31 18:01:37', NULL),
(59, 'elgun', 'Karimi', '23432323', 'elgun@celt.az', 'en', NULL, NULL, '2020-07-12 04:00:00', 'baku baku baku', 3, NULL, 17, 343333, 'o0C6RP8imVawJF56H8lSQL1Wj75925D6NLZpKHWU.jpeg', 100, '$2y$10$UetLZ6ID8xOr5KrIyJj1zO/RLoRogvdLWtt/eiCeOTZHZvpufd0mO', 5174, 1, 0, NULL, '2020-07-12 15:01:01', '2020-08-23 16:11:06', '2020-08-23 16:11:06'),
(60, 'Altay', 'Ulu', '34545435', 'altaymm@celt.az', 'en', NULL, NULL, '2020-07-12 04:00:00', 'wwwwwwwwwwwwwwwww', 3, NULL, 17, 34444, 'wYmAtO1FVZZy3Qf75vVt3p54QAuNiX60oj9H20uo.jpeg', 100, '$2y$10$nkCCRAiscEBMSm/vm/YHpecVowKSLb7r53F2Jr7thCx78TXH.XMpS', 7788, 1, 0, NULL, '2020-07-12 15:26:13', '2020-08-23 16:11:44', '2020-08-23 16:11:44'),
(61, 'Yoon', 'Yura', NULL, NULL, 'en', 'facebook', '10150085662281841', '2020-07-13 04:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2020-07-13 08:37:32', '2020-08-23 16:10:46', '2020-08-23 16:10:46'),
(62, 'Samire', 'Balalı', '232322323', 'samire@celt.az', 'en', NULL, NULL, '2020-07-17 04:00:00', '23232323232323', 3, NULL, 17, 1014, NULL, 100, '$2y$10$7iLx7DdKRmxsrr8dnSh9Bew3Y1bhH9bdWXU7jEbpfUthlhLrf96Fm', 5727, 1, 0, NULL, '2020-07-17 12:35:48', '2020-08-23 16:10:53', '2020-08-23 16:10:53'),
(63, 'CELT', 'English', NULL, 'celtenglish@celt.az', 'en', 'google', '105655969841519684500', '2020-07-17 04:00:00', NULL, NULL, NULL, NULL, NULL, NULL, 75, NULL, NULL, 1, 0, NULL, '2020-07-17 14:07:50', '2020-08-23 16:11:13', '2020-08-23 16:11:13'),
(64, 'Hazri', 'Ulu', '3423212132', 'hazri@celt.az', 'en', NULL, NULL, '2020-07-26 04:00:00', '232112312312312312', 3, NULL, NULL, 347432, NULL, 100, '$2y$10$IRaTFwViYNvUQCN74C4AguBgp2hDCAs8ioBAJ./VK/E3N2JUSkatO', 1274, 1, 0, NULL, '2020-07-26 11:55:18', '2020-12-31 18:01:41', '2020-12-31 18:01:41'),
(65, 'hazri', 'xsdf', '2343434', 'hazal@celt.az', 'en', NULL, NULL, '2020-08-01 04:00:00', '33432423', 3, NULL, 17, 345566, NULL, 100, '$2y$10$F5YWlQm.cjcw1Zdg2.QXfubQFxxlS14Dc4mReDDF4vNiu0voYh/aG', 8116, 1, 0, NULL, '2020-08-01 11:15:47', '2020-08-23 16:11:21', '2020-08-23 16:11:21'),
(66, 'Elgun Karimi', NULL, NULL, 'elgunkk@celt.az', 'en', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2020-08-10 18:26:34', '2020-08-23 16:11:25', '2020-08-23 16:11:25'),
(67, 'test2', 'test3', '8887776665', 'test2@mailinator.com', 'en', NULL, NULL, NULL, 'test 2 address', 2, NULL, 21, 395004, NULL, 100, '$2y$10$reAO3IHISEf6XJUX7uodb.fQbuq7dOmW/MyQ55X3G1qYnF3qGONfO', 8681, 1, 1, NULL, '2020-08-12 09:48:17', '2020-08-23 16:11:30', '2020-08-23 16:11:30'),
(68, 'Elgun', 'Karimov', '3434343434', 'samir@celt.az', 'en', NULL, NULL, NULL, 'Molla Gürani Mah. Tomrukçu 51, Nevin apt, 3\r\nFatih', 2, NULL, 21, 34093, NULL, 100, NULL, 7080, 1, 1, NULL, '2020-08-12 20:17:39', '2020-08-23 16:11:37', '2020-08-23 16:11:37'),
(69, 'aakash', 'gandhi', '2232353434', 'aakash.g@cearsirerernfotech.com', 'en', NULL, NULL, '2020-08-14 04:00:00', 'test', 3, NULL, NULL, 215454, NULL, 100, '$2y$10$83MGkVrEbAUpANrCWO0/z.ivNbO03LgzQ1Kygli.us4rdhsyNu2Qa', 9971, 1, 0, NULL, '2020-08-14 09:16:13', '2020-12-31 18:01:44', '2020-12-31 18:01:44'),
(70, 'Farid', 'rerrr', '4434343', 'farid@celt.az', 'en', NULL, NULL, '2020-08-27 05:00:00', 'Molla Gürani Mah. Tomrukçu 51, Nevin apt, 3\r\nFatih', 2, NULL, 21, 34093, NULL, 100, '$2y$10$gLBvoDlMIoJw7wzCmIPtceCtKfBx3Wh7p7LCNrTHnCH0bMm4ll6Jm', 5671, 1, 0, NULL, '2020-08-27 21:22:07', '2020-12-31 18:01:49', '2020-12-31 18:01:49'),
(71, 'Azat', NULL, NULL, 'azat@celt.az', 'en', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 75, NULL, NULL, 1, 0, NULL, '2020-09-16 06:49:05', '2020-12-31 18:01:52', '2020-12-31 18:01:52'),
(72, 'Elgun', NULL, NULL, 'sama@celt.az', 'en', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, '2020-09-16 07:03:45', '2020-12-31 18:01:56', '2020-12-31 18:01:56'),
(73, 'ddd', 'rrr', '060500555', 'ddd@celt.az', 'en', NULL, NULL, NULL, 'dfdff', 3, NULL, NULL, 1014, NULL, 100, NULL, 5237, 1, 0, NULL, '2020-09-16 09:11:31', '2020-12-31 18:02:00', '2020-12-31 18:02:00'),
(74, 'aakash gandhi', NULL, NULL, 'paakasdhg@gmail.com', 'en', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100, NULL, 4663, 1, 0, NULL, '2020-09-16 12:05:22', '2020-12-31 18:02:03', '2020-12-31 18:02:03'),
(75, 'aakash gandhi', NULL, NULL, 'paakashg@gmail.com', 'en', NULL, NULL, '2020-09-16 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, 100, '$2y$10$9P.NHr.j1xhRz68YyOMl4OLZ2yISI.lG.KEL1v0xBtoSNAH8lZDQ6', 4641, 1, 0, NULL, '2020-09-16 12:10:17', '2020-12-31 18:02:06', '2020-12-31 18:02:06'),
(76, 'Samira', NULL, NULL, 'samira@celt.az', 'en', NULL, NULL, '2020-09-16 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, 100, '$2y$10$oJ2OQF3GqzIBcREJxhym4u9hrA7nW.ocXsK6aK11zodo4IszCGVma', 2438, 1, 0, NULL, '2020-09-16 12:14:18', '2020-12-31 18:02:09', '2020-12-31 18:02:09'),
(77, 'aakash gandhi', NULL, NULL, 'aakash.g@cearsinfotech.com', 'en', NULL, NULL, '2020-09-26 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, 100, '$2y$10$oLFveQ4RoJbGZWm2doICKucuq5jHaafPVas82JtNc7bUt1HyBLF9G', 2499, 1, 0, NULL, '2020-09-26 04:46:28', '2020-12-31 18:02:14', '2020-12-31 18:02:14'),
(78, 'Babasg', NULL, NULL, 'babaa@celt.az', 'en', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100, NULL, 6262, 1, 1, NULL, '2020-09-26 13:10:00', '2020-12-31 18:02:17', '2020-12-31 18:02:17'),
(79, 'Layak', NULL, NULL, 'lakya@celt.az', 'en', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100, NULL, 1177, 1, 1, NULL, '2020-09-26 13:14:36', '2020-12-31 18:02:19', '2020-12-31 18:02:19'),
(80, 'OWw', NULL, NULL, 'gari@celt.az', 'en', NULL, NULL, '2020-09-26 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, 100, '$2y$10$mWfmjg8P8f/79XxuUXeGdeqwXDd9zJuyiA85nRGysutj81MWxMWDq', 7843, 1, 0, NULL, '2020-09-26 13:18:58', '2020-12-31 18:02:22', '2020-12-31 18:02:22'),
(81, 'VbESPuCY', NULL, NULL, 'terdetalo2009@gmail.com', 'en', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, '2020-10-08 22:23:26', '2020-12-31 18:02:24', '2020-12-31 18:02:24'),
(82, 'HxLiWNFafqpoER', NULL, NULL, 'beciterandqd@gmail.com', 'en', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, '2020-10-21 14:32:07', '2020-12-31 18:02:27', '2020-12-31 18:02:27'),
(83, 'Azat', NULL, NULL, 'karima@celt.az', 'en', NULL, NULL, '2020-11-04 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, 100, '$2y$10$ud7H881OwTEBEEDvensP9O.rVNYC5Pe7Q361nm6S4semodBbH8dLi', 5090, 1, 0, NULL, '2020-11-04 11:01:44', '2020-12-31 18:02:30', '2020-12-31 18:02:30'),
(84, 'tWwNPpiSoUsjfnxl', NULL, NULL, 'victoriabaldwin148@gmail.com', 'en', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, '2020-11-04 14:24:58', '2020-12-31 18:02:33', '2020-12-31 18:02:33'),
(85, 'aakash', NULL, NULL, 'aakash.g@ceearsinfotech.com', 'en', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, '2020-11-25 12:17:10', '2020-12-31 18:02:35', '2020-12-31 18:02:35'),
(86, 'Anar Gubanzada', NULL, NULL, 'anarm@celt.az', 'en', NULL, NULL, '2020-11-26 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, 100, '$2y$10$qSPxvtQluekrxNm6IWmpk.wW5EA.iv1noXffeO/1cXOW5A7w2YHNu', 8080, 1, 0, '5u0XjPzgEwrhnZQqnNSUvpinuk2eWdKclwdQhDjsEtYEdJQgg3ZZ7IftnM3e', '2020-11-26 10:20:30', '2020-12-31 18:02:38', '2020-12-31 18:02:38'),
(87, 'QTJMDeKRsqgIWCzE', NULL, NULL, 'denisnorman3856@gmail.com', 'en', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, '2020-12-06 19:04:25', '2020-12-31 18:02:41', '2020-12-31 18:02:41'),
(88, 'Farid Karimov', NULL, NULL, 'farid.karimov@gmail.com', 'en', NULL, NULL, '2020-12-23 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, 100, '$2y$10$.kfIdKM9gqK0sf3W/pNQZOvJc4.vux9OgwZMuxoQ05c3uTMV2yFme', 1398, 1, 0, NULL, '2020-12-23 16:28:43', '2020-12-31 18:02:45', '2020-12-31 18:02:45'),
(89, 'vishal vasoya', NULL, NULL, 'vasoya@cearsinfotech.com', 'en', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 100, NULL, 8909, 1, 0, NULL, '2020-12-28 09:04:56', '2020-12-31 18:02:49', '2020-12-31 18:02:49'),
(90, 'Elgun', 'Karimov', '0809090', 'asim@celt.az', 'en', NULL, NULL, '2021-01-04 00:00:00', '14 Khojaly ave\r\nOffice 22', 3, NULL, NULL, 1025, NULL, 100, '$2y$10$kWu57ySZhHnDhKjLRTlBGO0mauLgf2AEbIPyqwdaJ/1IIch.KAmOq', 3082, 1, 0, NULL, '2021-01-04 17:27:06', '2021-01-04 17:34:51', NULL),
(91, 'Anar m', NULL, NULL, 'anar44@celt.az', 'en', NULL, NULL, '2021-02-06 00:00:00', NULL, NULL, NULL, NULL, NULL, NULL, 100, '$2y$10$aAHC4WwCQ1e9poxPzrD8m.8G0hS1mNh61lj.pgFq/w9VBYV.Zg00y', 3826, 1, 0, NULL, '2021-02-06 10:28:00', '2021-02-06 10:29:05', NULL);

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `user_documents`
--

CREATE TABLE `user_documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `user_documents`
--

INSERT INTO `user_documents` (`id`, `user_id`, `type`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 75, 'high_school_diploma', 'xVC017wCynXazWenoxtoZZcT2vefn4SknH2f3gLq.jpeg', '2020-09-17 11:15:24', '2020-09-17 11:15:24', NULL),
(2, 64, 'passport_copy', 'ic10pZekYIXqVYRsg2q0z61GCrIPACrifCJtv8Pa.png', '2020-09-17 11:32:18', '2020-12-28 07:41:03', '2020-12-28 07:41:03'),
(3, 64, 'high_school_diploma', 'QSPXqWDt7NxAXr3JF8j0XDTxi7UQQG8caKVtUHq4.jpeg', '2020-09-17 11:32:38', '2020-12-28 07:40:59', '2020-12-28 07:40:59'),
(4, 64, 'transcripts', 'OytyrqbqRotJo3E6hiXDf49chJzz0Nptt5ndPCqK.jpeg', '2020-09-17 11:32:54', '2020-12-28 07:40:55', '2020-12-28 07:40:55'),
(5, 64, 'high_school_diploma', 'qtQeprJ7OpcktAHBUgSmWojpwGC8Cda3i61Z1OrG.jpeg', '2020-09-23 14:09:21', '2020-12-28 07:40:52', '2020-12-28 07:40:52'),
(6, 58, 'passport_copy', 'XT2V2BMas6AqGZ2Gp23O8IY7ADwxjbBSeztZMUwF.png', '2020-09-25 11:52:02', '2020-09-25 11:52:13', '2020-09-25 11:52:13'),
(7, 58, 'high_school_diploma', 'pMg12x2ZkA0E2JKwlnbEr5boXRdadzvWc7ePBv05.png', '2020-09-25 11:52:24', '2020-09-25 11:52:24', NULL),
(8, 90, 'passport_copy', 'N2DXkDQHJDsostdVJIc0tBLjBwUTXEJQboSYDKaz.docx', '2021-01-04 17:35:44', '2021-01-04 17:35:44', NULL),
(9, 90, 'high_school_diploma', 'gYG5o1lmp1Bd59geZCQsMvz7KP94a5dNeHD3XECp.docx', '2021-01-04 17:35:56', '2021-01-04 17:35:56', NULL),
(10, 90, 'transcripts', 'N6JMeNEpPhmSe30frGghYfYfFRLusyn4dgxSvk25.pdf', '2021-01-04 17:36:13', '2021-01-04 17:36:13', NULL),
(11, 90, 'exam_results', 'wcooYn5Xg1WTXppBdyOXXjMbTrflGpU4ij2OUZ99.png', '2021-01-04 17:36:28', '2021-01-04 17:36:28', NULL);

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `user_education_details`
--

CREATE TABLE `user_education_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `edu_country_id` bigint(20) UNSIGNED NOT NULL,
  `edu_highest_level_id` bigint(20) UNSIGNED NOT NULL,
  `edu_grade_average` double(8,2) NOT NULL,
  `edu_grade_scheme_id` bigint(20) UNSIGNED NOT NULL,
  `study_program_level_id` bigint(20) UNSIGNED DEFAULT NULL,
  `study_area_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `study_start_date` date DEFAULT NULL,
  `study_start_season` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `study_start_year` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `dest_country_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gpa_per` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `user_education_details`
--

INSERT INTO `user_education_details` (`id`, `user_id`, `edu_country_id`, `edu_highest_level_id`, `edu_grade_average`, `edu_grade_scheme_id`, `study_program_level_id`, `study_area_id`, `study_start_date`, `study_start_season`, `study_start_year`, `created_at`, `updated_at`, `deleted_at`, `dest_country_id`, `gpa_per`) VALUES
(22, 56, 3, 3, 90.00, 12, 2, '[\"2\"]', NULL, 'autumn', 2021, '2020-07-08 13:32:58', '2020-07-08 13:57:11', NULL, '[\"1\",\"2\"]', '90.00'),
(23, 57, 3, 3, 99.00, 12, 2, '[\"4\",\"5\"]', NULL, 'autumn', 2021, '2020-07-09 12:54:27', '2020-07-09 12:54:54', NULL, '[\"1\",\"2\"]', '99.00'),
(24, 58, 3, 3, 70.00, 12, NULL, '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\"]', NULL, 'autumn', 2022, '2020-07-09 16:08:35', '2021-01-18 04:01:37', NULL, '[\"1\",\"2\",\"4\"]', '70.00'),
(25, 59, 3, 3, 88.00, 12, 2, '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\"]', NULL, 'autumn', 2021, '2020-07-12 15:02:42', '2020-07-12 15:10:13', NULL, '[\"2\"]', '88.00'),
(26, 60, 3, 3, 99.00, 12, 2, '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\"]', NULL, 'autumn', 2020, '2020-07-12 15:26:32', '2020-08-01 11:09:18', NULL, '[\"1\",\"2\"]', '99.00'),
(27, 62, 3, 3, 99.00, 12, 2, '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\"]', NULL, 'autumn', 2021, '2020-07-17 12:36:13', '2020-07-17 13:50:04', NULL, '[\"1\",\"2\"]', '99.00'),
(28, 63, 2, 2, 77.00, 10, 4, '[\"5\"]', NULL, 'spring', 2021, '2020-07-17 14:08:29', '2020-07-17 14:09:23', NULL, '[\"1\"]', '77.00'),
(29, 64, 3, 3, 99.00, 12, NULL, '[\"1\",\"2\",\"3\",\"4\"]', NULL, 'autumn', 2021, '2020-07-26 11:55:42', '2020-12-28 07:40:39', NULL, '[\"1\",\"2\",\"4\"]', '99.00'),
(30, 65, 3, 3, 99.00, 12, 2, '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\"]', NULL, 'autumn', 2021, '2020-08-01 11:16:09', '2020-08-01 11:28:21', NULL, '[\"1\",\"2\",\"4\"]', '99.00'),
(31, 67, 2, 3, 55.00, 14, NULL, '[\"1\"]', NULL, 'autumn', 2020, '2020-08-12 10:04:25', '2020-08-12 12:48:24', NULL, '[\"2\"]', '55.00'),
(32, 68, 3, 3, 77.00, 12, NULL, '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\"]', NULL, 'autumn', 2021, '2020-08-12 20:17:57', '2020-08-12 20:19:18', NULL, '[\"1\",\"2\",\"4\"]', '77.00'),
(33, 69, 3, 3, 5.00, 11, NULL, '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\"]', NULL, 'autumn', 2021, '2020-08-14 09:16:49', '2020-08-14 09:23:55', NULL, '[\"1\"]', '100.00'),
(34, 70, 3, 3, 99.00, 12, NULL, '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\"]', NULL, 'winter', 2021, '2020-08-27 21:22:31', '2020-08-27 21:27:27', NULL, '[\"4\"]', '99.00'),
(35, 71, 3, 3, 99.00, 12, NULL, '[\"2\"]', NULL, 'autumn', 2021, '2020-09-16 06:49:37', '2020-09-16 06:50:08', NULL, '[\"1\"]', '99.00'),
(36, 73, 3, 3, 99.00, 12, NULL, '[\"8\"]', NULL, 'summer', 2021, '2020-09-16 09:11:44', '2020-09-16 09:12:00', NULL, '[\"2\"]', '99.00'),
(37, 74, 3, 3, 5.00, 11, NULL, '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\"]', NULL, 'autumn', 2021, '2020-09-16 12:05:39', '2020-09-16 12:07:31', NULL, '[\"1\",\"2\",\"4\",\"5\"]', '100.00'),
(38, 75, 3, 3, 5.00, 11, NULL, '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\"]', NULL, 'autumn', 2021, '2020-09-16 12:10:34', '2020-09-16 12:11:04', NULL, '[\"1\",\"2\",\"4\",\"5\"]', '100.00'),
(39, 76, 3, 3, 88.00, 12, NULL, '[\"5\"]', NULL, 'summer', 2021, '2020-09-16 12:14:52', '2020-09-16 12:15:07', NULL, '[\"2\"]', '88.00'),
(40, 77, 3, 3, 5.00, 11, NULL, '[\"1\",\"2\",\"3\",\"4\",\"5\"]', NULL, 'autumn', 2021, '2020-09-26 04:47:26', '2020-09-26 04:47:55', NULL, '[\"1\",\"2\",\"4\",\"5\"]', '100.00'),
(41, 78, 3, 3, 88.00, 12, NULL, '[null,\"1\"]', NULL, 'autumn', 2021, '2020-09-26 13:10:20', '2020-09-26 13:11:14', NULL, '[\"4\"]', '88.00'),
(42, 79, 3, 3, 99.00, 12, NULL, '[\"2\"]', NULL, 'spring', 2021, '2020-09-26 13:14:55', '2020-09-26 13:15:18', NULL, '[\"2\"]', '99.00'),
(43, 80, 3, 3, 4.00, 11, NULL, '[\"4\"]', NULL, 'autumn', 2021, '2020-09-26 13:19:13', '2020-09-26 13:19:46', NULL, '[\"2\"]', '80.00'),
(44, 83, 3, 3, 90.00, 12, NULL, '[\"1\",\"2\",\"3\",\"4\"]', NULL, 'autumn', 2021, '2020-11-04 11:02:41', '2020-11-04 11:03:19', NULL, '[\"1\",\"2\",\"4\"]', '90.00'),
(45, 86, 3, 3, 90.00, 12, NULL, '[\"1\",\"2\",\"5\",\"6\"]', NULL, 'autumn', 2021, '2020-11-26 10:20:56', '2020-11-26 10:21:41', NULL, '[\"1\",\"2\",\"4\"]', '90.00'),
(46, 88, 2, 2, 82.00, 10, NULL, '[\"1\"]', NULL, 'spring', 2020, '2020-12-23 16:29:26', '2020-12-23 16:31:59', NULL, '[\"2\"]', '82.00'),
(47, 89, 2, 2, 6.00, 10, NULL, '[\"4\"]', NULL, 'summer', 2021, '2020-12-28 09:05:32', '2020-12-28 09:06:01', NULL, '[\"1\"]', '6.00'),
(48, 90, 3, 3, 99.00, 12, NULL, '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\"]', NULL, 'autumn', 2021, '2021-01-04 17:27:20', '2021-02-10 10:11:23', NULL, '[\"1\"]', '99.00'),
(49, 91, 3, 3, 4.00, 11, NULL, '[\"2\"]', NULL, 'autumn', 2021, '2021-02-06 10:28:18', '2021-02-06 10:28:42', NULL, '[\"2\"]', '80.00');

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `user_schools_attendeds`
--

CREATE TABLE `user_schools_attendeds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `at_edu_level_id` bigint(20) UNSIGNED NOT NULL,
  `at_edu_country_id` bigint(20) UNSIGNED NOT NULL,
  `at_edu_institution_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `at_edu_primary_institution_language` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `at_edu_from_date` date NOT NULL,
  `at_edu_to_date` date NOT NULL,
  `at_edu_degree_award` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `at_edu_degree_award_date` date NOT NULL,
  `at_edu_school_address` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `user_test_scores`
--

CREATE TABLE `user_test_scores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `exam_id` bigint(20) UNSIGNED NOT NULL,
  `overal_score` double(8,1) DEFAULT NULL,
  `reading_score` double(8,1) DEFAULT NULL,
  `listening_score` double(8,1) DEFAULT NULL,
  `speaking_score` double(8,1) DEFAULT NULL,
  `writing_score` double(8,1) DEFAULT NULL,
  `exam_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `user_test_scores`
--

INSERT INTO `user_test_scores` (`id`, `user_id`, `exam_id`, `overal_score`, `reading_score`, `listening_score`, `speaking_score`, `writing_score`, `exam_date`, `created_at`, `updated_at`, `deleted_at`) VALUES
(134, 56, 2, 100.0, 25.0, 25.0, 25.0, 25.0, '2020-07-08', '2020-07-08 13:33:27', '2020-07-08 13:36:54', '2020-07-08 13:36:54'),
(135, 56, 2, 100.0, 25.0, 25.0, 25.0, 25.0, '2020-07-08', '2020-07-08 13:36:54', '2020-07-08 13:57:16', '2020-07-08 13:57:16'),
(136, 56, 2, 100.0, 25.0, 25.0, 25.0, 25.0, '2020-07-08', '2020-07-08 13:57:16', '2020-07-08 13:57:16', NULL),
(137, 58, 1, 5.0, 5.0, 6.0, 5.5, 5.5, '2020-07-09', '2020-07-09 16:08:52', '2020-07-09 16:13:42', '2020-07-09 16:13:42'),
(138, 58, 1, 5.0, 5.0, 6.0, 5.5, 5.5, '2020-07-09', '2020-07-09 16:13:42', '2020-07-13 09:46:10', '2020-07-13 09:46:10'),
(139, 59, 1, 8.5, 8.5, 8.5, 8.5, 8.5, '2019-05-07', '2020-07-12 15:03:42', '2020-07-12 15:09:55', '2020-07-12 15:09:55'),
(140, 59, 2, 116.0, 29.0, 29.0, 29.0, 29.0, '2020-07-12', '2020-07-12 15:03:42', '2020-07-12 15:09:55', '2020-07-12 15:09:55'),
(141, 59, 1, 8.5, 8.5, 8.5, 8.5, 8.5, '2019-05-07', '2020-07-12 15:09:55', '2020-07-12 15:09:55', NULL),
(142, 59, 2, 116.0, 29.0, 29.0, 29.0, 29.0, '2020-07-12', '2020-07-12 15:09:55', '2020-07-12 15:09:55', NULL),
(143, 60, 1, 8.5, 8.5, 8.5, 8.5, 8.5, '2020-07-12', '2020-07-12 15:27:02', '2020-07-12 15:27:14', '2020-07-12 15:27:14'),
(144, 60, 2, 120.0, 30.0, 30.0, 30.0, 30.0, '2020-07-12', '2020-07-12 15:27:02', '2020-07-12 15:27:14', '2020-07-12 15:27:14'),
(145, 60, 1, 8.5, 8.5, 8.5, 8.5, 8.5, '2020-07-12', '2020-07-12 15:27:14', '2020-07-12 15:29:47', '2020-07-12 15:29:47'),
(146, 60, 2, 120.0, 30.0, 30.0, 30.0, 30.0, '2020-07-12', '2020-07-12 15:27:14', '2020-07-12 15:29:47', '2020-07-12 15:29:47'),
(147, 60, 2, 120.0, 30.0, 30.0, 30.0, 30.0, '2020-07-12', '2020-07-12 15:29:47', '2020-07-12 16:57:50', '2020-07-12 16:57:50'),
(148, 60, 1, 8.5, 8.5, 8.5, 8.5, 8.5, '2020-07-12', '2020-07-12 16:57:50', '2020-07-17 12:32:52', '2020-07-17 12:32:52'),
(149, 60, 2, 120.0, 30.0, 30.0, 30.0, 30.0, '2020-07-12', '2020-07-12 16:57:50', '2020-07-17 12:32:52', '2020-07-17 12:32:52'),
(150, 58, 1, 5.0, 5.0, 6.0, 5.5, 5.5, '2020-07-09', '2020-07-13 09:46:10', '2020-07-13 09:50:46', '2020-07-13 09:50:46'),
(151, 58, 1, 5.0, 5.0, 6.0, 5.5, 5.5, '2020-07-09', '2020-07-13 09:50:46', '2020-07-13 09:51:09', '2020-07-13 09:51:09'),
(152, 58, 1, 5.0, 5.0, 6.0, 5.5, 5.5, '2020-07-09', '2020-07-13 09:51:09', '2020-07-16 16:58:32', '2020-07-16 16:58:32'),
(153, 58, 1, 5.0, 5.0, 6.0, 5.5, 5.5, '2020-07-09', '2020-07-16 16:58:32', '2020-07-17 12:43:29', '2020-07-17 12:43:29'),
(154, 58, 2, 70.0, 80.0, 50.0, 60.0, 60.0, '2020-07-16', '2020-07-16 16:58:32', '2020-07-17 12:43:29', '2020-07-17 12:43:29'),
(155, 60, 1, 8.5, 8.5, 8.5, 8.5, 8.5, '2020-07-12', '2020-07-17 12:32:52', '2020-07-17 12:34:26', '2020-07-17 12:34:26'),
(156, 60, 2, 120.0, 30.0, 30.0, 30.0, 30.0, '2020-07-12', '2020-07-17 12:32:52', '2020-07-17 12:34:26', '2020-07-17 12:34:26'),
(157, 60, 2, 120.0, 30.0, 30.0, 30.0, 30.0, '2020-07-12', '2020-07-17 12:34:26', '2020-07-17 12:34:54', '2020-07-17 12:34:54'),
(158, 60, 2, 120.0, 30.0, 30.0, 30.0, 30.0, '2020-07-12', '2020-07-17 12:34:54', '2020-07-17 12:38:38', '2020-07-17 12:38:38'),
(159, 62, 2, 120.0, 30.0, 30.0, 30.0, 30.0, '2020-07-17', '2020-07-17 12:36:30', '2020-07-17 12:39:01', '2020-07-17 12:39:01'),
(160, 60, 2, 120.0, 30.0, 30.0, 30.0, 30.0, '2020-07-12', '2020-07-17 12:38:38', '2020-07-17 12:56:42', '2020-07-17 12:56:42'),
(161, 62, 1, 8.5, 8.5, 8.5, 8.5, 8.5, '2020-07-17', '2020-07-17 12:39:01', '2020-07-17 12:45:19', '2020-07-17 12:45:19'),
(162, 62, 2, 120.0, 30.0, 30.0, 30.0, 30.0, '2020-07-17', '2020-07-17 12:39:01', '2020-07-17 12:45:19', '2020-07-17 12:45:19'),
(163, 58, 1, 5.0, 5.0, 6.0, 5.5, 5.5, '2020-07-09', '2020-07-17 12:43:29', '2020-07-17 12:45:45', '2020-07-17 12:45:45'),
(164, 58, 2, 70.0, 80.0, 50.0, 60.0, 60.0, '2020-07-16', '2020-07-17 12:43:29', '2020-07-17 12:45:45', '2020-07-17 12:45:45'),
(165, 62, 1, 8.5, 8.5, 8.5, 8.5, 8.5, '2020-07-17', '2020-07-17 12:45:19', '2020-07-17 12:47:30', '2020-07-17 12:47:30'),
(166, 62, 2, 120.0, 30.0, 30.0, 30.0, 30.0, '2020-07-17', '2020-07-17 12:45:19', '2020-07-17 12:47:30', '2020-07-17 12:47:30'),
(167, 58, 1, 5.0, 5.0, 6.0, 5.5, 5.5, '2020-07-09', '2020-07-17 12:45:45', '2020-07-17 12:48:39', '2020-07-17 12:48:39'),
(168, 58, 2, 70.0, 80.0, 50.0, 60.0, 60.0, '2020-07-16', '2020-07-17 12:45:45', '2020-07-17 12:48:39', '2020-07-17 12:48:39'),
(169, 62, 1, 8.5, 8.5, 8.5, 8.5, 8.5, '2020-07-17', '2020-07-17 12:47:30', '2020-07-17 13:02:10', '2020-07-17 13:02:10'),
(170, 62, 2, 120.0, 30.0, 30.0, 30.0, 30.0, '2020-07-17', '2020-07-17 12:47:30', '2020-07-17 13:02:10', '2020-07-17 13:02:10'),
(171, 58, 1, 5.0, 5.0, 6.0, 5.5, 5.5, '2020-07-09', '2020-07-17 12:48:39', '2020-07-17 13:04:50', '2020-07-17 13:04:50'),
(172, 58, 2, 70.0, 80.0, 50.0, 60.0, 60.0, '2020-07-16', '2020-07-17 12:48:39', '2020-07-17 13:04:50', '2020-07-17 13:04:50'),
(173, 60, 2, 120.0, 30.0, 30.0, 30.0, 30.0, '2020-07-12', '2020-07-17 12:56:42', '2020-07-17 12:58:31', '2020-07-17 12:58:31'),
(174, 60, 2, 120.0, 30.0, 30.0, 30.0, 30.0, '2020-07-12', '2020-07-17 12:58:31', '2020-07-17 12:58:43', '2020-07-17 12:58:43'),
(175, 60, 2, 120.0, 30.0, 30.0, 30.0, 30.0, '2020-07-12', '2020-07-17 12:58:43', '2020-07-17 13:00:13', '2020-07-17 13:00:13'),
(176, 60, 2, 120.0, 30.0, 30.0, 30.0, 30.0, '2020-07-12', '2020-07-17 13:00:13', '2020-07-25 19:38:51', '2020-07-25 19:38:51'),
(177, 62, 1, 8.5, 8.5, 8.5, 8.5, 8.5, '2020-07-17', '2020-07-17 13:02:10', '2020-07-17 13:03:17', '2020-07-17 13:03:17'),
(178, 62, 2, 120.0, 30.0, 30.0, 30.0, 30.0, '2020-07-17', '2020-07-17 13:02:10', '2020-07-17 13:03:17', '2020-07-17 13:03:17'),
(179, 62, 2, 60.0, 15.0, 15.0, 15.0, 15.0, '2020-07-17', '2020-07-17 13:03:17', '2020-07-17 13:04:21', '2020-07-17 13:04:21'),
(180, 62, 2, 80.0, 20.0, 20.0, 20.0, 20.0, '2020-07-17', '2020-07-17 13:04:21', '2020-07-17 13:04:48', '2020-07-17 13:04:48'),
(181, 62, 2, 80.0, 20.0, 20.0, 20.0, 20.0, '2020-07-17', '2020-07-17 13:04:48', '2020-07-17 13:18:02', '2020-07-17 13:18:02'),
(182, 58, 1, 5.0, 5.0, 6.0, 5.5, 5.5, '2020-07-09', '2020-07-17 13:04:50', '2020-07-17 13:45:56', '2020-07-17 13:45:56'),
(183, 58, 2, 70.0, 80.0, 50.0, 60.0, 60.0, '2020-07-16', '2020-07-17 13:04:50', '2020-07-17 13:45:56', '2020-07-17 13:45:56'),
(184, 62, 2, 120.0, 30.0, 30.0, 30.0, 30.0, '2020-07-17', '2020-07-17 13:18:02', '2020-07-17 13:18:41', '2020-07-17 13:18:41'),
(185, 62, 2, 120.0, 30.0, 30.0, 30.0, 30.0, '2020-07-17', '2020-07-17 13:18:41', '2020-07-17 13:50:08', '2020-07-17 13:50:08'),
(186, 58, 1, 5.0, 5.0, 6.0, 5.5, 5.5, '2020-07-09', '2020-07-17 13:45:56', '2020-07-18 08:11:06', '2020-07-18 08:11:06'),
(187, 58, 2, 70.0, 80.0, 50.0, 60.0, 60.0, '2020-07-16', '2020-07-17 13:45:56', '2020-07-18 08:11:06', '2020-07-18 08:11:06'),
(188, 62, 2, 120.0, 30.0, 30.0, 30.0, 30.0, '2020-07-17', '2020-07-17 13:50:08', '2020-07-17 13:50:08', NULL),
(189, 58, 1, 5.0, 5.0, 6.0, 5.5, 5.5, '2020-07-09', '2020-07-18 08:11:06', '2020-07-18 08:16:02', '2020-07-18 08:16:02'),
(190, 58, 2, 70.0, 80.0, 50.0, 60.0, 60.0, '2020-07-16', '2020-07-18 08:11:06', '2020-07-18 08:16:02', '2020-07-18 08:16:02'),
(191, 58, 1, 5.0, 5.0, 6.0, 5.5, 5.5, '2020-07-09', '2020-07-18 08:16:02', '2020-07-18 08:17:25', '2020-07-18 08:17:25'),
(192, 58, 2, 70.0, 80.0, 50.0, 60.0, 60.0, '2020-07-16', '2020-07-18 08:16:02', '2020-07-18 08:17:25', '2020-07-18 08:17:25'),
(193, 58, 1, 5.0, 5.0, 6.0, 5.5, 5.5, '2020-07-09', '2020-07-18 08:17:25', '2020-07-23 15:13:34', '2020-07-23 15:13:34'),
(194, 58, 2, 70.0, 80.0, 50.0, 60.0, 60.0, '2020-07-16', '2020-07-18 08:17:25', '2020-07-23 15:13:34', '2020-07-23 15:13:34'),
(195, 58, 1, 5.0, 5.0, 6.0, 5.5, 5.5, '2020-07-09', '2020-07-23 15:13:34', '2020-07-23 16:22:54', '2020-07-23 16:22:54'),
(196, 58, 2, 70.0, 80.0, 50.0, 60.0, 60.0, '2020-07-16', '2020-07-23 15:13:34', '2020-07-23 16:22:54', '2020-07-23 16:22:54'),
(197, 58, 1, 5.0, 5.0, 6.0, 5.5, 5.5, '2020-07-09', '2020-07-23 16:22:54', '2020-07-23 16:27:39', '2020-07-23 16:27:39'),
(198, 58, 2, 70.0, 80.0, 50.0, 60.0, 60.0, '2020-07-16', '2020-07-23 16:22:54', '2020-07-23 16:27:39', '2020-07-23 16:27:39'),
(199, 58, 1, 5.0, 5.0, 6.0, 5.5, 5.5, '2020-07-09', '2020-07-23 16:27:39', '2020-07-23 16:38:35', '2020-07-23 16:38:35'),
(200, 58, 2, 70.0, 80.0, 50.0, 60.0, 60.0, '2020-07-16', '2020-07-23 16:27:39', '2020-07-23 16:38:35', '2020-07-23 16:38:35'),
(201, 58, 1, 5.0, 5.0, 6.0, 5.5, 5.5, '2020-07-09', '2020-07-23 16:38:35', '2020-07-23 16:54:24', '2020-07-23 16:54:24'),
(202, 58, 2, 70.0, 80.0, 50.0, 60.0, 60.0, '2020-07-16', '2020-07-23 16:38:35', '2020-07-23 16:54:24', '2020-07-23 16:54:24'),
(203, 58, 1, 5.0, 5.0, 6.0, 5.5, 5.5, '2020-07-09', '2020-07-23 16:54:24', '2020-07-23 16:55:22', '2020-07-23 16:55:22'),
(204, 58, 2, 70.0, 80.0, 50.0, 60.0, 60.0, '2020-07-16', '2020-07-23 16:54:24', '2020-07-23 16:55:22', '2020-07-23 16:55:22'),
(205, 58, 1, 5.0, 5.0, 6.0, 5.5, 5.5, '2020-07-09', '2020-07-23 16:55:22', '2020-07-23 16:55:58', '2020-07-23 16:55:58'),
(206, 58, 2, 70.0, 80.0, 50.0, 60.0, 60.0, '2020-07-16', '2020-07-23 16:55:22', '2020-07-23 16:55:58', '2020-07-23 16:55:58'),
(207, 58, 1, 5.0, 5.0, 6.0, 5.5, 5.5, '2020-07-09', '2020-07-23 16:55:58', '2020-07-24 08:02:19', '2020-07-24 08:02:19'),
(208, 58, 2, 70.0, 80.0, 50.0, 60.0, 60.0, '2020-07-16', '2020-07-23 16:55:58', '2020-07-24 08:02:19', '2020-07-24 08:02:19'),
(209, 58, 1, 5.0, 5.0, 6.0, 5.5, 5.5, '2020-07-09', '2020-07-24 08:02:19', '2020-07-24 08:06:44', '2020-07-24 08:06:44'),
(210, 58, 2, 70.0, 80.0, 50.0, 60.0, 60.0, '2020-07-16', '2020-07-24 08:02:19', '2020-07-24 08:06:44', '2020-07-24 08:06:44'),
(211, 58, 1, 5.0, 5.0, 6.0, 5.5, 5.5, '2020-07-09', '2020-07-24 08:06:44', '2020-07-24 08:08:38', '2020-07-24 08:08:38'),
(212, 58, 2, 70.0, 80.0, 50.0, 60.0, 60.0, '2020-07-16', '2020-07-24 08:06:44', '2020-07-24 08:08:38', '2020-07-24 08:08:38'),
(213, 58, 1, 5.0, 5.0, 6.0, 5.5, 5.5, '2020-07-09', '2020-07-24 08:08:38', '2020-07-24 08:09:48', '2020-07-24 08:09:48'),
(214, 58, 2, 70.0, 80.0, 50.0, 60.0, 60.0, '2020-07-16', '2020-07-24 08:08:38', '2020-07-24 08:09:48', '2020-07-24 08:09:48'),
(215, 58, 1, 5.0, 5.0, 6.0, 5.5, 5.5, '2020-07-09', '2020-07-24 08:09:48', '2020-07-24 08:10:12', '2020-07-24 08:10:12'),
(216, 58, 2, 70.0, 80.0, 50.0, 60.0, 60.0, '2020-07-16', '2020-07-24 08:09:48', '2020-07-24 08:10:12', '2020-07-24 08:10:12'),
(217, 58, 1, 5.0, 5.0, 6.0, 5.5, 5.5, '2020-07-09', '2020-07-24 08:10:12', '2020-07-24 08:11:02', '2020-07-24 08:11:02'),
(218, 58, 2, 70.0, 80.0, 50.0, 60.0, 60.0, '2020-07-16', '2020-07-24 08:10:12', '2020-07-24 08:11:02', '2020-07-24 08:11:02'),
(219, 58, 1, 5.0, 5.0, 6.0, 5.5, 5.5, '2020-07-09', '2020-07-24 08:11:02', '2020-07-24 08:11:32', '2020-07-24 08:11:32'),
(220, 58, 2, 70.0, 80.0, 50.0, 60.0, 60.0, '2020-07-16', '2020-07-24 08:11:02', '2020-07-24 08:11:32', '2020-07-24 08:11:32'),
(221, 58, 1, 5.0, 5.0, 6.0, 5.5, 5.5, '2020-07-09', '2020-07-24 08:11:32', '2020-07-24 08:13:35', '2020-07-24 08:13:35'),
(222, 58, 2, 70.0, 80.0, 50.0, 60.0, 60.0, '2020-07-16', '2020-07-24 08:11:32', '2020-07-24 08:13:35', '2020-07-24 08:13:35'),
(223, 58, 1, 5.0, 5.0, 6.0, 5.5, 5.5, '2020-07-09', '2020-07-24 08:13:35', '2020-07-24 08:17:42', '2020-07-24 08:17:42'),
(224, 58, 2, 70.0, 80.0, 50.0, 60.0, 60.0, '2020-07-16', '2020-07-24 08:13:35', '2020-07-24 08:17:42', '2020-07-24 08:17:42'),
(225, 58, 1, 5.0, 5.0, 6.0, 5.5, 5.5, '2020-07-09', '2020-07-24 08:17:42', '2020-07-24 08:19:52', '2020-07-24 08:19:52'),
(226, 58, 2, 70.0, 80.0, 50.0, 60.0, 60.0, '2020-07-16', '2020-07-24 08:17:42', '2020-07-24 08:19:52', '2020-07-24 08:19:52'),
(227, 58, 1, 5.0, 5.0, 6.0, 5.5, 5.5, '2020-07-09', '2020-07-24 08:19:52', '2020-07-24 08:22:45', '2020-07-24 08:22:45'),
(228, 58, 2, 70.0, 80.0, 50.0, 60.0, 60.0, '2020-07-16', '2020-07-24 08:19:52', '2020-07-24 08:22:45', '2020-07-24 08:22:45'),
(229, 58, 1, 5.0, 5.0, 6.0, 5.5, 5.5, '2020-07-09', '2020-07-24 08:22:45', '2020-07-24 08:27:54', '2020-07-24 08:27:54'),
(230, 58, 2, 70.0, 80.0, 50.0, 60.0, 60.0, '2020-07-16', '2020-07-24 08:22:45', '2020-07-24 08:27:54', '2020-07-24 08:27:54'),
(231, 58, 1, 5.0, 5.0, 6.0, 5.5, 5.5, '2020-07-09', '2020-07-24 08:27:54', '2020-07-24 08:28:15', '2020-07-24 08:28:15'),
(232, 58, 2, 70.0, 80.0, 50.0, 60.0, 60.0, '2020-07-16', '2020-07-24 08:27:54', '2020-07-24 08:28:15', '2020-07-24 08:28:15'),
(233, 58, 1, 5.0, 5.0, 6.0, 5.5, 5.5, '2020-07-09', '2020-07-24 08:28:15', '2020-07-27 09:27:23', '2020-07-27 09:27:23'),
(234, 58, 2, 70.0, 80.0, 50.0, 60.0, 60.0, '2020-07-16', '2020-07-24 08:28:15', '2020-07-27 09:27:23', '2020-07-27 09:27:23'),
(235, 60, 2, 120.0, 30.0, 30.0, 30.0, 30.0, '2020-07-12', '2020-07-25 19:38:51', '2020-08-01 11:08:31', '2020-08-01 11:08:31'),
(236, 64, 2, 120.0, 30.0, 30.0, 30.0, 30.0, '2020-07-26', '2020-07-26 11:55:57', '2020-07-26 11:59:52', '2020-07-26 11:59:52'),
(237, 64, 2, 120.0, 30.0, 30.0, 30.0, 30.0, '2020-07-26', '2020-07-26 11:59:52', '2020-07-26 12:04:38', '2020-07-26 12:04:38'),
(238, 64, 2, 120.0, 30.0, 30.0, 30.0, 30.0, '2020-07-26', '2020-07-26 12:04:38', '2020-07-26 12:05:56', '2020-07-26 12:05:56'),
(239, 64, 2, 120.0, 30.0, 30.0, 30.0, 30.0, '2020-07-26', '2020-07-26 12:05:56', '2020-07-26 12:43:13', '2020-07-26 12:43:13'),
(240, 64, 2, 120.0, 30.0, 30.0, 30.0, 30.0, '2020-07-26', '2020-07-26 12:43:13', '2020-07-26 18:41:03', '2020-07-26 18:41:03'),
(241, 64, 2, 120.0, 30.0, 30.0, 30.0, 30.0, '2020-07-26', '2020-07-26 18:41:03', '2020-07-26 18:52:34', '2020-07-26 18:52:34'),
(242, 64, 2, 120.0, 30.0, 30.0, 30.0, 30.0, '2020-07-26', '2020-07-26 18:52:34', '2020-08-04 14:17:29', '2020-08-04 14:17:29'),
(243, 58, 1, 5.0, 5.0, 6.0, 5.5, 5.5, '2020-07-09', '2020-07-27 09:27:24', '2020-07-27 09:37:29', '2020-07-27 09:37:29'),
(244, 58, 2, 70.0, 80.0, 50.0, 60.0, 60.0, '2020-07-16', '2020-07-27 09:27:24', '2020-07-27 09:37:29', '2020-07-27 09:37:29'),
(245, 58, 1, 5.0, 5.0, 6.0, 5.5, 5.5, '2020-07-09', '2020-07-27 09:37:29', '2020-07-30 23:13:31', '2020-07-30 23:13:31'),
(246, 58, 2, 70.0, 80.0, 50.0, 60.0, 60.0, '2020-07-16', '2020-07-27 09:37:29', '2020-07-30 23:13:31', '2020-07-30 23:13:31'),
(247, 58, 1, 5.0, 5.0, 6.0, 5.5, 5.5, '2020-07-09', '2020-07-30 23:13:31', '2020-07-30 23:15:02', '2020-07-30 23:15:02'),
(248, 58, 2, 70.0, 80.0, 50.0, 60.0, 60.0, '2020-07-16', '2020-07-30 23:13:31', '2020-07-30 23:15:02', '2020-07-30 23:15:02'),
(249, 58, 1, 5.0, 5.0, 6.0, 5.5, 5.5, '2020-07-09', '2020-07-30 23:15:02', '2020-07-30 23:16:29', '2020-07-30 23:16:29'),
(250, 58, 2, 70.0, 80.0, 50.0, 60.0, 60.0, '2020-07-16', '2020-07-30 23:15:02', '2020-07-30 23:16:29', '2020-07-30 23:16:29'),
(251, 58, 1, 5.0, 5.0, 6.0, 5.5, 5.5, '2020-07-09', '2020-07-30 23:16:29', '2020-07-30 23:18:13', '2020-07-30 23:18:13'),
(252, 58, 2, 70.0, 80.0, 50.0, 60.0, 60.0, '2020-07-16', '2020-07-30 23:16:29', '2020-07-30 23:18:13', '2020-07-30 23:18:13'),
(253, 58, 1, 5.0, 5.0, 6.0, 5.5, 5.5, '2020-07-09', '2020-07-30 23:18:13', '2020-07-30 23:20:34', '2020-07-30 23:20:34'),
(254, 58, 2, 70.0, 80.0, 50.0, 60.0, 60.0, '2020-07-16', '2020-07-30 23:18:13', '2020-07-30 23:20:34', '2020-07-30 23:20:34'),
(255, 58, 1, 5.0, 5.0, 6.0, 5.5, 5.5, '2020-07-09', '2020-07-30 23:20:34', '2020-07-31 00:53:22', '2020-07-31 00:53:22'),
(256, 58, 2, 70.0, 80.0, 50.0, 60.0, 60.0, '2020-07-16', '2020-07-30 23:20:34', '2020-07-31 00:53:22', '2020-07-31 00:53:22'),
(257, 58, 1, 5.0, 5.0, 6.0, 5.5, 5.5, '2020-07-09', '2020-07-31 00:53:22', '2020-07-31 15:26:40', '2020-07-31 15:26:40'),
(258, 58, 2, 70.0, 80.0, 50.0, 60.0, 60.0, '2020-07-16', '2020-07-31 00:53:22', '2020-07-31 15:26:40', '2020-07-31 15:26:40'),
(259, 58, 1, 5.0, 5.0, 6.0, 5.5, 5.5, '2020-07-09', '2020-07-31 15:26:40', '2020-07-31 15:27:07', '2020-07-31 15:27:07'),
(260, 58, 2, 70.0, 80.0, 50.0, 60.0, 60.0, '2020-07-16', '2020-07-31 15:26:40', '2020-07-31 15:27:07', '2020-07-31 15:27:07'),
(261, 58, 1, 5.0, 5.0, 6.0, 5.5, 5.5, '2020-07-09', '2020-07-31 15:27:07', '2020-07-31 15:33:18', '2020-07-31 15:33:18'),
(262, 58, 2, 70.0, 80.0, 50.0, 60.0, 60.0, '2020-07-16', '2020-07-31 15:27:07', '2020-07-31 15:33:18', '2020-07-31 15:33:18'),
(263, 58, 1, 5.0, 5.0, 6.0, 5.5, 5.5, '2020-07-09', '2020-07-31 15:33:18', '2020-07-31 15:35:45', '2020-07-31 15:35:45'),
(264, 58, 2, 70.0, 80.0, 50.0, 60.0, 60.0, '2020-07-16', '2020-07-31 15:33:18', '2020-07-31 15:35:45', '2020-07-31 15:35:45'),
(265, 58, 1, 5.0, 5.0, 6.0, 5.5, 5.5, '2020-07-09', '2020-07-31 15:35:45', '2020-07-31 15:36:42', '2020-07-31 15:36:42'),
(266, 58, 2, 70.0, 80.0, 50.0, 60.0, 60.0, '2020-07-16', '2020-07-31 15:35:45', '2020-07-31 15:36:42', '2020-07-31 15:36:42'),
(267, 58, 1, 5.0, 5.0, 6.0, 5.5, 5.5, '2020-07-09', '2020-07-31 15:36:42', '2020-07-31 15:37:12', '2020-07-31 15:37:12'),
(268, 58, 2, 70.0, 80.0, 50.0, 60.0, 60.0, '2020-07-16', '2020-07-31 15:36:42', '2020-07-31 15:37:12', '2020-07-31 15:37:12'),
(269, 58, 1, 5.0, 5.0, 6.0, 5.5, 5.5, '2020-07-09', '2020-07-31 15:37:12', '2020-07-31 15:38:19', '2020-07-31 15:38:19'),
(270, 58, 2, 70.0, 80.0, 50.0, 60.0, 60.0, '2020-07-16', '2020-07-31 15:37:12', '2020-07-31 15:38:19', '2020-07-31 15:38:19'),
(271, 58, 1, 5.0, 5.0, 6.0, 5.5, 5.5, '2020-07-09', '2020-07-31 15:38:19', '2020-08-04 09:44:37', '2020-08-04 09:44:37'),
(272, 58, 2, 80.0, 80.0, 50.0, 60.0, 60.0, '2020-07-16', '2020-07-31 15:38:19', '2020-08-04 09:44:37', '2020-08-04 09:44:37'),
(273, 60, 2, 120.0, 30.0, 30.0, 30.0, 30.0, '2020-07-12', '2020-08-01 11:08:31', '2020-08-01 11:08:31', NULL),
(274, 65, 2, 120.0, 30.0, 30.0, 30.0, 30.0, '2020-08-01', '2020-08-01 11:16:24', '2020-08-01 11:23:41', '2020-08-01 11:23:41'),
(275, 65, 2, 120.0, 30.0, 30.0, 30.0, 30.0, '2020-08-01', '2020-08-01 11:23:41', '2020-08-01 11:28:38', '2020-08-01 11:28:38'),
(276, 65, 2, 120.0, 30.0, 30.0, 30.0, 30.0, '2020-08-01', '2020-08-01 11:28:38', '2020-08-01 11:29:36', '2020-08-01 11:29:36'),
(277, 65, 2, 120.0, 30.0, 30.0, 30.0, 30.0, '2020-08-01', '2020-08-01 11:29:36', '2020-08-01 11:29:36', NULL),
(278, 58, 2, 120.0, 30.0, 30.0, 30.0, 30.0, '2020-08-01', '2020-08-04 09:44:37', '2020-08-04 12:20:43', '2020-08-04 12:20:43'),
(279, 58, 2, 120.0, 30.0, 30.0, 30.0, 30.0, '2020-08-01', '2020-08-04 12:20:43', '2020-08-04 13:15:28', '2020-08-04 13:15:28'),
(280, 58, 2, 120.0, 30.0, 30.0, 30.0, 30.0, '2020-08-01', '2020-08-04 13:15:28', '2020-08-04 13:15:50', '2020-08-04 13:15:50'),
(281, 58, 2, 120.0, 30.0, 30.0, 30.0, 30.0, '2020-08-01', '2020-08-04 13:15:50', '2020-08-04 13:17:14', '2020-08-04 13:17:14'),
(282, 58, 2, 120.0, 30.0, 30.0, 30.0, 30.0, '2020-08-01', '2020-08-04 13:17:14', '2020-08-04 16:04:13', '2020-08-04 16:04:13'),
(283, 64, 2, 120.0, 30.0, 30.0, 30.0, 30.0, '2020-07-26', '2020-08-04 14:17:29', '2020-08-04 15:02:51', '2020-08-04 15:02:51'),
(284, 64, 2, 120.0, 30.0, 30.0, 30.0, 30.0, '2020-07-26', '2020-08-04 15:02:51', '2020-08-04 15:39:32', '2020-08-04 15:39:32'),
(285, 64, 2, 120.0, 30.0, 30.0, 30.0, 30.0, '2020-07-26', '2020-08-04 15:39:32', '2020-08-04 15:41:40', '2020-08-04 15:41:40'),
(286, 64, 2, 120.0, 30.0, 30.0, 30.0, 30.0, '2020-07-26', '2020-08-04 15:41:40', '2020-08-04 15:52:29', '2020-08-04 15:52:29'),
(287, 64, 2, 120.0, 30.0, 30.0, 30.0, 30.0, '2020-07-26', '2020-08-04 15:52:29', '2020-08-04 15:53:54', '2020-08-04 15:53:54'),
(288, 64, 2, 120.0, 30.0, 30.0, 30.0, 30.0, '2020-07-26', '2020-08-04 15:53:54', '2020-08-05 12:39:48', '2020-08-05 12:39:48'),
(289, 58, 2, 120.0, 30.0, 30.0, 30.0, 30.0, '2020-08-01', '2020-08-04 16:04:13', '2020-08-05 13:41:41', '2020-08-05 13:41:41'),
(290, 64, 2, 120.0, 30.0, 30.0, 30.0, 30.0, '2020-07-26', '2020-08-05 12:39:48', '2020-08-05 12:57:53', '2020-08-05 12:57:53'),
(291, 64, 2, 120.0, 30.0, 30.0, 30.0, 30.0, '2020-07-26', '2020-08-05 12:57:53', '2020-08-05 13:56:06', '2020-08-05 13:56:06'),
(292, 58, 2, 120.0, 30.0, 30.0, 30.0, 30.0, '2020-08-01', '2020-08-05 13:41:41', '2020-08-05 13:42:54', '2020-08-05 13:42:54'),
(293, 58, 2, 120.0, 30.0, 30.0, 30.0, 30.0, '2020-08-01', '2020-08-05 13:42:54', '2020-08-05 13:54:13', '2020-08-05 13:54:13'),
(294, 58, 2, 120.0, 30.0, 30.0, 30.0, 30.0, '2020-08-01', '2020-08-05 13:54:13', '2020-08-07 08:33:52', '2020-08-07 08:33:52'),
(295, 64, 2, 120.0, 30.0, 30.0, 30.0, 30.0, '2020-07-26', '2020-08-05 13:56:06', '2020-08-05 13:58:36', '2020-08-05 13:58:36'),
(296, 64, 2, 120.0, 30.0, 30.0, 30.0, 30.0, '2020-07-26', '2020-08-05 13:58:36', '2020-08-05 14:03:40', '2020-08-05 14:03:40'),
(297, 64, 2, 120.0, 30.0, 30.0, 30.0, 30.0, '2020-07-26', '2020-08-05 14:03:40', '2020-08-05 14:31:00', '2020-08-05 14:31:00'),
(298, 64, 2, 120.0, 30.0, 30.0, 30.0, 30.0, '2020-07-26', '2020-08-05 14:31:00', '2020-08-05 14:42:38', '2020-08-05 14:42:38'),
(299, 64, 2, 120.0, 30.0, 30.0, 30.0, 30.0, '2020-07-26', '2020-08-05 14:42:38', '2020-08-05 14:51:32', '2020-08-05 14:51:32'),
(300, 64, 2, 120.0, 30.0, 30.0, 30.0, 30.0, '2020-07-26', '2020-08-05 14:51:32', '2020-08-08 15:59:00', '2020-08-08 15:59:00'),
(305, 58, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-01', '2020-08-07 08:33:52', '2020-08-07 08:35:30', '2020-08-07 08:35:30'),
(306, 58, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-01', '2020-08-07 08:35:30', '2020-08-07 08:45:00', '2020-08-07 08:45:00'),
(307, 58, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-01', '2020-08-07 08:45:00', '2020-08-07 08:47:11', '2020-08-07 08:47:11'),
(308, 58, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-01', '2020-08-07 08:47:11', '2020-08-07 09:33:57', '2020-08-07 09:33:57'),
(309, 58, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-01', '2020-08-07 09:33:57', '2020-08-07 09:57:29', '2020-08-07 09:57:29'),
(310, 58, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-01', '2020-08-07 09:57:29', '2020-08-07 16:41:32', '2020-08-07 16:41:32'),
(311, 58, 4, 130.0, 0.0, 0.0, 0.0, 0.0, '2020-08-07', '2020-08-07 09:57:29', '2020-08-07 16:41:32', '2020-08-07 16:41:32'),
(312, 58, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-01', '2020-08-07 16:41:32', '2020-08-07 17:02:16', '2020-08-07 17:02:16'),
(313, 58, 4, 130.0, 0.0, 0.0, 0.0, 0.0, '2020-08-07', '2020-08-07 16:41:32', '2020-08-07 17:02:16', '2020-08-07 17:02:16'),
(314, 58, 6, 75.0, 0.0, 0.0, 0.0, 0.0, '2020-08-07', '2020-08-07 16:41:32', '2020-08-07 17:02:16', '2020-08-07 17:02:16'),
(315, 58, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-01', '2020-08-07 17:02:16', '2020-08-08 08:08:13', '2020-08-08 08:08:13'),
(316, 58, 4, 130.0, 0.0, 0.0, 0.0, 0.0, '2020-08-07', '2020-08-07 17:02:16', '2020-08-08 08:08:13', '2020-08-08 08:08:13'),
(317, 58, 6, 60.0, 0.0, 0.0, 0.0, 0.0, '2020-08-07', '2020-08-07 17:02:16', '2020-08-08 08:08:13', '2020-08-08 08:08:13'),
(318, 58, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-01', '2020-08-08 08:08:13', '2020-08-10 07:58:06', '2020-08-10 07:58:06'),
(319, 58, 4, 130.0, 0.0, 0.0, 0.0, 0.0, '2020-08-07', '2020-08-08 08:08:13', '2020-08-10 07:58:06', '2020-08-10 07:58:06'),
(320, 58, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-01', '2020-08-10 07:58:06', '2020-08-10 15:36:15', '2020-08-10 15:36:15'),
(321, 58, 4, 130.0, 0.0, 0.0, 0.0, 0.0, '2020-08-07', '2020-08-10 07:58:06', '2020-08-10 15:36:15', '2020-08-10 15:36:15'),
(322, 58, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-01', '2020-08-10 15:36:15', '2020-08-11 09:15:42', '2020-08-11 09:15:42'),
(323, 58, 4, 130.0, 0.0, 0.0, 0.0, 0.0, '2020-08-07', '2020-08-10 15:36:15', '2020-08-11 09:15:42', '2020-08-11 09:15:42'),
(324, 64, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-10 17:34:26', '2020-08-10 17:40:29', '2020-08-10 17:40:29'),
(325, 64, 4, 9.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-10 17:34:26', '2020-08-10 17:40:29', '2020-08-10 17:40:29'),
(326, 64, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-10 17:40:29', '2020-08-10 17:48:58', '2020-08-10 17:48:58'),
(327, 64, 4, 9.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-10 17:40:29', '2020-08-10 17:48:58', '2020-08-10 17:48:58'),
(328, 64, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-10 17:48:58', '2020-08-11 09:04:53', '2020-08-11 09:04:53'),
(329, 64, 4, 9.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-10 17:48:58', '2020-08-11 09:04:53', '2020-08-11 09:04:53'),
(330, 64, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-11 09:04:53', '2020-08-11 09:24:52', '2020-08-11 09:24:52'),
(331, 64, 4, 9.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-11 09:04:53', '2020-08-11 09:24:52', '2020-08-11 09:24:52'),
(332, 58, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-01', '2020-08-11 09:15:42', '2020-08-11 09:24:14', '2020-08-11 09:24:14'),
(333, 58, 4, 130.0, 0.0, 0.0, 0.0, 0.0, '2020-08-07', '2020-08-11 09:15:42', '2020-08-11 09:24:14', '2020-08-11 09:24:14'),
(334, 58, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-01', '2020-08-11 09:24:14', '2020-08-11 10:52:26', '2020-08-11 10:52:26'),
(335, 58, 4, 130.0, 0.0, 0.0, 0.0, 0.0, '2020-08-07', '2020-08-11 09:24:14', '2020-08-11 10:52:26', '2020-08-11 10:52:26'),
(336, 64, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-11 09:24:52', '2020-08-11 09:36:35', '2020-08-11 09:36:35'),
(337, 64, 4, 9.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-11 09:24:52', '2020-08-11 09:36:35', '2020-08-11 09:36:35'),
(338, 64, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-11 09:36:35', '2020-08-11 11:43:51', '2020-08-11 11:43:51'),
(339, 64, 4, 9.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-11 09:36:35', '2020-08-11 11:43:51', '2020-08-11 11:43:51'),
(340, 58, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-01', '2020-08-11 10:52:26', '2020-08-11 12:44:43', '2020-08-11 12:44:43'),
(341, 58, 4, 130.0, 0.0, 0.0, 0.0, 0.0, '2020-08-07', '2020-08-11 10:52:26', '2020-08-11 12:44:43', '2020-08-11 12:44:43'),
(342, 64, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-11 11:43:51', '2020-08-11 11:44:58', '2020-08-11 11:44:58'),
(343, 64, 4, 9.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-11 11:43:51', '2020-08-11 11:44:58', '2020-08-11 11:44:58'),
(344, 64, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-11 11:44:58', '2020-08-11 11:45:46', '2020-08-11 11:45:46'),
(345, 64, 4, 9.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-11 11:44:58', '2020-08-11 11:45:46', '2020-08-11 11:45:46'),
(346, 64, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-11 11:45:46', '2020-08-11 11:46:29', '2020-08-11 11:46:29'),
(347, 64, 4, 9.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-11 11:45:46', '2020-08-11 11:46:29', '2020-08-11 11:46:29'),
(348, 64, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-11 11:46:29', '2020-08-11 11:46:45', '2020-08-11 11:46:45'),
(349, 64, 4, 9.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-11 11:46:29', '2020-08-11 11:46:45', '2020-08-11 11:46:45'),
(350, 64, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-11 11:46:45', '2020-08-11 11:51:02', '2020-08-11 11:51:02'),
(351, 64, 4, 9.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-11 11:46:45', '2020-08-11 11:51:02', '2020-08-11 11:51:02'),
(352, 64, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-11 11:51:02', '2020-08-11 12:01:37', '2020-08-11 12:01:37'),
(353, 64, 4, 9.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-11 11:51:02', '2020-08-11 12:01:37', '2020-08-11 12:01:37'),
(354, 64, 6, 1600.0, 0.0, 0.0, 0.0, 0.0, '2020-08-11', '2020-08-11 11:51:02', '2020-08-11 12:01:37', '2020-08-11 12:01:37'),
(355, 64, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-11 12:01:37', '2020-08-11 12:02:16', '2020-08-11 12:02:16'),
(356, 64, 4, 9.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-11 12:01:37', '2020-08-11 12:02:16', '2020-08-11 12:02:16'),
(357, 64, 6, 1600.0, 0.0, 0.0, 0.0, 0.0, '2020-08-11', '2020-08-11 12:01:37', '2020-08-11 12:02:16', '2020-08-11 12:02:16'),
(358, 64, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-11 12:02:16', '2020-08-11 12:05:32', '2020-08-11 12:05:32'),
(359, 64, 4, 9.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-11 12:02:16', '2020-08-11 12:05:32', '2020-08-11 12:05:32'),
(360, 64, 6, 1600.0, 0.0, 0.0, 0.0, 0.0, '2020-08-11', '2020-08-11 12:02:16', '2020-08-11 12:05:32', '2020-08-11 12:05:32'),
(361, 64, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-11 12:05:32', '2020-08-11 12:05:38', '2020-08-11 12:05:38'),
(362, 64, 4, 9.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-11 12:05:32', '2020-08-11 12:05:38', '2020-08-11 12:05:38'),
(363, 64, 6, 1600.0, 0.0, 0.0, 0.0, 0.0, '2020-08-11', '2020-08-11 12:05:32', '2020-08-11 12:05:38', '2020-08-11 12:05:38'),
(364, 64, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-11 12:05:38', '2020-08-11 12:06:16', '2020-08-11 12:06:16'),
(365, 64, 4, 9.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-11 12:05:38', '2020-08-11 12:06:16', '2020-08-11 12:06:16'),
(366, 64, 6, 1600.0, 0.0, 0.0, 0.0, 0.0, '2020-08-11', '2020-08-11 12:05:38', '2020-08-11 12:06:16', '2020-08-11 12:06:16'),
(367, 64, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-11 12:06:16', '2020-08-11 12:35:40', '2020-08-11 12:35:40'),
(368, 64, 4, 9.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-11 12:06:16', '2020-08-11 12:35:40', '2020-08-11 12:35:40'),
(369, 64, 6, 1600.0, 0.0, 0.0, 0.0, 0.0, '2020-08-11', '2020-08-11 12:06:16', '2020-08-11 12:35:40', '2020-08-11 12:35:40'),
(370, 64, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-11 12:35:40', '2020-08-11 13:30:20', '2020-08-11 13:30:20'),
(371, 64, 4, 9.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-11 12:35:40', '2020-08-11 13:30:20', '2020-08-11 13:30:20'),
(372, 64, 6, 1600.0, 0.0, 0.0, 0.0, 0.0, '2020-08-11', '2020-08-11 12:35:40', '2020-08-11 13:30:20', '2020-08-11 13:30:20'),
(373, 58, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-01', '2020-08-11 12:44:43', '2020-08-11 12:51:49', '2020-08-11 12:51:49'),
(374, 58, 4, 130.0, 0.0, 0.0, 0.0, 0.0, '2020-08-07', '2020-08-11 12:44:43', '2020-08-11 12:51:49', '2020-08-11 12:51:49'),
(375, 58, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-01', '2020-08-11 12:51:49', '2020-08-11 13:02:21', '2020-08-11 13:02:21'),
(376, 58, 4, 130.0, 0.0, 0.0, 0.0, 0.0, '2020-08-07', '2020-08-11 12:51:49', '2020-08-11 13:02:21', '2020-08-11 13:02:21'),
(377, 58, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-01', '2020-08-11 13:02:21', '2020-08-11 13:32:22', '2020-08-11 13:32:22'),
(378, 58, 4, 130.0, 0.0, 0.0, 0.0, 0.0, '2020-08-07', '2020-08-11 13:02:21', '2020-08-11 13:32:22', '2020-08-11 13:32:22'),
(379, 64, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-11 13:30:21', '2020-08-11 13:31:14', '2020-08-11 13:31:14'),
(380, 64, 4, 9.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-11 13:30:21', '2020-08-11 13:31:14', '2020-08-11 13:31:14'),
(381, 64, 6, 1600.0, 0.0, 0.0, 0.0, 0.0, '2020-08-11', '2020-08-11 13:30:21', '2020-08-11 13:31:14', '2020-08-11 13:31:14'),
(382, 64, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-11 13:31:14', '2020-08-11 13:33:42', '2020-08-11 13:33:42'),
(383, 64, 4, 9.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-11 13:31:14', '2020-08-11 13:33:42', '2020-08-11 13:33:42'),
(384, 64, 6, 1600.0, 0.0, 0.0, 0.0, 0.0, '2020-08-11', '2020-08-11 13:31:14', '2020-08-11 13:33:42', '2020-08-11 13:33:42'),
(385, 58, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-01', '2020-08-11 13:32:22', '2020-09-15 05:04:38', '2020-09-15 05:04:38'),
(386, 58, 4, 130.0, 0.0, 0.0, 0.0, 0.0, '2020-08-07', '2020-08-11 13:32:22', '2020-09-15 05:04:38', '2020-09-15 05:04:38'),
(387, 64, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-11 13:33:42', '2020-08-11 13:41:04', '2020-08-11 13:41:04'),
(388, 64, 4, 9.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-11 13:33:42', '2020-08-11 13:41:04', '2020-08-11 13:41:04'),
(389, 64, 6, 1600.0, 0.0, 0.0, 0.0, 0.0, '2020-08-11', '2020-08-11 13:33:42', '2020-08-11 13:41:04', '2020-08-11 13:41:04'),
(390, 64, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-11 13:41:04', '2020-08-11 13:41:32', '2020-08-11 13:41:32'),
(391, 64, 4, 9.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-11 13:41:04', '2020-08-11 13:41:32', '2020-08-11 13:41:32'),
(392, 64, 6, 1600.0, 0.0, 0.0, 0.0, 0.0, '2020-08-11', '2020-08-11 13:41:04', '2020-08-11 13:41:32', '2020-08-11 13:41:32'),
(393, 64, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-11 13:41:32', '2020-08-11 14:03:24', '2020-08-11 14:03:24'),
(394, 64, 4, 9.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-11 13:41:32', '2020-08-11 14:03:24', '2020-08-11 14:03:24'),
(395, 64, 6, 1600.0, 0.0, 0.0, 0.0, 0.0, '2020-08-11', '2020-08-11 13:41:32', '2020-08-11 14:03:24', '2020-08-11 14:03:24'),
(396, 64, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-11 14:03:24', '2020-08-23 15:36:14', '2020-08-23 15:36:14'),
(397, 64, 4, 9.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-11 14:03:24', '2020-08-23 15:36:14', '2020-08-23 15:36:14'),
(398, 64, 6, 1600.0, 0.0, 0.0, 0.0, 0.0, '2020-08-11', '2020-08-11 14:03:24', '2020-08-23 15:36:14', '2020-08-23 15:36:14'),
(399, 67, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-12', '2020-08-12 10:04:52', '2020-08-12 10:22:08', '2020-08-12 10:22:08'),
(400, 67, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-12', '2020-08-12 10:22:08', '2020-08-12 10:42:07', '2020-08-12 10:42:07'),
(401, 67, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-12', '2020-08-12 10:42:07', '2020-08-12 11:02:39', '2020-08-12 11:02:39'),
(402, 67, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-12', '2020-08-12 11:02:39', '2020-08-12 12:45:30', '2020-08-12 12:45:30'),
(403, 67, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-12', '2020-08-12 12:45:30', '2020-08-12 12:45:30', NULL),
(404, 68, 2, 30.0, 0.0, 0.0, 0.0, 0.0, '2020-08-12', '2020-08-12 20:18:29', '2020-08-12 20:19:16', '2020-08-12 20:19:16'),
(405, 68, 4, 8.0, 0.0, 0.0, 0.0, 0.0, '2020-08-12', '2020-08-12 20:18:29', '2020-08-12 20:19:16', '2020-08-12 20:19:16'),
(406, 68, 2, 30.0, 0.0, 0.0, 0.0, 0.0, '2020-08-12', '2020-08-12 20:19:16', '2020-08-12 20:19:16', NULL),
(407, 68, 4, 8.0, 0.0, 0.0, 0.0, 0.0, '2020-08-12', '2020-08-12 20:19:16', '2020-08-12 20:19:16', NULL),
(408, 69, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-14', '2020-08-14 09:17:24', '2020-08-14 09:23:57', '2020-08-14 09:23:57'),
(409, 69, 6, 90.0, 0.0, 0.0, 0.0, 0.0, '2020-08-14', '2020-08-14 09:17:24', '2020-08-14 09:23:57', '2020-08-14 09:23:57'),
(410, 69, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-14', '2020-08-14 09:23:57', '2020-08-14 09:23:57', NULL),
(411, 69, 6, 90.0, 0.0, 0.0, 0.0, 0.0, '2020-08-14', '2020-08-14 09:23:57', '2020-08-14 09:23:57', NULL),
(412, 64, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-23 15:36:14', '2020-08-23 15:37:43', '2020-08-23 15:37:43'),
(413, 64, 4, 9.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-23 15:36:14', '2020-08-23 15:37:43', '2020-08-23 15:37:43'),
(414, 64, 6, 1600.0, 0.0, 0.0, 0.0, 0.0, '2020-08-11', '2020-08-23 15:36:14', '2020-08-23 15:37:43', '2020-08-23 15:37:43'),
(415, 64, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-23 15:37:43', '2020-08-23 15:39:27', '2020-08-23 15:39:27'),
(416, 64, 4, 9.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-23 15:37:43', '2020-08-23 15:39:27', '2020-08-23 15:39:27'),
(417, 64, 6, 1600.0, 0.0, 0.0, 0.0, 0.0, '2020-08-11', '2020-08-23 15:37:43', '2020-08-23 15:39:27', '2020-08-23 15:39:27'),
(418, 64, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-23 15:39:27', '2020-08-23 15:40:21', '2020-08-23 15:40:21'),
(419, 64, 4, 9.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-23 15:39:27', '2020-08-23 15:40:21', '2020-08-23 15:40:21'),
(420, 64, 6, 1600.0, 0.0, 0.0, 0.0, 0.0, '2020-08-11', '2020-08-23 15:39:27', '2020-08-23 15:40:21', '2020-08-23 15:40:21'),
(421, 64, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-23 15:40:21', '2020-08-23 15:41:02', '2020-08-23 15:41:02'),
(422, 64, 4, 9.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-23 15:40:21', '2020-08-23 15:41:02', '2020-08-23 15:41:02'),
(423, 64, 6, 1600.0, 0.0, 0.0, 0.0, 0.0, '2020-08-11', '2020-08-23 15:40:21', '2020-08-23 15:41:02', '2020-08-23 15:41:02'),
(424, 64, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-23 15:41:02', '2020-08-23 15:46:13', '2020-08-23 15:46:13'),
(425, 64, 4, 9.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-23 15:41:02', '2020-08-23 15:46:13', '2020-08-23 15:46:13'),
(426, 64, 6, 1600.0, 0.0, 0.0, 0.0, 0.0, '2020-08-11', '2020-08-23 15:41:02', '2020-08-23 15:46:13', '2020-08-23 15:46:13'),
(427, 64, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-23 15:46:13', '2020-09-08 12:45:49', '2020-09-08 12:45:49'),
(428, 64, 4, 9.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-08-23 15:46:13', '2020-09-08 12:45:49', '2020-09-08 12:45:49'),
(429, 64, 6, 1600.0, 0.0, 0.0, 0.0, 0.0, '2020-08-11', '2020-08-23 15:46:13', '2020-09-08 12:45:49', '2020-09-08 12:45:49'),
(430, 70, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-27', '2020-08-27 21:23:55', '2020-08-27 21:26:29', '2020-08-27 21:26:29'),
(431, 70, 4, 8.5, 0.0, 0.0, 0.0, 0.0, '2020-08-27', '2020-08-27 21:23:55', '2020-08-27 21:26:29', '2020-08-27 21:26:29'),
(432, 70, 6, 1600.0, 0.0, 0.0, 0.0, 0.0, '2020-08-27', '2020-08-27 21:23:55', '2020-08-27 21:26:29', '2020-08-27 21:26:29'),
(433, 70, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-27', '2020-08-27 21:26:29', '2020-08-27 21:27:01', '2020-08-27 21:27:01'),
(434, 70, 4, 8.5, 0.0, 0.0, 0.0, 0.0, '2020-08-27', '2020-08-27 21:26:29', '2020-08-27 21:27:01', '2020-08-27 21:27:01'),
(435, 70, 6, 1600.0, 0.0, 0.0, 0.0, 0.0, '2020-08-27', '2020-08-27 21:26:29', '2020-08-27 21:27:01', '2020-08-27 21:27:01'),
(436, 70, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-27', '2020-08-27 21:27:01', '2020-08-27 21:27:29', '2020-08-27 21:27:29'),
(437, 70, 4, 8.5, 0.0, 0.0, 0.0, 0.0, '2020-08-27', '2020-08-27 21:27:01', '2020-08-27 21:27:29', '2020-08-27 21:27:29'),
(438, 70, 6, 1600.0, 0.0, 0.0, 0.0, 0.0, '2020-08-27', '2020-08-27 21:27:01', '2020-08-27 21:27:29', '2020-08-27 21:27:29'),
(439, 70, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-27', '2020-08-27 21:27:29', '2020-08-27 21:27:29', NULL),
(440, 70, 4, 8.5, 0.0, 0.0, 0.0, 0.0, '2020-08-27', '2020-08-27 21:27:29', '2020-08-27 21:27:29', NULL),
(441, 70, 6, 1600.0, 0.0, 0.0, 0.0, 0.0, '2020-08-27', '2020-08-27 21:27:29', '2020-08-27 21:27:29', NULL),
(442, 64, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-09-08 12:45:49', '2020-09-10 13:39:46', '2020-09-10 13:39:46'),
(443, 64, 4, 9.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-09-08 12:45:49', '2020-09-10 13:39:46', '2020-09-10 13:39:46'),
(444, 64, 6, 1600.0, 0.0, 0.0, 0.0, 0.0, '2020-08-11', '2020-09-08 12:45:49', '2020-09-10 13:39:46', '2020-09-10 13:39:46'),
(445, 64, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-09-10 13:39:46', '2020-09-14 08:39:37', '2020-09-14 08:39:37'),
(446, 64, 4, 9.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-09-10 13:39:46', '2020-09-14 08:39:37', '2020-09-14 08:39:37'),
(447, 64, 6, 1600.0, 0.0, 0.0, 0.0, 0.0, '2020-08-11', '2020-09-10 13:39:46', '2020-09-14 08:39:37', '2020-09-14 08:39:37'),
(448, 64, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-09-14 08:39:37', '2020-09-16 07:33:32', '2020-09-16 07:33:32'),
(449, 64, 4, 9.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-09-14 08:39:37', '2020-09-16 07:33:32', '2020-09-16 07:33:32'),
(450, 64, 6, 1600.0, 0.0, 0.0, 0.0, 0.0, '2020-08-11', '2020-09-14 08:39:37', '2020-09-16 07:33:32', '2020-09-16 07:33:32'),
(451, 58, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-01', '2020-09-15 05:04:38', '2020-09-15 05:05:10', '2020-09-15 05:05:10'),
(452, 58, 4, 130.0, 0.0, 0.0, 0.0, 0.0, '2020-08-07', '2020-09-15 05:04:38', '2020-09-15 05:05:10', '2020-09-15 05:05:10'),
(453, 58, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-01', '2020-09-15 05:05:10', '2020-09-15 05:06:32', '2020-09-15 05:06:32'),
(454, 58, 4, 130.0, 0.0, 0.0, 0.0, 0.0, '2020-08-07', '2020-09-15 05:05:10', '2020-09-15 05:06:32', '2020-09-15 05:06:32'),
(455, 58, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-01', '2020-09-15 05:06:32', '2020-09-15 05:09:41', '2020-09-15 05:09:41'),
(456, 58, 4, 130.0, 0.0, 0.0, 0.0, 0.0, '2020-08-07', '2020-09-15 05:06:32', '2020-09-15 05:09:41', '2020-09-15 05:09:41'),
(457, 58, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-01', '2020-09-15 05:09:41', '2020-09-15 05:11:01', '2020-09-15 05:11:01'),
(458, 58, 4, 130.0, 0.0, 0.0, 0.0, 0.0, '2020-08-07', '2020-09-15 05:09:41', '2020-09-15 05:11:01', '2020-09-15 05:11:01'),
(459, 58, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-01', '2020-09-15 05:11:01', '2020-09-16 06:22:18', '2020-09-16 06:22:18'),
(460, 58, 4, 130.0, 0.0, 0.0, 0.0, 0.0, '2020-08-07', '2020-09-15 05:11:01', '2020-09-16 06:22:18', '2020-09-16 06:22:18'),
(461, 58, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-01', '2020-09-16 06:22:18', '2021-01-18 03:59:19', '2021-01-18 03:59:19'),
(462, 58, 4, 130.0, 0.0, 0.0, 0.0, 0.0, '2020-08-07', '2020-09-16 06:22:18', '2021-01-18 03:59:19', '2021-01-18 03:59:19'),
(463, 71, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-09-16', '2020-09-16 06:49:52', '2020-09-16 06:54:13', '2020-09-16 06:54:13'),
(464, 71, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-09-16', '2020-09-16 06:54:13', '2020-09-16 06:54:13', NULL),
(465, 64, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-09-16 07:33:32', '2020-09-16 12:13:38', '2020-09-16 12:13:38'),
(466, 64, 4, 9.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-09-16 07:33:32', '2020-09-16 12:13:38', '2020-09-16 12:13:38'),
(467, 64, 6, 1600.0, 0.0, 0.0, 0.0, 0.0, '2020-08-11', '2020-09-16 07:33:32', '2020-09-16 12:13:38', '2020-09-16 12:13:38'),
(468, 74, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-09-16', '2020-09-16 12:05:50', '2020-09-16 12:07:33', '2020-09-16 12:07:33'),
(469, 74, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-09-16', '2020-09-16 12:07:33', '2020-09-16 12:07:33', NULL),
(470, 75, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-09-16', '2020-09-16 12:10:45', '2020-09-16 12:10:45', NULL),
(471, 64, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-09-16 12:13:38', '2020-09-23 14:08:56', '2020-09-23 14:08:56'),
(472, 64, 4, 9.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-09-16 12:13:39', '2020-09-23 14:08:56', '2020-09-23 14:08:56'),
(473, 64, 6, 1600.0, 0.0, 0.0, 0.0, 0.0, '2020-08-11', '2020-09-16 12:13:39', '2020-09-23 14:08:56', '2020-09-23 14:08:56'),
(474, 64, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-09-23 14:08:56', '2020-09-23 14:09:58', '2020-09-23 14:09:58'),
(475, 64, 4, 9.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-09-23 14:08:56', '2020-09-23 14:09:58', '2020-09-23 14:09:58'),
(476, 64, 6, 1600.0, 0.0, 0.0, 0.0, 0.0, '2020-08-11', '2020-09-23 14:08:56', '2020-09-23 14:09:58', '2020-09-23 14:09:58'),
(477, 64, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-09-23 14:09:58', '2020-12-11 06:42:59', '2020-12-11 06:42:59'),
(478, 64, 4, 9.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-09-23 14:09:58', '2020-12-11 06:42:59', '2020-12-11 06:42:59'),
(479, 64, 6, 1600.0, 0.0, 0.0, 0.0, 0.0, '2020-08-11', '2020-09-23 14:09:58', '2020-12-11 06:42:59', '2020-12-11 06:42:59'),
(480, 77, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-09-26', '2020-09-26 04:47:38', '2020-09-26 04:47:38', NULL),
(481, 78, 4, 8.0, 0.0, 0.0, 0.0, 0.0, '2020-09-26', '2020-09-26 13:10:31', '2020-09-26 13:10:31', NULL),
(482, 79, 4, 8.5, 0.0, 0.0, 0.0, 0.0, '2020-09-26', '2020-09-26 13:15:05', '2020-09-26 13:15:05', NULL),
(483, 80, 4, 7.0, 0.0, 0.0, 0.0, 0.0, '2020-09-26', '2020-09-26 13:19:27', '2020-09-26 13:19:27', NULL),
(484, 83, 4, 6.5, 0.0, 0.0, 0.0, 0.0, '2020-11-04', '2020-11-04 11:02:52', '2020-11-04 11:02:52', NULL),
(485, 86, 4, 8.0, 0.0, 0.0, 0.0, 0.0, '2020-11-26', '2020-11-26 10:21:11', '2020-11-26 10:21:11', NULL),
(486, 64, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-12-11 06:42:59', '2020-12-11 06:44:02', '2020-12-11 06:44:02'),
(487, 64, 4, 9.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-12-11 06:42:59', '2020-12-11 06:44:02', '2020-12-11 06:44:02'),
(488, 64, 6, 1600.0, 0.0, 0.0, 0.0, 0.0, '2020-08-11', '2020-12-11 06:42:59', '2020-12-11 06:44:02', '2020-12-11 06:44:02'),
(489, 64, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-12-11 06:44:02', '2020-12-21 15:20:47', '2020-12-21 15:20:47'),
(490, 64, 4, 9.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-12-11 06:44:02', '2020-12-21 15:20:47', '2020-12-21 15:20:47'),
(491, 64, 6, 1600.0, 0.0, 0.0, 0.0, 0.0, '2020-08-11', '2020-12-11 06:44:02', '2020-12-21 15:20:47', '2020-12-21 15:20:47'),
(492, 64, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-12-21 15:20:47', '2020-12-23 16:32:46', '2020-12-23 16:32:46'),
(493, 64, 4, 9.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-12-21 15:20:47', '2020-12-23 16:32:46', '2020-12-23 16:32:46'),
(494, 64, 6, 1600.0, 0.0, 0.0, 0.0, 0.0, '2020-08-11', '2020-12-21 15:20:47', '2020-12-23 16:32:46', '2020-12-23 16:32:46'),
(495, 88, 6, 1320.0, 0.0, 0.0, 0.0, 0.0, '2020-12-23', '2020-12-23 16:31:30', '2020-12-23 16:31:30', NULL),
(496, 64, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-12-23 16:32:46', '2020-12-28 07:40:42', '2020-12-28 07:40:42'),
(497, 64, 4, 9.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-12-23 16:32:46', '2020-12-28 07:40:42', '2020-12-28 07:40:42'),
(498, 64, 6, 1600.0, 0.0, 0.0, 0.0, 0.0, '2020-08-11', '2020-12-23 16:32:46', '2020-12-28 07:40:42', '2020-12-28 07:40:42'),
(499, 64, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-12-28 07:40:42', '2020-12-28 07:40:42', NULL),
(500, 64, 4, 9.0, 0.0, 0.0, 0.0, 0.0, '2020-08-10', '2020-12-28 07:40:42', '2020-12-28 07:40:42', NULL),
(501, 64, 6, 1600.0, 0.0, 0.0, 0.0, 0.0, '2020-08-11', '2020-12-28 07:40:42', '2020-12-28 07:40:42', NULL),
(502, 89, 4, 8.0, 0.0, 0.0, 0.0, 0.0, '2020-12-28', '2020-12-28 09:05:46', '2020-12-28 09:05:46', NULL),
(503, 90, 2, 100.0, 0.0, 0.0, 0.0, 0.0, '2021-01-04', '2021-01-04 17:27:37', '2021-01-04 17:29:18', '2021-01-04 17:29:18'),
(504, 90, 2, 100.0, 0.0, 0.0, 0.0, 0.0, '2021-01-04', '2021-01-04 17:29:18', '2021-01-04 17:30:41', '2021-01-04 17:30:41'),
(505, 90, 6, 1400.0, 0.0, 0.0, 0.0, 0.0, '2021-01-04', '2021-01-04 17:29:18', '2021-01-04 17:30:41', '2021-01-04 17:30:41'),
(506, 90, 2, 100.0, 0.0, 0.0, 0.0, 0.0, '2021-01-04', '2021-01-04 17:30:41', '2021-01-04 17:35:03', '2021-01-04 17:35:03'),
(507, 90, 6, 1400.0, 0.0, 0.0, 0.0, 0.0, '2021-01-04', '2021-01-04 17:30:41', '2021-01-04 17:35:03', '2021-01-04 17:35:03'),
(508, 90, 2, 100.0, 0.0, 0.0, 0.0, 0.0, '2021-01-04', '2021-01-04 17:35:03', '2021-01-05 14:48:14', '2021-01-05 14:48:14'),
(509, 90, 6, 1400.0, 0.0, 0.0, 0.0, 0.0, '2021-01-04', '2021-01-04 17:35:03', '2021-01-05 14:48:14', '2021-01-05 14:48:14'),
(510, 90, 2, 100.0, 0.0, 0.0, 0.0, 0.0, '2021-01-04', '2021-01-05 14:48:14', '2021-01-05 14:49:55', '2021-01-05 14:49:55'),
(511, 90, 6, 1400.0, 0.0, 0.0, 0.0, 0.0, '2021-01-04', '2021-01-05 14:48:14', '2021-01-05 14:49:55', '2021-01-05 14:49:55'),
(512, 90, 2, 100.0, 0.0, 0.0, 0.0, 0.0, '2021-01-04', '2021-01-05 14:49:55', '2021-01-05 14:51:28', '2021-01-05 14:51:28'),
(513, 90, 4, 7.0, 0.0, 0.0, 0.0, 0.0, '2021-01-05', '2021-01-05 14:49:55', '2021-01-05 14:51:28', '2021-01-05 14:51:28'),
(514, 90, 6, 1400.0, 0.0, 0.0, 0.0, 0.0, '2021-01-04', '2021-01-05 14:49:55', '2021-01-05 14:51:28', '2021-01-05 14:51:28'),
(515, 90, 2, 100.0, 0.0, 0.0, 0.0, 0.0, '2021-01-04', '2021-01-05 14:51:28', '2021-01-26 05:38:50', '2021-01-26 05:38:50'),
(516, 90, 6, 1400.0, 0.0, 0.0, 0.0, 0.0, '2021-01-04', '2021-01-05 14:51:28', '2021-01-26 05:38:50', '2021-01-26 05:38:50'),
(517, 58, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-01', '2021-01-18 03:59:19', '2021-01-18 04:00:42', '2021-01-18 04:00:42'),
(518, 58, 4, 130.0, 0.0, 0.0, 0.0, 0.0, '2020-08-07', '2021-01-18 03:59:19', '2021-01-18 04:00:42', '2021-01-18 04:00:42'),
(519, 58, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-01', '2021-01-18 04:00:42', '2021-02-11 11:06:44', '2021-02-11 11:06:44'),
(520, 58, 4, 130.0, 0.0, 0.0, 0.0, 0.0, '2020-08-07', '2021-01-18 04:00:42', '2021-02-11 11:06:44', '2021-02-11 11:06:44'),
(521, 90, 2, 100.0, 0.0, 0.0, 0.0, 0.0, '2021-01-04', '2021-01-26 05:38:50', '2021-02-10 07:55:12', '2021-02-10 07:55:12'),
(522, 90, 6, 1400.0, 0.0, 0.0, 0.0, 0.0, '2021-01-04', '2021-01-26 05:38:51', '2021-02-10 07:55:12', '2021-02-10 07:55:12'),
(523, 91, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2021-02-06', '2021-02-06 10:28:28', '2021-02-06 10:28:28', NULL),
(524, 90, 2, 100.0, 0.0, 0.0, 0.0, 0.0, '2021-01-04', '2021-02-10 07:55:12', '2021-02-10 07:56:23', '2021-02-10 07:56:23'),
(525, 90, 6, 1400.0, 0.0, 0.0, 0.0, 0.0, '2021-01-04', '2021-02-10 07:55:13', '2021-02-10 07:56:23', '2021-02-10 07:56:23'),
(526, 90, 2, 100.0, 0.0, 0.0, 0.0, 0.0, '2021-01-04', '2021-02-10 07:56:23', '2021-02-10 08:08:41', '2021-02-10 08:08:41'),
(527, 90, 6, 1400.0, 0.0, 0.0, 0.0, 0.0, '2021-01-04', '2021-02-10 07:56:23', '2021-02-10 08:08:41', '2021-02-10 08:08:41'),
(528, 90, 2, 100.0, 0.0, 0.0, 0.0, 0.0, '2021-01-04', '2021-02-10 08:08:41', '2021-02-10 10:10:00', '2021-02-10 10:10:00'),
(529, 90, 6, 1400.0, 0.0, 0.0, 0.0, 0.0, '2021-01-04', '2021-02-10 08:08:41', '2021-02-10 10:10:00', '2021-02-10 10:10:00'),
(530, 90, 2, 100.0, 0.0, 0.0, 0.0, 0.0, '2021-01-04', '2021-02-10 10:10:00', '2021-02-10 10:10:07', '2021-02-10 10:10:07'),
(531, 90, 6, 1400.0, 0.0, 0.0, 0.0, 0.0, '2021-01-04', '2021-02-10 10:10:00', '2021-02-10 10:10:07', '2021-02-10 10:10:07'),
(532, 90, 2, 100.0, 0.0, 0.0, 0.0, 0.0, '2021-01-04', '2021-02-10 10:10:07', '2021-02-10 10:10:07', NULL),
(533, 90, 6, 1400.0, 0.0, 0.0, 0.0, 0.0, '2021-01-04', '2021-02-10 10:10:07', '2021-02-10 10:10:07', NULL),
(534, 58, 2, 120.0, 0.0, 0.0, 0.0, 0.0, '2020-08-01', '2021-02-11 11:06:44', '2021-02-11 11:06:44', NULL),
(535, 58, 4, 130.0, 0.0, 0.0, 0.0, 0.0, '2020-08-07', '2021-02-11 11:06:44', '2021-02-11 11:06:44', NULL);

-- --------------------------------------------------------

--
-- টেবলের জন্য টেবলের গঠন `user_test_score_details`
--

CREATE TABLE `user_test_score_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `score_id` bigint(20) UNSIGNED DEFAULT NULL,
  `subsection_id` bigint(20) UNSIGNED DEFAULT NULL,
  `score` double(8,1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- টেবলের জন্য তথ্য স্তুপ করছি `user_test_score_details`
--

INSERT INTO `user_test_score_details` (`id`, `score_id`, `subsection_id`, `score`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 305, 4, 100.0, '2020-08-07 08:33:52', '2020-08-07 08:33:52', NULL),
(2, 306, 4, 60.0, '2020-08-07 08:35:30', '2020-08-07 08:35:30', NULL),
(3, 307, 4, 60.0, '2020-08-07 08:45:00', '2020-08-07 08:45:00', NULL),
(4, 308, 3, 60.0, '2020-08-07 08:47:11', '2020-08-07 08:47:11', NULL),
(5, 308, 4, 60.0, '2020-08-07 08:47:11', '2020-08-07 08:47:11', NULL),
(6, 309, 3, 40.0, '2020-08-07 09:33:57', '2020-08-07 09:33:57', NULL),
(7, 309, 4, 80.0, '2020-08-07 09:33:57', '2020-08-07 09:33:57', NULL),
(8, 310, 3, 60.0, '2020-08-07 09:57:29', '2020-08-07 09:57:29', NULL),
(9, 310, 4, 60.0, '2020-08-07 09:57:29', '2020-08-07 09:57:29', NULL),
(10, 311, 9, 130.0, '2020-08-07 09:57:29', '2020-08-07 09:57:29', NULL),
(11, 312, 3, 60.0, '2020-08-07 16:41:32', '2020-08-07 16:41:32', NULL),
(12, 312, 4, 60.0, '2020-08-07 16:41:32', '2020-08-07 16:41:32', NULL),
(13, 313, 9, 130.0, '2020-08-07 16:41:32', '2020-08-07 16:41:32', NULL),
(14, 314, 5, 15.0, '2020-08-07 16:41:32', '2020-08-07 16:41:32', NULL),
(15, 314, 6, 15.0, '2020-08-07 16:41:32', '2020-08-07 16:41:32', NULL),
(16, 314, 7, 15.0, '2020-08-07 16:41:32', '2020-08-07 16:41:32', NULL),
(17, 314, 8, 15.0, '2020-08-07 16:41:32', '2020-08-07 16:41:32', NULL),
(18, 315, 3, 60.0, '2020-08-07 17:02:16', '2020-08-07 17:02:16', NULL),
(19, 315, 4, 60.0, '2020-08-07 17:02:16', '2020-08-07 17:02:16', NULL),
(20, 316, 9, 130.0, '2020-08-07 17:02:16', '2020-08-07 17:02:16', NULL),
(21, 317, 5, 15.0, '2020-08-07 17:02:16', '2020-08-07 17:02:16', NULL),
(22, 317, 6, 15.0, '2020-08-07 17:02:16', '2020-08-07 17:02:16', NULL),
(23, 317, 7, 15.0, '2020-08-07 17:02:16', '2020-08-07 17:02:16', NULL),
(24, 317, 8, 15.0, '2020-08-07 17:02:16', '2020-08-07 17:02:16', NULL),
(25, 318, 3, 60.0, '2020-08-08 08:08:13', '2020-08-08 08:08:13', NULL),
(26, 318, 4, 60.0, '2020-08-08 08:08:13', '2020-08-08 08:08:13', NULL),
(27, 319, 9, 130.0, '2020-08-08 08:08:13', '2020-08-08 08:08:13', NULL),
(28, 320, 3, 30.0, '2020-08-10 07:58:06', '2020-08-10 07:58:06', NULL),
(29, 320, 4, 30.0, '2020-08-10 07:58:06', '2020-08-10 07:58:06', NULL),
(30, 320, 10, 30.0, '2020-08-10 07:58:06', '2020-08-10 07:58:06', NULL),
(31, 320, 11, 30.0, '2020-08-10 07:58:06', '2020-08-10 07:58:06', NULL),
(32, 321, 9, 30.0, '2020-08-10 07:58:06', '2020-08-10 07:58:06', NULL),
(33, 321, 12, 30.0, '2020-08-10 07:58:06', '2020-08-10 07:58:06', NULL),
(34, 321, 13, 30.0, '2020-08-10 07:58:06', '2020-08-10 07:58:06', NULL),
(35, 321, 14, 40.0, '2020-08-10 07:58:06', '2020-08-10 07:58:06', NULL),
(36, 322, 3, 30.0, '2020-08-10 15:36:15', '2020-08-10 15:36:15', NULL),
(37, 322, 4, 30.0, '2020-08-10 15:36:15', '2020-08-10 15:36:15', NULL),
(38, 322, 10, 30.0, '2020-08-10 15:36:15', '2020-08-10 15:36:15', NULL),
(39, 322, 11, 30.0, '2020-08-10 15:36:15', '2020-08-10 15:36:15', NULL),
(40, 323, 9, 30.0, '2020-08-10 15:36:15', '2020-08-10 15:36:15', NULL),
(41, 323, 12, 30.0, '2020-08-10 15:36:15', '2020-08-10 15:36:15', NULL),
(42, 323, 13, 30.0, '2020-08-10 15:36:15', '2020-08-10 15:36:15', NULL),
(43, 323, 14, 40.0, '2020-08-10 15:36:15', '2020-08-10 15:36:15', NULL),
(44, 324, 3, 30.0, '2020-08-10 17:34:26', '2020-08-10 17:34:26', NULL),
(45, 324, 4, 30.0, '2020-08-10 17:34:26', '2020-08-10 17:34:26', NULL),
(46, 324, 10, 30.0, '2020-08-10 17:34:26', '2020-08-10 17:34:26', NULL),
(47, 324, 11, 30.0, '2020-08-10 17:34:26', '2020-08-10 17:34:26', NULL),
(48, 325, 9, 9.0, '2020-08-10 17:34:26', '2020-08-10 17:34:26', NULL),
(49, 325, 12, 9.0, '2020-08-10 17:34:26', '2020-08-10 17:34:26', NULL),
(50, 325, 13, 9.0, '2020-08-10 17:34:26', '2020-08-10 17:34:26', NULL),
(51, 325, 14, 9.0, '2020-08-10 17:34:26', '2020-08-10 17:34:26', NULL),
(52, 326, 3, 30.0, '2020-08-10 17:40:29', '2020-08-10 17:40:29', NULL),
(53, 326, 4, 30.0, '2020-08-10 17:40:29', '2020-08-10 17:40:29', NULL),
(54, 326, 10, 30.0, '2020-08-10 17:40:29', '2020-08-10 17:40:29', NULL),
(55, 326, 11, 30.0, '2020-08-10 17:40:29', '2020-08-10 17:40:29', NULL),
(56, 327, 9, 9.0, '2020-08-10 17:40:29', '2020-08-10 17:40:29', NULL),
(57, 327, 12, 9.0, '2020-08-10 17:40:29', '2020-08-10 17:40:29', NULL),
(58, 327, 13, 9.0, '2020-08-10 17:40:29', '2020-08-10 17:40:29', NULL),
(59, 327, 14, 9.0, '2020-08-10 17:40:29', '2020-08-10 17:40:29', NULL),
(60, 328, 3, 30.0, '2020-08-10 17:48:58', '2020-08-10 17:48:58', NULL),
(61, 328, 4, 30.0, '2020-08-10 17:48:58', '2020-08-10 17:48:58', NULL),
(62, 328, 10, 30.0, '2020-08-10 17:48:58', '2020-08-10 17:48:58', NULL),
(63, 328, 11, 30.0, '2020-08-10 17:48:58', '2020-08-10 17:48:58', NULL),
(64, 329, 9, 9.0, '2020-08-10 17:48:58', '2020-08-10 17:48:58', NULL),
(65, 329, 12, 9.0, '2020-08-10 17:48:58', '2020-08-10 17:48:58', NULL),
(66, 329, 13, 9.0, '2020-08-10 17:48:58', '2020-08-10 17:48:58', NULL),
(67, 329, 14, 9.0, '2020-08-10 17:48:58', '2020-08-10 17:48:58', NULL),
(68, 330, 3, 30.0, '2020-08-11 09:04:53', '2020-08-11 09:04:53', NULL),
(69, 330, 4, 30.0, '2020-08-11 09:04:53', '2020-08-11 09:04:53', NULL),
(70, 330, 10, 30.0, '2020-08-11 09:04:53', '2020-08-11 09:04:53', NULL),
(71, 330, 11, 30.0, '2020-08-11 09:04:53', '2020-08-11 09:04:53', NULL),
(72, 331, 9, 9.0, '2020-08-11 09:04:53', '2020-08-11 09:04:53', NULL),
(73, 331, 12, 9.0, '2020-08-11 09:04:53', '2020-08-11 09:04:53', NULL),
(74, 331, 13, 9.0, '2020-08-11 09:04:53', '2020-08-11 09:04:53', NULL),
(75, 331, 14, 9.0, '2020-08-11 09:04:53', '2020-08-11 09:04:53', NULL),
(76, 332, 3, 30.0, '2020-08-11 09:15:42', '2020-08-11 09:15:42', NULL),
(77, 332, 4, 30.0, '2020-08-11 09:15:42', '2020-08-11 09:15:42', NULL),
(78, 332, 10, 30.0, '2020-08-11 09:15:42', '2020-08-11 09:15:42', NULL),
(79, 332, 11, 30.0, '2020-08-11 09:15:42', '2020-08-11 09:15:42', NULL),
(80, 333, 9, 30.0, '2020-08-11 09:15:42', '2020-08-11 09:15:42', NULL),
(81, 333, 12, 30.0, '2020-08-11 09:15:42', '2020-08-11 09:15:42', NULL),
(82, 333, 13, 30.0, '2020-08-11 09:15:42', '2020-08-11 09:15:42', NULL),
(83, 333, 14, 40.0, '2020-08-11 09:15:42', '2020-08-11 09:15:42', NULL),
(84, 334, 3, 30.0, '2020-08-11 09:24:14', '2020-08-11 09:24:14', NULL),
(85, 334, 4, 30.0, '2020-08-11 09:24:14', '2020-08-11 09:24:14', NULL),
(86, 334, 10, 30.0, '2020-08-11 09:24:14', '2020-08-11 09:24:14', NULL),
(87, 334, 11, 30.0, '2020-08-11 09:24:14', '2020-08-11 09:24:14', NULL),
(88, 335, 9, 30.0, '2020-08-11 09:24:14', '2020-08-11 09:24:14', NULL),
(89, 335, 12, 30.0, '2020-08-11 09:24:14', '2020-08-11 09:24:14', NULL),
(90, 335, 13, 30.0, '2020-08-11 09:24:14', '2020-08-11 09:24:14', NULL),
(91, 335, 14, 40.0, '2020-08-11 09:24:14', '2020-08-11 09:24:14', NULL),
(92, 336, 3, 30.0, '2020-08-11 09:24:52', '2020-08-11 09:24:52', NULL),
(93, 336, 4, 30.0, '2020-08-11 09:24:52', '2020-08-11 09:24:52', NULL),
(94, 336, 10, 30.0, '2020-08-11 09:24:52', '2020-08-11 09:24:52', NULL),
(95, 336, 11, 30.0, '2020-08-11 09:24:52', '2020-08-11 09:24:52', NULL),
(96, 337, 9, 9.0, '2020-08-11 09:24:52', '2020-08-11 09:24:52', NULL),
(97, 337, 12, 9.0, '2020-08-11 09:24:52', '2020-08-11 09:24:52', NULL),
(98, 337, 13, 9.0, '2020-08-11 09:24:52', '2020-08-11 09:24:52', NULL),
(99, 337, 14, 9.0, '2020-08-11 09:24:52', '2020-08-11 09:24:52', NULL),
(100, 338, 3, 30.0, '2020-08-11 09:36:35', '2020-08-11 09:36:35', NULL),
(101, 338, 4, 30.0, '2020-08-11 09:36:35', '2020-08-11 09:36:35', NULL),
(102, 338, 10, 30.0, '2020-08-11 09:36:35', '2020-08-11 09:36:35', NULL),
(103, 338, 11, 30.0, '2020-08-11 09:36:35', '2020-08-11 09:36:35', NULL),
(104, 339, 9, 9.0, '2020-08-11 09:36:35', '2020-08-11 09:36:35', NULL),
(105, 339, 12, 9.0, '2020-08-11 09:36:35', '2020-08-11 09:36:35', NULL),
(106, 339, 13, 9.0, '2020-08-11 09:36:35', '2020-08-11 09:36:35', NULL),
(107, 339, 14, 9.0, '2020-08-11 09:36:35', '2020-08-11 09:36:35', NULL),
(108, 340, 3, 30.0, '2020-08-11 10:52:26', '2020-08-11 10:52:26', NULL),
(109, 340, 4, 30.0, '2020-08-11 10:52:26', '2020-08-11 10:52:26', NULL),
(110, 340, 10, 30.0, '2020-08-11 10:52:26', '2020-08-11 10:52:26', NULL),
(111, 340, 11, 30.0, '2020-08-11 10:52:26', '2020-08-11 10:52:26', NULL),
(112, 341, 9, 30.0, '2020-08-11 10:52:26', '2020-08-11 10:52:26', NULL),
(113, 341, 12, 30.0, '2020-08-11 10:52:26', '2020-08-11 10:52:26', NULL),
(114, 341, 13, 30.0, '2020-08-11 10:52:26', '2020-08-11 10:52:26', NULL),
(115, 341, 14, 40.0, '2020-08-11 10:52:26', '2020-08-11 10:52:26', NULL),
(116, 342, 3, 30.0, '2020-08-11 11:43:51', '2020-08-11 11:43:51', NULL),
(117, 342, 4, 30.0, '2020-08-11 11:43:51', '2020-08-11 11:43:51', NULL),
(118, 342, 10, 30.0, '2020-08-11 11:43:51', '2020-08-11 11:43:51', NULL),
(119, 342, 11, 30.0, '2020-08-11 11:43:51', '2020-08-11 11:43:51', NULL),
(120, 343, 9, 9.0, '2020-08-11 11:43:51', '2020-08-11 11:43:51', NULL),
(121, 343, 12, 9.0, '2020-08-11 11:43:51', '2020-08-11 11:43:51', NULL),
(122, 343, 13, 9.0, '2020-08-11 11:43:51', '2020-08-11 11:43:51', NULL),
(123, 343, 14, 9.0, '2020-08-11 11:43:51', '2020-08-11 11:43:51', NULL),
(124, 344, 3, 30.0, '2020-08-11 11:44:58', '2020-08-11 11:44:58', NULL),
(125, 344, 4, 30.0, '2020-08-11 11:44:58', '2020-08-11 11:44:58', NULL),
(126, 344, 10, 30.0, '2020-08-11 11:44:58', '2020-08-11 11:44:58', NULL),
(127, 344, 11, 30.0, '2020-08-11 11:44:58', '2020-08-11 11:44:58', NULL),
(128, 345, 9, 9.0, '2020-08-11 11:44:58', '2020-08-11 11:44:58', NULL),
(129, 345, 12, 9.0, '2020-08-11 11:44:58', '2020-08-11 11:44:58', NULL),
(130, 345, 13, 9.0, '2020-08-11 11:44:58', '2020-08-11 11:44:58', NULL),
(131, 345, 14, 9.0, '2020-08-11 11:44:58', '2020-08-11 11:44:58', NULL),
(132, 346, 3, 30.0, '2020-08-11 11:45:46', '2020-08-11 11:45:46', NULL),
(133, 346, 4, 30.0, '2020-08-11 11:45:46', '2020-08-11 11:45:46', NULL),
(134, 346, 10, 30.0, '2020-08-11 11:45:46', '2020-08-11 11:45:46', NULL),
(135, 346, 11, 30.0, '2020-08-11 11:45:46', '2020-08-11 11:45:46', NULL),
(136, 347, 9, 9.0, '2020-08-11 11:45:46', '2020-08-11 11:45:46', NULL),
(137, 347, 12, 9.0, '2020-08-11 11:45:46', '2020-08-11 11:45:46', NULL),
(138, 347, 13, 9.0, '2020-08-11 11:45:46', '2020-08-11 11:45:46', NULL),
(139, 347, 14, 9.0, '2020-08-11 11:45:46', '2020-08-11 11:45:46', NULL),
(140, 348, 3, 30.0, '2020-08-11 11:46:29', '2020-08-11 11:46:29', NULL),
(141, 348, 4, 30.0, '2020-08-11 11:46:29', '2020-08-11 11:46:29', NULL),
(142, 348, 10, 30.0, '2020-08-11 11:46:29', '2020-08-11 11:46:29', NULL),
(143, 348, 11, 30.0, '2020-08-11 11:46:29', '2020-08-11 11:46:29', NULL),
(144, 349, 9, 9.0, '2020-08-11 11:46:29', '2020-08-11 11:46:29', NULL),
(145, 349, 12, 9.0, '2020-08-11 11:46:29', '2020-08-11 11:46:29', NULL),
(146, 349, 13, 9.0, '2020-08-11 11:46:29', '2020-08-11 11:46:29', NULL),
(147, 349, 14, 9.0, '2020-08-11 11:46:29', '2020-08-11 11:46:29', NULL),
(148, 350, 3, 30.0, '2020-08-11 11:46:45', '2020-08-11 11:46:45', NULL),
(149, 350, 4, 30.0, '2020-08-11 11:46:45', '2020-08-11 11:46:45', NULL),
(150, 350, 10, 30.0, '2020-08-11 11:46:45', '2020-08-11 11:46:45', NULL),
(151, 350, 11, 30.0, '2020-08-11 11:46:45', '2020-08-11 11:46:45', NULL),
(152, 351, 9, 9.0, '2020-08-11 11:46:45', '2020-08-11 11:46:45', NULL),
(153, 351, 12, 9.0, '2020-08-11 11:46:45', '2020-08-11 11:46:45', NULL),
(154, 351, 13, 9.0, '2020-08-11 11:46:45', '2020-08-11 11:46:45', NULL),
(155, 351, 14, 9.0, '2020-08-11 11:46:45', '2020-08-11 11:46:45', NULL),
(156, 352, 3, 30.0, '2020-08-11 11:51:02', '2020-08-11 11:51:02', NULL),
(157, 352, 4, 30.0, '2020-08-11 11:51:02', '2020-08-11 11:51:02', NULL),
(158, 352, 10, 30.0, '2020-08-11 11:51:02', '2020-08-11 11:51:02', NULL),
(159, 352, 11, 30.0, '2020-08-11 11:51:02', '2020-08-11 11:51:02', NULL),
(160, 353, 9, 9.0, '2020-08-11 11:51:02', '2020-08-11 11:51:02', NULL),
(161, 353, 12, 9.0, '2020-08-11 11:51:02', '2020-08-11 11:51:02', NULL),
(162, 353, 13, 9.0, '2020-08-11 11:51:02', '2020-08-11 11:51:02', NULL),
(163, 353, 14, 9.0, '2020-08-11 11:51:02', '2020-08-11 11:51:02', NULL),
(164, 354, 7, 800.0, '2020-08-11 11:51:02', '2020-08-11 11:51:02', NULL),
(165, 354, 8, 800.0, '2020-08-11 11:51:02', '2020-08-11 11:51:02', NULL),
(166, 354, 15, 454.0, '2020-08-11 11:51:02', '2020-08-11 11:51:02', NULL),
(167, 355, 3, 30.0, '2020-08-11 12:01:37', '2020-08-11 12:01:37', NULL),
(168, 355, 4, 30.0, '2020-08-11 12:01:37', '2020-08-11 12:01:37', NULL),
(169, 355, 10, 30.0, '2020-08-11 12:01:37', '2020-08-11 12:01:37', NULL),
(170, 355, 11, 30.0, '2020-08-11 12:01:37', '2020-08-11 12:01:37', NULL),
(171, 356, 9, 9.0, '2020-08-11 12:01:37', '2020-08-11 12:01:37', NULL),
(172, 356, 12, 9.0, '2020-08-11 12:01:37', '2020-08-11 12:01:37', NULL),
(173, 356, 13, 9.0, '2020-08-11 12:01:37', '2020-08-11 12:01:37', NULL),
(174, 356, 14, 9.0, '2020-08-11 12:01:37', '2020-08-11 12:01:37', NULL),
(175, 357, 7, 800.0, '2020-08-11 12:01:37', '2020-08-11 12:01:37', NULL),
(176, 357, 8, 800.0, '2020-08-11 12:01:37', '2020-08-11 12:01:37', NULL),
(177, 357, 15, 454.0, '2020-08-11 12:01:37', '2020-08-11 12:01:37', NULL),
(178, 358, 3, 30.0, '2020-08-11 12:02:16', '2020-08-11 12:02:16', NULL),
(179, 358, 4, 30.0, '2020-08-11 12:02:16', '2020-08-11 12:02:16', NULL),
(180, 358, 10, 30.0, '2020-08-11 12:02:16', '2020-08-11 12:02:16', NULL),
(181, 358, 11, 30.0, '2020-08-11 12:02:16', '2020-08-11 12:02:16', NULL),
(182, 359, 9, 9.0, '2020-08-11 12:02:16', '2020-08-11 12:02:16', NULL),
(183, 359, 12, 9.0, '2020-08-11 12:02:16', '2020-08-11 12:02:16', NULL),
(184, 359, 13, 9.0, '2020-08-11 12:02:16', '2020-08-11 12:02:16', NULL),
(185, 359, 14, 9.0, '2020-08-11 12:02:16', '2020-08-11 12:02:16', NULL),
(186, 360, 7, 800.0, '2020-08-11 12:02:16', '2020-08-11 12:02:16', NULL),
(187, 360, 8, 800.0, '2020-08-11 12:02:16', '2020-08-11 12:02:16', NULL),
(188, 360, 15, 454.0, '2020-08-11 12:02:16', '2020-08-11 12:02:16', NULL),
(189, 361, 3, 30.0, '2020-08-11 12:05:32', '2020-08-11 12:05:32', NULL),
(190, 361, 4, 30.0, '2020-08-11 12:05:32', '2020-08-11 12:05:32', NULL),
(191, 361, 10, 30.0, '2020-08-11 12:05:32', '2020-08-11 12:05:32', NULL),
(192, 361, 11, 30.0, '2020-08-11 12:05:32', '2020-08-11 12:05:32', NULL),
(193, 362, 9, 9.0, '2020-08-11 12:05:32', '2020-08-11 12:05:32', NULL),
(194, 362, 12, 9.0, '2020-08-11 12:05:32', '2020-08-11 12:05:32', NULL),
(195, 362, 13, 9.0, '2020-08-11 12:05:32', '2020-08-11 12:05:32', NULL),
(196, 362, 14, 9.0, '2020-08-11 12:05:32', '2020-08-11 12:05:32', NULL),
(197, 363, 7, 800.0, '2020-08-11 12:05:32', '2020-08-11 12:05:32', NULL),
(198, 363, 8, 800.0, '2020-08-11 12:05:32', '2020-08-11 12:05:32', NULL),
(199, 363, 15, 454.0, '2020-08-11 12:05:32', '2020-08-11 12:05:32', NULL),
(200, 364, 3, 30.0, '2020-08-11 12:05:38', '2020-08-11 12:05:38', NULL),
(201, 364, 4, 30.0, '2020-08-11 12:05:38', '2020-08-11 12:05:38', NULL),
(202, 364, 10, 30.0, '2020-08-11 12:05:38', '2020-08-11 12:05:38', NULL),
(203, 364, 11, 30.0, '2020-08-11 12:05:38', '2020-08-11 12:05:38', NULL),
(204, 365, 9, 9.0, '2020-08-11 12:05:38', '2020-08-11 12:05:38', NULL),
(205, 365, 12, 9.0, '2020-08-11 12:05:38', '2020-08-11 12:05:38', NULL),
(206, 365, 13, 9.0, '2020-08-11 12:05:38', '2020-08-11 12:05:38', NULL),
(207, 365, 14, 9.0, '2020-08-11 12:05:38', '2020-08-11 12:05:38', NULL),
(208, 366, 7, 800.0, '2020-08-11 12:05:38', '2020-08-11 12:05:38', NULL),
(209, 366, 8, 800.0, '2020-08-11 12:05:38', '2020-08-11 12:05:38', NULL),
(210, 366, 15, 454.0, '2020-08-11 12:05:38', '2020-08-11 12:05:38', NULL),
(211, 367, 3, 30.0, '2020-08-11 12:06:16', '2020-08-11 12:06:16', NULL),
(212, 367, 4, 30.0, '2020-08-11 12:06:16', '2020-08-11 12:06:16', NULL),
(213, 367, 10, 30.0, '2020-08-11 12:06:16', '2020-08-11 12:06:16', NULL),
(214, 367, 11, 30.0, '2020-08-11 12:06:16', '2020-08-11 12:06:16', NULL),
(215, 368, 9, 9.0, '2020-08-11 12:06:16', '2020-08-11 12:06:16', NULL),
(216, 368, 12, 9.0, '2020-08-11 12:06:16', '2020-08-11 12:06:16', NULL),
(217, 368, 13, 9.0, '2020-08-11 12:06:16', '2020-08-11 12:06:16', NULL),
(218, 368, 14, 9.0, '2020-08-11 12:06:16', '2020-08-11 12:06:16', NULL),
(219, 369, 7, 800.0, '2020-08-11 12:06:16', '2020-08-11 12:06:16', NULL),
(220, 369, 8, 800.0, '2020-08-11 12:06:16', '2020-08-11 12:06:16', NULL),
(221, 369, 15, 454.0, '2020-08-11 12:06:16', '2020-08-11 12:06:16', NULL),
(222, 370, 3, 30.0, '2020-08-11 12:35:40', '2020-08-11 12:35:40', NULL),
(223, 370, 4, 30.0, '2020-08-11 12:35:40', '2020-08-11 12:35:40', NULL),
(224, 370, 10, 30.0, '2020-08-11 12:35:40', '2020-08-11 12:35:40', NULL),
(225, 370, 11, 30.0, '2020-08-11 12:35:40', '2020-08-11 12:35:40', NULL),
(226, 371, 9, 9.0, '2020-08-11 12:35:40', '2020-08-11 12:35:40', NULL),
(227, 371, 12, 9.0, '2020-08-11 12:35:40', '2020-08-11 12:35:40', NULL),
(228, 371, 13, 9.0, '2020-08-11 12:35:40', '2020-08-11 12:35:40', NULL),
(229, 371, 14, 9.0, '2020-08-11 12:35:40', '2020-08-11 12:35:40', NULL),
(230, 372, 7, 800.0, '2020-08-11 12:35:40', '2020-08-11 12:35:40', NULL),
(231, 372, 8, 800.0, '2020-08-11 12:35:40', '2020-08-11 12:35:40', NULL),
(232, 372, 15, 454.0, '2020-08-11 12:35:40', '2020-08-11 12:35:40', NULL),
(233, 373, 3, 30.0, '2020-08-11 12:44:43', '2020-08-11 12:44:43', NULL),
(234, 373, 4, 30.0, '2020-08-11 12:44:43', '2020-08-11 12:44:43', NULL),
(235, 373, 10, 30.0, '2020-08-11 12:44:43', '2020-08-11 12:44:43', NULL),
(236, 373, 11, 30.0, '2020-08-11 12:44:43', '2020-08-11 12:44:43', NULL),
(237, 374, 9, 30.0, '2020-08-11 12:44:43', '2020-08-11 12:44:43', NULL),
(238, 374, 12, 30.0, '2020-08-11 12:44:43', '2020-08-11 12:44:43', NULL),
(239, 374, 13, 30.0, '2020-08-11 12:44:43', '2020-08-11 12:44:43', NULL),
(240, 374, 14, 40.0, '2020-08-11 12:44:43', '2020-08-11 12:44:43', NULL),
(241, 375, 3, 30.0, '2020-08-11 12:51:49', '2020-08-11 12:51:49', NULL),
(242, 375, 4, 30.0, '2020-08-11 12:51:49', '2020-08-11 12:51:49', NULL),
(243, 375, 10, 30.0, '2020-08-11 12:51:49', '2020-08-11 12:51:49', NULL),
(244, 375, 11, 30.0, '2020-08-11 12:51:49', '2020-08-11 12:51:49', NULL),
(245, 376, 9, 30.0, '2020-08-11 12:51:49', '2020-08-11 12:51:49', NULL),
(246, 376, 12, 30.0, '2020-08-11 12:51:49', '2020-08-11 12:51:49', NULL),
(247, 376, 13, 30.0, '2020-08-11 12:51:49', '2020-08-11 12:51:49', NULL),
(248, 376, 14, 40.0, '2020-08-11 12:51:49', '2020-08-11 12:51:49', NULL),
(249, 377, 3, 30.0, '2020-08-11 13:02:21', '2020-08-11 13:02:21', NULL),
(250, 377, 4, 30.0, '2020-08-11 13:02:21', '2020-08-11 13:02:21', NULL),
(251, 377, 10, 30.0, '2020-08-11 13:02:21', '2020-08-11 13:02:21', NULL),
(252, 377, 11, 30.0, '2020-08-11 13:02:21', '2020-08-11 13:02:21', NULL),
(253, 378, 9, 30.0, '2020-08-11 13:02:21', '2020-08-11 13:02:21', NULL),
(254, 378, 12, 30.0, '2020-08-11 13:02:21', '2020-08-11 13:02:21', NULL),
(255, 378, 13, 30.0, '2020-08-11 13:02:21', '2020-08-11 13:02:21', NULL),
(256, 378, 14, 40.0, '2020-08-11 13:02:21', '2020-08-11 13:02:21', NULL),
(257, 379, 3, 30.0, '2020-08-11 13:30:21', '2020-08-11 13:30:21', NULL),
(258, 379, 4, 30.0, '2020-08-11 13:30:21', '2020-08-11 13:30:21', NULL),
(259, 379, 10, 30.0, '2020-08-11 13:30:21', '2020-08-11 13:30:21', NULL),
(260, 379, 11, 30.0, '2020-08-11 13:30:21', '2020-08-11 13:30:21', NULL),
(261, 380, 9, 9.0, '2020-08-11 13:30:21', '2020-08-11 13:30:21', NULL),
(262, 380, 12, 9.0, '2020-08-11 13:30:21', '2020-08-11 13:30:21', NULL),
(263, 380, 13, 9.0, '2020-08-11 13:30:21', '2020-08-11 13:30:21', NULL),
(264, 380, 14, 9.0, '2020-08-11 13:30:21', '2020-08-11 13:30:21', NULL),
(265, 381, 7, 800.0, '2020-08-11 13:30:21', '2020-08-11 13:30:21', NULL),
(266, 381, 8, 800.0, '2020-08-11 13:30:21', '2020-08-11 13:30:21', NULL),
(267, 381, 15, 454.0, '2020-08-11 13:30:21', '2020-08-11 13:30:21', NULL),
(268, 382, 3, 30.0, '2020-08-11 13:31:14', '2020-08-11 13:31:14', NULL),
(269, 382, 4, 30.0, '2020-08-11 13:31:14', '2020-08-11 13:31:14', NULL),
(270, 382, 10, 30.0, '2020-08-11 13:31:14', '2020-08-11 13:31:14', NULL),
(271, 382, 11, 30.0, '2020-08-11 13:31:14', '2020-08-11 13:31:14', NULL),
(272, 383, 9, 9.0, '2020-08-11 13:31:14', '2020-08-11 13:31:14', NULL),
(273, 383, 12, 9.0, '2020-08-11 13:31:14', '2020-08-11 13:31:14', NULL),
(274, 383, 13, 9.0, '2020-08-11 13:31:14', '2020-08-11 13:31:14', NULL),
(275, 383, 14, 9.0, '2020-08-11 13:31:14', '2020-08-11 13:31:14', NULL),
(276, 384, 7, 800.0, '2020-08-11 13:31:14', '2020-08-11 13:31:14', NULL),
(277, 384, 8, 800.0, '2020-08-11 13:31:14', '2020-08-11 13:31:14', NULL),
(278, 384, 15, 454.0, '2020-08-11 13:31:14', '2020-08-11 13:31:14', NULL),
(279, 385, 3, 30.0, '2020-08-11 13:32:22', '2020-08-11 13:32:22', NULL),
(280, 385, 4, 30.0, '2020-08-11 13:32:22', '2020-08-11 13:32:22', NULL),
(281, 385, 10, 30.0, '2020-08-11 13:32:22', '2020-08-11 13:32:22', NULL),
(282, 385, 11, 30.0, '2020-08-11 13:32:22', '2020-08-11 13:32:22', NULL),
(283, 386, 9, 30.0, '2020-08-11 13:32:22', '2020-08-11 13:32:22', NULL),
(284, 386, 12, 30.0, '2020-08-11 13:32:22', '2020-08-11 13:32:22', NULL),
(285, 386, 13, 30.0, '2020-08-11 13:32:22', '2020-08-11 13:32:22', NULL),
(286, 386, 14, 40.0, '2020-08-11 13:32:22', '2020-08-11 13:32:22', NULL),
(287, 387, 3, 30.0, '2020-08-11 13:33:42', '2020-08-11 13:33:42', NULL),
(288, 387, 4, 30.0, '2020-08-11 13:33:42', '2020-08-11 13:33:42', NULL),
(289, 387, 10, 30.0, '2020-08-11 13:33:42', '2020-08-11 13:33:42', NULL),
(290, 387, 11, 30.0, '2020-08-11 13:33:42', '2020-08-11 13:33:42', NULL),
(291, 388, 9, 9.0, '2020-08-11 13:33:42', '2020-08-11 13:33:42', NULL),
(292, 388, 12, 9.0, '2020-08-11 13:33:42', '2020-08-11 13:33:42', NULL),
(293, 388, 13, 9.0, '2020-08-11 13:33:42', '2020-08-11 13:33:42', NULL),
(294, 388, 14, 9.0, '2020-08-11 13:33:42', '2020-08-11 13:33:42', NULL),
(295, 389, 7, 800.0, '2020-08-11 13:33:42', '2020-08-11 13:33:42', NULL),
(296, 389, 8, 800.0, '2020-08-11 13:33:42', '2020-08-11 13:33:42', NULL),
(297, 389, 15, 454.0, '2020-08-11 13:33:42', '2020-08-11 13:33:42', NULL),
(298, 390, 3, 30.0, '2020-08-11 13:41:04', '2020-08-11 13:41:04', NULL),
(299, 390, 4, 30.0, '2020-08-11 13:41:04', '2020-08-11 13:41:04', NULL),
(300, 390, 10, 30.0, '2020-08-11 13:41:04', '2020-08-11 13:41:04', NULL),
(301, 390, 11, 30.0, '2020-08-11 13:41:04', '2020-08-11 13:41:04', NULL),
(302, 391, 9, 9.0, '2020-08-11 13:41:04', '2020-08-11 13:41:04', NULL),
(303, 391, 12, 9.0, '2020-08-11 13:41:04', '2020-08-11 13:41:04', NULL),
(304, 391, 13, 9.0, '2020-08-11 13:41:04', '2020-08-11 13:41:04', NULL),
(305, 391, 14, 9.0, '2020-08-11 13:41:04', '2020-08-11 13:41:04', NULL),
(306, 392, 7, 800.0, '2020-08-11 13:41:04', '2020-08-11 13:41:04', NULL),
(307, 392, 8, 800.0, '2020-08-11 13:41:04', '2020-08-11 13:41:04', NULL),
(308, 392, 15, 454.0, '2020-08-11 13:41:04', '2020-08-11 13:41:04', NULL),
(309, 393, 3, 30.0, '2020-08-11 13:41:32', '2020-08-11 13:41:32', NULL),
(310, 393, 4, 30.0, '2020-08-11 13:41:32', '2020-08-11 13:41:32', NULL),
(311, 393, 10, 30.0, '2020-08-11 13:41:32', '2020-08-11 13:41:32', NULL),
(312, 393, 11, 30.0, '2020-08-11 13:41:32', '2020-08-11 13:41:32', NULL),
(313, 394, 9, 9.0, '2020-08-11 13:41:32', '2020-08-11 13:41:32', NULL),
(314, 394, 12, 9.0, '2020-08-11 13:41:32', '2020-08-11 13:41:32', NULL),
(315, 394, 13, 9.0, '2020-08-11 13:41:32', '2020-08-11 13:41:32', NULL),
(316, 394, 14, 9.0, '2020-08-11 13:41:32', '2020-08-11 13:41:32', NULL),
(317, 395, 7, 800.0, '2020-08-11 13:41:32', '2020-08-11 13:41:32', NULL),
(318, 395, 8, 800.0, '2020-08-11 13:41:32', '2020-08-11 13:41:32', NULL),
(319, 395, 15, 454.0, '2020-08-11 13:41:32', '2020-08-11 13:41:32', NULL),
(320, 396, 3, 30.0, '2020-08-11 14:03:24', '2020-08-11 14:03:24', NULL),
(321, 396, 4, 30.0, '2020-08-11 14:03:24', '2020-08-11 14:03:24', NULL),
(322, 396, 10, 30.0, '2020-08-11 14:03:24', '2020-08-11 14:03:24', NULL),
(323, 396, 11, 30.0, '2020-08-11 14:03:24', '2020-08-11 14:03:24', NULL),
(324, 397, 9, 9.0, '2020-08-11 14:03:24', '2020-08-11 14:03:24', NULL),
(325, 397, 12, 9.0, '2020-08-11 14:03:24', '2020-08-11 14:03:24', NULL),
(326, 397, 13, 9.0, '2020-08-11 14:03:24', '2020-08-11 14:03:24', NULL),
(327, 397, 14, 9.0, '2020-08-11 14:03:24', '2020-08-11 14:03:24', NULL),
(328, 398, 7, 800.0, '2020-08-11 14:03:24', '2020-08-11 14:03:24', NULL),
(329, 398, 8, 800.0, '2020-08-11 14:03:24', '2020-08-11 14:03:24', NULL),
(330, 398, 15, 454.0, '2020-08-11 14:03:24', '2020-08-11 14:03:24', NULL),
(331, 399, 3, 50.0, '2020-08-12 10:04:52', '2020-08-12 10:04:52', NULL),
(332, 399, 4, 60.0, '2020-08-12 10:04:52', '2020-08-12 10:04:52', NULL),
(333, 399, 10, 70.0, '2020-08-12 10:04:52', '2020-08-12 10:04:52', NULL),
(334, 399, 11, 60.0, '2020-08-12 10:04:52', '2020-08-12 10:04:52', NULL),
(335, 400, 3, 50.0, '2020-08-12 10:22:08', '2020-08-12 10:22:08', NULL),
(336, 400, 4, 60.0, '2020-08-12 10:22:08', '2020-08-12 10:22:08', NULL),
(337, 400, 10, 70.0, '2020-08-12 10:22:08', '2020-08-12 10:22:08', NULL),
(338, 400, 11, 60.0, '2020-08-12 10:22:08', '2020-08-12 10:22:08', NULL),
(339, 401, 3, 50.0, '2020-08-12 10:42:07', '2020-08-12 10:42:07', NULL),
(340, 401, 4, 60.0, '2020-08-12 10:42:07', '2020-08-12 10:42:07', NULL),
(341, 401, 10, 70.0, '2020-08-12 10:42:07', '2020-08-12 10:42:07', NULL),
(342, 401, 11, 60.0, '2020-08-12 10:42:07', '2020-08-12 10:42:07', NULL),
(343, 402, 3, 50.0, '2020-08-12 11:02:39', '2020-08-12 11:02:39', NULL),
(344, 402, 4, 60.0, '2020-08-12 11:02:39', '2020-08-12 11:02:39', NULL),
(345, 402, 10, 70.0, '2020-08-12 11:02:39', '2020-08-12 11:02:39', NULL),
(346, 402, 11, 60.0, '2020-08-12 11:02:39', '2020-08-12 11:02:39', NULL),
(347, 403, 3, 50.0, '2020-08-12 12:45:30', '2020-08-12 12:45:30', NULL),
(348, 403, 4, 60.0, '2020-08-12 12:45:30', '2020-08-12 12:45:30', NULL),
(349, 403, 10, 70.0, '2020-08-12 12:45:30', '2020-08-12 12:45:30', NULL),
(350, 403, 11, 60.0, '2020-08-12 12:45:30', '2020-08-12 12:45:30', NULL),
(351, 404, 3, 30.0, '2020-08-12 20:18:29', '2020-08-12 20:18:29', NULL),
(352, 404, 4, 30.0, '2020-08-12 20:18:29', '2020-08-12 20:18:29', NULL),
(353, 404, 10, 30.0, '2020-08-12 20:18:29', '2020-08-12 20:18:29', NULL),
(354, 404, 11, 30.0, '2020-08-12 20:18:29', '2020-08-12 20:18:29', NULL),
(355, 405, 9, 8.0, '2020-08-12 20:18:29', '2020-08-12 20:18:29', NULL),
(356, 405, 12, 8.0, '2020-08-12 20:18:29', '2020-08-12 20:18:29', NULL),
(357, 405, 13, 8.0, '2020-08-12 20:18:29', '2020-08-12 20:18:29', NULL),
(358, 405, 14, 8.0, '2020-08-12 20:18:29', '2020-08-12 20:18:29', NULL),
(359, 406, 3, 30.0, '2020-08-12 20:19:16', '2020-08-12 20:19:16', NULL),
(360, 406, 4, 30.0, '2020-08-12 20:19:16', '2020-08-12 20:19:16', NULL),
(361, 406, 10, 30.0, '2020-08-12 20:19:16', '2020-08-12 20:19:16', NULL),
(362, 406, 11, 30.0, '2020-08-12 20:19:16', '2020-08-12 20:19:16', NULL),
(363, 407, 9, 8.0, '2020-08-12 20:19:16', '2020-08-12 20:19:16', NULL),
(364, 407, 12, 8.0, '2020-08-12 20:19:16', '2020-08-12 20:19:16', NULL),
(365, 407, 13, 8.0, '2020-08-12 20:19:16', '2020-08-12 20:19:16', NULL),
(366, 407, 14, 8.0, '2020-08-12 20:19:16', '2020-08-12 20:19:16', NULL),
(367, 408, 3, 30.0, '2020-08-14 09:17:24', '2020-08-14 09:17:24', NULL),
(368, 408, 4, 30.0, '2020-08-14 09:17:24', '2020-08-14 09:17:24', NULL),
(369, 408, 10, 30.0, '2020-08-14 09:17:24', '2020-08-14 09:17:24', NULL),
(370, 408, 11, 30.0, '2020-08-14 09:17:24', '2020-08-14 09:17:24', NULL),
(371, 409, 7, 30.0, '2020-08-14 09:17:24', '2020-08-14 09:17:24', NULL),
(372, 409, 8, 30.0, '2020-08-14 09:17:24', '2020-08-14 09:17:24', NULL),
(373, 409, 15, 30.0, '2020-08-14 09:17:24', '2020-08-14 09:17:24', NULL),
(374, 410, 3, 30.0, '2020-08-14 09:23:57', '2020-08-14 09:23:57', NULL),
(375, 410, 4, 30.0, '2020-08-14 09:23:57', '2020-08-14 09:23:57', NULL),
(376, 410, 10, 30.0, '2020-08-14 09:23:57', '2020-08-14 09:23:57', NULL),
(377, 410, 11, 30.0, '2020-08-14 09:23:57', '2020-08-14 09:23:57', NULL),
(378, 411, 7, 30.0, '2020-08-14 09:23:57', '2020-08-14 09:23:57', NULL),
(379, 411, 8, 30.0, '2020-08-14 09:23:57', '2020-08-14 09:23:57', NULL),
(380, 411, 15, 30.0, '2020-08-14 09:23:57', '2020-08-14 09:23:57', NULL),
(381, 412, 3, 30.0, '2020-08-23 15:36:14', '2020-08-23 15:36:14', NULL),
(382, 412, 4, 30.0, '2020-08-23 15:36:14', '2020-08-23 15:36:14', NULL),
(383, 412, 10, 30.0, '2020-08-23 15:36:14', '2020-08-23 15:36:14', NULL),
(384, 412, 11, 30.0, '2020-08-23 15:36:14', '2020-08-23 15:36:14', NULL),
(385, 413, 9, 9.0, '2020-08-23 15:36:14', '2020-08-23 15:36:14', NULL),
(386, 413, 12, 9.0, '2020-08-23 15:36:14', '2020-08-23 15:36:14', NULL),
(387, 413, 13, 9.0, '2020-08-23 15:36:14', '2020-08-23 15:36:14', NULL),
(388, 413, 14, 9.0, '2020-08-23 15:36:14', '2020-08-23 15:36:14', NULL),
(389, 414, 7, 800.0, '2020-08-23 15:36:14', '2020-08-23 15:36:14', NULL),
(390, 414, 8, 800.0, '2020-08-23 15:36:14', '2020-08-23 15:36:14', NULL),
(391, 414, 15, 454.0, '2020-08-23 15:36:14', '2020-08-23 15:36:14', NULL),
(392, 415, 3, 30.0, '2020-08-23 15:37:43', '2020-08-23 15:37:43', NULL),
(393, 415, 4, 30.0, '2020-08-23 15:37:43', '2020-08-23 15:37:43', NULL),
(394, 415, 10, 30.0, '2020-08-23 15:37:43', '2020-08-23 15:37:43', NULL),
(395, 415, 11, 30.0, '2020-08-23 15:37:43', '2020-08-23 15:37:43', NULL),
(396, 416, 9, 9.0, '2020-08-23 15:37:43', '2020-08-23 15:37:43', NULL),
(397, 416, 12, 9.0, '2020-08-23 15:37:43', '2020-08-23 15:37:43', NULL),
(398, 416, 13, 9.0, '2020-08-23 15:37:43', '2020-08-23 15:37:43', NULL),
(399, 416, 14, 9.0, '2020-08-23 15:37:43', '2020-08-23 15:37:43', NULL),
(400, 417, 7, 800.0, '2020-08-23 15:37:43', '2020-08-23 15:37:43', NULL),
(401, 417, 8, 800.0, '2020-08-23 15:37:43', '2020-08-23 15:37:43', NULL),
(402, 417, 15, 454.0, '2020-08-23 15:37:43', '2020-08-23 15:37:43', NULL),
(403, 418, 3, 30.0, '2020-08-23 15:39:27', '2020-08-23 15:39:27', NULL),
(404, 418, 4, 30.0, '2020-08-23 15:39:27', '2020-08-23 15:39:27', NULL),
(405, 418, 10, 30.0, '2020-08-23 15:39:27', '2020-08-23 15:39:27', NULL),
(406, 418, 11, 30.0, '2020-08-23 15:39:27', '2020-08-23 15:39:27', NULL),
(407, 419, 9, 9.0, '2020-08-23 15:39:27', '2020-08-23 15:39:27', NULL),
(408, 419, 12, 9.0, '2020-08-23 15:39:27', '2020-08-23 15:39:27', NULL),
(409, 419, 13, 9.0, '2020-08-23 15:39:27', '2020-08-23 15:39:27', NULL),
(410, 419, 14, 9.0, '2020-08-23 15:39:27', '2020-08-23 15:39:27', NULL),
(411, 420, 7, 800.0, '2020-08-23 15:39:27', '2020-08-23 15:39:27', NULL),
(412, 420, 8, 800.0, '2020-08-23 15:39:27', '2020-08-23 15:39:27', NULL),
(413, 420, 15, 454.0, '2020-08-23 15:39:27', '2020-08-23 15:39:27', NULL),
(414, 421, 3, 30.0, '2020-08-23 15:40:21', '2020-08-23 15:40:21', NULL),
(415, 421, 4, 30.0, '2020-08-23 15:40:21', '2020-08-23 15:40:21', NULL),
(416, 421, 10, 30.0, '2020-08-23 15:40:21', '2020-08-23 15:40:21', NULL),
(417, 421, 11, 30.0, '2020-08-23 15:40:21', '2020-08-23 15:40:21', NULL),
(418, 422, 9, 9.0, '2020-08-23 15:40:21', '2020-08-23 15:40:21', NULL),
(419, 422, 12, 9.0, '2020-08-23 15:40:21', '2020-08-23 15:40:21', NULL),
(420, 422, 13, 9.0, '2020-08-23 15:40:21', '2020-08-23 15:40:21', NULL),
(421, 422, 14, 9.0, '2020-08-23 15:40:21', '2020-08-23 15:40:21', NULL),
(422, 423, 7, 800.0, '2020-08-23 15:40:21', '2020-08-23 15:40:21', NULL),
(423, 423, 8, 800.0, '2020-08-23 15:40:21', '2020-08-23 15:40:21', NULL),
(424, 423, 15, 454.0, '2020-08-23 15:40:21', '2020-08-23 15:40:21', NULL),
(425, 424, 3, 30.0, '2020-08-23 15:41:02', '2020-08-23 15:41:02', NULL),
(426, 424, 4, 30.0, '2020-08-23 15:41:02', '2020-08-23 15:41:02', NULL),
(427, 424, 10, 30.0, '2020-08-23 15:41:02', '2020-08-23 15:41:02', NULL),
(428, 424, 11, 30.0, '2020-08-23 15:41:02', '2020-08-23 15:41:02', NULL),
(429, 425, 9, 9.0, '2020-08-23 15:41:02', '2020-08-23 15:41:02', NULL),
(430, 425, 12, 9.0, '2020-08-23 15:41:02', '2020-08-23 15:41:02', NULL),
(431, 425, 13, 9.0, '2020-08-23 15:41:02', '2020-08-23 15:41:02', NULL),
(432, 425, 14, 9.0, '2020-08-23 15:41:02', '2020-08-23 15:41:02', NULL),
(433, 426, 7, 800.0, '2020-08-23 15:41:02', '2020-08-23 15:41:02', NULL),
(434, 426, 8, 800.0, '2020-08-23 15:41:02', '2020-08-23 15:41:02', NULL),
(435, 426, 15, 454.0, '2020-08-23 15:41:02', '2020-08-23 15:41:02', NULL),
(436, 427, 3, 30.0, '2020-08-23 15:46:13', '2020-08-23 15:46:13', NULL),
(437, 427, 4, 30.0, '2020-08-23 15:46:13', '2020-08-23 15:46:13', NULL),
(438, 427, 10, 30.0, '2020-08-23 15:46:13', '2020-08-23 15:46:13', NULL),
(439, 427, 11, 30.0, '2020-08-23 15:46:13', '2020-08-23 15:46:13', NULL),
(440, 428, 9, 9.0, '2020-08-23 15:46:13', '2020-08-23 15:46:13', NULL),
(441, 428, 12, 9.0, '2020-08-23 15:46:13', '2020-08-23 15:46:13', NULL),
(442, 428, 13, 9.0, '2020-08-23 15:46:13', '2020-08-23 15:46:13', NULL),
(443, 428, 14, 9.0, '2020-08-23 15:46:13', '2020-08-23 15:46:13', NULL),
(444, 429, 7, 800.0, '2020-08-23 15:46:13', '2020-08-23 15:46:13', NULL),
(445, 429, 8, 800.0, '2020-08-23 15:46:13', '2020-08-23 15:46:13', NULL),
(446, 429, 15, 454.0, '2020-08-23 15:46:13', '2020-08-23 15:46:13', NULL),
(447, 430, 3, 30.0, '2020-08-27 21:23:55', '2020-08-27 21:23:55', NULL),
(448, 430, 4, 30.0, '2020-08-27 21:23:55', '2020-08-27 21:23:55', NULL),
(449, 430, 10, 30.0, '2020-08-27 21:23:55', '2020-08-27 21:23:55', NULL),
(450, 430, 11, 30.0, '2020-08-27 21:23:55', '2020-08-27 21:23:55', NULL),
(451, 431, 9, 8.5, '2020-08-27 21:23:55', '2020-08-27 21:23:55', NULL),
(452, 431, 12, 8.5, '2020-08-27 21:23:55', '2020-08-27 21:23:55', NULL),
(453, 431, 13, 8.5, '2020-08-27 21:23:55', '2020-08-27 21:23:55', NULL),
(454, 431, 14, 8.5, '2020-08-27 21:23:55', '2020-08-27 21:23:55', NULL),
(455, 432, 7, 800.0, '2020-08-27 21:23:55', '2020-08-27 21:23:55', NULL),
(456, 432, 8, 800.0, '2020-08-27 21:23:55', '2020-08-27 21:23:55', NULL),
(457, 432, 15, 55.0, '2020-08-27 21:23:55', '2020-08-27 21:23:55', NULL),
(458, 433, 3, 30.0, '2020-08-27 21:26:29', '2020-08-27 21:26:29', NULL),
(459, 433, 4, 30.0, '2020-08-27 21:26:29', '2020-08-27 21:26:29', NULL),
(460, 433, 10, 30.0, '2020-08-27 21:26:29', '2020-08-27 21:26:29', NULL),
(461, 433, 11, 30.0, '2020-08-27 21:26:29', '2020-08-27 21:26:29', NULL),
(462, 434, 9, 8.5, '2020-08-27 21:26:29', '2020-08-27 21:26:29', NULL),
(463, 434, 12, 8.5, '2020-08-27 21:26:29', '2020-08-27 21:26:29', NULL),
(464, 434, 13, 8.5, '2020-08-27 21:26:29', '2020-08-27 21:26:29', NULL),
(465, 434, 14, 8.5, '2020-08-27 21:26:29', '2020-08-27 21:26:29', NULL),
(466, 435, 7, 800.0, '2020-08-27 21:26:29', '2020-08-27 21:26:29', NULL),
(467, 435, 8, 800.0, '2020-08-27 21:26:29', '2020-08-27 21:26:29', NULL),
(468, 435, 15, 55.0, '2020-08-27 21:26:29', '2020-08-27 21:26:29', NULL),
(469, 436, 3, 30.0, '2020-08-27 21:27:01', '2020-08-27 21:27:01', NULL),
(470, 436, 4, 30.0, '2020-08-27 21:27:01', '2020-08-27 21:27:01', NULL),
(471, 436, 10, 30.0, '2020-08-27 21:27:01', '2020-08-27 21:27:01', NULL),
(472, 436, 11, 30.0, '2020-08-27 21:27:01', '2020-08-27 21:27:01', NULL),
(473, 437, 9, 8.5, '2020-08-27 21:27:01', '2020-08-27 21:27:01', NULL),
(474, 437, 12, 8.5, '2020-08-27 21:27:01', '2020-08-27 21:27:01', NULL),
(475, 437, 13, 8.5, '2020-08-27 21:27:01', '2020-08-27 21:27:01', NULL),
(476, 437, 14, 8.5, '2020-08-27 21:27:01', '2020-08-27 21:27:01', NULL),
(477, 438, 7, 800.0, '2020-08-27 21:27:01', '2020-08-27 21:27:01', NULL),
(478, 438, 8, 800.0, '2020-08-27 21:27:01', '2020-08-27 21:27:01', NULL),
(479, 438, 15, 55.0, '2020-08-27 21:27:01', '2020-08-27 21:27:01', NULL),
(480, 439, 3, 30.0, '2020-08-27 21:27:29', '2020-08-27 21:27:29', NULL),
(481, 439, 4, 30.0, '2020-08-27 21:27:29', '2020-08-27 21:27:29', NULL),
(482, 439, 10, 30.0, '2020-08-27 21:27:29', '2020-08-27 21:27:29', NULL),
(483, 439, 11, 30.0, '2020-08-27 21:27:29', '2020-08-27 21:27:29', NULL),
(484, 440, 9, 8.5, '2020-08-27 21:27:29', '2020-08-27 21:27:29', NULL),
(485, 440, 12, 8.5, '2020-08-27 21:27:29', '2020-08-27 21:27:29', NULL),
(486, 440, 13, 8.5, '2020-08-27 21:27:29', '2020-08-27 21:27:29', NULL),
(487, 440, 14, 8.5, '2020-08-27 21:27:29', '2020-08-27 21:27:29', NULL),
(488, 441, 7, 800.0, '2020-08-27 21:27:29', '2020-08-27 21:27:29', NULL),
(489, 441, 8, 800.0, '2020-08-27 21:27:29', '2020-08-27 21:27:29', NULL),
(490, 441, 15, 55.0, '2020-08-27 21:27:29', '2020-08-27 21:27:29', NULL),
(491, 442, 3, 30.0, '2020-09-08 12:45:49', '2020-09-08 12:45:49', NULL),
(492, 442, 4, 30.0, '2020-09-08 12:45:49', '2020-09-08 12:45:49', NULL),
(493, 442, 10, 30.0, '2020-09-08 12:45:49', '2020-09-08 12:45:49', NULL),
(494, 442, 11, 30.0, '2020-09-08 12:45:49', '2020-09-08 12:45:49', NULL),
(495, 443, 9, 9.0, '2020-09-08 12:45:49', '2020-09-08 12:45:49', NULL),
(496, 443, 12, 9.0, '2020-09-08 12:45:49', '2020-09-08 12:45:49', NULL),
(497, 443, 13, 9.0, '2020-09-08 12:45:49', '2020-09-08 12:45:49', NULL),
(498, 443, 14, 9.0, '2020-09-08 12:45:49', '2020-09-08 12:45:49', NULL),
(499, 444, 7, 800.0, '2020-09-08 12:45:49', '2020-09-08 12:45:49', NULL),
(500, 444, 8, 800.0, '2020-09-08 12:45:49', '2020-09-08 12:45:49', NULL),
(501, 444, 15, 454.0, '2020-09-08 12:45:49', '2020-09-08 12:45:49', NULL),
(502, 445, 3, 30.0, '2020-09-10 13:39:46', '2020-09-10 13:39:46', NULL),
(503, 445, 4, 30.0, '2020-09-10 13:39:46', '2020-09-10 13:39:46', NULL),
(504, 445, 10, 30.0, '2020-09-10 13:39:46', '2020-09-10 13:39:46', NULL),
(505, 445, 11, 30.0, '2020-09-10 13:39:46', '2020-09-10 13:39:46', NULL),
(506, 446, 9, 9.0, '2020-09-10 13:39:46', '2020-09-10 13:39:46', NULL),
(507, 446, 12, 9.0, '2020-09-10 13:39:46', '2020-09-10 13:39:46', NULL),
(508, 446, 13, 9.0, '2020-09-10 13:39:46', '2020-09-10 13:39:46', NULL),
(509, 446, 14, 9.0, '2020-09-10 13:39:46', '2020-09-10 13:39:46', NULL),
(510, 447, 7, 800.0, '2020-09-10 13:39:46', '2020-09-10 13:39:46', NULL),
(511, 447, 8, 800.0, '2020-09-10 13:39:46', '2020-09-10 13:39:46', NULL),
(512, 447, 15, 454.0, '2020-09-10 13:39:46', '2020-09-10 13:39:46', NULL),
(513, 448, 3, 30.0, '2020-09-14 08:39:37', '2020-09-14 08:39:37', NULL),
(514, 448, 4, 30.0, '2020-09-14 08:39:37', '2020-09-14 08:39:37', NULL),
(515, 448, 10, 30.0, '2020-09-14 08:39:37', '2020-09-14 08:39:37', NULL),
(516, 448, 11, 30.0, '2020-09-14 08:39:37', '2020-09-14 08:39:37', NULL),
(517, 449, 9, 9.0, '2020-09-14 08:39:37', '2020-09-14 08:39:37', NULL),
(518, 449, 12, 9.0, '2020-09-14 08:39:37', '2020-09-14 08:39:37', NULL),
(519, 449, 13, 9.0, '2020-09-14 08:39:37', '2020-09-14 08:39:37', NULL),
(520, 449, 14, 9.0, '2020-09-14 08:39:37', '2020-09-14 08:39:37', NULL),
(521, 450, 7, 800.0, '2020-09-14 08:39:37', '2020-09-14 08:39:37', NULL),
(522, 450, 8, 800.0, '2020-09-14 08:39:37', '2020-09-14 08:39:37', NULL),
(523, 450, 15, 454.0, '2020-09-14 08:39:37', '2020-09-14 08:39:37', NULL),
(524, 451, 3, 30.0, '2020-09-15 05:04:38', '2020-09-15 05:04:38', NULL),
(525, 451, 4, 30.0, '2020-09-15 05:04:38', '2020-09-15 05:04:38', NULL),
(526, 451, 10, 30.0, '2020-09-15 05:04:38', '2020-09-15 05:04:38', NULL),
(527, 451, 11, 30.0, '2020-09-15 05:04:38', '2020-09-15 05:04:38', NULL),
(528, 452, 9, 30.0, '2020-09-15 05:04:38', '2020-09-15 05:04:38', NULL),
(529, 452, 12, 30.0, '2020-09-15 05:04:38', '2020-09-15 05:04:38', NULL),
(530, 452, 13, 30.0, '2020-09-15 05:04:38', '2020-09-15 05:04:38', NULL),
(531, 452, 14, 40.0, '2020-09-15 05:04:38', '2020-09-15 05:04:38', NULL),
(532, 453, 3, 30.0, '2020-09-15 05:05:10', '2020-09-15 05:05:10', NULL),
(533, 453, 4, 30.0, '2020-09-15 05:05:10', '2020-09-15 05:05:10', NULL),
(534, 453, 10, 30.0, '2020-09-15 05:05:10', '2020-09-15 05:05:10', NULL),
(535, 453, 11, 30.0, '2020-09-15 05:05:10', '2020-09-15 05:05:10', NULL),
(536, 454, 9, 30.0, '2020-09-15 05:05:10', '2020-09-15 05:05:10', NULL),
(537, 454, 12, 30.0, '2020-09-15 05:05:10', '2020-09-15 05:05:10', NULL),
(538, 454, 13, 30.0, '2020-09-15 05:05:10', '2020-09-15 05:05:10', NULL),
(539, 454, 14, 40.0, '2020-09-15 05:05:10', '2020-09-15 05:05:10', NULL),
(540, 455, 3, 30.0, '2020-09-15 05:06:32', '2020-09-15 05:06:32', NULL),
(541, 455, 4, 30.0, '2020-09-15 05:06:32', '2020-09-15 05:06:32', NULL),
(542, 455, 10, 30.0, '2020-09-15 05:06:32', '2020-09-15 05:06:32', NULL),
(543, 455, 11, 30.0, '2020-09-15 05:06:32', '2020-09-15 05:06:32', NULL),
(544, 456, 9, 30.0, '2020-09-15 05:06:32', '2020-09-15 05:06:32', NULL),
(545, 456, 12, 30.0, '2020-09-15 05:06:32', '2020-09-15 05:06:32', NULL),
(546, 456, 13, 30.0, '2020-09-15 05:06:32', '2020-09-15 05:06:32', NULL),
(547, 456, 14, 40.0, '2020-09-15 05:06:32', '2020-09-15 05:06:32', NULL),
(548, 457, 3, 30.0, '2020-09-15 05:09:41', '2020-09-15 05:09:41', NULL),
(549, 457, 4, 30.0, '2020-09-15 05:09:41', '2020-09-15 05:09:41', NULL),
(550, 457, 10, 30.0, '2020-09-15 05:09:41', '2020-09-15 05:09:41', NULL),
(551, 457, 11, 30.0, '2020-09-15 05:09:41', '2020-09-15 05:09:41', NULL),
(552, 458, 9, 30.0, '2020-09-15 05:09:41', '2020-09-15 05:09:41', NULL),
(553, 458, 12, 30.0, '2020-09-15 05:09:41', '2020-09-15 05:09:41', NULL),
(554, 458, 13, 30.0, '2020-09-15 05:09:41', '2020-09-15 05:09:41', NULL),
(555, 458, 14, 40.0, '2020-09-15 05:09:41', '2020-09-15 05:09:41', NULL),
(556, 459, 3, 30.0, '2020-09-15 05:11:01', '2020-09-15 05:11:01', NULL),
(557, 459, 4, 30.0, '2020-09-15 05:11:01', '2020-09-15 05:11:01', NULL),
(558, 459, 10, 30.0, '2020-09-15 05:11:01', '2020-09-15 05:11:01', NULL),
(559, 459, 11, 30.0, '2020-09-15 05:11:01', '2020-09-15 05:11:01', NULL),
(560, 460, 9, 30.0, '2020-09-15 05:11:01', '2020-09-15 05:11:01', NULL),
(561, 460, 12, 30.0, '2020-09-15 05:11:01', '2020-09-15 05:11:01', NULL),
(562, 460, 13, 30.0, '2020-09-15 05:11:01', '2020-09-15 05:11:01', NULL),
(563, 460, 14, 40.0, '2020-09-15 05:11:01', '2020-09-15 05:11:01', NULL),
(564, 461, 3, 40.0, '2020-09-16 06:22:18', '2020-09-16 06:22:18', NULL),
(565, 461, 4, 40.0, '2020-09-16 06:22:18', '2020-09-16 06:22:18', NULL),
(566, 461, 10, 40.0, '2020-09-16 06:22:18', '2020-09-16 06:22:18', NULL),
(567, 461, 11, NULL, '2020-09-16 06:22:18', '2020-09-16 06:22:18', NULL),
(568, 462, 9, 30.0, '2020-09-16 06:22:18', '2020-09-16 06:22:18', NULL),
(569, 462, 12, 30.0, '2020-09-16 06:22:18', '2020-09-16 06:22:18', NULL),
(570, 462, 13, 30.0, '2020-09-16 06:22:18', '2020-09-16 06:22:18', NULL),
(571, 462, 14, 40.0, '2020-09-16 06:22:18', '2020-09-16 06:22:18', NULL),
(572, 463, 3, NULL, '2020-09-16 06:49:52', '2020-09-16 06:49:52', NULL),
(573, 463, 4, NULL, '2020-09-16 06:49:52', '2020-09-16 06:49:52', NULL),
(574, 463, 10, NULL, '2020-09-16 06:49:52', '2020-09-16 06:49:52', NULL),
(575, 463, 11, NULL, '2020-09-16 06:49:52', '2020-09-16 06:49:52', NULL),
(576, 464, 3, NULL, '2020-09-16 06:54:13', '2020-09-16 06:54:13', NULL),
(577, 464, 4, NULL, '2020-09-16 06:54:13', '2020-09-16 06:54:13', NULL),
(578, 464, 10, NULL, '2020-09-16 06:54:13', '2020-09-16 06:54:13', NULL),
(579, 464, 11, NULL, '2020-09-16 06:54:13', '2020-09-16 06:54:13', NULL),
(580, 465, 3, 30.0, '2020-09-16 07:33:32', '2020-09-16 07:33:32', NULL),
(581, 465, 4, 30.0, '2020-09-16 07:33:32', '2020-09-16 07:33:32', NULL),
(582, 465, 10, 30.0, '2020-09-16 07:33:32', '2020-09-16 07:33:32', NULL),
(583, 465, 11, 30.0, '2020-09-16 07:33:32', '2020-09-16 07:33:32', NULL),
(584, 466, 9, 9.0, '2020-09-16 07:33:32', '2020-09-16 07:33:32', NULL),
(585, 466, 12, 9.0, '2020-09-16 07:33:32', '2020-09-16 07:33:32', NULL),
(586, 466, 13, 9.0, '2020-09-16 07:33:32', '2020-09-16 07:33:32', NULL),
(587, 466, 14, 9.0, '2020-09-16 07:33:32', '2020-09-16 07:33:32', NULL),
(588, 467, 7, 800.0, '2020-09-16 07:33:32', '2020-09-16 07:33:32', NULL),
(589, 467, 8, 800.0, '2020-09-16 07:33:32', '2020-09-16 07:33:32', NULL),
(590, 467, 15, 454.0, '2020-09-16 07:33:32', '2020-09-16 07:33:32', NULL),
(591, 468, 3, 40.0, '2020-09-16 12:05:50', '2020-09-16 12:05:50', NULL),
(592, 468, 4, 40.0, '2020-09-16 12:05:50', '2020-09-16 12:05:50', NULL),
(593, 468, 10, 40.0, '2020-09-16 12:05:50', '2020-09-16 12:05:50', NULL),
(594, 468, 11, NULL, '2020-09-16 12:05:50', '2020-09-16 12:05:50', NULL),
(595, 469, 3, 40.0, '2020-09-16 12:07:33', '2020-09-16 12:07:33', NULL),
(596, 469, 4, 40.0, '2020-09-16 12:07:33', '2020-09-16 12:07:33', NULL),
(597, 469, 10, 40.0, '2020-09-16 12:07:33', '2020-09-16 12:07:33', NULL),
(598, 469, 11, NULL, '2020-09-16 12:07:33', '2020-09-16 12:07:33', NULL),
(599, 470, 3, 40.0, '2020-09-16 12:10:45', '2020-09-16 12:10:45', NULL),
(600, 470, 4, 40.0, '2020-09-16 12:10:45', '2020-09-16 12:10:45', NULL),
(601, 470, 10, 40.0, '2020-09-16 12:10:45', '2020-09-16 12:10:45', NULL),
(602, 470, 11, NULL, '2020-09-16 12:10:45', '2020-09-16 12:10:45', NULL),
(603, 471, 3, 30.0, '2020-09-16 12:13:38', '2020-09-16 12:13:38', NULL),
(604, 471, 4, 30.0, '2020-09-16 12:13:38', '2020-09-16 12:13:38', NULL),
(605, 471, 10, 30.0, '2020-09-16 12:13:38', '2020-09-16 12:13:38', NULL),
(606, 471, 11, 30.0, '2020-09-16 12:13:38', '2020-09-16 12:13:38', NULL),
(607, 472, 9, 9.0, '2020-09-16 12:13:39', '2020-09-16 12:13:39', NULL),
(608, 472, 12, 9.0, '2020-09-16 12:13:39', '2020-09-16 12:13:39', NULL),
(609, 472, 13, 9.0, '2020-09-16 12:13:39', '2020-09-16 12:13:39', NULL),
(610, 472, 14, 9.0, '2020-09-16 12:13:39', '2020-09-16 12:13:39', NULL),
(611, 473, 7, 800.0, '2020-09-16 12:13:39', '2020-09-16 12:13:39', NULL),
(612, 473, 8, 800.0, '2020-09-16 12:13:39', '2020-09-16 12:13:39', NULL),
(613, 473, 15, 454.0, '2020-09-16 12:13:39', '2020-09-16 12:13:39', NULL),
(614, 474, 3, 30.0, '2020-09-23 14:08:56', '2020-09-23 14:08:56', NULL),
(615, 474, 4, 30.0, '2020-09-23 14:08:56', '2020-09-23 14:08:56', NULL),
(616, 474, 10, 30.0, '2020-09-23 14:08:56', '2020-09-23 14:08:56', NULL),
(617, 474, 11, 30.0, '2020-09-23 14:08:56', '2020-09-23 14:08:56', NULL),
(618, 475, 9, 9.0, '2020-09-23 14:08:56', '2020-09-23 14:08:56', NULL),
(619, 475, 12, 9.0, '2020-09-23 14:08:56', '2020-09-23 14:08:56', NULL),
(620, 475, 13, 9.0, '2020-09-23 14:08:56', '2020-09-23 14:08:56', NULL),
(621, 475, 14, 9.0, '2020-09-23 14:08:56', '2020-09-23 14:08:56', NULL),
(622, 476, 7, 800.0, '2020-09-23 14:08:56', '2020-09-23 14:08:56', NULL),
(623, 476, 8, 800.0, '2020-09-23 14:08:56', '2020-09-23 14:08:56', NULL),
(624, 476, 15, 454.0, '2020-09-23 14:08:56', '2020-09-23 14:08:56', NULL),
(625, 477, 3, 30.0, '2020-09-23 14:09:58', '2020-09-23 14:09:58', NULL),
(626, 477, 4, 30.0, '2020-09-23 14:09:58', '2020-09-23 14:09:58', NULL),
(627, 477, 10, 30.0, '2020-09-23 14:09:58', '2020-09-23 14:09:58', NULL),
(628, 477, 11, 30.0, '2020-09-23 14:09:58', '2020-09-23 14:09:58', NULL),
(629, 478, 9, 9.0, '2020-09-23 14:09:58', '2020-09-23 14:09:58', NULL),
(630, 478, 12, 9.0, '2020-09-23 14:09:58', '2020-09-23 14:09:58', NULL),
(631, 478, 13, 9.0, '2020-09-23 14:09:58', '2020-09-23 14:09:58', NULL),
(632, 478, 14, 9.0, '2020-09-23 14:09:58', '2020-09-23 14:09:58', NULL),
(633, 479, 7, 800.0, '2020-09-23 14:09:58', '2020-09-23 14:09:58', NULL),
(634, 479, 8, 800.0, '2020-09-23 14:09:58', '2020-09-23 14:09:58', NULL),
(635, 479, 15, NULL, '2020-09-23 14:09:58', '2020-09-23 14:09:58', NULL),
(636, 480, 3, 40.0, '2020-09-26 04:47:38', '2020-09-26 04:47:38', NULL),
(637, 480, 4, 40.0, '2020-09-26 04:47:38', '2020-09-26 04:47:38', NULL),
(638, 480, 10, 40.0, '2020-09-26 04:47:38', '2020-09-26 04:47:38', NULL),
(639, 480, 11, NULL, '2020-09-26 04:47:38', '2020-09-26 04:47:38', NULL),
(640, 481, 9, NULL, '2020-09-26 13:10:31', '2020-09-26 13:10:31', NULL),
(641, 481, 12, NULL, '2020-09-26 13:10:31', '2020-09-26 13:10:31', NULL),
(642, 481, 13, NULL, '2020-09-26 13:10:31', '2020-09-26 13:10:31', NULL),
(643, 481, 14, NULL, '2020-09-26 13:10:31', '2020-09-26 13:10:31', NULL),
(644, 482, 9, NULL, '2020-09-26 13:15:05', '2020-09-26 13:15:05', NULL),
(645, 482, 12, NULL, '2020-09-26 13:15:05', '2020-09-26 13:15:05', NULL),
(646, 482, 13, NULL, '2020-09-26 13:15:05', '2020-09-26 13:15:05', NULL),
(647, 482, 14, NULL, '2020-09-26 13:15:05', '2020-09-26 13:15:05', NULL),
(648, 483, 9, NULL, '2020-09-26 13:19:27', '2020-09-26 13:19:27', NULL),
(649, 483, 12, NULL, '2020-09-26 13:19:27', '2020-09-26 13:19:27', NULL),
(650, 483, 13, NULL, '2020-09-26 13:19:27', '2020-09-26 13:19:27', NULL),
(651, 483, 14, NULL, '2020-09-26 13:19:27', '2020-09-26 13:19:27', NULL),
(652, 484, 9, NULL, '2020-11-04 11:02:52', '2020-11-04 11:02:52', NULL),
(653, 484, 12, NULL, '2020-11-04 11:02:52', '2020-11-04 11:02:52', NULL),
(654, 484, 13, NULL, '2020-11-04 11:02:52', '2020-11-04 11:02:52', NULL),
(655, 484, 14, NULL, '2020-11-04 11:02:52', '2020-11-04 11:02:52', NULL),
(656, 485, 9, 5.0, '2020-11-26 10:21:11', '2020-11-26 10:21:11', NULL),
(657, 485, 12, 5.0, '2020-11-26 10:21:11', '2020-11-26 10:21:11', NULL),
(658, 485, 13, 5.0, '2020-11-26 10:21:11', '2020-11-26 10:21:11', NULL),
(659, 485, 14, 5.0, '2020-11-26 10:21:11', '2020-11-26 10:21:11', NULL),
(660, 486, 3, 30.0, '2020-12-11 06:42:59', '2020-12-11 06:42:59', NULL),
(661, 486, 4, 30.0, '2020-12-11 06:42:59', '2020-12-11 06:42:59', NULL),
(662, 486, 10, 30.0, '2020-12-11 06:42:59', '2020-12-11 06:42:59', NULL),
(663, 486, 11, 30.0, '2020-12-11 06:42:59', '2020-12-11 06:42:59', NULL),
(664, 487, 9, 9.0, '2020-12-11 06:42:59', '2020-12-11 06:42:59', NULL),
(665, 487, 12, 9.0, '2020-12-11 06:42:59', '2020-12-11 06:42:59', NULL),
(666, 487, 13, 9.0, '2020-12-11 06:42:59', '2020-12-11 06:42:59', NULL),
(667, 487, 14, 9.0, '2020-12-11 06:42:59', '2020-12-11 06:42:59', NULL),
(668, 488, 7, 800.0, '2020-12-11 06:42:59', '2020-12-11 06:42:59', NULL),
(669, 488, 8, 800.0, '2020-12-11 06:42:59', '2020-12-11 06:42:59', NULL),
(670, 488, 15, NULL, '2020-12-11 06:42:59', '2020-12-11 06:42:59', NULL),
(671, 489, 3, 30.0, '2020-12-11 06:44:02', '2020-12-11 06:44:02', NULL),
(672, 489, 4, 30.0, '2020-12-11 06:44:02', '2020-12-11 06:44:02', NULL),
(673, 489, 10, 30.0, '2020-12-11 06:44:02', '2020-12-11 06:44:02', NULL),
(674, 489, 11, 30.0, '2020-12-11 06:44:02', '2020-12-11 06:44:02', NULL),
(675, 490, 9, 9.0, '2020-12-11 06:44:02', '2020-12-11 06:44:02', NULL),
(676, 490, 12, 9.0, '2020-12-11 06:44:02', '2020-12-11 06:44:02', NULL),
(677, 490, 13, 9.0, '2020-12-11 06:44:02', '2020-12-11 06:44:02', NULL),
(678, 490, 14, 9.0, '2020-12-11 06:44:02', '2020-12-11 06:44:02', NULL),
(679, 491, 7, 800.0, '2020-12-11 06:44:02', '2020-12-11 06:44:02', NULL),
(680, 491, 8, 800.0, '2020-12-11 06:44:02', '2020-12-11 06:44:02', NULL),
(681, 491, 15, NULL, '2020-12-11 06:44:02', '2020-12-11 06:44:02', NULL),
(682, 492, 3, 30.0, '2020-12-21 15:20:47', '2020-12-21 15:20:47', NULL),
(683, 492, 4, 30.0, '2020-12-21 15:20:47', '2020-12-21 15:20:47', NULL),
(684, 492, 10, 30.0, '2020-12-21 15:20:47', '2020-12-21 15:20:47', NULL),
(685, 492, 11, 30.0, '2020-12-21 15:20:47', '2020-12-21 15:20:47', NULL),
(686, 493, 9, 9.0, '2020-12-21 15:20:47', '2020-12-21 15:20:47', NULL),
(687, 493, 12, 9.0, '2020-12-21 15:20:47', '2020-12-21 15:20:47', NULL),
(688, 493, 13, 9.0, '2020-12-21 15:20:47', '2020-12-21 15:20:47', NULL),
(689, 493, 14, 9.0, '2020-12-21 15:20:47', '2020-12-21 15:20:47', NULL),
(690, 494, 7, 800.0, '2020-12-21 15:20:47', '2020-12-21 15:20:47', NULL),
(691, 494, 8, 800.0, '2020-12-21 15:20:47', '2020-12-21 15:20:47', NULL),
(692, 494, 15, NULL, '2020-12-21 15:20:47', '2020-12-21 15:20:47', NULL),
(693, 495, 7, 800.0, '2020-12-23 16:31:30', '2020-12-23 16:31:30', NULL),
(694, 495, 8, 760.0, '2020-12-23 16:31:30', '2020-12-23 16:31:30', NULL),
(695, 495, 15, NULL, '2020-12-23 16:31:30', '2020-12-23 16:31:30', NULL),
(696, 496, 3, 30.0, '2020-12-23 16:32:46', '2020-12-23 16:32:46', NULL),
(697, 496, 4, 30.0, '2020-12-23 16:32:46', '2020-12-23 16:32:46', NULL),
(698, 496, 10, 30.0, '2020-12-23 16:32:46', '2020-12-23 16:32:46', NULL),
(699, 496, 11, 30.0, '2020-12-23 16:32:46', '2020-12-23 16:32:46', NULL);
INSERT INTO `user_test_score_details` (`id`, `score_id`, `subsection_id`, `score`, `created_at`, `updated_at`, `deleted_at`) VALUES
(700, 497, 9, 9.0, '2020-12-23 16:32:46', '2020-12-23 16:32:46', NULL),
(701, 497, 12, 9.0, '2020-12-23 16:32:46', '2020-12-23 16:32:46', NULL),
(702, 497, 13, 9.0, '2020-12-23 16:32:46', '2020-12-23 16:32:46', NULL),
(703, 497, 14, 9.0, '2020-12-23 16:32:46', '2020-12-23 16:32:46', NULL),
(704, 498, 7, 800.0, '2020-12-23 16:32:46', '2020-12-23 16:32:46', NULL),
(705, 498, 8, 800.0, '2020-12-23 16:32:46', '2020-12-23 16:32:46', NULL),
(706, 498, 15, NULL, '2020-12-23 16:32:46', '2020-12-23 16:32:46', NULL),
(707, 499, 3, 30.0, '2020-12-28 07:40:42', '2020-12-28 07:40:42', NULL),
(708, 499, 4, 30.0, '2020-12-28 07:40:42', '2020-12-28 07:40:42', NULL),
(709, 499, 10, 30.0, '2020-12-28 07:40:42', '2020-12-28 07:40:42', NULL),
(710, 499, 11, 30.0, '2020-12-28 07:40:42', '2020-12-28 07:40:42', NULL),
(711, 500, 9, 9.0, '2020-12-28 07:40:42', '2020-12-28 07:40:42', NULL),
(712, 500, 12, 9.0, '2020-12-28 07:40:42', '2020-12-28 07:40:42', NULL),
(713, 500, 13, 9.0, '2020-12-28 07:40:42', '2020-12-28 07:40:42', NULL),
(714, 500, 14, 9.0, '2020-12-28 07:40:42', '2020-12-28 07:40:42', NULL),
(715, 501, 7, 800.0, '2020-12-28 07:40:42', '2020-12-28 07:40:42', NULL),
(716, 501, 8, 800.0, '2020-12-28 07:40:42', '2020-12-28 07:40:42', NULL),
(717, 501, 15, NULL, '2020-12-28 07:40:42', '2020-12-28 07:40:42', NULL),
(718, 502, 9, 8.0, '2020-12-28 09:05:46', '2020-12-28 09:05:46', NULL),
(719, 502, 12, 8.0, '2020-12-28 09:05:46', '2020-12-28 09:05:46', NULL),
(720, 502, 13, 8.0, '2020-12-28 09:05:46', '2020-12-28 09:05:46', NULL),
(721, 502, 14, 8.0, '2020-12-28 09:05:46', '2020-12-28 09:05:46', NULL),
(722, 503, 3, 25.0, '2021-01-04 17:27:37', '2021-01-04 17:27:37', NULL),
(723, 503, 4, 25.0, '2021-01-04 17:27:37', '2021-01-04 17:27:37', NULL),
(724, 503, 10, 25.0, '2021-01-04 17:27:37', '2021-01-04 17:27:37', NULL),
(725, 503, 11, 25.0, '2021-01-04 17:27:37', '2021-01-04 17:27:37', NULL),
(726, 504, 3, 25.0, '2021-01-04 17:29:18', '2021-01-04 17:29:18', NULL),
(727, 504, 4, 25.0, '2021-01-04 17:29:18', '2021-01-04 17:29:18', NULL),
(728, 504, 10, 25.0, '2021-01-04 17:29:18', '2021-01-04 17:29:18', NULL),
(729, 504, 11, 25.0, '2021-01-04 17:29:18', '2021-01-04 17:29:18', NULL),
(730, 505, 7, NULL, '2021-01-04 17:29:18', '2021-01-04 17:29:18', NULL),
(731, 505, 8, NULL, '2021-01-04 17:29:18', '2021-01-04 17:29:18', NULL),
(732, 505, 15, NULL, '2021-01-04 17:29:18', '2021-01-04 17:29:18', NULL),
(733, 506, 3, 25.0, '2021-01-04 17:30:41', '2021-01-04 17:30:41', NULL),
(734, 506, 4, 25.0, '2021-01-04 17:30:41', '2021-01-04 17:30:41', NULL),
(735, 506, 10, 25.0, '2021-01-04 17:30:41', '2021-01-04 17:30:41', NULL),
(736, 506, 11, 25.0, '2021-01-04 17:30:41', '2021-01-04 17:30:41', NULL),
(737, 507, 7, 800.0, '2021-01-04 17:30:41', '2021-01-04 17:30:41', NULL),
(738, 507, 8, 800.0, '2021-01-04 17:30:41', '2021-01-04 17:30:41', NULL),
(739, 507, 15, NULL, '2021-01-04 17:30:41', '2021-01-04 17:30:41', NULL),
(740, 508, 3, 25.0, '2021-01-04 17:35:03', '2021-01-04 17:35:03', NULL),
(741, 508, 4, 25.0, '2021-01-04 17:35:03', '2021-01-04 17:35:03', NULL),
(742, 508, 10, 25.0, '2021-01-04 17:35:03', '2021-01-04 17:35:03', NULL),
(743, 508, 11, 25.0, '2021-01-04 17:35:03', '2021-01-04 17:35:03', NULL),
(744, 509, 7, 800.0, '2021-01-04 17:35:03', '2021-01-04 17:35:03', NULL),
(745, 509, 8, 800.0, '2021-01-04 17:35:03', '2021-01-04 17:35:03', NULL),
(746, 509, 15, NULL, '2021-01-04 17:35:03', '2021-01-04 17:35:03', NULL),
(747, 510, 3, 25.0, '2021-01-05 14:48:14', '2021-01-05 14:48:14', NULL),
(748, 510, 4, 25.0, '2021-01-05 14:48:14', '2021-01-05 14:48:14', NULL),
(749, 510, 10, 25.0, '2021-01-05 14:48:14', '2021-01-05 14:48:14', NULL),
(750, 510, 11, 25.0, '2021-01-05 14:48:14', '2021-01-05 14:48:14', NULL),
(751, 511, 7, 800.0, '2021-01-05 14:48:14', '2021-01-05 14:48:14', NULL),
(752, 511, 8, 800.0, '2021-01-05 14:48:14', '2021-01-05 14:48:14', NULL),
(753, 511, 15, NULL, '2021-01-05 14:48:14', '2021-01-05 14:48:14', NULL),
(754, 512, 3, 25.0, '2021-01-05 14:49:55', '2021-01-05 14:49:55', NULL),
(755, 512, 4, 25.0, '2021-01-05 14:49:55', '2021-01-05 14:49:55', NULL),
(756, 512, 10, 25.0, '2021-01-05 14:49:55', '2021-01-05 14:49:55', NULL),
(757, 512, 11, 25.0, '2021-01-05 14:49:55', '2021-01-05 14:49:55', NULL),
(758, 513, 9, NULL, '2021-01-05 14:49:55', '2021-01-05 14:49:55', NULL),
(759, 513, 12, NULL, '2021-01-05 14:49:55', '2021-01-05 14:49:55', NULL),
(760, 513, 13, NULL, '2021-01-05 14:49:55', '2021-01-05 14:49:55', NULL),
(761, 513, 14, NULL, '2021-01-05 14:49:55', '2021-01-05 14:49:55', NULL),
(762, 514, 7, 800.0, '2021-01-05 14:49:55', '2021-01-05 14:49:55', NULL),
(763, 514, 8, 800.0, '2021-01-05 14:49:55', '2021-01-05 14:49:55', NULL),
(764, 514, 15, NULL, '2021-01-05 14:49:55', '2021-01-05 14:49:55', NULL),
(765, 515, 3, 25.0, '2021-01-05 14:51:28', '2021-01-05 14:51:28', NULL),
(766, 515, 4, 25.0, '2021-01-05 14:51:28', '2021-01-05 14:51:28', NULL),
(767, 515, 10, 25.0, '2021-01-05 14:51:28', '2021-01-05 14:51:28', NULL),
(768, 515, 11, 25.0, '2021-01-05 14:51:28', '2021-01-05 14:51:28', NULL),
(769, 516, 7, 800.0, '2021-01-05 14:51:28', '2021-01-05 14:51:28', NULL),
(770, 516, 8, 800.0, '2021-01-05 14:51:28', '2021-01-05 14:51:28', NULL),
(771, 516, 15, NULL, '2021-01-05 14:51:28', '2021-01-05 14:51:28', NULL),
(772, 517, 3, 40.0, '2021-01-18 03:59:19', '2021-01-18 03:59:19', NULL),
(773, 517, 4, 40.0, '2021-01-18 03:59:19', '2021-01-18 03:59:19', NULL),
(774, 517, 10, 40.0, '2021-01-18 03:59:19', '2021-01-18 03:59:19', NULL),
(775, 517, 11, NULL, '2021-01-18 03:59:19', '2021-01-18 03:59:19', NULL),
(776, 518, 9, 30.0, '2021-01-18 03:59:19', '2021-01-18 03:59:19', NULL),
(777, 518, 12, 30.0, '2021-01-18 03:59:19', '2021-01-18 03:59:19', NULL),
(778, 518, 13, 30.0, '2021-01-18 03:59:19', '2021-01-18 03:59:19', NULL),
(779, 518, 14, 40.0, '2021-01-18 03:59:19', '2021-01-18 03:59:19', NULL),
(780, 519, 3, 40.0, '2021-01-18 04:00:42', '2021-01-18 04:00:42', NULL),
(781, 519, 4, 40.0, '2021-01-18 04:00:42', '2021-01-18 04:00:42', NULL),
(782, 519, 10, 40.0, '2021-01-18 04:00:42', '2021-01-18 04:00:42', NULL),
(783, 519, 11, NULL, '2021-01-18 04:00:42', '2021-01-18 04:00:42', NULL),
(784, 520, 9, 30.0, '2021-01-18 04:00:42', '2021-01-18 04:00:42', NULL),
(785, 520, 12, 30.0, '2021-01-18 04:00:42', '2021-01-18 04:00:42', NULL),
(786, 520, 13, 30.0, '2021-01-18 04:00:42', '2021-01-18 04:00:42', NULL),
(787, 520, 14, 40.0, '2021-01-18 04:00:42', '2021-01-18 04:00:42', NULL),
(788, 521, 3, 25.0, '2021-01-26 05:38:51', '2021-01-26 05:38:51', NULL),
(789, 521, 4, 25.0, '2021-01-26 05:38:51', '2021-01-26 05:38:51', NULL),
(790, 521, 10, 25.0, '2021-01-26 05:38:51', '2021-01-26 05:38:51', NULL),
(791, 521, 11, 25.0, '2021-01-26 05:38:51', '2021-01-26 05:38:51', NULL),
(792, 522, 7, 800.0, '2021-01-26 05:38:51', '2021-01-26 05:38:51', NULL),
(793, 522, 8, 800.0, '2021-01-26 05:38:51', '2021-01-26 05:38:51', NULL),
(794, 522, 15, NULL, '2021-01-26 05:38:51', '2021-01-26 05:38:51', NULL),
(795, 523, 3, NULL, '2021-02-06 10:28:28', '2021-02-06 10:28:28', NULL),
(796, 523, 4, NULL, '2021-02-06 10:28:28', '2021-02-06 10:28:28', NULL),
(797, 523, 10, NULL, '2021-02-06 10:28:28', '2021-02-06 10:28:28', NULL),
(798, 523, 11, NULL, '2021-02-06 10:28:28', '2021-02-06 10:28:28', NULL),
(799, 524, 3, 25.0, '2021-02-10 07:55:13', '2021-02-10 07:55:13', NULL),
(800, 524, 4, 25.0, '2021-02-10 07:55:13', '2021-02-10 07:55:13', NULL),
(801, 524, 10, 25.0, '2021-02-10 07:55:13', '2021-02-10 07:55:13', NULL),
(802, 524, 11, 25.0, '2021-02-10 07:55:13', '2021-02-10 07:55:13', NULL),
(803, 525, 7, 800.0, '2021-02-10 07:55:13', '2021-02-10 07:55:13', NULL),
(804, 525, 8, 800.0, '2021-02-10 07:55:13', '2021-02-10 07:55:13', NULL),
(805, 525, 15, NULL, '2021-02-10 07:55:13', '2021-02-10 07:55:13', NULL),
(806, 526, 3, 25.0, '2021-02-10 07:56:23', '2021-02-10 07:56:23', NULL),
(807, 526, 4, 25.0, '2021-02-10 07:56:23', '2021-02-10 07:56:23', NULL),
(808, 526, 10, 25.0, '2021-02-10 07:56:23', '2021-02-10 07:56:23', NULL),
(809, 526, 11, 25.0, '2021-02-10 07:56:23', '2021-02-10 07:56:23', NULL),
(810, 527, 7, 800.0, '2021-02-10 07:56:23', '2021-02-10 07:56:23', NULL),
(811, 527, 8, 800.0, '2021-02-10 07:56:23', '2021-02-10 07:56:23', NULL),
(812, 527, 15, NULL, '2021-02-10 07:56:23', '2021-02-10 07:56:23', NULL),
(813, 528, 3, 25.0, '2021-02-10 08:08:41', '2021-02-10 08:08:41', NULL),
(814, 528, 4, 25.0, '2021-02-10 08:08:41', '2021-02-10 08:08:41', NULL),
(815, 528, 10, 25.0, '2021-02-10 08:08:41', '2021-02-10 08:08:41', NULL),
(816, 528, 11, 25.0, '2021-02-10 08:08:41', '2021-02-10 08:08:41', NULL),
(817, 529, 7, 800.0, '2021-02-10 08:08:41', '2021-02-10 08:08:41', NULL),
(818, 529, 8, 800.0, '2021-02-10 08:08:41', '2021-02-10 08:08:41', NULL),
(819, 529, 15, NULL, '2021-02-10 08:08:41', '2021-02-10 08:08:41', NULL),
(820, 530, 3, 25.0, '2021-02-10 10:10:00', '2021-02-10 10:10:00', NULL),
(821, 530, 4, 25.0, '2021-02-10 10:10:00', '2021-02-10 10:10:00', NULL),
(822, 530, 10, 25.0, '2021-02-10 10:10:00', '2021-02-10 10:10:00', NULL),
(823, 530, 11, 25.0, '2021-02-10 10:10:00', '2021-02-10 10:10:00', NULL),
(824, 531, 7, 800.0, '2021-02-10 10:10:00', '2021-02-10 10:10:00', NULL),
(825, 531, 8, 800.0, '2021-02-10 10:10:00', '2021-02-10 10:10:00', NULL),
(826, 531, 15, NULL, '2021-02-10 10:10:00', '2021-02-10 10:10:00', NULL),
(827, 532, 3, 25.0, '2021-02-10 10:10:07', '2021-02-10 10:10:07', NULL),
(828, 532, 4, 25.0, '2021-02-10 10:10:07', '2021-02-10 10:10:07', NULL),
(829, 532, 10, 25.0, '2021-02-10 10:10:07', '2021-02-10 10:10:07', NULL),
(830, 532, 11, 25.0, '2021-02-10 10:10:07', '2021-02-10 10:10:07', NULL),
(831, 533, 7, 800.0, '2021-02-10 10:10:07', '2021-02-10 10:10:07', NULL),
(832, 533, 8, 800.0, '2021-02-10 10:10:07', '2021-02-10 10:10:07', NULL),
(833, 533, 15, NULL, '2021-02-10 10:10:07', '2021-02-10 10:10:07', NULL),
(834, 534, 3, 40.1, '2021-02-11 11:06:44', '2021-02-11 11:06:44', NULL),
(835, 534, 4, 40.5, '2021-02-11 11:06:44', '2021-02-11 11:06:44', NULL),
(836, 534, 10, 40.9, '2021-02-11 11:06:44', '2021-02-11 11:06:44', NULL),
(837, 534, 11, NULL, '2021-02-11 11:06:44', '2021-02-11 11:06:44', NULL),
(838, 535, 9, 30.0, '2021-02-11 11:06:44', '2021-02-11 11:06:44', NULL),
(839, 535, 12, 30.0, '2021-02-11 11:06:44', '2021-02-11 11:06:44', NULL),
(840, 535, 13, 30.0, '2021-02-11 11:06:44', '2021-02-11 11:06:44', NULL),
(841, 535, 14, 40.0, '2021-02-11 11:06:44', '2021-02-11 11:06:44', NULL);

--
-- স্তুপকৃত টেবলের ইনডেক্স
--

--
-- টেবিলের ইনডেক্সসমুহ `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- টেবিলের ইনডেক্সসমুহ `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `applications_program_id_foreign` (`program_id`),
  ADD KEY `applications_student_id_foreign` (`student_id`),
  ADD KEY `applications_bonus_id_foreign` (`bonus_id`);

--
-- টেবিলের ইনডেক্সসমুহ `application_bonuses`
--
ALTER TABLE `application_bonuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `application_bonuses_application_id_foreign` (`application_id`),
  ADD KEY `application_bonuses_bonus_id_foreign` (`bonus_id`);

--
-- টেবিলের ইনডেক্সসমুহ `application_messages`
--
ALTER TABLE `application_messages`
  ADD PRIMARY KEY (`id`);

--
-- টেবিলের ইনডেক্সসমুহ `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- টেবিলের ইনডেক্সসমুহ `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`);

--
-- টেবিলের ইনডেক্সসমুহ `blog_category_translations`
--
ALTER TABLE `blog_category_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_category_translations_locale_foreign` (`locale`),
  ADD KEY `blog_category_translations_blog_category_id_foreign` (`blog_category_id`);

--
-- টেবিলের ইনডেক্সসমুহ `blog_translations`
--
ALTER TABLE `blog_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_translations_locale_foreign` (`locale`),
  ADD KEY `blog_translations_blog_id_foreign` (`blog_id`),
  ADD KEY `blog_translations_category_id_foreign` (`category_id`);

--
-- টেবিলের ইনডেক্সসমুহ `bonuses`
--
ALTER TABLE `bonuses`
  ADD PRIMARY KEY (`id`);

--
-- টেবিলের ইনডেক্সসমুহ `bonus_translations`
--
ALTER TABLE `bonus_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bonus_translations_locale_foreign` (`locale`),
  ADD KEY `bonus_translations_bonus_id_foreign` (`bonus_id`);

--
-- টেবিলের ইনডেক্সসমুহ `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cities_country_id_foreign` (`country_id`),
  ADD KEY `cities_state_id_foreign` (`state_id`);

--
-- টেবিলের ইনডেক্সসমুহ `city_translations`
--
ALTER TABLE `city_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `city_translations_locale_foreign` (`locale`),
  ADD KEY `city_translations_city_id_foreign` (`city_id`);

--
-- টেবিলের ইনডেক্সসমুহ `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `contact_us_phone_unique` (`phone`),
  ADD UNIQUE KEY `contact_us_email_unique` (`email`),
  ADD KEY `contact_us_country_foreign` (`country`);

--
-- টেবিলের ইনডেক্সসমুহ `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `countries_currency_id_foreign` (`currency_id`);

--
-- টেবিলের ইনডেক্সসমুহ `country_translations`
--
ALTER TABLE `country_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_translations_locale_foreign` (`locale`),
  ADD KEY `country_translations_country_id_foreign` (`country_id`);

--
-- টেবিলের ইনডেক্সসমুহ `country_wise_education`
--
ALTER TABLE `country_wise_education`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_wise_education_residential_country_id_foreign` (`residential_country_id`),
  ADD KEY `country_wise_education_destination_country_id_foreign` (`destination_country_id`),
  ADD KEY `country_wise_education_residential_degree_id_foreign` (`residential_degree_id`),
  ADD KEY `country_wise_education_destination_degree_id_foreign` (`destination_degree_id`);

--
-- টেবিলের ইনডেক্সসমুহ `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- টেবিলের ইনডেক্সসমুহ `education_levels`
--
ALTER TABLE `education_levels`
  ADD PRIMARY KEY (`id`);

--
-- টেবিলের ইনডেক্সসমুহ `education_level_translations`
--
ALTER TABLE `education_level_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `education_level_translations_locale_foreign` (`locale`),
  ADD KEY `education_level_translations_education_level_id_foreign` (`education_level_id`);

--
-- টেবিলের ইনডেক্সসমুহ `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exams_parent_id_foreign` (`parent_id`);

--
-- টেবিলের ইনডেক্সসমুহ `exam_sub_sections`
--
ALTER TABLE `exam_sub_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_sub_sections_exam_id_foreign` (`exam_id`);

--
-- টেবিলের ইনডেক্সসমুহ `exam_sub_section_translations`
--
ALTER TABLE `exam_sub_section_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_sub_section_translations_locale_foreign` (`locale`),
  ADD KEY `exam_sub_section_translations_exam_sub_section_id_foreign` (`exam_sub_section_id`);

--
-- টেবিলের ইনডেক্সসমুহ `exam_translations`
--
ALTER TABLE `exam_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_translations_locale_foreign` (`locale`),
  ADD KEY `exam_translations_exam_id_foreign` (`exam_id`);

--
-- টেবিলের ইনডেক্সসমুহ `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- টেবিলের ইনডেক্সসমুহ `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faqs_institution_id_foreign` (`institution_id`),
  ADD KEY `faqs_program_id_foreign` (`program_id`),
  ADD KEY `faqs_country_id_foreign` (`country_id`);

--
-- টেবিলের ইনডেক্সসমুহ `faq_translations`
--
ALTER TABLE `faq_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `faq_translations_locale_foreign` (`locale`),
  ADD KEY `faq_translations_faq_id_foreign` (`faq_id`);

--
-- টেবিলের ইনডেক্সসমুহ `foundation_routes`
--
ALTER TABLE `foundation_routes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foundation_routes_country_id_foreign` (`country_id`);

--
-- টেবিলের ইনডেক্সসমুহ `grading_schemes`
--
ALTER TABLE `grading_schemes`
  ADD PRIMARY KEY (`id`);

--
-- টেবিলের ইনডেক্সসমুহ `grading_scheme_counrty_education_levels`
--
ALTER TABLE `grading_scheme_counrty_education_levels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gd_id` (`grading_scheme_id`),
  ADD KEY `grading_scheme_counrty_education_levels_country_id_foreign` (`country_id`),
  ADD KEY `e_id` (`education_level_id`);

--
-- টেবিলের ইনডেক্সসমুহ `grading_scheme_data`
--
ALTER TABLE `grading_scheme_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `grading_scheme_data_grading_scheme_id_foreign` (`grading_scheme_id`);

--
-- টেবিলের ইনডেক্সসমুহ `grading_scheme_data_translations`
--
ALTER TABLE `grading_scheme_data_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `grading_scheme_data_translations_locale_foreign` (`locale`),
  ADD KEY `gs_id` (`grading_scheme_data_id`);

--
-- টেবিলের ইনডেক্সসমুহ `institutions`
--
ALTER TABLE `institutions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `institutions_type_id_foreign` (`type_id`),
  ADD KEY `institutions_country_id_foreign` (`country_id`),
  ADD KEY `institutions_city_id_foreign` (`city_id`),
  ADD KEY `institutions_state_id_foreign` (`state_id`),
  ADD KEY `institutions_unirep_id_foreign` (`unirep_id`);

--
-- টেবিলের ইনডেক্সসমুহ `institution_images`
--
ALTER TABLE `institution_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `institution_images_institution_id_foreign` (`institution_id`);

--
-- টেবিলের ইনডেক্সসমুহ `institution_programs`
--
ALTER TABLE `institution_programs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `institution_programs_institution_id_foreign` (`institution_id`),
  ADD KEY `institution_programs_country_id_foreign` (`country_id`),
  ADD KEY `dl_id` (`current_degree_level_id`),
  ADD KEY `institution_programs_degree_level_id_foreign` (`degree_level_id`),
  ADD KEY `institution_programs_study_type_id_foreign` (`study_type_id`),
  ADD KEY `institution_programs_study_duration_id_foreign` (`study_duration_id`),
  ADD KEY `institution_programs_language_id_foreign` (`language_id`),
  ADD KEY `institution_programs_currency_id_foreign` (`currency_id`),
  ADD KEY `institution_programs_state_id_foreign` (`state_id`),
  ADD KEY `city_id` (`city_id`),
  ADD KEY `institution_programs_unirep_id_foreign` (`unirep_id`);

--
-- টেবিলের ইনডেক্সসমুহ `institution_program_bonuses`
--
ALTER TABLE `institution_program_bonuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `institution_program_bonuses_institution_program_id_foreign` (`institution_program_id`),
  ADD KEY `institution_program_bonuses_bonus_id_foreign` (`bonus_id`);

--
-- টেবিলের ইনডেক্সসমুহ `institution_program_deadlines`
--
ALTER TABLE `institution_program_deadlines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `institution_program_deadlines_institution_program_id_foreign` (`institution_program_id`);

--
-- টেবিলের ইনডেক্সসমুহ `institution_program_exam_requirements`
--
ALTER TABLE `institution_program_exam_requirements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `institute_program_id_foreign` (`institution_program_id`);

--
-- টেবিলের ইনডেক্সসমুহ `institution_program_exam_requirement_details`
--
ALTER TABLE `institution_program_exam_requirement_details`
  ADD PRIMARY KEY (`id`);

--
-- টেবিলের ইনডেক্সসমুহ `institution_program_notify_tracks`
--
ALTER TABLE `institution_program_notify_tracks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `institution_program_notify_tracks_student_id_foreign` (`student_id`),
  ADD KEY `institution_program_notify_tracks_institution_program_id_foreign` (`institution_program_id`);

--
-- টেবিলের ইনডেক্সসমুহ `institution_program_study_areas`
--
ALTER TABLE `institution_program_study_areas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `institution_program_study_areas_institution_program_id_foreign` (`institution_program_id`),
  ADD KEY `institution_program_study_areas_study_area_id_foreign` (`study_area_id`);

--
-- টেবিলের ইনডেক্সসমুহ `institution_program_translations`
--
ALTER TABLE `institution_program_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `institution_program_translations_institution_program_id_foreign` (`institution_program_id`),
  ADD KEY `institution_program_translations_locale_foreign` (`locale`);

--
-- টেবিলের ইনডেক্সসমুহ `institution_translations`
--
ALTER TABLE `institution_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `institution_translations_locale_foreign` (`locale`),
  ADD KEY `institution_translations_institution_id_foreign` (`institution_id`);

--
-- টেবিলের ইনডেক্সসমুহ `institution_types`
--
ALTER TABLE `institution_types`
  ADD PRIMARY KEY (`id`);

--
-- টেবিলের ইনডেক্সসমুহ `institution_type_translations`
--
ALTER TABLE `institution_type_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `institution_type_translations_locale_foreign` (`locale`),
  ADD KEY `institution_type_translations_institution_type_id_foreign` (`institution_type_id`);

--
-- টেবিলের ইনডেক্সসমুহ `labels`
--
ALTER TABLE `labels`
  ADD PRIMARY KEY (`id`);

--
-- টেবিলের ইনডেক্সসমুহ `label_translations`
--
ALTER TABLE `label_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `label_translations_locale_foreign` (`locale`),
  ADD KEY `label_translations_label_id_foreign` (`label_id`);

--
-- টেবিলের ইনডেক্সসমুহ `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- টেবিলের ইনডেক্সসমুহ `locales`
--
ALTER TABLE `locales`
  ADD PRIMARY KEY (`locale`);

--
-- টেবিলের ইনডেক্সসমুহ `mails`
--
ALTER TABLE `mails`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mails_email_unique` (`email`);

--
-- টেবিলের ইনডেক্সসমুহ `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- টেবিলের ইনডেক্সসমুহ `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- টেবিলের ইনডেক্সসমুহ `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- টেবিলের ইনডেক্সসমুহ `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- টেবিলের ইনডেক্সসমুহ `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- টেবিলের ইনডেক্সসমুহ `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`);

--
-- টেবিলের ইনডেক্সসমুহ `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`(191));

--
-- টেবিলের ইনডেক্সসমুহ `prefilled_dates`
--
ALTER TABLE `prefilled_dates`
  ADD PRIMARY KEY (`id`);

--
-- টেবিলের ইনডেক্সসমুহ `program_ratings`
--
ALTER TABLE `program_ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `program_ratings_student_id_foreign` (`student_id`),
  ADD KEY `program_ratings_institution_program_id_foreign` (`institution_program_id`);

--
-- টেবিলের ইনডেক্সসমুহ `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`),
  ADD KEY `states_country_id_foreign` (`country_id`);

--
-- টেবিলের ইনডেক্সসমুহ `state_translations`
--
ALTER TABLE `state_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `state_translations_locale_foreign` (`locale`),
  ADD KEY `state_translations_state_id_foreign` (`state_id`);

--
-- টেবিলের ইনডেক্সসমুহ `student_favorite_programs`
--
ALTER TABLE `student_favorite_programs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_favorite_programs_student_id_foreign` (`student_id`),
  ADD KEY `student_favorite_programs_program_id_foreign` (`program_id`);

--
-- টেবিলের ইনডেক্সসমুহ `student_favorite_universities`
--
ALTER TABLE `student_favorite_universities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_favorite_universities_student_id_foreign` (`student_id`),
  ADD KEY `student_favorite_universities_institution_id_foreign` (`institution_id`);

--
-- টেবিলের ইনডেক্সসমুহ `study_areas`
--
ALTER TABLE `study_areas`
  ADD PRIMARY KEY (`id`);

--
-- টেবিলের ইনডেক্সসমুহ `study_area_translations`
--
ALTER TABLE `study_area_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `study_area_translations_locale_foreign` (`locale`),
  ADD KEY `study_area_translations_study_area_id_foreign` (`study_area_id`);

--
-- টেবিলের ইনডেক্সসমুহ `study_durations`
--
ALTER TABLE `study_durations`
  ADD PRIMARY KEY (`id`);

--
-- টেবিলের ইনডেক্সসমুহ `study_duration_translations`
--
ALTER TABLE `study_duration_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `study_duration_translations_locale_foreign` (`locale`),
  ADD KEY `study_duration_translations_study_duration_id_foreign` (`study_duration_id`);

--
-- টেবিলের ইনডেক্সসমুহ `study_types`
--
ALTER TABLE `study_types`
  ADD PRIMARY KEY (`id`);

--
-- টেবিলের ইনডেক্সসমুহ `study_type_translations`
--
ALTER TABLE `study_type_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `study_type_translations_locale_foreign` (`locale`),
  ADD KEY `study_type_translations_study_type_id_foreign` (`study_type_id`);

--
-- টেবিলের ইনডেক্সসমুহ `tution_fees`
--
ALTER TABLE `tution_fees`
  ADD PRIMARY KEY (`id`);

--
-- টেবিলের ইনডেক্সসমুহ `tution_fees_periods`
--
ALTER TABLE `tution_fees_periods`
  ADD PRIMARY KEY (`id`);

--
-- টেবিলের ইনডেক্সসমুহ `tution_fees_period_translations`
--
ALTER TABLE `tution_fees_period_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tution_fees_period_translations_locale_foreign` (`locale`),
  ADD KEY `tution_fees_period_translations_tution_fees_period_id_foreign` (`tution_fees_period_id`);

--
-- টেবিলের ইনডেক্সসমুহ `tution_fee_translations`
--
ALTER TABLE `tution_fee_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tution_fee_translations_locale_foreign` (`locale`),
  ADD KEY `tution_fee_translations_tution_fee_id_foreign` (`tution_fee_id`);

--
-- টেবিলের ইনডেক্সসমুহ `university_representatives`
--
ALTER TABLE `university_representatives`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `university_representatives_email_unique` (`email`),
  ADD KEY `university_representatives_country_id_foreign` (`country_id`),
  ADD KEY `university_representatives_state_id_foreign` (`state_id`),
  ADD KEY `university_representatives_city_id_foreign` (`city_id`);

--
-- টেবিলের ইনডেক্সসমুহ `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`),
  ADD KEY `users_country_foreign` (`country`),
  ADD KEY `users_state_foreign` (`state`),
  ADD KEY `users_city_foreign` (`city`);

--
-- টেবিলের ইনডেক্সসমুহ `user_documents`
--
ALTER TABLE `user_documents`
  ADD PRIMARY KEY (`id`);

--
-- টেবিলের ইনডেক্সসমুহ `user_education_details`
--
ALTER TABLE `user_education_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_education_details_user_id_foreign` (`user_id`),
  ADD KEY `user_education_details_edu_country_id_foreign` (`edu_country_id`),
  ADD KEY `user_education_details_edu_highest_level_id_foreign` (`edu_highest_level_id`),
  ADD KEY `user_education_details_edu_grade_scheme_id_foreign` (`edu_grade_scheme_id`),
  ADD KEY `user_education_details_study_program_level_id_foreign` (`study_program_level_id`),
  ADD KEY `user_education_details_study_area_id_foreign` (`study_area_id`);

--
-- টেবিলের ইনডেক্সসমুহ `user_schools_attendeds`
--
ALTER TABLE `user_schools_attendeds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_schools_attendeds_user_id_foreign` (`user_id`),
  ADD KEY `user_schools_attendeds_at_edu_level_id_foreign` (`at_edu_level_id`),
  ADD KEY `user_schools_attendeds_at_edu_country_id_foreign` (`at_edu_country_id`);

--
-- টেবিলের ইনডেক্সসমুহ `user_test_scores`
--
ALTER TABLE `user_test_scores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_test_scores_user_id_foreign` (`user_id`),
  ADD KEY `user_test_scores_exam_id_foreign` (`exam_id`);

--
-- টেবিলের ইনডেক্সসমুহ `user_test_score_details`
--
ALTER TABLE `user_test_score_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_test_score_details_score_id_foreign` (`score_id`),
  ADD KEY `user_test_score_details_subsection_id_foreign` (`subsection_id`);

--
-- স্তুপকৃত টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT)
--

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `applications`
--
ALTER TABLE `applications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `application_bonuses`
--
ALTER TABLE `application_bonuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `application_messages`
--
ALTER TABLE `application_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `blog_category_translations`
--
ALTER TABLE `blog_category_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `blog_translations`
--
ALTER TABLE `blog_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `bonuses`
--
ALTER TABLE `bonuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `bonus_translations`
--
ALTER TABLE `bonus_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `city_translations`
--
ALTER TABLE `city_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `country_translations`
--
ALTER TABLE `country_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `country_wise_education`
--
ALTER TABLE `country_wise_education`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `education_levels`
--
ALTER TABLE `education_levels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `education_level_translations`
--
ALTER TABLE `education_level_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `exams`
--
ALTER TABLE `exams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `exam_sub_sections`
--
ALTER TABLE `exam_sub_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `exam_sub_section_translations`
--
ALTER TABLE `exam_sub_section_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `exam_translations`
--
ALTER TABLE `exam_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `faq_translations`
--
ALTER TABLE `faq_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `foundation_routes`
--
ALTER TABLE `foundation_routes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `grading_schemes`
--
ALTER TABLE `grading_schemes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `grading_scheme_counrty_education_levels`
--
ALTER TABLE `grading_scheme_counrty_education_levels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `grading_scheme_data`
--
ALTER TABLE `grading_scheme_data`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `grading_scheme_data_translations`
--
ALTER TABLE `grading_scheme_data_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `institutions`
--
ALTER TABLE `institutions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `institution_images`
--
ALTER TABLE `institution_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `institution_programs`
--
ALTER TABLE `institution_programs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=285;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `institution_program_bonuses`
--
ALTER TABLE `institution_program_bonuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=451;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `institution_program_deadlines`
--
ALTER TABLE `institution_program_deadlines`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=606;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `institution_program_exam_requirements`
--
ALTER TABLE `institution_program_exam_requirements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=757;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `institution_program_exam_requirement_details`
--
ALTER TABLE `institution_program_exam_requirement_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2187;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `institution_program_notify_tracks`
--
ALTER TABLE `institution_program_notify_tracks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `institution_program_study_areas`
--
ALTER TABLE `institution_program_study_areas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=351;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `institution_program_translations`
--
ALTER TABLE `institution_program_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=290;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `institution_translations`
--
ALTER TABLE `institution_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `institution_types`
--
ALTER TABLE `institution_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `institution_type_translations`
--
ALTER TABLE `institution_type_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `labels`
--
ALTER TABLE `labels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `label_translations`
--
ALTER TABLE `label_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `mails`
--
ALTER TABLE `mails`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `prefilled_dates`
--
ALTER TABLE `prefilled_dates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `program_ratings`
--
ALTER TABLE `program_ratings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `state_translations`
--
ALTER TABLE `state_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `student_favorite_programs`
--
ALTER TABLE `student_favorite_programs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `student_favorite_universities`
--
ALTER TABLE `student_favorite_universities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `study_areas`
--
ALTER TABLE `study_areas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `study_area_translations`
--
ALTER TABLE `study_area_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `study_durations`
--
ALTER TABLE `study_durations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `study_duration_translations`
--
ALTER TABLE `study_duration_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `study_types`
--
ALTER TABLE `study_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `study_type_translations`
--
ALTER TABLE `study_type_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `tution_fees`
--
ALTER TABLE `tution_fees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `tution_fees_periods`
--
ALTER TABLE `tution_fees_periods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `tution_fees_period_translations`
--
ALTER TABLE `tution_fees_period_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `tution_fee_translations`
--
ALTER TABLE `tution_fee_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `university_representatives`
--
ALTER TABLE `university_representatives`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `user_documents`
--
ALTER TABLE `user_documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `user_education_details`
--
ALTER TABLE `user_education_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `user_schools_attendeds`
--
ALTER TABLE `user_schools_attendeds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `user_test_scores`
--
ALTER TABLE `user_test_scores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=536;

--
-- টেবলের জন্য স্বয়ক্রীয় বর্দ্ধিত মান (AUTO_INCREMENT) `user_test_score_details`
--
ALTER TABLE `user_test_score_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=842;

--
-- স্তুপকৃত টেবলের সীমবদ্ধতা
--

--
-- টেবলের সীমবদ্ধতা `applications`
--
ALTER TABLE `applications`
  ADD CONSTRAINT `applications_bonus_id_foreign` FOREIGN KEY (`bonus_id`) REFERENCES `bonuses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `applications_program_id_foreign` FOREIGN KEY (`program_id`) REFERENCES `institution_programs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `applications_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- টেবলের সীমবদ্ধতা `application_bonuses`
--
ALTER TABLE `application_bonuses`
  ADD CONSTRAINT `application_bonuses_application_id_foreign` FOREIGN KEY (`application_id`) REFERENCES `applications` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `application_bonuses_bonus_id_foreign` FOREIGN KEY (`bonus_id`) REFERENCES `bonuses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- টেবলের সীমবদ্ধতা `blog_category_translations`
--
ALTER TABLE `blog_category_translations`
  ADD CONSTRAINT `blog_category_translations_blog_category_id_foreign` FOREIGN KEY (`blog_category_id`) REFERENCES `blog_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `blog_category_translations_locale_foreign` FOREIGN KEY (`locale`) REFERENCES `locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- টেবলের সীমবদ্ধতা `blog_translations`
--
ALTER TABLE `blog_translations`
  ADD CONSTRAINT `blog_translations_blog_id_foreign` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `blog_translations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `blog_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `blog_translations_locale_foreign` FOREIGN KEY (`locale`) REFERENCES `locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- টেবলের সীমবদ্ধতা `bonus_translations`
--
ALTER TABLE `bonus_translations`
  ADD CONSTRAINT `bonus_translations_bonus_id_foreign` FOREIGN KEY (`bonus_id`) REFERENCES `bonuses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bonus_translations_locale_foreign` FOREIGN KEY (`locale`) REFERENCES `locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- টেবলের সীমবদ্ধতা `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cities_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- টেবলের সীমবদ্ধতা `city_translations`
--
ALTER TABLE `city_translations`
  ADD CONSTRAINT `city_translations_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `city_translations_locale_foreign` FOREIGN KEY (`locale`) REFERENCES `locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- টেবলের সীমবদ্ধতা `contact_us`
--
ALTER TABLE `contact_us`
  ADD CONSTRAINT `contact_us_country_foreign` FOREIGN KEY (`country`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- টেবলের সীমবদ্ধতা `countries`
--
ALTER TABLE `countries`
  ADD CONSTRAINT `countries_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- টেবলের সীমবদ্ধতা `country_translations`
--
ALTER TABLE `country_translations`
  ADD CONSTRAINT `country_translations_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `country_translations_locale_foreign` FOREIGN KEY (`locale`) REFERENCES `locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- টেবলের সীমবদ্ধতা `country_wise_education`
--
ALTER TABLE `country_wise_education`
  ADD CONSTRAINT `country_wise_education_destination_country_id_foreign` FOREIGN KEY (`destination_country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `country_wise_education_destination_degree_id_foreign` FOREIGN KEY (`destination_degree_id`) REFERENCES `education_levels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `country_wise_education_residential_country_id_foreign` FOREIGN KEY (`residential_country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `country_wise_education_residential_degree_id_foreign` FOREIGN KEY (`residential_degree_id`) REFERENCES `education_levels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- টেবলের সীমবদ্ধতা `education_level_translations`
--
ALTER TABLE `education_level_translations`
  ADD CONSTRAINT `education_level_translations_education_level_id_foreign` FOREIGN KEY (`education_level_id`) REFERENCES `education_levels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `education_level_translations_locale_foreign` FOREIGN KEY (`locale`) REFERENCES `locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- টেবলের সীমবদ্ধতা `exams`
--
ALTER TABLE `exams`
  ADD CONSTRAINT `exams_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- টেবলের সীমবদ্ধতা `exam_sub_sections`
--
ALTER TABLE `exam_sub_sections`
  ADD CONSTRAINT `exam_sub_sections_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`);

--
-- টেবলের সীমবদ্ধতা `exam_sub_section_translations`
--
ALTER TABLE `exam_sub_section_translations`
  ADD CONSTRAINT `exam_sub_section_translations_exam_sub_section_id_foreign` FOREIGN KEY (`exam_sub_section_id`) REFERENCES `exam_sub_sections` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `exam_sub_section_translations_locale_foreign` FOREIGN KEY (`locale`) REFERENCES `locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- টেবলের সীমবদ্ধতা `exam_translations`
--
ALTER TABLE `exam_translations`
  ADD CONSTRAINT `exam_translations_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `exam_translations_locale_foreign` FOREIGN KEY (`locale`) REFERENCES `locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- টেবলের সীমবদ্ধতা `faqs`
--
ALTER TABLE `faqs`
  ADD CONSTRAINT `faqs_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `faqs_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `faqs_program_id_foreign` FOREIGN KEY (`program_id`) REFERENCES `institution_programs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- টেবলের সীমবদ্ধতা `faq_translations`
--
ALTER TABLE `faq_translations`
  ADD CONSTRAINT `faq_translations_faq_id_foreign` FOREIGN KEY (`faq_id`) REFERENCES `faqs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `faq_translations_locale_foreign` FOREIGN KEY (`locale`) REFERENCES `locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- টেবলের সীমবদ্ধতা `foundation_routes`
--
ALTER TABLE `foundation_routes`
  ADD CONSTRAINT `foundation_routes_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- টেবলের সীমবদ্ধতা `grading_scheme_counrty_education_levels`
--
ALTER TABLE `grading_scheme_counrty_education_levels`
  ADD CONSTRAINT `e_id` FOREIGN KEY (`education_level_id`) REFERENCES `education_levels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `gd_id` FOREIGN KEY (`grading_scheme_id`) REFERENCES `grading_schemes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grading_scheme_counrty_education_levels_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- টেবলের সীমবদ্ধতা `grading_scheme_data`
--
ALTER TABLE `grading_scheme_data`
  ADD CONSTRAINT `grading_scheme_data_grading_scheme_id_foreign` FOREIGN KEY (`grading_scheme_id`) REFERENCES `grading_schemes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- টেবলের সীমবদ্ধতা `grading_scheme_data_translations`
--
ALTER TABLE `grading_scheme_data_translations`
  ADD CONSTRAINT `grading_scheme_data_translations_locale_foreign` FOREIGN KEY (`locale`) REFERENCES `locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `gs_id` FOREIGN KEY (`grading_scheme_data_id`) REFERENCES `grading_scheme_data` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- টেবলের সীমবদ্ধতা `institutions`
--
ALTER TABLE `institutions`
  ADD CONSTRAINT `institutions_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `institutions_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `institutions_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `institutions_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `institution_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `institutions_unirep_id_foreign` FOREIGN KEY (`unirep_id`) REFERENCES `university_representatives` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- টেবলের সীমবদ্ধতা `institution_images`
--
ALTER TABLE `institution_images`
  ADD CONSTRAINT `institution_images_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- টেবলের সীমবদ্ধতা `institution_programs`
--
ALTER TABLE `institution_programs`
  ADD CONSTRAINT `dl_id` FOREIGN KEY (`current_degree_level_id`) REFERENCES `education_levels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `institution_programs_city_id` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `institution_programs_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `institution_programs_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `institution_programs_degree_level_id_foreign` FOREIGN KEY (`degree_level_id`) REFERENCES `education_levels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `institution_programs_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `institution_programs_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `institution_programs_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `institution_programs_study_duration_id_foreign` FOREIGN KEY (`study_duration_id`) REFERENCES `study_durations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `institution_programs_study_type_id_foreign` FOREIGN KEY (`study_type_id`) REFERENCES `study_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `institution_programs_unirep_id_foreign` FOREIGN KEY (`unirep_id`) REFERENCES `university_representatives` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- টেবলের সীমবদ্ধতা `institution_program_bonuses`
--
ALTER TABLE `institution_program_bonuses`
  ADD CONSTRAINT `institution_program_bonuses_bonus_id_foreign` FOREIGN KEY (`bonus_id`) REFERENCES `bonuses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `institution_program_bonuses_institution_program_id_foreign` FOREIGN KEY (`institution_program_id`) REFERENCES `institution_programs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- টেবলের সীমবদ্ধতা `institution_program_deadlines`
--
ALTER TABLE `institution_program_deadlines`
  ADD CONSTRAINT `institution_program_deadlines_institution_program_id_foreign` FOREIGN KEY (`institution_program_id`) REFERENCES `institution_programs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- টেবলের সীমবদ্ধতা `institution_program_exam_requirements`
--
ALTER TABLE `institution_program_exam_requirements`
  ADD CONSTRAINT `institute_program_id_foreign` FOREIGN KEY (`institution_program_id`) REFERENCES `institution_programs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- টেবলের সীমবদ্ধতা `institution_program_notify_tracks`
--
ALTER TABLE `institution_program_notify_tracks`
  ADD CONSTRAINT `institution_program_notify_tracks_institution_program_id_foreign` FOREIGN KEY (`institution_program_id`) REFERENCES `institution_programs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `institution_program_notify_tracks_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- টেবলের সীমবদ্ধতা `institution_program_study_areas`
--
ALTER TABLE `institution_program_study_areas`
  ADD CONSTRAINT `institution_program_study_areas_institution_program_id_foreign` FOREIGN KEY (`institution_program_id`) REFERENCES `institution_programs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `institution_program_study_areas_study_area_id_foreign` FOREIGN KEY (`study_area_id`) REFERENCES `study_areas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- টেবলের সীমবদ্ধতা `institution_program_translations`
--
ALTER TABLE `institution_program_translations`
  ADD CONSTRAINT `institution_program_translations_institution_program_id_foreign` FOREIGN KEY (`institution_program_id`) REFERENCES `institution_programs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `institution_program_translations_locale_foreign` FOREIGN KEY (`locale`) REFERENCES `locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- টেবলের সীমবদ্ধতা `institution_translations`
--
ALTER TABLE `institution_translations`
  ADD CONSTRAINT `institution_translations_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `institution_translations_locale_foreign` FOREIGN KEY (`locale`) REFERENCES `locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- টেবলের সীমবদ্ধতা `institution_type_translations`
--
ALTER TABLE `institution_type_translations`
  ADD CONSTRAINT `institution_type_translations_institution_type_id_foreign` FOREIGN KEY (`institution_type_id`) REFERENCES `institution_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `institution_type_translations_locale_foreign` FOREIGN KEY (`locale`) REFERENCES `locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- টেবলের সীমবদ্ধতা `label_translations`
--
ALTER TABLE `label_translations`
  ADD CONSTRAINT `label_translations_label_id_foreign` FOREIGN KEY (`label_id`) REFERENCES `labels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `label_translations_locale_foreign` FOREIGN KEY (`locale`) REFERENCES `locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- টেবলের সীমবদ্ধতা `program_ratings`
--
ALTER TABLE `program_ratings`
  ADD CONSTRAINT `program_ratings_institution_program_id_foreign` FOREIGN KEY (`institution_program_id`) REFERENCES `institution_programs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `program_ratings_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- টেবলের সীমবদ্ধতা `states`
--
ALTER TABLE `states`
  ADD CONSTRAINT `states_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- টেবলের সীমবদ্ধতা `state_translations`
--
ALTER TABLE `state_translations`
  ADD CONSTRAINT `state_translations_locale_foreign` FOREIGN KEY (`locale`) REFERENCES `locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `state_translations_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- টেবলের সীমবদ্ধতা `student_favorite_programs`
--
ALTER TABLE `student_favorite_programs`
  ADD CONSTRAINT `student_favorite_programs_program_id_foreign` FOREIGN KEY (`program_id`) REFERENCES `institution_programs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_favorite_programs_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- টেবলের সীমবদ্ধতা `student_favorite_universities`
--
ALTER TABLE `student_favorite_universities`
  ADD CONSTRAINT `student_favorite_universities_institution_id_foreign` FOREIGN KEY (`institution_id`) REFERENCES `institutions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_favorite_universities_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- টেবলের সীমবদ্ধতা `study_area_translations`
--
ALTER TABLE `study_area_translations`
  ADD CONSTRAINT `study_area_translations_locale_foreign` FOREIGN KEY (`locale`) REFERENCES `locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `study_area_translations_study_area_id_foreign` FOREIGN KEY (`study_area_id`) REFERENCES `study_areas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- টেবলের সীমবদ্ধতা `study_duration_translations`
--
ALTER TABLE `study_duration_translations`
  ADD CONSTRAINT `study_duration_translations_locale_foreign` FOREIGN KEY (`locale`) REFERENCES `locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `study_duration_translations_study_duration_id_foreign` FOREIGN KEY (`study_duration_id`) REFERENCES `study_durations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- টেবলের সীমবদ্ধতা `study_type_translations`
--
ALTER TABLE `study_type_translations`
  ADD CONSTRAINT `study_type_translations_locale_foreign` FOREIGN KEY (`locale`) REFERENCES `locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `study_type_translations_study_type_id_foreign` FOREIGN KEY (`study_type_id`) REFERENCES `study_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- টেবলের সীমবদ্ধতা `tution_fees_period_translations`
--
ALTER TABLE `tution_fees_period_translations`
  ADD CONSTRAINT `tution_fees_period_translations_locale_foreign` FOREIGN KEY (`locale`) REFERENCES `locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tution_fees_period_translations_tution_fees_period_id_foreign` FOREIGN KEY (`tution_fees_period_id`) REFERENCES `tution_fees_periods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- টেবলের সীমবদ্ধতা `tution_fee_translations`
--
ALTER TABLE `tution_fee_translations`
  ADD CONSTRAINT `tution_fee_translations_locale_foreign` FOREIGN KEY (`locale`) REFERENCES `locales` (`locale`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tution_fee_translations_tution_fee_id_foreign` FOREIGN KEY (`tution_fee_id`) REFERENCES `tution_fees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- টেবলের সীমবদ্ধতা `university_representatives`
--
ALTER TABLE `university_representatives`
  ADD CONSTRAINT `university_representatives_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `university_representatives_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `university_representatives_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- টেবলের সীমবদ্ধতা `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_city_foreign` FOREIGN KEY (`city`) REFERENCES `cities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_country_foreign` FOREIGN KEY (`country`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_state_foreign` FOREIGN KEY (`state`) REFERENCES `states` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- টেবলের সীমবদ্ধতা `user_education_details`
--
ALTER TABLE `user_education_details`
  ADD CONSTRAINT `user_education_details_edu_country_id_foreign` FOREIGN KEY (`edu_country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_education_details_edu_grade_scheme_id_foreign` FOREIGN KEY (`edu_grade_scheme_id`) REFERENCES `grading_schemes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_education_details_edu_highest_level_id_foreign` FOREIGN KEY (`edu_highest_level_id`) REFERENCES `education_levels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_education_details_study_program_level_id_foreign` FOREIGN KEY (`study_program_level_id`) REFERENCES `education_levels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_education_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- টেবলের সীমবদ্ধতা `user_schools_attendeds`
--
ALTER TABLE `user_schools_attendeds`
  ADD CONSTRAINT `user_schools_attendeds_at_edu_country_id_foreign` FOREIGN KEY (`at_edu_country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_schools_attendeds_at_edu_level_id_foreign` FOREIGN KEY (`at_edu_level_id`) REFERENCES `education_levels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_schools_attendeds_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- টেবলের সীমবদ্ধতা `user_test_scores`
--
ALTER TABLE `user_test_scores`
  ADD CONSTRAINT `user_test_scores_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_test_scores_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- টেবলের সীমবদ্ধতা `user_test_score_details`
--
ALTER TABLE `user_test_score_details`
  ADD CONSTRAINT `user_test_score_details_score_id_foreign` FOREIGN KEY (`score_id`) REFERENCES `user_test_scores` (`id`),
  ADD CONSTRAINT `user_test_score_details_subsection_id_foreign` FOREIGN KEY (`subsection_id`) REFERENCES `exam_sub_sections` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

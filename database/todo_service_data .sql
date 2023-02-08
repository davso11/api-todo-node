SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `contactId` varchar(255) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `userId` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `contact` (`id`, `contactId`, `contact`, `updatedAt`, `userId`) VALUES
(2, '9141c846-cf6c-4ce9-a554-6a5692b5dfb4', '0506116722', '2023-02-03 14:43:05', '04ed2ac8-fa4b-4fb3-ab07-4cf16cd811ab'),
(1, 'db43cc4f-e7cf-4b6c-83af-30becc34f782', '0506116731', '2023-02-03 14:47:52', '6dd81adb-e0e8-4115-a014-0c7760a362bc');

CREATE TABLE `log` (
  `id` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `action` varchar(30) NOT NULL,
  `todoId` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `log` (`id`, `createdAt`, `action`, `todoId`) VALUES
(3, '2023-02-08 07:10:30', 'Insertion', 'f3237a67-7925-4ebc-945b-5ec0c283239f'),
(4, '2023-02-08 07:55:25', 'Insertion', '78260ed8-0ddb-44ac-9451-b534539e63e4'),
(5, '2023-02-08 07:56:31', 'Insertion', '93bdac9a-059e-4c44-b646-f8a85e8e825f'),
(6, '2023-02-08 08:33:01', 'Insertion', 'a5401226-1451-4319-9df4-6566f7e93c64'),
(7, '2023-02-08 08:33:22', 'Insertion', '3697fbe1-3226-415e-b408-6a9007de3914'),
(8, '2023-02-08 10:02:35', 'Insertion', '152dc7f1-905f-443f-af1b-39e79b77cca4'),
(9, '2023-02-08 10:36:30', 'Insertion', 'bee579bc-263e-4470-8f1b-340149db0b0b'),
(10, '2023-02-08 12:07:11', 'Insertion', 'a4ce7d1e-9c0d-4cd0-8d68-01516dea975f'),
(11, '2023-02-08 13:03:17', 'Insertion', 'a1fbbc9d-4005-4e52-ae22-bab0109e1de1'),
(12, '2023-02-08 13:04:08', 'Deletion', 'a1fbbc9d-4005-4e52-ae22-bab0109e1de1'),
(13, '2023-02-08 13:04:45', 'Insertion', 'b88a24e3-554c-42e7-ad8e-d8d9123f8ceb'),
(14, '2023-02-08 13:04:49', 'Update', 'b88a24e3-554c-42e7-ad8e-d8d9123f8ceb'),
(15, '2023-02-08 15:20:09', 'Insertion', 'd90c130d-d9ae-457e-b6ed-75b3caa784ab'),
(16, '2023-02-08 15:21:05', 'Insertion', '729294a0-397b-41e3-b80a-9ae3d539f456'),
(17, '2023-02-08 15:21:43', 'Insertion', '3450cc4a-d189-4d4c-ba18-7541dae05be8'),
(18, '2023-02-08 15:21:46', 'Deletion', '729294a0-397b-41e3-b80a-9ae3d539f456'),
(19, '2023-02-08 15:22:10', 'Insertion', '1eda9340-4f43-4c87-a233-7294d4f92246'),
(20, '2023-02-08 15:25:20', 'Update', '3450cc4a-d189-4d4c-ba18-7541dae05be8'),
(21, '2023-02-08 16:03:57', 'Deletion', 'b88a24e3-554c-42e7-ad8e-d8d9123f8ceb');

CREATE TABLE `phoneOperator` (
  `id` int(11) NOT NULL,
  `oparator` varchar(20) NOT NULL,
  `contactId` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `todo` (
  `id` int(11) NOT NULL,
  `todoId` varchar(255) NOT NULL,
  `todo` varchar(255) NOT NULL,
  `userId` varchar(255) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `isImportant` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `todo` (`id`, `todoId`, `todo`, `userId`, `createdAt`, `updatedAt`, `isImportant`) VALUES
(53, '17574886-aa91-4cfe-acd9-9a2d50517177', 'Regarder le match Brooklyn Nets - Dallas Mavericks après demain 20H', '6dd81adb-e0e8-4115-a014-0c7760a362bc', '2023-02-06 20:34:05', '2023-02-08 11:36:05', 0),
(100, '1eda9340-4f43-4c87-a233-7294d4f92246', 'Test Without AJAX Call', '6dd81adb-e0e8-4115-a014-0c7760a362bc', '2023-02-08 15:22:10', '2023-02-08 15:22:10', 0),
(99, '3450cc4a-d189-4d4c-ba18-7541dae05be8', 'Test With AJAX Call', '6dd81adb-e0e8-4115-a014-0c7760a362bc', '2023-02-08 15:21:43', '2023-02-08 15:25:20', 0),
(76, '421cec77-feb2-45fd-aa0a-0d87389733c6', 'Let\'s go Dallas x Ky ', '6dd81adb-e0e8-4115-a014-0c7760a362bc', '2023-02-07 13:11:16', '2023-02-07 13:11:16', 0),
(54, '473c775d-9e39-4423-a9ec-81457ce0d0a9', 'Se détendre ', '6dd81adb-e0e8-4115-a014-0c7760a362bc', '2023-02-06 20:43:42', '2023-02-06 20:43:42', 0),
(49, '4d696b82-fad7-4e2c-b8cb-df03c76b78ac', 'Terminer mon projet avant mercredi', '6dd81adb-e0e8-4115-a014-0c7760a362bc', '2023-02-06 20:25:19', '2023-02-08 11:34:28', 1),
(57, '5528c8a9-d326-4579-91ae-e229da05b4bf', 'Chillin\' out ', '6dd81adb-e0e8-4115-a014-0c7760a362bc', '2023-02-07 07:32:44', '2023-02-07 07:32:44', 0),
(52, '58f857ee-d3e7-4889-8158-b9cb1380bc2c', 'Boire un verre d\'eau tous les matins au réveille', '6dd81adb-e0e8-4115-a014-0c7760a362bc', '2023-02-06 20:32:52', '2023-02-08 11:34:39', 1),
(48, '63bc2fa2-6944-45ea-9de3-58067ce55b86', 'Se reposer ', '6dd81adb-e0e8-4115-a014-0c7760a362bc', '2023-02-06 20:25:03', '2023-02-08 11:36:11', 0),
(44, '6597757c-a7fc-4e38-9c71-e16a0e8a3ac7', 'Aller à la maison dans pas longtemps', '6dd81adb-e0e8-4115-a014-0c7760a362bc', '2023-02-06 20:20:46', '2023-02-08 11:36:21', 0),
(47, '66e129b7-4c98-4758-85c1-8e1ab60ab2dd', 'Participer au séminaire de la semaine prochaine ', '6dd81adb-e0e8-4115-a014-0c7760a362bc', '2023-02-06 20:21:57', '2023-02-08 11:34:26', 0),
(85, '7f399bd7-7bf8-4059-b9f7-bd2fc486425c', 'Consommer les APIs ', '6dd81adb-e0e8-4115-a014-0c7760a362bc', '2023-02-07 16:54:52', '2023-02-07 16:54:52', 0),
(55, '9fe6b591-3e87-4238-b8db-786e4409b95c', 'Se désabonner du compte des Nets', '6dd81adb-e0e8-4115-a014-0c7760a362bc', '2023-02-07 07:28:11', '2023-02-07 07:28:11', 0),
(45, 'b843fedd-e29a-4029-bb5f-53e7b614cfc1', 'Dormir avant 22H30', '6dd81adb-e0e8-4115-a014-0c7760a362bc', '2023-02-06 20:21:14', '2023-02-08 10:36:47', 1),
(51, 'bc43c11f-7bf8-4f75-88ba-d234aa187506', 'Être au centre (ODC) tous les jours avant 8H', '6dd81adb-e0e8-4115-a014-0c7760a362bc', '2023-02-06 20:30:15', '2023-02-08 11:36:26', 0),
(93, 'bee579bc-263e-4470-8f1b-340149db0b0b', 'Aller au RDV de ce soir ', '6dd81adb-e0e8-4115-a014-0c7760a362bc', '2023-02-08 10:36:30', '2023-02-08 10:36:30', 1),
(56, 'c26e7af3-ba27-4076-8b69-f848ccfab5e7', 'Me faire un café dans 5 minutes', '6dd81adb-e0e8-4115-a014-0c7760a362bc', '2023-02-07 07:31:29', '2023-02-07 07:31:29', 0),
(46, 'c7f8bd7a-d89e-4104-846e-72b85a166b59', 'Se déparasiter demain soir', '6dd81adb-e0e8-4115-a014-0c7760a362bc', '2023-02-06 20:21:28', '2023-02-08 11:34:57', 1),
(97, 'd90c130d-d9ae-457e-b6ed-75b3caa784ab', 'Test from INSOMNIA', '6dd81adb-e0e8-4115-a014-0c7760a362bc', '2023-02-08 15:20:09', '2023-02-08 15:20:09', 0),
(50, 'e9e5aa2d-2d55-46bf-8f10-b3fe520ca85f', 'Apprendre Vue.js ', '6dd81adb-e0e8-4115-a014-0c7760a362bc', '2023-02-06 20:28:01', '2023-02-06 20:28:01', 0);
DELIMITER $$
CREATE TRIGGER `todoDeletionTigger` BEFORE DELETE ON `todo` FOR EACH ROW INSERT INTO `log`(`action`, `todoId`) VALUES ('Deletion', old.todoId)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `todoInsertionTigger` AFTER INSERT ON `todo` FOR EACH ROW INSERT INTO `log`(`action`, `todoId`) VALUES ('Insertion', new.todoId)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `todoUpdateTigger` AFTER UPDATE ON `todo` FOR EACH ROW INSERT INTO `log`(`action`, `todoId`) VALUES ('Update', new.todoId)
$$
DELIMITER ;

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `userId` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `user` (`id`, `userId`) VALUES
(1, '6dd81adb-e0e8-4115-a014-0c7760a362bc'),
(2, '04ed2ac8-fa4b-4fb3-ab07-4cf16cd811ab');

CREATE TABLE `userDetails` (
  `id` int(11) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `userId` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `userDetails` (`id`, `firstName`, `lastName`, `email`, `password`, `userId`) VALUES
(1, 'Kan Jean Christian', '', 'yaokanjk@gmail.com', '$2b$10$lt/g3NddGEa.41ihdZ6b/uViBHnSrYNXfkxfAnejGFNA3Koq5djqu', '6dd81adb-e0e8-4115-a014-0c7760a362bc'),
(2, 'Eliel ', 'Tapé', 'eltap@yahoo.fr', '$2b$10$lt/g3NddGEa.41ihdZ6b/uViBHnSrYNXfkxfAnejGFNA3Koq5djqu', '04ed2ac8-fa4b-4fb3-ab07-4cf16cd811ab');


ALTER TABLE `contact`
  ADD PRIMARY KEY (`contactId`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `userId` (`userId`) USING BTREE;

ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `phoneOperator`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `contactId` (`contactId`);

ALTER TABLE `todo`
  ADD PRIMARY KEY (`todoId`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `userId` (`userId`) USING BTREE;

ALTER TABLE `user`
  ADD PRIMARY KEY (`userId`),
  ADD UNIQUE KEY `id` (`id`);

ALTER TABLE `userDetails`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userId` (`userId`) USING BTREE;


ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

ALTER TABLE `phoneOperator`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `todo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `userDetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;


ALTER TABLE `contact`
  ADD CONSTRAINT `contact_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `phoneOperator`
  ADD CONSTRAINT `phoneoperator_ibfk_1` FOREIGN KEY (`contactId`) REFERENCES `contact` (`contactId`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `todo`
  ADD CONSTRAINT `todo_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `userDetails`
  ADD CONSTRAINT `userdetails_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

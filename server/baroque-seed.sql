-- Schema

CREATE TABLE IF NOT EXISTS periods (
  decade       INTEGER PRIMARY KEY,
  summary      TEXT,
  historical_context TEXT
);

CREATE TABLE IF NOT EXISTS artists (
  id           INTEGER PRIMARY KEY AUTOINCREMENT,
  name         TEXT NOT NULL,
  nationality  TEXT,
  birth_year   INTEGER,
  death_year   INTEGER,
  style        TEXT,
  bio          TEXT
);

CREATE TABLE IF NOT EXISTS artworks (
  id           INTEGER PRIMARY KEY AUTOINCREMENT,
  artist_id    INTEGER REFERENCES artists(id),
  title        TEXT NOT NULL,
  year_created INTEGER,
  medium       TEXT,
  location     TEXT,
  image_url    TEXT,
  description  TEXT
);

CREATE TABLE IF NOT EXISTS events (
  id           INTEGER PRIMARY KEY AUTOINCREMENT,
  year         INTEGER,
  title        TEXT NOT NULL,
  description  TEXT
);

CREATE TABLE IF NOT EXISTS artist_periods (
  artist_id    INTEGER REFERENCES artists(id),
  decade       INTEGER REFERENCES periods(decade),
  PRIMARY KEY (artist_id, decade)
);

-- Seed data

INSERT INTO periods (decade, summary, historical_context) VALUES
(1600, 'Birth of Baroque', 'The Counter-Reformation drives a new emotionally intense religious art. Caravaggio emerges with revolutionary naturalism and dramatic lighting.'),
(1610, 'Early Baroque Maturity', 'Baroque spreads across Europe. Rubens dominates the Flemish school while Artemisia Gentileschi breaks through as a major painter.'),
(1620, 'Global Expansion', 'Dutch Golden Age begins. Rembrandt is born. Spanish court painting flourishes under Velázquez. Baroque becomes the dominant European style.'),
(1630, 'Peak Drama', 'Rembrandt and Vermeer emerge. Baroque reaches its most theatrical phase. Court art and religious works dominate.'),
(1640, 'Consolidation', 'Baroque becomes establishment. Poussin refines classical Baroque. Rembrandt deepens psychological depth. Civil wars reshape European politics.'),
(1650, 'Baroque Zenith', 'Vermeer paints her most intimate works. Rembrandt enters his late period. Bernini''s sculptural Baroque dominates Rome.'),
(1660, 'Late Baroque Richness', 'Rembrandt''s final years. Dutch maritime trade fuels art patronage. Baroque becomes increasingly ornate and sensual.'),
(1670, 'Baroque Maturity', 'Vermeer''s final works. Rembrandt dies. Late Baroque painters like Murillo dominate Spain and Latin America.'),
(1680, 'Approaching Rococo', 'Baroque begins morphing toward Rococo''s lighter touch. Giordano spreads Baroque across Europe. Dutch Golden Age wanes.'),
(1690, 'Late Flourish', 'Baroque still dominates but grows more decorative. Religious Baroque continues to inspire grand altarpieces and domes.'),
(1700, 'Transition Era', 'Early 18th century sees Baroque still strong but Rococo emerging. Classical revival begins in theory if not yet in practice.'),
(1710, 'Baroque-Rococo Hybrid', 'Hogarth emerges in England. Baroque and Rococo coexist. Grand Baroque spectacle gives way to intimate elegance.'),
(1720, 'Rococo Ascendant', 'Rococo becomes fashionable in courts. Baroque remains in churches and grand public buildings. Two styles in dialogue.'),
(1730, 'Rococo Dominance', 'Rococo rules aristocratic taste. Baroque relegated to religious and historical contexts. Neoclassical theory gains influence.'),
(1740, 'End of Baroque', 'Baroque largely superseded by Rococo and emerging Neoclassicism. But Baroque''s dramatic language remains unmatched for religious intensity.');

INSERT INTO artists (name, nationality, birth_year, death_year, style, bio) VALUES
('Caravaggio', 'Italian', 1571, 1610, 'Italian', 'Revolutionary naturalist whose dramatic chiaroscuro and emotional intensity defined early Baroque. Worked for popes and cardinals in Rome.'),
('Rembrandt van Rijn', 'Dutch', 1606, 1669, 'Dutch', 'Master of light and shadow, psychological depth, and self-portraiture. Created 100+ self-portraits tracking his aging. Amsterdam''s greatest artist.'),
('Johannes Vermeer', 'Dutch', 1632, 1675, 'Dutch', 'Painter of intimate domestic scenes with extraordinary light. Produced only ~36 known works but created some of the most perfect paintings ever made.'),
('Peter Paul Rubens', 'Flemish', 1577, 1640, 'Flemish', 'Diplomat and master of dynamic, sensual Baroque. Prolific workshop in Antwerp. His fleshy female nudes define Rubensian beauty.'),
('Diego Velázquez', 'Spanish', 1599, 1660, 'Spanish', 'Court painter to Philip IV of Spain. Creator of Las Meninas, considered one of the greatest paintings ever. Master of dignity and composition.'),
('Gian Lorenzo Bernini', 'Italian', 1598, 1680, 'Italian', 'Supreme Baroque sculptor and architect. Designed fountains, chapels, and statues for Rome''s churches. Rival to Michelangelo in ambition.'),
('Artemisia Gentileschi', 'Italian', 1593, 1656, 'Italian', 'Only major female painter of her era. Known for powerful biblical and mythological heroines. Overcame trauma to become court painter across Italy.'),
('Frans Hals', 'Dutch', 1582, 1666, 'Dutch', 'Master of loose, brilliant brushwork and lively group portraits. Captured motion and personality unlike any contemporaries.'),
('Nicolas Poussin', 'French', 1594, 1665, 'Italian', 'French classicist who worked in Rome. Ordered, intellectual Baroque blending classical themes with emotional restraint.'),
('Bartolomé Murillo', 'Spanish', 1618, 1682, 'Spanish', 'Seville''s greatest painter. Created devotional images of Mary, Christ, and saints. His tender, human approach made him immensely popular.'),
('Anthony van Dyck', 'Flemish', 1599, 1641, 'Flemish', 'Rubens'' most gifted student. Court painter to Charles I of England. Master of aristocratic portraiture with elegance and pathos.'),
('Luca Giordano', 'Italian', 1632, 1705, 'Italian', 'Incredibly prolific fresco painter. Spread Baroque spectacle across Italy, Spain, and Austria. Called ''fa presto'' for his speed.'),
('Judith Leyster', 'Dutch', 1609, 1660, 'Dutch', 'Vermeer''s contemporary and one of few women who ran successful independent studios. Master of genre scenes and self-portraits.'),
('José de Ribera', 'Spanish', 1591, 1652, 'Spanish', 'Worked in Naples. Master of religious drama and anatomical knowledge. Dark, intense realism influenced Spanish and Italian Baroque.'),
('Giovanni Battista Tiepolo', 'Italian', 1696, 1770, 'Italian', 'Last great Baroque fresco painter. Created vast ceiling decorations across Venice, Milan, and Spain. Light, joyful, architectural in scope.'),
('Claude Lorrain', 'French', 1600, 1682, 'Italian', 'Landscape master. Worked in Rome painting idealized, luminous nature scenes. Influenced landscape painting for centuries.'),
('Georges de La Tour', 'French', 1593, 1652, 'Italian', 'Rare master of nocturnal scenes lit by candle. Quiet, meditative intensity. Long forgotten, rediscovered in 20th century.'),
('Alonso Cano', 'Spanish', 1601, 1667, 'Spanish', 'Sculptor, painter, and architect. Master of religious sculpture in polychrome wood. Represented Spanish Baroque''s intensity.'),
('Salvator Rosa', 'Italian', 1615, 1673, 'Italian', 'Painter of wild landscapes and dramatic biblical scenes. Also poet, musician, and satirist. Fiercely independent spirit.');

INSERT INTO artworks (artist_id, title, year_created, medium, location, image_url, description) VALUES
(1, 'The Calling of Saint Matthew', 1599, 'Oil on canvas', 'Contarelli Chapel, Rome', 'https://commons.wikimedia.org/wiki/Special:FilePath/The_Calling_of_Saint_Matthew-Caravaggio_%281599-1600%29.jpg', 'Christ calls Matthew from his money-counting table. Dramatic divine light pierces darkness, illuminating the moment of spiritual transformation.'),
(1, 'Judith Beheading Holofernes', 1598, 'Oil on canvas', 'Palazzo Barbini, Naples', 'https://commons.wikimedia.org/wiki/Special:FilePath/Caravaggio_-_Judith_Beheading_Holofernes.jpg', 'Violent, unflinching depiction of a woman''s power. Judith calmly beheads an Assyrian general to save her people. Blood flows. Drama is absolute.'),
(1, 'The Conversion of Saint Paul', 1600, 'Oil on canvas', 'Cerasi Chapel, Rome', 'https://commons.wikimedia.org/wiki/Special:FilePath/Caravaggio_-_The_Conversion_of_Saint_Paul.jpg', 'Paul falls from his horse in blindness, surrounded by stable workers and animals. Divine light suggests spiritual awakening amid earthly chaos.'),
(2, 'Self-Portrait with Beret and Lowered Sabre', 1635, 'Oil on panel', 'Uffizi Gallery, Florence', 'https://commons.wikimedia.org/wiki/Special:FilePath/Rembrandt_-_Self-portrait_-_1635_-_Mauritshuis.jpg', 'Rembrandt as a prosperous Amsterdam merchant. Golden light, rich clothing. The painter surveys us with intelligence and dignity.'),
(2, 'Night Watch', 1642, 'Oil on canvas', 'Rijksmuseum, Amsterdam', 'https://commons.wikimedia.org/wiki/Special:FilePath/The_Night_Watch_-_Google_Art_Project.jpg', 'Militia company in dramatic action. Rembrandt rejected formal group portrait rules, creating dynamic movement and mysterious shadow.'),
(2, 'The Jewish Bride', 1665, 'Oil on canvas', 'Rijksmuseum, Amsterdam', 'https://commons.wikimedia.org/wiki/Special:FilePath/The_Jewish_Bride_-_Google_Art_Project.jpg', 'Tender portrait of an embracing couple. Golden, warm light. Epitomizes Rembrandt''s late humanity and psychological insight.'),
(3, 'Girl with a Pearl Earring', 1665, 'Oil on canvas', 'Mauritshuis, The Hague', 'https://commons.wikimedia.org/wiki/Special:FilePath/1665_Girl_with_a_Pearl_Earring.jpg', 'Young woman in exotic turban, turning to gaze at viewer. Pearl earring catches light. Serene, mysterious, utterly perfect composition.'),
(3, 'The Milkmaid', 1658, 'Oil on canvas', 'Rijksmuseum, Amsterdam', 'https://commons.wikimedia.org/wiki/Special:FilePath/The_Milkmaid_-_Google_Art_Project.jpg', 'Servant girl pouring milk. Domestic miracle. Every object glows. Vermeer elevates humble reality into timeless poetry.'),
(3, 'View of Delft', 1661, 'Oil on canvas', 'Mauritshuis, The Hague', 'https://commons.wikimedia.org/wiki/Special:FilePath/Vermeer_-_View_of_Delft_-_1661.jpg', 'City skyline reflected in river. Soft northern light. Considered one of the greatest landscape paintings ever made.'),
(4, 'The Elevation of the Cross', 1610, 'Oil on panel', 'Cathedral of Antwerp', 'https://commons.wikimedia.org/wiki/Special:FilePath/Peter_Paul_Rubens_-_The_Elevation_of_the_Cross_-_Google_Art_Project.jpg', 'Muscular, dynamic Baroque at its most theatrical. Christ''s body strains as soldiers raise him. Rubens fills every inch with movement.'),
(4, 'The Three Graces', 1635, 'Oil on panel', 'Museo del Prado, Madrid', 'https://commons.wikimedia.org/wiki/Special:FilePath/Peter_Paul_Rubens_-_The_Three_Graces_-_Google_Art_Project.jpg', 'Three full-figured women, an epitome of Rubensian beauty. Golden, sensual, joyful. Celebration of female form in all its abundance.'),
(5, 'Las Meninas', 1656, 'Oil on canvas', 'Museo del Prado, Madrid', 'https://commons.wikimedia.org/wiki/Special:FilePath/Las_Meninas%2C_by_Diego_Velá_zquez%2C_from_Prado_in_Google_Earth.jpg', 'The Spanish court painter''s masterpiece. Velázquez stands before his canvas painting the royal couple. We see what he sees. Meta-painting of supreme genius.'),
(5, 'Old Woman Cooking Eggs', 1618, 'Oil on canvas', 'National Gallery of Scotland, Edinburgh', 'https://commons.wikimedia.org/wiki/Special:FilePath/Diego_Velázquez_-_Old_Woman_Cooking_Eggs_-_Google_Art_Project.jpg', 'Humble kitchen scene. Old woman, boy, simple food. Velázquez''s early work shows naturalism and dignity in everyday life.'),
(6, 'Apollo and Daphne', 1622, 'Marble', 'Galleria Borghese, Rome', 'https://commons.wikimedia.org/wiki/Special:FilePath/Bernini_Apollo_and_Daphne.jpg', 'Moment of metamorphosis. Daphne transforms to laurel as Apollo reaches for her. Bernini captures motion in stone, emotion in marble.'),
(6, 'David', 1623, 'Marble', 'Galleria Borghese, Rome', 'https://commons.wikimedia.org/wiki/Special:FilePath/Bernini_-_David_-_1624.jpg', 'Young David caught mid-action. Unlike Michelangelo''s calm giant, Bernini''s David is dynamic, tense, about to sling. Baroque energy in flesh.'),
(7, 'Judith Slaying Holofernes', 1620, 'Oil on canvas', 'Uffizi Gallery, Florence', 'https://commons.wikimedia.org/wiki/Special:FilePath/Artemisia_Gentileschi_-_Judith_Slaying_Holofernes_-_Google_Art_Project.jpg', 'Woman as powerful agent. Judith beheads her enemy with calm determination. Gentileschi''s personal trauma transformed into artistic power.'),
(7, 'Self-Portrait as the Allegory of Painting', 1638, 'Oil on canvas', 'Kensington Palace, London', 'https://commons.wikimedia.org/wiki/Special:FilePath/Artemisia_Gentileschi_-_Self-Portrait_as_the_Allegory_of_Painting.jpg', 'Female artist claims the role of painting itself. Gold chain, disheveled hair, absorbed in work. Statement of identity and professional equality.'),
(8, 'Laughing Cavalier', 1624, 'Oil on panel', 'Wallace Collection, London', 'https://commons.wikimedia.org/wiki/Special:FilePath/Frans_Hals_-_Laughing_Cavalier.jpg', 'Young man in rakish hat, half-smile. Loose brushwork captures personality and motion. One of the most engaging portraits ever painted.'),
(8, 'Family Group in a Landscape', 1645, 'Oil on canvas', 'National Gallery, London', 'https://commons.wikimedia.org/wiki/Special:FilePath/Frans_Hals_-_Family_Group_in_a_Landscape_-_Google_Art_Project.jpg', 'Relaxed, charming family portrait. Hals''s brilliant brushwork renders fabrics, light, and personality in loose, assured strokes.'),
(9, 'Landscape with the Burial of Phocion', 1648, 'Oil on canvas', 'National Museum of Wales, Cardiff', 'https://commons.wikimedia.org/wiki/Special:FilePath/Nicolas_Poussin_-_Landscape_with_the_Burial_of_Phocion_-_Google_Art_Project.jpg', 'Ideal landscape with classical narrative buried in composition. Poussin hides story in nature, subordinating action to order and beauty.'),
(9, 'The Inspiration of the Poet', 1629, 'Oil on canvas', 'Musée du Louvre, Paris', 'https://commons.wikimedia.org/wiki/Special:FilePath/Poussin_-_The_Inspiration_of_the_Poet_-_Google_Art_Project.jpg', 'Apollo inspires a poet. Intellectual Baroque. Harmonious composition, noble figures, classical restraint. Mind over emotion.'),
(10, 'Two Women at a Window', 1670, 'Oil on canvas', 'National Gallery, London', 'https://commons.wikimedia.org/wiki/Special:FilePath/Bartolome_Murillo_-_Two_Women_at_a_Window_-_Google_Art_Project.jpg', 'Girls lean from window, flirting. Tender, intimate. Murillo''s gift for capturing innocence and charm in everyday moments.'),
(10, 'The Immaculate Conception', 1670, 'Oil on canvas', 'Museo del Prado, Madrid', 'https://commons.wikimedia.org/wiki/Special:FilePath/Bartolome_Murillo_-_The_Immaculate_Conception_-_Google_Art_Project.jpg', 'Virgin Mary surrounded by angels. Soft, heavenly light. Murillo''s popular devotional style made him beloved across Catholic Spain and Latin America.'),
(11, 'Charles I in Three Positions', 1635, 'Oil on canvas', 'Royal Collection Trust, Windsor', 'https://commons.wikimedia.org/wiki/Special:FilePath/Anthony_van_Dyck_-_Charles_I_-_Google_Art_Project.jpg', 'King shown in three angles for sculptor''s reference. Elegant, dignified. Van Dyck''s portraits set the standard for royal portraiture.'),
(11, 'Self-Portrait with Sunflower', 1632, 'Oil on canvas', 'Private Collection', 'https://commons.wikimedia.org/wiki/Special:FilePath/Anthony_van_Dyck_-_Self-Portrait_with_a_Sunflower_-_Google_Art_Project.jpg', 'Artist holds sunflower (symbol of loyalty). Aristocratic self-presentation. Van Dyck claims noble status for the painter.'),
(12, 'The Abduction of Orithyia', 1700, 'Fresco', 'Palazzo Labbia, Venice', 'https://commons.wikimedia.org/wiki/Special:FilePath/Giordano_abduction_of_orithyia.jpg', 'Dynamic swirling scene. Gods and mortals in ecstatic motion. Giordano''s brilliant color and movement epitomize late Baroque exuberance.'),
(13, 'Self-Portrait', 1635, 'Oil on canvas', 'National Museum of Denmark, Copenhagen', 'https://commons.wikimedia.org/wiki/Special:FilePath/Judith_Leyster_005.jpg', 'Woman artist with flute, turning to smile. Confident, accomplished. Leyster claims professional status as musician and painter.'),
(14, 'The Martyrdom of Saint Bartholomew', 1630, 'Oil on canvas', 'Museo del Prado, Madrid', 'https://commons.wikimedia.org/wiki/Special:FilePath/Josep_de_Ribera_-_The_Martyrdom_of_Saint_Bartholomew_-_Google_Art_Project.jpg', 'Brutal religious drama. Saint flayed alive. Ribera''s unflinching realism and dark chiaroscuro create anguish and pathos.'),
(16, 'Landscape with Aeneas and Dido', 1675, 'Oil on canvas', 'Musée du Louvre, Paris', 'https://commons.wikimedia.org/wiki/Special:FilePath/Claude_Lorrain_025.jpg', 'Golden, luminous harbor. Classical figures small amid grand nature. Claude''s idealized landscapes influenced centuries of painters.'),
(17, 'The Penitent Magdalen', 1640, 'Oil on canvas', 'Musée du Louvre, Paris', 'https://commons.wikimedia.org/wiki/Special:FilePath/La_Tour_Magdalen_With_Two_Flames.jpg', 'Woman by candlelight, reflecting on sins. Intimate, quiet intensity. La Tour''s nocturnal candlelit scenes create spiritual contemplation.'),
(19, 'Landscape with Mercury and the Dishonest Woodcutter', 1650, 'Oil on canvas', 'Museo Capodimonte, Naples', 'https://commons.wikimedia.org/wiki/Special:FilePath/Salvator_Rosa_-_Landscape_with_Mercury_and_the_Dishonest_Woodcutter_-_Google_Art_Project.jpg', 'Wild, rocky landscape. Classical narrative embedded in nature. Rosa''s dramatic, moody landscapes rejected Renaissance idealism.');

INSERT INTO events (year, title, description) VALUES
(1600, 'Caravaggio in Rome', 'Caravaggio arrives in Rome. His revolutionary paintings begin to reshape Italian art with dramatic chiaroscuro and emotional intensity.'),
(1604, 'Council of Trent Impact', 'Counter-Reformation Church demands religious art that emotionally engages believers. Caravaggio exemplifies this demand perfectly.'),
(1606, 'Caravaggio Flees Rome', 'After killing a man in a brawl, Caravaggio flees Rome. He spends his final years in Naples, Malta, and Sicily, always on the run.'),
(1610, 'Caravaggio Dies', 'Michelangelo Merisi (Caravaggio) dies in Porto Ercole at age 38. Despite his short life, he revolutionized European painting.'),
(1615, 'Rembrandt Born', 'Rembrandt van Rijn born in Leiden. He will become Amsterdam''s greatest artist and the Netherlands'' supreme master of light and psychology.'),
(1620, 'Dutch Golden Age Begins', 'Dutch independence from Spain consolidated. Wealth from trade fuels art market. Amsterdam becomes art world capital. Dutch Golden Age dawns.'),
(1622, 'Vermeer Born', 'Johannes Vermeer born in Delft. He will create only ~36 paintings but become immortal for their perfect light and intimate wisdom.'),
(1632, 'Judith Leyster''s Studio', 'Judith Leyster runs successful independent studio in Haarlem. One of few women to do so. Master of genre scenes and self-portraits.'),
(1635, 'Rembrandt''s Success', 'Rembrandt established as Amsterdam''s most sought-after portrait painter. Wealthy, famous, at his peak. He runs large workshop.'),
(1640, 'Civil War in England', 'English Civil War begins. Disrupts royal patronage. Van Dyck dies. Political upheaval affects art markets across Europe.'),
(1648, 'Peace of Westphalia', 'Thirty Years'' War ends. Spanish, Dutch, and French powers reconfigure. Art centers shift. Dutch independence secured.'),
(1656, 'Las Meninas Painted', 'Velázquez completes Las Meninas, considered by many the greatest painting ever made. Meta-painting of supreme compositional genius.'),
(1660, 'Rembrandt''s Decline', 'Rembrandt financially ruined. Declared bankrupt. Forced to sell his collection. But his late paintings are among his most profound.'),
(1661, 'Vermeer''s View of Delft', 'Vermeer paints View of Delft. One of the most perfect landscape paintings ever made. Soft northern light, perfect composition.'),
(1665, 'London Plague and Fire', 'Great Plague kills 100,000 Londoners. Year later, Great Fire destroys the City. Art patronage disrupted temporarily.'),
(1669, 'Rembrandt Dies', 'Rembrandt dies in Amsterdam, poor but creatively undiminished. His late paintings achieve unprecedented depth of human insight.'),
(1675, 'Vermeer Dies', 'Vermeer dies in Delft, leaving ~36 paintings. Quickly forgotten. Rediscovered in 19th century. Now immortal.'),
(1680, 'Bernini Dies', 'Gian Lorenzo Bernini dies in Rome at 82. He dominated Roman Baroque for 60 years. Supreme sculptor and architect.'),
(1685, 'Louis XIV Revokes Edict of Nantes', 'French king revokes religious tolerance. Protestant refugees flee to Dutch Republic and England. Art patronage shifts again.'),
(1700, 'Baroque to Rococo Transition', 'Baroque still dominates but Rococo emerging in French court. Two styles coexist. Grand drama morphs toward lighter elegance.'),
(1715, 'Louis XIV Dies', 'Death of Sun King. Rococo takes over French taste. Intimate, decorative, playful. Baroque''s dramatic intensity fades in France.'),
(1730, 'Rococo Dominance', 'Rococo fully ascendant in European courts. Baroque relegated to churches and grand public buildings. Neoclassicism theorized.'),
(1748, 'Excavation of Pompeii Begins', 'Pompeii and Herculaneum excavated. Classical Roman art discovered. Neoclassical movement gains momentum. Baroque''s reign nearing end.');

INSERT INTO artist_periods (artist_id, decade) VALUES
(1, 1600), (1, 1610),
(2, 1620), (2, 1630), (2, 1640), (2, 1650), (2, 1660),
(3, 1630), (3, 1640), (3, 1650), (3, 1660),
(4, 1600), (4, 1610), (4, 1620), (4, 1630), (4, 1640),
(5, 1620), (5, 1630), (5, 1640), (5, 1650),
(6, 1620), (6, 1630), (6, 1640), (6, 1650), (6, 1660), (6, 1670),
(7, 1610), (7, 1620), (7, 1630), (7, 1640),
(8, 1620), (8, 1630), (8, 1640), (8, 1650),
(9, 1620), (9, 1630), (9, 1640), (9, 1650),
(10, 1640), (10, 1650), (10, 1660), (10, 1670),
(11, 1620), (11, 1630), (11, 1640),
(12, 1660), (12, 1670), (12, 1680), (12, 1690), (12, 1700),
(13, 1630), (13, 1640), (13, 1650),
(14, 1620), (14, 1630), (14, 1640), (14, 1650),
(16, 1610), (16, 1620), (16, 1630), (16, 1640), (16, 1650), (16, 1660), (16, 1670),
(17, 1620), (17, 1630), (17, 1640),
(19, 1640), (19, 1650), (19, 1660);
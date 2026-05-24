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
('Caravaggio', 'Italian', 1571, 1610, 'Italian', 'Revolutionized European painting by treating sacred subjects with street-level realism — his saints had dirty feet, his Madonnas were real working women. His extreme chiaroscuro turned every canvas into theater, divine light cutting through total darkness. His life matched the violence in his paintings: brawls, lawsuits, and a 1606 murder that forced him to flee Rome forever. He died mysteriously in 1610 at thirty-eight, possibly of fever, possibly assassinated.'),
('Rembrandt van Rijn', 'Dutch', 1606, 1669, 'Dutch', 'Amsterdam''s supreme painter, who turned ordinary Dutch faces into windows on the soul. His mastery of light and shadow gave his sitters a psychological depth no one had achieved before. He painted himself over a hundred times across his life, creating an unparalleled visual autobiography from confident youth to ruined old age. Bankrupted in 1656 by debts and overspending, he kept producing his most profound works in poverty until his death in 1669.'),
('Johannes Vermeer', 'Dutch', 1632, 1675, 'Dutch', 'Painter of light itself. Working quietly in Delft, he produced only about thirty-six known paintings — mostly small domestic scenes of women reading letters, pouring milk, or playing music in shafts of northern sunlight. He died in debt at forty-three, leaving eleven children and almost no fame. Forgotten for two centuries, he was rediscovered in the 1860s and is now considered one of the most perfect painters who ever lived.'),
('Peter Paul Rubens', 'Flemish', 1577, 1640, 'Flemish', 'Antwerp''s prince of painters and an actual diplomat for European courts. He ran a vast workshop that turned out altarpieces, mythologies, and royal portraits at industrial scale, often finishing apprentices'' canvases himself. His muscular men and voluptuous women — the source of the word "Rubenesque" — defined Flemish Baroque''s sensual energy. Wealthy, multilingual, and politically connected, he was the most successful painter of his century.'),
('Diego Velázquez', 'Spanish', 1599, 1660, 'Spanish', 'Court painter to Philip IV of Spain for thirty-seven years, and one of the most quietly radical artists in history. His Las Meninas (1656) is a meta-painting that has fascinated viewers for centuries — the artist paints himself painting the king and queen, who appear only as a reflection in a far mirror. His brushwork dissolved into pure suggestion close-up but resolved into perfect form at distance, anticipating Impressionism by two centuries.'),
('Gian Lorenzo Bernini', 'Italian', 1598, 1680, 'Italian', 'The man who shaped Rome. Sculptor, architect, set designer, and playwright — he built fountains, designed the colonnade embracing St. Peter''s Square, and carved marble that seemed to breathe. His Ecstasy of Saint Teresa makes stone look like fabric and flesh. For sixty years he dominated Roman Baroque under multiple popes, rival to Borromini and successor to Michelangelo in his combination of architectural ambition and pure sculptural genius.'),
('Artemisia Gentileschi', 'Italian', 1593, 1656, 'Italian', 'The Baroque''s most powerful female painter, working when women were barred from most artistic training. Raped at seventeen by her teacher Agostino Tassi, she pursued him through a notorious public trial and channeled her experience into paintings of biblical heroines exacting violent justice — her Judith Beheading Holofernes is unforgettable. She traveled across Italy and to England, becoming a court painter and the first woman admitted to Florence''s prestigious art academy.'),
('Frans Hals', 'Dutch', 1582, 1666, 'Dutch', 'Haarlem''s master of the loose, lightning-fast brushstroke. Where contemporaries finished their portraits in smooth polished layers, Hals left visible marks of joy and motion, catching a sitter''s personality the way a smile catches mid-laugh. His enormous militia and regent group portraits arranged dozens of figures into living conversation. He died poor at eighty-four, but Manet and the Impressionists would resurrect his reputation in the 1860s.'),
('Nicolas Poussin', 'French', 1594, 1665, 'Italian', 'A French painter who spent most of his career in Rome and became the model for classical Baroque restraint. While Italian contemporaries built up emotional drama, Poussin built up logic — his canvases are arranged like philosophical arguments, with every figure, gesture, and color in deliberate balance. His landscapes and biblical scenes would shape French academic painting for two centuries and influence Cézanne three centuries later.'),
('Bartolomé Murillo', 'Spanish', 1618, 1682, 'Spanish', 'Seville''s beloved painter of tender religious imagery. His soft-focused Madonnas, smiling street children, and luminous saints made him one of the most popular painters in 17th-century Europe. Less dramatic than his contemporary Velázquez, he aimed for warmth and accessibility — devotion you could feel rather than analyze. He fell from a scaffold while painting an altarpiece in Cádiz and died from the injury in 1682.'),
('Anthony van Dyck', 'Flemish', 1599, 1641, 'Flemish', 'Rubens''s brilliant student who became Europe''s premier portrait painter. He worked in Antwerp, Genoa, and finally London, where he served as principal court painter to Charles I and reinvented royal portraiture — his elongated, aristocratic figures with graceful hands and melancholy eyes set the template for English portrait painting through the 18th century. He died young at forty-one, just before England descended into civil war.'),
('Luca Giordano', 'Italian', 1632, 1705, 'Italian', 'Nicknamed "Luca fa presto" (Luke who works fast) for his almost supernatural speed. Working from Naples to Spain to Florence, he covered massive ceilings with mythological and religious scenes in a fluid, light-filled late-Baroque style. He could allegedly paint a portrait in an hour and complete entire frescoed chapels in weeks. Phenomenally productive, he bridged the dramatic dark Baroque of his teachers and the lighter Rococo to come.'),
('Judith Leyster', 'Dutch', 1609, 1660, 'Dutch', 'One of the very few women admitted to the Haarlem painters'' guild, where she ran her own studio at twenty-four and took on male apprentices. She painted lively genre scenes — drinkers, musicians, children — in a style close to her contemporary Frans Hals. After her death in 1660 her works were misattributed to Hals and her name forgotten until 1893, when art historians began correctly identifying her distinctive monogram signature.'),
('José de Ribera', 'Spanish', 1591, 1652, 'Spanish', 'A Spaniard who spent his career in Spanish-ruled Naples, where his dark, intensely physical paintings of suffering saints and ancient philosophers earned him the nickname "Lo Spagnoletto" (the little Spaniard). His harsh realism — old skin, broken bodies, dirty feet — drew directly from Caravaggio but pushed further into anatomical unflinching truth. He painted the elderly and the tortured with dignity and visceral compassion.'),
('Giovanni Battista Tiepolo', 'Italian', 1696, 1770, 'Italian', 'Venice''s last great Baroque master and the supreme ceiling painter of his age. His vast frescoes for palaces in Würzburg, Madrid, and Venice are filled with brilliant light, soaring perspective, and impossibly graceful figures rising into limitless sky. By his death in 1770 his bright theatrical style had fallen out of fashion as Neoclassicism took over, but his work remains the dazzling final chapter of Baroque painting.'),
('Claude Lorrain', 'French', 1600, 1682, 'Italian', 'A French painter from Lorraine who lived almost his entire adult life in Rome, where he transformed landscape painting into a major art form. His luminous harbors, idealized classical ruins, and golden afternoon light became the template for "picturesque" beauty that influenced Constable, Turner, and the entire English landscape tradition. He kept a sketchbook of every painting he sold to prevent forgeries — an invaluable record of his complete work.'),
('Georges de La Tour', 'French', 1593, 1652, 'Italian', 'A French painter rediscovered only in 1915 after centuries of obscurity. His specialty was nocturnal scenes lit by a single candle or torch, with monumental simplified figures wrapped in silence and contemplation. His religious paintings strip away Baroque drama for quiet mystery — a Magdalene with her hand on a skull, a Joseph carpentering by lamplight. Working in remote Lorraine, he was unknown to most of his Parisian contemporaries.'),
('Alonso Cano', 'Spanish', 1601, 1667, 'Spanish', 'A Spanish triple-talent — painter, sculptor, and architect — who designed Granada Cathedral''s façade and carved life-size polychrome wooden statues of saints that still process through Spanish streets during Holy Week. His paintings combined Sevillian softness with sculptural solidity. He led a turbulent life, fled Madrid after being suspected of murdering his wife, and was tortured during the investigation before being cleared.'),
('Salvator Rosa', 'Italian', 1615, 1673, 'Italian', 'Italian painter, poet, actor, musician, and professional rebel. He invented the "Romantic" landscape long before Romanticism — jagged cliffs, twisted trees, ruins haunted by bandits and witches. His paintings of wild nature and bizarre subjects appealed to a new market of private collectors tired of religious commissions. Sharp-tongued and self-promoting, he openly mocked his patrons and competitors in printed satirical verse.');

INSERT INTO artworks (artist_id, title, year_created, medium, location, image_url, description) VALUES
-- Caravaggio (id 1)
(1, 'The Calling of Saint Matthew', 1600, 'Oil on canvas', 'Contarelli Chapel, San Luigi dei Francesi, Rome', 'https://commons.wikimedia.org/wiki/Special:FilePath/Caravaggio_-_La_vocazione_di_San_Matteo.jpg', 'Christ enters a tax collector''s room and points across the table at Matthew. A shaft of divine light cuts the gloom. One of the founding images of Baroque painting.'),
(1, 'Judith Beheading Holofernes', 1599, 'Oil on canvas', 'Palazzo Barberini, Rome', 'https://commons.wikimedia.org/wiki/Special:FilePath/Caravaggio_-_Judith_Beheading_Holofernes.jpg', 'A young woman calmly saws through an Assyrian general''s neck while her old servant looks on. Blood arcs across white sheets. Unflinching, theatrical, instantly unforgettable.'),
(1, 'The Conversion of Saint Paul', 1601, 'Oil on canvas', 'Cerasi Chapel, Santa Maria del Popolo, Rome', 'https://commons.wikimedia.org/wiki/Special:FilePath/Caravaggio-The_Conversion_of_St._Paul_%28WGA04135%29.jpg', 'Paul lies blinded on the ground, arms thrown wide, while his enormous horse fills the canvas above. The miracle happens in a stable yard, not in heaven.'),
(1, 'Bacchus', 1596, 'Oil on canvas', 'Uffizi Gallery, Florence', 'https://commons.wikimedia.org/wiki/Special:FilePath/Bacchus_by_Caravaggio.jpg', 'A languid teenage boy in a toga offers the viewer a glass of wine. The fruit beside him is already rotting. Sensual, ironic, very early Caravaggio.'),
(1, 'David with the Head of Goliath', 1610, 'Oil on canvas', 'Galleria Borghese, Rome', 'https://commons.wikimedia.org/wiki/Special:FilePath/David_with_the_Head_of_Goliath-Caravaggio_%281610%29.jpg', 'A young David holds up a severed head — Caravaggio''s own face, painted while he was a fugitive hoping for a papal pardon. He died months later.'),

-- Rembrandt (id 2)
(2, 'The Night Watch', 1642, 'Oil on canvas', 'Rijksmuseum, Amsterdam', 'https://commons.wikimedia.org/wiki/Special:FilePath/The_Nightwatch_by_Rembrandt_-_Rijksmuseum.jpg', 'A militia company bursts into motion as their captain orders the march. Rembrandt broke every group-portrait convention. Massive, theatrical, the most famous painting in the Netherlands.'),
(2, 'The Anatomy Lesson of Dr. Nicolaes Tulp', 1632, 'Oil on canvas', 'Mauritshuis, The Hague', 'https://commons.wikimedia.org/wiki/Special:FilePath/Rembrandt_-_The_Anatomy_Lesson_of_Dr_Nicolaes_Tulp.jpg', 'Surgeons crane forward as Dr. Tulp dissects the arm of an executed criminal. Painted at twenty-six, this group portrait made Rembrandt''s reputation in Amsterdam overnight.'),
(2, 'Self-Portrait with Two Circles', 1665, 'Oil on canvas', 'Kenwood House, London', 'https://commons.wikimedia.org/wiki/Special:FilePath/Rembrandt_van_Rijn_-_Self-Portrait_with_Two_Circles.jpg', 'The aging painter stares out, palette in hand, with two mysterious half-circles behind him. One of the most penetrating self-portraits in Western art.'),
(2, 'The Jewish Bride', 1665, 'Oil on canvas', 'Rijksmuseum, Amsterdam', 'https://commons.wikimedia.org/wiki/Special:FilePath/Rembrandt_Harmensz._van_Rijn_-_Portret_van_een_paar_als_oudtestamentische_figuren%2C_genaamd_%27Het_Joodse_bruidje%27.jpg', 'A man tenderly places his hand on a woman''s chest. Late Rembrandt at his most human — thick golden paint, warm shadow, complete emotional intimacy.'),
(2, 'The Return of the Prodigal Son', 1669, 'Oil on canvas', 'Hermitage Museum, Saint Petersburg', 'https://commons.wikimedia.org/wiki/Special:FilePath/Rembrandt_Harmensz_van_Rijn_-_Return_of_the_Prodigal_Son_-_Google_Art_Project.jpg', 'A ragged son kneels and a blind father lays both hands on his back. Painted in the final year of Rembrandt''s life. Quiet, monumental, total compassion.'),

-- Vermeer (id 3)
(3, 'Girl with a Pearl Earring', 1665, 'Oil on canvas', 'Mauritshuis, The Hague', 'https://commons.wikimedia.org/wiki/Special:FilePath/1665_Girl_with_a_Pearl_Earring.jpg', 'A young woman in a blue and yellow turban turns to glance at the viewer. The pearl catches a single point of light. No backstory, no narrative — only presence.'),
(3, 'The Milkmaid', 1658, 'Oil on canvas', 'Rijksmuseum, Amsterdam', 'https://commons.wikimedia.org/wiki/Special:FilePath/Johannes_Vermeer_-_Het_melkmeisje_-_Google_Art_Project.jpg', 'A servant pours milk from a jug into a bowl. Everyday matter elevated into stillness. Every surface — bread, brass, plaster — seems lit from within.'),
(3, 'View of Delft', 1661, 'Oil on canvas', 'Mauritshuis, The Hague', 'https://commons.wikimedia.org/wiki/Special:FilePath/Vermeer-view-of-delft.jpg', 'Vermeer''s home city seen across the harbor on a clear morning after rain. Marcel Proust called it the most beautiful painting in the world.'),
(3, 'The Astronomer', 1668, 'Oil on canvas', 'Musée du Louvre, Paris', 'https://commons.wikimedia.org/wiki/Special:FilePath/Johannes_Vermeer_-_The_Astronomer_-_WGA24685.jpg', 'A scholar in a robe reaches toward a celestial globe in a quiet study. The light from a leaded window is, as always, the real subject of the painting.'),

-- Rubens (id 4)
(4, 'The Descent from the Cross', 1614, 'Oil on panel', 'Cathedral of Our Lady, Antwerp', 'https://commons.wikimedia.org/wiki/Special:FilePath/Peter_Paul_Rubens_-_Descent_from_the_Cross_-_WGA20212.jpg', 'Christ''s pale body slides down a great diagonal of white shroud, caught by mourners. The altarpiece that made Rubens the most famous painter in northern Europe.'),
(4, 'The Three Graces', 1635, 'Oil on panel', 'Museo del Prado, Madrid', 'https://commons.wikimedia.org/wiki/Special:FilePath/Peter_Paul_Rubens_-_The_Three_Graces%2C_1635.jpg', 'Three nude goddesses link arms in a clearing — the painter''s late, intimate ode to Helena Fourment, his second wife. Rosy flesh, no idealization.'),
(4, 'Samson and Delilah', 1610, 'Oil on panel', 'National Gallery, London', 'https://commons.wikimedia.org/wiki/Special:FilePath/Peter_Paul_Rubens_-_Samson_and_Delilah_-_WGA20272.jpg', 'A muscled Samson sleeps in Delilah''s lap while a barber creeps in with scissors. Candlelight, soldiers waiting in the doorway, betrayal in slow motion.'),
(4, 'The Garden of Love', 1633, 'Oil on canvas', 'Museo del Prado, Madrid', 'https://commons.wikimedia.org/wiki/Special:FilePath/Peter_Paul_Rubens_-_The_Garden_of_Love_%28Prado%29.jpg', 'Elegant couples lounge in a palace garden as cupids hover overhead. Painted around his marriage to Helena — a vision of pleasure and married love.'),
(4, 'Massacre of the Innocents', 1612, 'Oil on panel', 'Art Gallery of Ontario, Toronto', 'https://commons.wikimedia.org/wiki/Special:FilePath/Rubens_Massacre_of_the_Innocents.jpg', 'Herod''s soldiers tear infants from their mothers. Brutal, choreographed violence on a Roman scale. Sold for £49.5 million in 2002 after being misattributed for centuries.'),

-- Velázquez (id 5)
(5, 'Las Meninas', 1656, 'Oil on canvas', 'Museo del Prado, Madrid', 'https://commons.wikimedia.org/wiki/Special:FilePath/Las_Meninas_01.jpg', 'The young princess and her maids of honor face the viewer, who stands where the king and queen must be — visible only in a small mirror. Endlessly analyzed, never exhausted.'),
(5, 'The Surrender of Breda', 1635, 'Oil on canvas', 'Museo del Prado, Madrid', 'https://commons.wikimedia.org/wiki/Special:FilePath/Vel%C3%A1zquez_-_de_Breda_o_Las_Lanzas_%28Museo_del_Prado%2C_1634-35%29.jpg', 'A defeated Dutch general hands the keys of his city to a Spanish commander, who places a kindly hand on his shoulder. A forest of victorious lances rises behind them.'),
(5, 'Portrait of Pope Innocent X', 1650, 'Oil on canvas', 'Galleria Doria Pamphilj, Rome', 'https://commons.wikimedia.org/wiki/Special:FilePath/Diego_Vel%C3%A1zquez_-_Portrait_of_Pope_Innocent_X_-_Google_Art_Project.jpg', 'The pope sits in scarlet robes, suspicious and intelligent, watching the painter watching him. "Troppo vero" — too true — he reportedly said when he saw it.'),
(5, 'The Rokeby Venus', 1647, 'Oil on canvas', 'National Gallery, London', 'https://commons.wikimedia.org/wiki/Special:FilePath/The_Rokeby_Venus_%28Vel%C3%A1zquez%29.jpg', 'A nude Venus reclines, her face visible only as a soft reflection in the mirror Cupid holds. The only surviving nude by Velázquez. Slashed by a suffragette in 1914 and restored.'),
(5, 'The Forge of Vulcan', 1630, 'Oil on canvas', 'Museo del Prado, Madrid', 'https://commons.wikimedia.org/wiki/Special:FilePath/Vulcan%27s_Forge_by_Velazquez.jpg', 'A young Apollo arrives at a smoky workshop to tell Vulcan that his wife has betrayed him. The blacksmiths freeze in disbelief. Mythology rendered as Sevillian street life.'),

-- Bernini (id 6)
(6, 'Ecstasy of Saint Teresa', 1652, 'Marble sculpture', 'Cornaro Chapel, Santa Maria della Vittoria, Rome', 'https://commons.wikimedia.org/wiki/Special:FilePath/Ecstasy_of_St._Teresa_HDR.jpg', 'A swooning nun is pierced by an angel''s golden arrow as marble drapery dissolves into pure motion. Light falls from a hidden window above. Sculpture as full theatrical experience.'),
(6, 'Apollo and Daphne', 1625, 'Marble sculpture', 'Galleria Borghese, Rome', 'https://commons.wikimedia.org/wiki/Special:FilePath/Apollo_and_Daphne_%28Bernini%29_-_1.jpg', 'Apollo grasps the fleeing Daphne just as her fingers turn into laurel leaves and her toes root into the earth. Carved when Bernini was twenty-five.'),
(6, 'David', 1624, 'Marble sculpture', 'Galleria Borghese, Rome', 'https://commons.wikimedia.org/wiki/Special:FilePath/Bernini%27s_David.jpg', 'David twists at the moment of releasing his sling, lower lip bitten in concentration. Where Michelangelo''s David stands still, Bernini''s acts.'),
(6, 'Saint Peter''s Square Colonnade', 1667, 'Travertine architecture', 'Vatican City', 'https://commons.wikimedia.org/wiki/Special:FilePath/Vatican_StPeter_Square.jpg', 'Two great curving arms of colonnade reach out from the basilica to "embrace" arriving pilgrims, in Bernini''s own words. The defining face of Catholic Rome.'),

-- Gentileschi (id 7)
(7, 'Judith Slaying Holofernes', 1620, 'Oil on canvas', 'Uffizi Gallery, Florence', 'https://commons.wikimedia.org/wiki/Special:FilePath/Artemisia_Gentileschi_-_Judith_Beheading_Holofernes_-_WGA8563.jpg', 'Two women hold down a struggling general and saw through his neck with cold focus. Painted shortly after her own trial. Often read as personal revenge.'),
(7, 'Self-Portrait as the Allegory of Painting', 1639, 'Oil on canvas', 'Royal Collection, Windsor Castle', 'https://commons.wikimedia.org/wiki/Special:FilePath/Self-portrait_as_the_Allegory_of_Painting_%28La_Pittura%29_-_Artemisia_Gentileschi.jpg', 'Artemisia paints herself in the act of painting — embodying Painting itself, which classical iconography insisted was always female. A quiet, brilliant claim of authority.'),
(7, 'Susanna and the Elders', 1610, 'Oil on canvas', 'Schloss Weißenstein, Pommersfelden', 'https://commons.wikimedia.org/wiki/Special:FilePath/Susanna_and_the_Elders_%281610%29%2C_by_Artemisia_Gentileschi.jpg', 'A nude young woman recoils as two old men lean over a balcony to threaten her. Painted at seventeen — her first known signed work, and devastatingly mature.'),
(7, 'Jael and Sisera', 1620, 'Oil on canvas', 'Museum of Fine Arts, Budapest', 'https://commons.wikimedia.org/wiki/Special:FilePath/Artemisia_Gentileschi_-_Jael_and_Sisera_-_WGA8567.jpg', 'A calm woman drives a tent peg into the temple of the sleeping enemy general — another biblical heroine, another quiet act of strength.'),

-- Hals (id 8)
(8, 'The Laughing Cavalier', 1624, 'Oil on canvas', 'Wallace Collection, London', 'https://commons.wikimedia.org/wiki/Special:FilePath/Frans_Hals_-_The_Laughing_Cavalier.jpg', 'A young man in an embroidered doublet smirks rather than laughs, hand on hip, supremely confident. The most famous portrait Hals ever painted.'),
(8, 'Banquet of the Officers of the St George Civic Guard', 1616, 'Oil on canvas', 'Frans Hals Museum, Haarlem', 'https://commons.wikimedia.org/wiki/Special:FilePath/Frans_Hals_-_Banquet_of_the_Officers_of_the_St_George_Civic_Guard_Company_in_1616_-_WGA11041.jpg', 'Twelve militia officers around a feast table, each one alive and individuated. Hals invented a new kind of group portrait — sociable, dynamic, never stiff.'),
(8, 'Malle Babbe', 1635, 'Oil on canvas', 'Gemäldegalerie, Berlin', 'https://commons.wikimedia.org/wiki/Special:FilePath/Frans_Hals_-_Malle_Babbe_-_WGA11098.jpg', 'A wild-eyed Haarlem woman with a tankard and an owl on her shoulder, laughing at something beyond the frame. Loose, fast, immediate.'),
(8, 'Regents of the Old Men''s Almshouse', 1664, 'Oil on canvas', 'Frans Hals Museum, Haarlem', 'https://commons.wikimedia.org/wiki/Special:FilePath/Frans_Hals_-_Regents_of_the_Old_Men%27s_Almshouse.jpg', 'Five black-clad officials peer out from the dark. Painted at eighty-two, possibly while Hals himself was a charity case. Cold, unsparing, magnificent.'),

-- Poussin (id 9)
(9, 'Et in Arcadia Ego', 1638, 'Oil on canvas', 'Musée du Louvre, Paris', 'https://commons.wikimedia.org/wiki/Special:FilePath/Nicolas_Poussin_-_Et_in_Arcadia_ego_%28deuxi%C3%A8me_version%29.jpg', 'Shepherds in an idyllic landscape gather around a tomb and trace its Latin inscription: "Even in Arcadia, I exist" — death speaks. Calm, classical, philosophical.'),
(9, 'The Rape of the Sabine Women', 1638, 'Oil on canvas', 'Metropolitan Museum of Art, New York', 'https://commons.wikimedia.org/wiki/Special:FilePath/Nicolas_Poussin_-_The_Abduction_of_the_Sabine_Women_-_46.160_-_Metropolitan_Museum_of_Art.jpg', 'Roman soldiers seize the Sabine women in choreographed chaos as Romulus signals from a portico. Violence arranged like a frieze.'),
(9, 'The Judgement of Solomon', 1649, 'Oil on canvas', 'Musée du Louvre, Paris', 'https://commons.wikimedia.org/wiki/Special:FilePath/Nicolas_Poussin_-_The_Judgement_of_Solomon_-_WGA18307.jpg', 'Two mothers claim the same child; the king prepares to cut the baby in half. Architecture, color, and gesture all balanced around the moment of truth.'),
(9, 'The Arcadian Shepherds (first version)', 1629, 'Oil on canvas', 'Chatsworth House, Derbyshire', 'https://commons.wikimedia.org/wiki/Special:FilePath/Et_in_Arcadia_ego_%28Nicolas_Poussin%2C_premi%C3%A8re_version%29.jpg', 'An earlier, more dramatic take on the same theme — the shepherds startled rather than meditative. Poussin returned to the subject because he had not finished thinking about it.'),

-- Murillo (id 10)
(10, 'The Immaculate Conception of Los Venerables', 1678, 'Oil on canvas', 'Museo del Prado, Madrid', 'https://commons.wikimedia.org/wiki/Special:FilePath/Inmaculada_Concepci%C3%B3n_%28Los_Venerables%29_-_Murillo.jpg', 'The Virgin rises through golden clouds, cherubs whirling around her feet. Tender, ecstatic, the image Spanish Catholicism most wanted to see.'),
(10, 'Young Beggar', 1650, 'Oil on canvas', 'Musée du Louvre, Paris', 'https://commons.wikimedia.org/wiki/Special:FilePath/Bartolom%C3%A9_Esteban_Murillo_-_The_Young_Beggar_-_WGA16358.jpg', 'A barefoot boy picks lice from his shirt in a shaft of sunlight. Sentimental, observed, the kind of street scene that scandalized academics and charmed everyone else.'),
(10, 'The Two Trinities (Holy Family with God the Father and the Holy Spirit)', 1677, 'Oil on canvas', 'National Gallery, London', 'https://commons.wikimedia.org/wiki/Special:FilePath/Bartolom%C3%A9_Esteban_Murillo_-_The_Two_Trinities_-_WGA16407.jpg', 'The Christ Child stands between Mary and Joseph as God the Father and the dove of the Holy Spirit float above. Murillo''s gift for soft, glowing devotion.'),
(10, 'Self-Portrait', 1670, 'Oil on canvas', 'National Gallery, London', 'https://commons.wikimedia.org/wiki/Special:FilePath/Self_portrait_of_Bartolome_Esteban_Murillo.jpg', 'The painter looks out from inside an oval frame on which his own hand rests. A self-portrait that quietly insists on its own artifice.'),

-- van Dyck (id 11)
(11, 'Charles I in Three Positions', 1635, 'Oil on canvas', 'Royal Collection, Windsor Castle', 'https://commons.wikimedia.org/wiki/Special:FilePath/Sir_Anthony_Van_Dyck_-_Charles_I_%281600-49%29_-_Google_Art_Project.jpg', 'The English king seen from three angles, painted as a study for Bernini to carve a bust in Rome. Bernini said the face showed signs of a doomed man.'),
(11, 'Charles I at the Hunt', 1635, 'Oil on canvas', 'Musée du Louvre, Paris', 'https://commons.wikimedia.org/wiki/Special:FilePath/Anthony_van_Dyck_-_King_Charles_I_at_the_Hunt_-_WGA07395.jpg', 'The king stands in a casual pose against a Thames landscape, a groom and a horse behind him. Royal portraiture stripped of throne and crown, supremely confident.'),
(11, 'Self-Portrait with a Sunflower', 1633, 'Oil on canvas', 'Westminster, London', 'https://commons.wikimedia.org/wiki/Special:FilePath/Anthony_van_Dyck_-_Self-portrait_with_Sunflower_-_WGA07435.jpg', 'The painter turns toward the viewer and gestures to a sunflower — symbol of his loyalty to the king. Vain, elegant, perfectly van Dyck.'),
(11, 'Lord John Stuart and his Brother', 1638, 'Oil on canvas', 'National Gallery, London', 'https://commons.wikimedia.org/wiki/Special:FilePath/Anthony_Van_Dyck_-_Lord_John_Stuart_and_his_Brother%2C_Lord_Bernard_Stuart_-_WGA07418.jpg', 'Two aristocratic brothers lean against a stone step in silks and satins. Both would die in the English Civil War years later.'),

-- Giordano (id 12)
(12, 'The Triumph of Judith', 1704, 'Fresco', 'Treasury of San Martino, Naples', 'https://commons.wikimedia.org/wiki/Special:FilePath/Tesoro_Certosa_di_San_Martino.jpg', 'A vast ceiling fresco of light and motion celebrating Judith''s victory. Giordano painted this final masterpiece in his seventies, still working at full speed.'),
(12, 'The Fall of the Rebel Angels', 1666, 'Oil on canvas', 'Kunsthistorisches Museum, Vienna', 'https://commons.wikimedia.org/wiki/Special:FilePath/Luca_Giordano_-_Fall_of_the_Rebel_Angels.jpg', 'Saint Michael drives a tangle of damned bodies down out of heaven. Theatrical, cinematic, the kind of canvas Giordano could complete in days.'),
(12, 'Allegory of Divine Wisdom', 1685, 'Fresco', 'Palazzo Medici Riccardi, Florence', 'https://commons.wikimedia.org/wiki/Special:FilePath/Luca_Giordano_-_Apoteosis_de_la_dinast%C3%ADa_M%C3%A9dici.jpg', 'A swirling ceiling apotheosis of the Medici dynasty, dissolving the architecture into open sky. Pure Baroque spectacle.'),

-- Leyster (id 13)
(13, 'Self-Portrait', 1633, 'Oil on canvas', 'National Gallery of Art, Washington', 'https://commons.wikimedia.org/wiki/Special:FilePath/Judith_Leyster_-_Self_Portrait_-_NGA.jpg', 'The painter turns from her easel, mouth open mid-sentence, paintbrush in hand. Confident, professional, smiling at us across four centuries.'),
(13, 'The Proposition', 1631, 'Oil on panel', 'Mauritshuis, The Hague', 'https://commons.wikimedia.org/wiki/Special:FilePath/Judith_Leyster_The_Proposition.jpg', 'A quiet woman sews by candlelight as a man leans over to offer her coins. She keeps her eyes on her work. Unusual, restrained, sharply observed.'),
(13, 'The Concert', 1633, 'Oil on canvas', 'National Museum of Women in the Arts, Washington', 'https://commons.wikimedia.org/wiki/Special:FilePath/Judith_Leyster_-_The_Concert.jpg', 'Three musicians sing and play together in warm light. Loose brushwork close to Hals, but the mood is gentler and more inward.'),

-- Ribera (id 14)
(14, 'The Martyrdom of Saint Philip', 1639, 'Oil on canvas', 'Museo del Prado, Madrid', 'https://commons.wikimedia.org/wiki/Special:FilePath/Jusepe_de_Ribera_-_Martyrdom_of_Saint_Philip_-_WGA19389.jpg', 'Tormentors hoist the saint onto a cross under harsh Mediterranean light. Long mistaken for a Saint Bartholomew. Brutal, sunlit, physically convincing.'),
(14, 'Apollo and Marsyas', 1637, 'Oil on canvas', 'Capodimonte Museum, Naples', 'https://commons.wikimedia.org/wiki/Special:FilePath/Apollo_and_Marsyas-Ribera-MNSM.jpg', 'Apollo calmly skins the satyr Marsyas alive for losing a music contest. Ribera''s anatomical knowledge made the violence unbearably specific.'),
(14, 'The Clubfoot', 1642, 'Oil on canvas', 'Musée du Louvre, Paris', 'https://commons.wikimedia.org/wiki/Special:FilePath/Jusepe_de_Ribera_-_The_Club-footed_Boy_-_WGA19378.jpg', 'A street boy with a malformed foot grins at the viewer and holds up a note begging for charity. Dignified, monumental, neither pitying nor sentimental.'),

-- Tiepolo (id 15)
(15, 'The Apotheosis of the Spanish Monarchy', 1764, 'Fresco', 'Royal Palace of Madrid', 'https://commons.wikimedia.org/wiki/Special:FilePath/Apoteosis_Espa%C3%B1ola_-_Tiepolo.jpg', 'A vast ceiling fresco of allegorical figures rising into pure Mediterranean sky. One of Tiepolo''s last and largest works.'),
(15, 'The Banquet of Cleopatra', 1744, 'Oil on canvas', 'National Gallery of Victoria, Melbourne', 'https://commons.wikimedia.org/wiki/Special:FilePath/Banquet_of_Cleopatra_Tiepolo.jpg', 'Cleopatra prepares to dissolve a pearl in vinegar to win a bet with Mark Antony. All silk, marble, and theatrical Venetian color.'),
(15, 'Würzburg Residence Ceiling', 1753, 'Fresco', 'Würzburg Residence, Bavaria', 'https://commons.wikimedia.org/wiki/Special:FilePath/Residenz_Wuerzburg_Treppenhaus_Fresko_Olympus_Asia_klein.jpg', 'The world''s largest ceiling fresco, depicting the four continents paying tribute to the prince-bishop. The high point of late Baroque ceiling painting.'),
(15, 'The Finding of Moses', 1740, 'Oil on canvas', 'National Gallery of Scotland, Edinburgh', 'https://commons.wikimedia.org/wiki/Special:FilePath/Giovanni_Battista_Tiepolo_-_The_Finding_of_Moses_-_Google_Art_Project.jpg', 'Pharaoh''s daughter and her elegant retinue gather around the basket on the Nile. Tiepolo treats biblical story as Venetian fashion plate.'),

-- Claude Lorrain (id 16)
(16, 'Seaport with the Embarkation of the Queen of Sheba', 1648, 'Oil on canvas', 'National Gallery, London', 'https://commons.wikimedia.org/wiki/Special:FilePath/Claude_Lorrain_009.jpg', 'The morning sun rises directly over a harbor crowded with ships and classical palaces. The Queen and her courtiers are tiny — the real subject is golden light on water.'),
(16, 'Landscape with the Marriage of Isaac and Rebecca', 1648, 'Oil on canvas', 'National Gallery, London', 'https://commons.wikimedia.org/wiki/Special:FilePath/Claude_Lorrain_017.jpg', 'A wedding dance in a luminous Italian valley. Claude''s landscapes invented the very idea of "scenic" beauty for the next two hundred years.'),
(16, 'Pastoral Landscape', 1648, 'Oil on canvas', 'Museum of Fine Arts, Boston', 'https://commons.wikimedia.org/wiki/Special:FilePath/Claude_Lorrain_-_Pastoral_Landscape_-_Google_Art_Project.jpg', 'Cattle and herders pass through a wide Roman campagna toward a distant temple. Calm, golden, the painted version of a perfect afternoon.'),

-- La Tour (id 17)
(17, 'Magdalene with the Smoking Flame', 1640, 'Oil on canvas', 'Los Angeles County Museum of Art', 'https://commons.wikimedia.org/wiki/Special:FilePath/Georges_de_La_Tour_007.jpg', 'Mary Magdalene contemplates a skull resting on a book, lit only by a single guttering candle. Almost geometric in its stillness.'),
(17, 'Joseph the Carpenter', 1642, 'Oil on canvas', 'Musée du Louvre, Paris', 'https://commons.wikimedia.org/wiki/Special:FilePath/Georges_de_La_Tour_-_Joseph_charpentier.jpg', 'The young Christ holds a candle for his father, who bores a hole in a beam — foreshadowing the cross. The boy''s hand glows translucent.'),
(17, 'The Cheat with the Ace of Diamonds', 1635, 'Oil on canvas', 'Musée du Louvre, Paris', 'https://commons.wikimedia.org/wiki/Special:FilePath/Georges_de_La_Tour_017.jpg', 'A foolish young man at a card table is calmly cheated by three accomplices. Cool daylight, a rare non-religious La Tour with all the wit of a stage play.'),
(17, 'Saint Joseph''s Dream', 1640, 'Oil on canvas', 'Musée des Beaux-Arts, Nantes', 'https://commons.wikimedia.org/wiki/Special:FilePath/Georges_de_La_Tour_-_St._Joseph%27s_Dream.jpg', 'An angel leans over the sleeping Joseph and whispers in his ear. A single candle, two figures, complete silence.'),

-- Cano (id 18)
(18, 'Immaculate Conception', 1655, 'Polychrome wood sculpture', 'Granada Cathedral, Granada', 'https://commons.wikimedia.org/wiki/Special:FilePath/Inmaculada_de_Granada_-_Alonso_Cano.jpg', 'A small standing Virgin in carved and painted wood. Hands clasped, eyes lowered. The most loved devotional sculpture in Granada.'),
(18, 'The Vision of Saint Bernard', 1660, 'Oil on canvas', 'Museo del Prado, Madrid', 'https://commons.wikimedia.org/wiki/Special:FilePath/Alonso_Cano_-_The_Vision_of_Saint_Bernard_-_WGA4220.jpg', 'The Virgin presses milk from her breast into the mouth of the kneeling saint. A startling, tender image from late medieval legend.'),
(18, 'Granada Cathedral Façade', 1667, 'Stone architecture', 'Granada, Spain', 'https://commons.wikimedia.org/wiki/Special:FilePath/Granada_Cathedral_facade.jpg', 'A massive three-arch façade combining sculptural depth with restrained classical geometry. Cano''s last great commission, finished in the year of his death.'),

-- Salvator Rosa (id 19)
(19, 'Self-Portrait', 1647, 'Oil on canvas', 'National Gallery, London', 'https://commons.wikimedia.org/wiki/Special:FilePath/Salvator_Rosa_-_Self-portrait_-_National_Gallery.jpg', 'The painter stares out from a stormy background, holding a Latin tablet: "Be silent, unless your speech is better than silence." The motto of a man who could not.'),
(19, 'Landscape with Soldiers and Hunters', 1670, 'Oil on canvas', 'Musée du Louvre, Paris', 'https://commons.wikimedia.org/wiki/Special:FilePath/Salvator_Rosa_-_Landscape_with_Soldiers_and_Hunters.jpg', 'Tiny figures move through a wild, jagged landscape under a stormy sky. Rosa invented the kind of brooding nature that Romantic painters would chase for centuries.'),
(19, 'The Temptation of Saint Anthony', 1645, 'Oil on canvas', 'Palazzo Pitti, Florence', 'https://commons.wikimedia.org/wiki/Special:FilePath/Salvator_Rosa_-_The_Temptation_of_St_Anthony_-_WGA20049.jpg', 'A grotesque demon menaces the praying saint in a dark cave. Rosa''s love of the bizarre and the horrific anticipates Gothic taste by a century.');

INSERT INTO events (year, title, description) VALUES
-- 1600s
(1600, 'Caravaggio in Rome', 'Caravaggio unveils the Contarelli Chapel paintings in Rome. His revolutionary chiaroscuro and street-level realism redefine what religious art can look like.'),
(1600, 'Giordano Bruno burned', 'The philosopher Giordano Bruno is burned at the stake in Rome''s Campo de'' Fiori for heresy, including teaching that the stars are distant suns with their own planets.'),
(1602, 'Bodleian Library opens', 'Sir Thomas Bodley''s rebuilt library opens at Oxford with 2,500 volumes. It will become one of the great research libraries of Europe.'),
(1603, 'Death of Elizabeth I', 'The Virgin Queen dies childless after 44 years on the English throne. James VI of Scotland takes the crown as James I, uniting the kingdoms.'),
(1604, 'Counter-Reformation art', 'The Catholic Church, still reeling from the Protestant Reformation, demands emotionally engaging religious imagery. Caravaggio and his followers answer the call.'),
(1605, 'Don Quixote published', 'Miguel de Cervantes publishes Part One of Don Quixote in Madrid. The book invents the modern novel and instantly becomes Europe''s most popular fiction.'),
(1606, 'Caravaggio kills a man', 'After a dispute on a Roman tennis court turns into a sword fight, Caravaggio kills Ranuccio Tomassoni and flees the city. He will never return.'),
(1607, 'Monteverdi''s Orfeo', 'Claudio Monteverdi premieres L''Orfeo at the Mantuan court. It is the first opera that has remained in the modern repertoire — Baroque music is born.'),
(1609, 'Galileo''s telescope', 'Galileo Galilei improves the spyglass into a 30-power telescope and turns it on the night sky. He will discover Jupiter''s moons within months.'),
(1609, 'Twelve Years'' Truce', 'Spain and the Dutch Republic sign a truce halting (temporarily) the Eighty Years'' War. Dutch trade explodes; the Golden Age accelerates.'),

-- 1610s
(1610, 'Henri IV assassinated', 'The French king Henri IV is stabbed to death by a Catholic fanatic on a Paris street. His widow Marie de'' Medici takes the regency and later commissions a vast cycle from Rubens.'),
(1610, 'Caravaggio dies', 'Michelangelo Merisi da Caravaggio dies on a beach at Porto Ercole at thirty-eight, possibly of fever, possibly murdered. Painting has lost its most violent genius.'),
(1614, 'Rubens'' Descent from the Cross', 'Rubens unveils his great altarpiece in Antwerp Cathedral. The painting confirms him as northern Europe''s leading artist and floods his workshop with commissions.'),
(1615, 'Rembrandt born', 'Rembrandt van Rijn is born in Leiden, the ninth child of a prosperous miller. He will become the Netherlands'' supreme painter of light and human psychology.'),
(1616, 'Shakespeare dies', 'William Shakespeare dies in Stratford-upon-Avon at fifty-two. His collected plays will be published seven years later in the First Folio.'),
(1616, 'Galileo warned', 'The Roman Inquisition warns Galileo not to teach Copernican heliocentrism as truth. He agrees — for now.'),
(1618, 'Thirty Years'' War begins', 'Protestant nobles throw two Catholic regents out a window in Prague. The Defenestration triggers a continent-wide religious war that will kill millions.'),
(1619, 'Synod of Dort', 'Calvinist theologians from across Europe meet in the Dutch Republic and codify strict Reformed doctrine. Religious painting in the Netherlands declines; domestic subjects rise.'),

-- 1620s
(1620, 'Dutch Golden Age begins', 'With trade booming after the truce with Spain, Amsterdam becomes Europe''s wealthiest city. A vast middle-class art market emerges — paintings hang in every burgher''s home.'),
(1620, 'Mayflower lands', 'English Separatists aboard the Mayflower establish Plymouth Colony on the Massachusetts coast, beginning the European colonization of New England.'),
(1623, 'Bernini''s David', 'A 24-year-old Gian Lorenzo Bernini carves a marble David twisting at the moment of releasing his sling. Sculpture has not been this alive since antiquity.'),
(1624, 'Hals'' Laughing Cavalier', 'Frans Hals paints the smirking young man in Haarlem who will become his most famous portrait. The brushwork is loose, fast, and immediate — a small revolution.'),
(1625, 'Apollo and Daphne', 'Bernini completes Apollo and Daphne for Cardinal Borghese. Marble fingers turn into laurel leaves before the viewer''s eyes.'),
(1626, 'St Peter''s consecrated', 'After 120 years of construction by Bramante, Michelangelo, Maderno and others, the new St Peter''s Basilica in Rome is finally consecrated by Pope Urban VIII.'),
(1628, 'Velázquez meets Rubens', 'Rubens visits Madrid on a diplomatic mission and meets the young court painter Velázquez. He encourages Velázquez to travel to Italy — which he does the next year.'),

-- 1630s
(1630, 'Velázquez in Rome', 'Velázquez, on his first Italian journey, paints The Forge of Vulcan in Rome. He returns to Madrid with a transformed sense of color and light.'),
(1632, 'Vermeer born', 'Johannes Vermeer is born in Delft, the son of an innkeeper and art dealer. He will produce only about thirty-six paintings in his entire life.'),
(1632, 'The Anatomy Lesson', 'Rembrandt, twenty-six and newly arrived in Amsterdam, paints The Anatomy Lesson of Dr. Nicolaes Tulp. The group portrait makes his reputation overnight.'),
(1632, 'Leyster''s studio opens', 'Judith Leyster, twenty-three, is admitted as a master to the Haarlem painters'' guild and opens her own studio. Very few women in 17th-century Europe will achieve this.'),
(1633, 'Galileo on trial', 'Galileo is tried by the Roman Inquisition for advocating heliocentrism, forced to recant, and placed under house arrest for the rest of his life.'),
(1635, 'Rembrandt at his peak', 'Rembrandt is Amsterdam''s most fashionable portrait painter, recently married to wealthy Saskia van Uylenburgh. He paints himself in costume jewelry and a fur cap.'),
(1635, 'Surrender of Breda', 'Velázquez completes The Surrender of Breda for Madrid''s Hall of Realms. The defeated Dutch general is offered dignity — propaganda rendered with extraordinary tact.'),
(1638, 'Et in Arcadia Ego', 'Poussin paints his second version of shepherds discovering a tomb in an idyllic landscape. The Latin inscription — "Even in Arcadia, I am" — is death speaking.'),
(1639, 'Artemisia in England', 'Artemisia Gentileschi joins her father Orazio at the court of Charles I and paints her famous Self-Portrait as the Allegory of Painting.'),

-- 1640s
(1640, 'Rubens dies', 'Peter Paul Rubens dies in Antwerp at sixty-two, having outlived two wives and produced more than a thousand paintings. Northern Europe''s most successful painter is gone.'),
(1641, 'Van Dyck dies', 'Anthony van Dyck dies in London at forty-one, just before the English Civil War destroys the courtly world he painted. His aristocratic portrait style outlives him by centuries.'),
(1642, 'English Civil War', 'Parliament and King Charles I go to war. The conflict will end with the trial and execution of the king and the temporary abolition of the English monarchy.'),
(1642, 'The Night Watch', 'Rembrandt completes his enormous militia portrait for an Amsterdam guard company. Months later his wife Saskia dies at thirty, leaving him with their infant son Titus.'),
(1648, 'Peace of Westphalia', 'A series of treaties signed in Münster and Osnabrück end the Thirty Years'' War. Modern Europe''s system of sovereign states is essentially born here.'),
(1648, 'French Royal Academy', 'Charles Le Brun and others establish the Royal Academy of Painting and Sculpture in Paris under royal protection. The state begins to dictate French artistic taste.'),
(1649, 'Charles I executed', 'After trial by Parliament, King Charles I is beheaded outside the Banqueting House in Whitehall. England is a republic for the next eleven years.'),

-- 1650s
(1650, 'Velázquez paints the pope', 'Velázquez, in Rome on a second Italian journey, paints Pope Innocent X. The pope reportedly mutters "troppo vero" (too true) on seeing the result.'),
(1652, 'Ecstasy of Saint Teresa', 'Bernini completes his Ecstasy of Saint Teresa in the Cornaro Chapel — a swooning nun pierced by an angel''s arrow, lit by a hidden window. Theatre as sculpture.'),
(1653, 'Taj Mahal completed', 'Far from Europe, the great mausoleum to Mumtaz Mahal is completed at Agra after twenty-one years. Mughal Baroque, parallel to European.'),
(1656, 'Las Meninas painted', 'Velázquez completes Las Meninas in the Alcázar palace — a meta-painting of the royal family, the artist himself, and the viewer. Many consider it the greatest painting ever made.'),
(1656, 'Rembrandt bankrupt', 'Rembrandt, unable to repay loans on his Amsterdam house, files for insolvency. His art collection and possessions are auctioned over the next two years.'),
(1658, 'The Milkmaid', 'Vermeer paints a servant girl pouring milk in a Delft kitchen. The painting is small, modest in subject, and one of the most quietly perfect works in Western art.'),
(1659, 'Treaty of the Pyrenees', 'France and Spain end twenty-four years of war. The peace seals France''s rise as Europe''s dominant power and Spain''s long decline.'),

-- 1660s
(1660, 'Restoration of the monarchy', 'After eleven years of republican Commonwealth, Charles II returns to London as king. The arts revive; theatres reopen; women perform on the English stage for the first time.'),
(1661, 'Louis XIV takes power', 'After Cardinal Mazarin''s death, the twenty-two-year-old Louis XIV announces he will rule France personally. His seventy-two-year reign will define absolute monarchy.'),
(1661, 'View of Delft', 'Vermeer paints his home city across the harbor on a clear morning after rain. Marcel Proust will later call it the most beautiful painting in the world.'),
(1665, 'The Great Plague', 'Bubonic plague kills an estimated 100,000 people in London — nearly a quarter of the population. The court flees to Oxford; the city shuts down for months.'),
(1665, 'The Jewish Bride', 'The aging Rembrandt paints a couple in thick golden paint, with one hand resting tenderly on a chest. Late Rembrandt at his most quietly humane.'),
(1666, 'Great Fire of London', 'A fire that begins in a Pudding Lane bakery destroys most of the medieval City of London in four days. Christopher Wren will rebuild St Paul''s Cathedral over the next forty-five years.'),
(1666, 'Frans Hals dies', 'Frans Hals dies in Haarlem at eighty-four, possibly a charity case. His loose, brilliant brushwork will be ignored for two centuries before the Impressionists revive his reputation.'),
(1667, 'St Peter''s Square colonnade', 'Bernini completes the great curving colonnade in front of St Peter''s Basilica — two arms reaching out, in his own words, to "embrace" arriving pilgrims.'),
(1669, 'Rembrandt dies', 'Rembrandt dies in Amsterdam at sixty-three, almost forgotten by the fashionable. His last self-portraits and the Return of the Prodigal Son are among the greatest paintings ever made.'),

-- 1670s
(1670, 'Pascal''s Pensées', 'The mathematician Blaise Pascal''s scattered religious reflections are published posthumously as Pensées. "The heart has its reasons which reason knows not."'),
(1672, 'Dutch Disaster Year', 'The Rampjaar: France, England, and two German bishoprics simultaneously invade the Dutch Republic. The art market collapses; Vermeer''s patrons stop buying paintings.'),
(1675, 'Vermeer dies', 'Johannes Vermeer dies in Delft at forty-three, leaving his wife and eleven children deeply in debt. His name will be largely forgotten for the next two centuries.'),
(1678, 'Murillo''s Immaculate Conception', 'Bartolomé Esteban Murillo paints his most famous Immaculate Conception in Seville. Soft light, ascending Virgin, swirling cherubs — Spanish Catholicism''s ideal image.'),

-- 1680s
(1680, 'Bernini dies', 'Gian Lorenzo Bernini dies in Rome at eighty-one, having shaped the city for sixty years under eight different popes. No sculptor since Michelangelo has had such influence.'),
(1682, 'Claude Lorrain dies', 'Claude Lorrain dies in Rome at eighty-one. His luminous, idealized landscapes will define "scenic" beauty for English painters and aristocratic garden designers for centuries.'),
(1682, 'Murillo''s fatal fall', 'Bartolomé Murillo falls from a scaffold while painting an altarpiece in Cádiz. He dies of his injuries some months later in Seville.'),
(1685, 'Edict of Nantes revoked', 'Louis XIV revokes the Edict of Nantes, ending nearly a century of religious toleration in France. Hundreds of thousands of Protestant Huguenots flee to England, the Dutch Republic, and the Americas.'),
(1685, 'A great year for music', 'Johann Sebastian Bach, George Frideric Handel, and Domenico Scarlatti are all born in 1685 — the late-Baroque musical revolution has its founders.'),
(1687, 'Newton''s Principia', 'Isaac Newton publishes Philosophiæ Naturalis Principia Mathematica, setting out the laws of motion and universal gravitation. The Scientific Revolution has its central text.'),
(1688, 'Glorious Revolution', 'William of Orange, invited by English Protestants, lands in Devon. The Catholic King James II flees to France. Parliamentary monarchy is established.'),

-- 1690s
(1692, 'Salem witch trials', 'A mass panic in Massachusetts Bay Colony leads to the execution of twenty people for witchcraft. The trials become a permanent symbol of religious hysteria.'),
(1696, 'Tiepolo born', 'Giovanni Battista Tiepolo is born in Venice. He will become the supreme ceiling painter of the late Baroque, working for princes from Madrid to Würzburg.'),
(1699, 'Treaty of Karlowitz', 'After sixteen years of war, the Ottoman Empire signs the Treaty of Karlowitz, ceding Hungary and large territories to the Habsburgs. The long Ottoman retreat from central Europe begins.'),

-- 1700s
(1700, 'Last Spanish Habsburg dies', 'The childless and disabled Charles II of Spain dies, bequeathing his throne to Louis XIV''s grandson. The other powers refuse to accept it — the War of the Spanish Succession begins.'),
(1700, 'Baroque meets Rococo', 'Baroque still dominates major churches and palaces, but in the French court a lighter, more intimate decorative style — soon called Rococo — begins to emerge.'),
(1704, 'Newton''s Opticks', 'Isaac Newton publishes Opticks, his treatise on light, color, and the rainbow. The book becomes one of the most influential scientific works of the century.'),
(1705, 'Giordano dies', 'Luca Giordano, called "fa presto" for his almost supernatural speed, dies in Naples. His fluid late-Baroque frescoes had decorated churches and palaces from Italy to Spain.'),
(1709, 'Battle of Poltava', 'Peter the Great of Russia decisively defeats Sweden''s Charles XII at Poltava in Ukraine. Russia replaces Sweden as the dominant northern power.'),

-- 1710s
(1711, 'Handel arrives in London', 'The young German composer George Frideric Handel arrives in London. He will spend the rest of his life there, becoming the dominant figure in English music.'),
(1715, 'Louis XIV dies', 'After a 72-year reign — the longest in European history — the Sun King dies at Versailles. The court relaxes; the Régence loosens manners; Rococo takes hold.'),
(1717, 'Pilgrimage to Cythera', 'Antoine Watteau completes his Pilgrimage to the Isle of Cythera. The painting defines the new French Rococo: elegant, sensual, dreamlike, melancholy.'),
(1719, 'Robinson Crusoe', 'Daniel Defoe publishes Robinson Crusoe in London. Many consider it the first English novel; it is an immediate sensation.'),

-- 1720s
(1720, 'Plague of Marseille', 'Bubonic plague arrives by ship at Marseille and kills perhaps half the city''s population. It will be the last great plague outbreak in western Europe.'),
(1721, 'Brandenburg Concertos', 'Johann Sebastian Bach completes his six Brandenburg Concertos in Köthen. They will become the most loved concertos of the entire Baroque era.'),
(1725, 'The Four Seasons', 'Antonio Vivaldi publishes The Four Seasons in Amsterdam — four violin concertos with programmatic poems. The work is wildly popular across Europe.'),
(1727, 'Newton dies', 'Isaac Newton dies in London at eighty-four and is buried in Westminster Abbey. Voltaire, present at the funeral, marvels that a country honored a scientist like a king.'),

-- 1730s
(1730, 'Rococo dominant', 'The French Rococo, with its pastel colors, intimate scale, and playful decoration, has fully replaced grand Baroque in European court taste. Baroque retreats to churches and great public buildings.'),
(1733, 'War of Polish Succession', 'The War of Polish Succession begins, involving Russia, Austria, and Prussia. It ends with the Treaty of Warsaw in 1735.'),
(1735, 'Linnaeus'' Systema Naturae', 'The Swedish naturalist Carl Linnaeus publishes Systema Naturae, classifying living things into kingdoms, classes, orders, genera, and species. Modern biology has its framework.'),
(1738, 'Herculaneum excavated', 'Workmen digging a well near Naples uncover the buried Roman town of Herculaneum. The discovery electrifies Europe and sets off a neoclassical revival in art and design.'),

-- 1740s
(1740, 'Maria Theresa inherits', 'Maria Theresa inherits the vast Habsburg dominions. Most of Europe immediately refuses to accept a female ruler, and the War of the Austrian Succession begins.'),
(1741, 'Handel''s Messiah', 'In London, George Frideric Handel composes his oratorio Messiah in twenty-four days. Its first performance in Dublin the next year raises money for charity hospitals.'),
(1748, 'Pompeii excavated', 'Excavations begin at the Roman city of Pompeii, buried by Vesuvius in 79 AD. Combined with Herculaneum, the discoveries fuel the Neoclassical movement that will overthrow the Baroque.'),
(1748, 'Treaty of Aix-la-Chapelle', 'The Treaty ending the War of Austrian Succession largely restores prewar boundaries. Maria Theresa keeps her throne; Prussia keeps Silesia; everyone prepares for the next war.');

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

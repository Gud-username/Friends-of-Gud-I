local atlas_key = 'fog1_atlas'
local atlas_path = 'fog1_lc.png'
local atlas_path_hc = 'fog1_hc.png'

local suits = {'hearts', 'clubs', 'diamonds', 'spades'}
local ranks = {'Jack', 'Queen', "King", "Ace", "10", "9", "8", "7", "6", "5", "4", "3", "2"}

local description = {
    hearts = "Athebyne",
    clubs = "Scraptake",
    diamonds = "Not mario",
    spades = "Crabus",
}

SMODS.Atlas{  key = atlas_key..'_lc', px = 71, py = 95, path = atlas_path, prefix_config = {key = false},}
if atlas_path_hc then
    SMODS.Atlas{  key = atlas_key..'_hc', px = 71, py = 95, path = atlas_path_hc, prefix_config = {key = false},}
end

for _, suit in ipairs(suits) do
    SMODS.DeckSkin{
        key = suit.."_skin",
        suit = suit:gsub("^%l", string.upper),
        ranks = ranks,
	display_ranks = {"Jack", "Queen", "King", "Ace"},
        lc_atlas = atlas_key..'_lc',
        hc_atlas = (atlas_path_hc and atlas_key..'_hc') or atlas_key..'_lc',
        loc_txt = {
            ['en-us'] = description[suit]},
        posStyle = 'deck'
    }
end

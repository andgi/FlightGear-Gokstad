###############################################################################
##
## The Gokstad ship for FlightGear.
##
##  Copyright (C) 2015  Anders Gidenstam  (anders(at)gidenstam.org)
##  This file is licensed under the GPL license v2 or later.
##
###############################################################################

###############################################################################
# Walk views.

# Deck
var deckConstraint = walkview.makeUnionConstraint
   (
    [
     walkview.SlopingYAlignedPlane.new([ 3.50, -1.00, 1.00],
                                       [20.04,  1.00, 1.00]),
     walkview.SlopingYAlignedPlane.new([20.04, -0.30, 1.60],
                                       [22.00,  0.30, 1.90]),
    ]);

# Create the view managers.
var deck_walker =
        walkview.Walker.new("Deck View",
                            deckConstraint);
#                            [walkview.JSBSimPointmass.new(29)]);

deck_walker.set_eye_height(1.70);

###############################################################################

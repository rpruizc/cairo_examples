struct Location:
    member row : felt
    member col : felt
end

func verify_valid_location(loc : Location*):
    # Check that row is in range 0-3
    tempvar row = loc.row
    assert row * (row - 1) * (row - 2) * (row - 3) = 0

    # Check that col is in range 0-3
    tempvar col = loc.col
    assert col * (col - 1) * (col - 2) * (col - 3) = 0

    return ()
end

func verify_adjacent_locations(
    loc0: Location*,
    loc1: Location*
):
    alloc_locals
    local row_diff = loc0.row - loc1.row
    local col_diff = loc0.col - loc1.col

    if row_diff == 0:
        # The row coordinate is the same. Make sure that the difference
        # in col is 1 or -1
        assert col_diff * col_diff == 1
        return ()
    else :
        # Verify the difference in row is 1 or -1
        assert row_diff * row_diff == 1
        # Verify that the col coordinate is the same
        assert col_diff == 0
        return ()
    end
end

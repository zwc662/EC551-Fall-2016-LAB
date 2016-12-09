// The width of the screen in pixels
`define PIXEL_WIDTH 640
// The height of the screen in pixels
`define PIXEL_HEIGHT 480

// Used for VGA horizontal and vertical sync
`define HSYNC_FRONT_PORCH 16
`define HSYNC_PULSE_WIDTH 96
`define HSYNC_BACK_PORCH 48
`define VSYNC_FRONT_PORCH 10
`define VSYNC_PULSE_WIDTH 2
`define VSYNC_BACK_PORCH 33

// How many pixels wide/high each block is
`define BLOCK_SIZE 10

// How many blocks wide the game board is
`define BLOCKS_WIDE 28
// How many blocks high the game board is
`define BLOCKS_HIGH 28
// Width of the game board in pixels



// Color mapping
`define WHITE 8'b11111111
`define BLACK 8'b00000000
`define GRAY 8'b10100100
`define CYAN 8'b11110000
`define YELLOW 8'b00111111
`define PURPLE 8'b11000111
`define GREEN 8'b00111000
`define RED 8'b00000111
`define BLUE 8'b11000000
`define ORANGE 8'b00011111

// Error value
`define row_len_bits 8
`define col_id_bits 8
`define matrix_val_bits 8
`define row_id_bits 8
`define vec_val_bits 8
`define mult_bits 16
`define channels_per_accumulator 4
`define channels_per_CISR 4
`define channel_num_bits 4
`define channel_num 4
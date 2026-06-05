loadBookings();

document
.getElementById("bookingForm")
.addEventListener("submit", async (e) => {

    e.preventDefault();

    const booking = {

        guest_name:
        document.getElementById("guest_name").value,

        room_number:
        document.getElementById("room_number").value,

        check_in:
        document.getElementById("check_in").value,

        check_out:
        document.getElementById("check_out").value
    };

    await fetch("/bookings", {

        method: "POST",

        headers: {
            "Content-Type": "application/json"
        },

        body: JSON.stringify(booking)

    });

    document.getElementById("bookingForm").reset();

    loadBookings();
});

async function loadBookings() {

    const response =
    await fetch("/bookings");

    const data =
    await response.json();

    const table =
    document.getElementById("bookingTable");

    table.innerHTML = "";

    data.forEach(booking => {

        table.innerHTML += `

        <tr>

            <td>${booking.id}</td>

            <td>${booking.guest_name}</td>

            <td>${booking.room_number}</td>

            <td>${booking.check_in}</td>

            <td>${booking.check_out}</td>

        </tr>

        `;

    });
}

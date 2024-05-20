// redirect.js

exports.handler = async (event) => {
    const response = {
        status: '307',
        statusDescription: 'Temporary Redirect',
        headers: {
            location: [{
                key: 'Location',
                value: 'https://example.com', // Replace 'https://example.com' with your desired redirect URL
            }],
        },
    };
    return response;
};

function importAll (r) {
    r.keys().forEach(r);
}

importAll(require.context('.', true, /\.(png|jpe?g|svg)$/))
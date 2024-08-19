function padronizacao (nmTables) {
    return {
        timestamps: false,
        freezeTableName: true,
        tableName: nmTables
    }
}

module.exports = {
    padronizacao
}

function findAccountDetails()
    for per in peripheral.getNames() do
        if disk.hasData(per) and prgrom.isReadOnlyDisk(per) then
            local basePath = disk.getMountPath(per);
            local accFile = fs.open(basePath.."/account-details","r");

            if accFile then
                local transitNum = accFile.readLine(): -- actually <inst>-<transit>, 
                local accountNum = accFile.readLine();

                accFile.close()

                return {transitNum = transitNum, accountNum = accountNum}
            end
        end
    end
    return nil
end
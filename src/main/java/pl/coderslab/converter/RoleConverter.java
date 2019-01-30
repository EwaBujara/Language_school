package pl.coderslab.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.coderslab.entity.Role;
import pl.coderslab.repository.RoleRepository;

public class RoleConverter implements Converter<String, Role> {

    @Autowired
    RoleRepository roleRepository;

    @Override
    public Role convert(String s) {
        return roleRepository.findOne(Long.parseLong(s));
    }
}

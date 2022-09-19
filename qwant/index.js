import iconStyles from './icons.yml';

const nameToClass = iconName => iconName.match(/^(.*?)-[0-9]{1,2}$/)[1];

function getIconFromMapping({ className, subClassName }) {
  const icons = iconStyles.mappings;
  const icon =
    // Matching class and subclass
    icons.find(iconProperty =>
      iconProperty.subclass === subClassName && iconProperty.class === className)
  ||
    // Or: no class and matching subclass
    icons.find(iconProperty => 
      iconProperty.subclass === subClassName && !iconProperty.class)
  ||
    // Or: matching class and no subclass
    icons.find(iconProperty => 
      iconProperty.class === className && !iconProperty.subclass);

  return icon;
}

function getPoiIcon({ className, subClassName, type }) {
  let iconName, color;

  // Get the icon of a location / area that is not a PoI:
  switch (type) {
    case 'poi':
    case 'category':
      const icon = getIconFromMapping({ className, subClassName });
      iconName = icon ? icon.iconName : iconStyles.defaultIcon;
      color = icon ? icon.color : iconStyles.defaultColor;
      break;
    
    // Exact address
    case 'house':
    case 'address':
      iconName = iconStyles.defaultAddressIcon;
      color = iconStyles.defaultAddressColor;
      break;

    // Road / street without house number
    case 'street':
      iconName = iconStyles.defaultStreetIcon;
      color = iconStyles.defaultStreetColor;
      break;

    // Administrative zones (city, area, country)
    default:
      iconName = iconStyles.defaultAdministrativeIcon;
      color = iconStyles.defaultAdministrativeColor;
  }

  return {
    iconClass: nameToClass(iconName),
    color,
  }
}

export { getPoiIcon };

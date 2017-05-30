function value=coordinate(xa,xb,xc,xd)
left=[xa(2)-xc(2),xc(1)-xa(1);xb(2)-xd(2),xd(1)-xb(1)];
right=[xc(1)*xa(2)-xc(2)*xa(1);xd(1)*xb(2)-xd(2)*xb(1)];
value=left\right;
value=value';
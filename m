Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C813CA0EDC
	for <ath11k@archiver.kernel.org>; Thu, 21 Aug 2025 07:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7jj0RWb3NgQmNjLgwT9jEyVWruC4wLqZypmADAd++kU=; b=joHI7UdvVNIXB8juOoUNsnDWTe
	DL4hP8hn/b8UUqhz+buhSvGdKeyG47nLV3FUlLpUdIIam0wqTBNfu1i2cJ0psyQzulSdoCtg9pPjC
	l9WLKj82L3IV+4RFmJ3GtJBIjeCmCOVhLKYdroklbPPV5vjTObp6UbcMirG56AkOCzk1HAuUUX+15
	/1uDNFmOWb/eSAvWRt7z6rPFYIdQ+k6YO5Wp3FVpgI6B486jNWQ918s20rUp43T8Da1ym/IVLjr+d
	0dbzow7J5TUZQd/JMR5LXnufaInmaHHAfg0D5B8D05CwXEv84POzjoqRitbrpeF6pm/EDZ1l/GT4G
	zDzT6i0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uozSw-0000000G3zx-1oc8;
	Thu, 21 Aug 2025 07:12:06 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoz9P-0000000G0fc-0K8Y
	for ath11k@lists.infradead.org;
	Thu, 21 Aug 2025 06:51:56 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-e94f7232b30so682931276.0
        for <ath11k@lists.infradead.org>; Wed, 20 Aug 2025 23:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755759114; x=1756363914; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7jj0RWb3NgQmNjLgwT9jEyVWruC4wLqZypmADAd++kU=;
        b=fgzyX7B9iJjd0qw1cQxBRxRDSCC4E4VpRWia2YrGupO+LmjeJB9n7FUZowgQExPzV8
         UI4tFysV01k+n6UW5fFYZB3snVqPgpHy1/J37DD0wF4fyxjKyhh/2tGpQmOQsvs3HYfx
         PSI+w1Dp88V3hCgsqXS4m1qgweUmbCIZD3zeFSSu/uq+O7FlUdgNkcQahjhlRo1wGuHu
         AwNQsUqBi8387mSxhsP4YXCFSXLB4RZN0ovt5iy0TWnih8nIwCkBXHdNDZE3S4xDPIt7
         oUnt3xkVYq5e+3mzp29+/lAVTSbaE4xWuPZIJC0sFMgZkJsII/9NkUvl4oxFfI4Sn/Oo
         q9Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755759114; x=1756363914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7jj0RWb3NgQmNjLgwT9jEyVWruC4wLqZypmADAd++kU=;
        b=XulNXtu+iIljWsM8xLlcHC/4vxB1NCDFFE14ZCWSCaoBZHTJLtKWwzXcS8NSdoK8m3
         QQqPnC4ZGnXpacO25G/1RH3e5Yjw5fTh03dfW1TBODHM8qYNVWB91xB8lGNlX9zPU1z9
         7Wg5EUcy4ysn/RH0ggZd1xoQnTgjczJ0aPc2xMFJJ3MPsZQHort95dQ8BQ+TkYoDTLe3
         klfW5/9mh/Wby3i0kz0upxTz1UiZexSQBa9Dzt5CuVMAsw47a739qINrqEAAa81GZn2p
         VWGIxFiswzlO2wdNqIWBvS8+yRxrPvG1lvK3IQRR8BhQTVD6OYQ08jPKTXWeXw7uyKm6
         oAuw==
X-Forwarded-Encrypted: i=1; AJvYcCXZxlOcj+JwHIE6Oo0ymdv6owS/uBK7HCrhksHpJM3a9RobGM2/7Wu3Cmnyq60tch1B4W0rY4Y=@lists.infradead.org
X-Gm-Message-State: AOJu0YzcgjR5bPstX2h4no4rwgVXX8q+wPAS6I3SWknnRmsU635J/6mX
	6SsG3APUjmWI3rWfsb7zEfwhpngBm02CKywi5h/H1bWn5cxJhs+k277WKWy/FPk9olZrAg5geBJ
	mW+Y1pemKlximkFqpht/IshvKtay5E5M=
X-Gm-Gg: ASbGncszI6QwBonbj3ag2yBQV3lFWCVk5wQeez6tHlPn4/rnoJYv/tFV/P3sUJTdQXG
	r+gbnb/mTpNu3Mi6vXGtqrijh5hwIYjaSXbBwAdbEqRXEO0q1bDdk8xL2aoVc1cCWpU1b32tOxa
	kL+40z5ZIWz8p0PqEGCD4gvTtP+YfAvBJQ9KPgOI/fRZlKK7+wCvQbvMkBLyBpXSw3QYc/0fYsO
	oEIEllK
X-Google-Smtp-Source: AGHT+IH5IRSj7RIwsEmgN0S7S/Fcoa63Wm/F1dJC1WTH74qSbmlrgX9PHDJjd4/36xzJZo0pxQrRH22tVi8kSuqmFfo=
X-Received: by 2002:a05:6902:540f:b0:e93:36f3:571a with SMTP id
 3f1490d57ef6-e95088fe627mr1280173276.19.1755759113882; Wed, 20 Aug 2025
 23:51:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250821032755.636661-1-rosenp@gmail.com> <86ddae9a-4931-b160-51a2-f89d45d4038d@oss.qualcomm.com>
In-Reply-To: <86ddae9a-4931-b160-51a2-f89d45d4038d@oss.qualcomm.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 20 Aug 2025 23:51:43 -0700
X-Gm-Features: Ac12FXyw_ixSA4Api_c3e9oT18wZB5ZGV1G--orns_TPaSoKPXA7k3zurYMbDDA
Message-ID: <CAKxU2N-0Q2uxw=-v-XP8g=Y=yBb2ufv+T0yk7dmaszwUy8Z6tg@mail.gmail.com>
Subject: Re: [PATCH ath-next] wifi: ath11k: switch to of_get_mac_address
To: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, Jeff Johnson <jjohnson@kernel.org>, 
	"open list:QUALCOMM ATHEROS ATH11K WIRELESS DRIVER" <ath11k@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_235155_118971_1EF57E0C 
X-CRM114-Status: GOOD (  25.83  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Wed, Aug 20, 2025 at 10:55=E2=80=AFPM Vasanthakumar Thiagarajan
<vasanthakumar.thiagarajan@oss.qualcomm.com> wrote:
>
>
>
> On 8/21/2025 8:57 AM, Rosen Penev wrote:
> > This is needed to support nvmem defined MAC addresses in DTS.
> >
> > In addition, check if the probe should be deferred as nvmem can load
> > after ath11k.
> >
> > For brevity, ACPI is not a factor here. ath11k is too new for that.
>
> This may not be accurate, pcie devices are widely used on x86 where
> ACPI is not certainly new.
No way ACPI is used to define MAC addresses.
>
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >   drivers/net/wireless/ath/ath11k/mac.c | 5 ++++-
> >   1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wirele=
ss/ath/ath11k/mac.c
> > index 1fadf5faafb8..801db15ca78b 100644
> > --- a/drivers/net/wireless/ath/ath11k/mac.c
> > +++ b/drivers/net/wireless/ath/ath11k/mac.c
> > @@ -9,6 +9,7 @@
> >   #include <linux/etherdevice.h>
> >   #include <linux/bitfield.h>
> >   #include <linux/inetdevice.h>
> > +#include <linux/of_net.h>
> >   #include <net/if_inet6.h>
> >   #include <net/ipv6.h>
> >
> > @@ -10434,7 +10435,9 @@ int ath11k_mac_register(struct ath11k_base *ab)
> >       if (ret)
> >               return ret;
> >
> > -     device_get_mac_address(ab->dev, mac_addr);
> > +     ret =3D of_get_mac_address(ab->dev->of_node, mac_addr);
>
> I still think it is better to keep the generic API and add the the one sp=
ecific
> to nvmem when the generic one fails.
I don't. ath10k and ath11k are the only modern drivers using
device_get_mac_address
>
> > +     if (ret =3D=3D -EPROBE_DEFER)
> > +             return ret;
>
> Please note that this error does not impact the device probe as this is
> being done in the event path after probe returns withis complete.
> Also, this will result in device registration failure even when
> the device is not really looking for mac_addr from nvmem (or it is not
> there) as firmware can also provide the mac_addr from the hardware.

Does probe not handle EPROBE_DEFER?
>
> Vasanth


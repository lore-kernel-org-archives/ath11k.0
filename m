Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EDDBCA0EFA
	for <ath11k@archiver.kernel.org>; Fri, 22 Aug 2025 03:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E2aKpri2llVUHBtLde+z+I7G/BKEzBp3VqPywh8sbrA=; b=sezxSFmVyFUuOM3a6vilfLkB5A
	pi33jXg+N4d25N1lRvyBl+uIkUv7Go8QyqZ5PmTHETzVV7X/0C2/MsWV1FYwOWcQmdxzzMhZPw903
	x4NekL9/y7VUhctBoTZQ+KBUySEE19O+FtUOQZ6rqF3ik7tj/XY6ya2v8hddcTOR+COS4p6rC40Y7
	HwyguDvkMLhTwCL4vQIpfxfUdsGdlkjlhNRJAdNNDKOlBPfRYfMewNxYZlpZ5s3CdzNBmpXvLyB8b
	LiFl6y2xS23Xf29PSUGF8QpRnfVtlJdh2otyNZBFfmDAz9X7Rk18fNHk+mrILX+jsjvuNxfczaqTG
	fPrQUaEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upIWk-00000001OeX-33nR;
	Fri, 22 Aug 2025 03:33:18 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upDcz-00000000j2m-0jcl
	for ath11k@lists.infradead.org;
	Thu, 21 Aug 2025 22:19:27 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-71fab75fc97so14048707b3.3
        for <ath11k@lists.infradead.org>; Thu, 21 Aug 2025 15:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755814764; x=1756419564; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E2aKpri2llVUHBtLde+z+I7G/BKEzBp3VqPywh8sbrA=;
        b=Q/HmgvI36LofPrtGcB4Jsl8GAdG4ayS3dbq70OrjrFCKOt9GxXc0qjBx0CFAW/3VMC
         QPM9+aFPY1Y4W6GbzMuIBeLlY96jVDRblcsC1RcrAyse5arQK0T2zvF0mZ1f9TUFmqFE
         mazvlq7PZRabxxoR5jPwgNmokvwlkXdz2hcnivrbkkvCZ1V0UV0h/VGRZo79Hl5T+fha
         bJ7DUzPT3sOHuuMI6jNfQwC43F2PHx4vLIzSoZX2bGr230MMaHLJVCphkIJafdZfq39a
         84D//CRxpxfjnfEXmATZcnepBcW6wf4V0ho6C24otHIdMDVfmhkWoUD4Gk2215wrlyRa
         pq0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755814764; x=1756419564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E2aKpri2llVUHBtLde+z+I7G/BKEzBp3VqPywh8sbrA=;
        b=N33l0waHW1LRoBWgQAtxBCYMsa40TGG4A/qua83TZP700Fg9v6CFskPfK3+xsjMW15
         ovAJ9uM9oJjEBSyeHCalmVH8L44ZGgr4vVU+qtnHbi2YsS3wFelAWzzTEGFyN8n5+1V+
         VrqqsqGEiOkLj22//ckal043V+R4KBH8aKyHDLqjoopYLJy9dJHLJO3PV2MWINAWS1vs
         ccKx4MOsFDSFuIVMif5GLtkZeH4MLo6/WeGAox5GTnJSTzZphkrg94nuKohdDjrEeCj9
         8Tqm9SobVf2ivUhFM1QOEUFRtMwhFxAivXa/QGUqvwpop8XxU6e+vsS2mloStc9v01Uz
         OG2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVKL1Fwr82j9whJpcC8rAA9B5Im/TYMikiGATiVVnjE5W/SqVniaxKhp0faMnL6PkZVyF6YgLM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxZ/AnmP5cQCOSLOsGa5gqqtre7KBUQR395QuBU2m6zPDTyxD3w
	5T+Us5qY04v8zdB6ZamB5eaoTYa0a2yN84c5OmUBEVNHZUBUa2b7BS+r+gdFOZefopP79Gg4/a+
	MAbEn7c87JEO3mLvw+Wo8CY9BwIGX78U=
X-Gm-Gg: ASbGncszdNX1Ksf9U2IdAR0PvHFKUhU/eEltE/jfpd5gvZBx77ER1y3DLiCIRz4/5Ke
	KcYrFfR4QF230WAbbD6/Wk/WnhHuZDvXU9PLsW/mD3qoD1ziFukIJKpplGcNTVH4epU1yt4724f
	aaDvoLCeVdOwVK3f+fgvqXcn/tmKRRCavIIrzw7q/uBDGcBkI1RW1bUmhZjGoippHDW+UyJTJEP
	atZroOwmjTd973F6+yqsuYgucBqa7CcOgd3L3B+fgcCfvz/tR+cJemgYw6wjKtg4DCauybOWSEi
	aqKVrg==
X-Google-Smtp-Source: AGHT+IG+LqpI50Q9RX8ALIbLBIj3bBhJYLmE/MSU+FtkFR5lC7OQcze9NAs58ajLXelaB8jMBatAgjnNrQyy+PuMrDc=
X-Received: by 2002:a05:690c:6104:b0:71f:c6c7:e238 with SMTP id
 00721157ae682-71fdc40714dmr10005827b3.37.1755814763977; Thu, 21 Aug 2025
 15:19:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250821032755.636661-1-rosenp@gmail.com> <86ddae9a-4931-b160-51a2-f89d45d4038d@oss.qualcomm.com>
 <CAKxU2N-0Q2uxw=-v-XP8g=Y=yBb2ufv+T0yk7dmaszwUy8Z6tg@mail.gmail.com> <b711072b-11fa-ea33-3a47-d16ad5a9cc62@oss.qualcomm.com>
In-Reply-To: <b711072b-11fa-ea33-3a47-d16ad5a9cc62@oss.qualcomm.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 21 Aug 2025 15:19:12 -0700
X-Gm-Features: Ac12FXwFmlpwHkriynt0Q17VriPJkfjZxkf8YcQBw75aS0rjb3Lu87eEwnmzcjc
Message-ID: <CAKxU2N_=mqneTUSxaaeN=i_DpQB_ejCb37588bUqagj9_TmdMg@mail.gmail.com>
Subject: Re: [PATCH ath-next] wifi: ath11k: switch to of_get_mac_address
To: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, Jeff Johnson <jjohnson@kernel.org>, 
	"open list:QUALCOMM ATHEROS ATH11K WIRELESS DRIVER" <ath11k@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_151925_214330_72C61B2A 
X-CRM114-Status: GOOD (  26.79  )
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

On Thu, Aug 21, 2025 at 12:44=E2=80=AFAM Vasanthakumar Thiagarajan
<vasanthakumar.thiagarajan@oss.qualcomm.com> wrote:
>
>
>
> On 8/21/2025 12:21 PM, Rosen Penev wrote:
> > On Wed, Aug 20, 2025 at 10:55=E2=80=AFPM Vasanthakumar Thiagarajan
> > <vasanthakumar.thiagarajan@oss.qualcomm.com> wrote:
> >>
> >>
> >>
> >> On 8/21/2025 8:57 AM, Rosen Penev wrote:
> >>> This is needed to support nvmem defined MAC addresses in DTS.
> >>>
> >>> In addition, check if the probe should be deferred as nvmem can load
> >>> after ath11k.
> >>>
> >>> For brevity, ACPI is not a factor here. ath11k is too new for that.
> >>
> >> This may not be accurate, pcie devices are widely used on x86 where
> >> ACPI is not certainly new.
> > No way ACPI is used to define MAC addresses.
> >>
> >>>
> >>> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> >>> ---
> >>>    drivers/net/wireless/ath/ath11k/mac.c | 5 ++++-
> >>>    1 file changed, 4 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wire=
less/ath/ath11k/mac.c
> >>> index 1fadf5faafb8..801db15ca78b 100644
> >>> --- a/drivers/net/wireless/ath/ath11k/mac.c
> >>> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> >>> @@ -9,6 +9,7 @@
> >>>    #include <linux/etherdevice.h>
> >>>    #include <linux/bitfield.h>
> >>>    #include <linux/inetdevice.h>
> >>> +#include <linux/of_net.h>
> >>>    #include <net/if_inet6.h>
> >>>    #include <net/ipv6.h>
> >>>
> >>> @@ -10434,7 +10435,9 @@ int ath11k_mac_register(struct ath11k_base *a=
b)
> >>>        if (ret)
> >>>                return ret;
> >>>
> >>> -     device_get_mac_address(ab->dev, mac_addr);
> >>> +     ret =3D of_get_mac_address(ab->dev->of_node, mac_addr);
> >>
> >> I still think it is better to keep the generic API and add the the one=
 specific
> >> to nvmem when the generic one fails.
> > I don't. ath10k and ath11k are the only modern drivers using
> > device_get_mac_address
> >>
> >>> +     if (ret =3D=3D -EPROBE_DEFER)
> >>> +             return ret;
> >>
> >> Please note that this error does not impact the device probe as this i=
s
> >> being done in the event path after probe returns withis complete.
> >> Also, this will result in device registration failure even when
> >> the device is not really looking for mac_addr from nvmem (or it is not
> >> there) as firmware can also provide the mac_addr from the hardware.
> >
> > Does probe not handle EPROBE_DEFER?
>
> right
I looked further into this. The function ends up being called in
_probe as ath11k_core_init , which doesn't seem to pass the return
code of of_get_mac_address as it currently stands. Unfortunate.


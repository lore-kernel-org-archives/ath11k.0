Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9559E77197
	for <ath11k@archiver.kernel.org>; Tue,  7 Jan 2025 14:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JYTLhZYs01LPTbxTxKocXSvHBt53N+BWt217JHcmGHM=; b=uTVloQn4T1hcVEtP871alMVdT4
	FOyEsb+hLLo1AQi5efY2WzjohSyAfUwfWP467PKh6fq59BGzy7WzmY2yW8OyOaNpUTHe/+nJx38j7
	kacNPnthDDQxmeKCnrn9p6VQTpiDbJ/2CIrZyAOOd6mBLiIpWcni0+cGJ21vQU6IjITy7NSb+2szN
	FtrePptrCGI+LR3nAfCJVK0qioUaeXX2De5BMXOKgXBO/+V6gJbfSqTplqsVS1KAlMVig9ScKXq4S
	NG8doui0QiagUx85TpIzdv3VKWduV0GboXcy8n3mIGlMb/se+LCMaRRWp1dk5JX7clkaNqpn22EPU
	3ReXdMlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVAvc-00000005IwU-1I0J;
	Tue, 07 Jan 2025 14:51:32 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVAqC-00000005HXF-395y
	for ath11k@lists.infradead.org;
	Tue, 07 Jan 2025 14:46:00 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4363ae65100so161276715e9.0
        for <ath11k@lists.infradead.org>; Tue, 07 Jan 2025 06:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736261154; x=1736865954; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JYTLhZYs01LPTbxTxKocXSvHBt53N+BWt217JHcmGHM=;
        b=GDrfAEnTEiJKNecDdu65EOxBXfePVQBxgEPgDt342qFAThyeYuzyqXQN2/gmYVTGad
         GuLgCnNgWeT/7l19FR9KY9gv2CuUWmCMxZW14JAkXyUsDjGlKo2c9qhLSNAoJhSEQp2a
         eD7XfBuqtNOxunENdBOgKAK47Nw8Gi25bJZWp2PWD1kUqGFSysSSFWNrH6mEiseQ9V76
         8jNsT3ZVg00v3L8ZIQmWPwONtCMUQMg4V4xaR4JEU+aR1cjqZOTQUATymuLJuZnP8KLD
         rV1STkCi/CTWuws4U461TcxJhY/QVnuVzsgKPW05HW2ANUGy8pxk2mna9aKawFu6LiPI
         w23w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736261154; x=1736865954;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JYTLhZYs01LPTbxTxKocXSvHBt53N+BWt217JHcmGHM=;
        b=jbFHhE2RGDal02XKLAdH9bbNlnTCJtEO9rYmIEb7feiHddzql/GuzUjH8sv0IfwVjy
         Jz7ep/BjkWR16viGcsXDXgdtKkLBxm6HJToafzevUQT1L+mkicO8WMMWSDsqugfZ3fkz
         mjoJfzk/SZKc9vkVVRlj+VVIN4qGTj+mQf/SbzUpXrq1RDNAOxY+QMb2GhvngEeSsu+4
         305IFoe3qSgQ/tePyOQ0w9+pqvUJwAKzQI2rRNqqB0KaJmFo/42Sf78aHwXaYPJCX1QI
         jn3aKkBU/6ug/loxSlrnjzJHBqJFISUZyFy/+4fdBfvIZGiDl3qmj4LkHtwQ+SDCMd3d
         Sbew==
X-Gm-Message-State: AOJu0Yz098p49BeEJz5s4JNW2OIf2gpuyi+y7f+TKW4c6KDCfw7jh4Em
	0XXbX0vNVmykmUi6c49m9XSAuU4GnlGuQYIGWgRXmxu6YRJ5jRRpciRcaQ==
X-Gm-Gg: ASbGnctSsVCwHThEBhibtb3Tqz5pW4t6HfHtUsK0hbLGaSLq6ow+tD6StUmHE7Hm+sX
	hvX4HLTvBS8xHpoXrfrHcjmHRzjeS81m+MPunErjeZcnt3pvNXfOK5UUnJoiF4TVWP/+CkqZTJE
	kO4thgLiwrqauIi6mE8JJ9Ng0bW9hYkjcu6+E5N3yLdcG2J4/MFwoJUrb2Zvz/ue1MD33RqvrzN
	VPN5KfiWELxpOqO91+9XNyNCbD4ydN98dSqrDKVKmSKYE7B8fMnZ4jR0kzb8IqQgwy60PiCeoY=
X-Google-Smtp-Source: AGHT+IEeZKbsBO+G3cgcfYMD2OZWP3GMAhV7N+MZFaoinUVOiq0tXKzD3AdtqBUUiZQFh+Be4iiDVA==
X-Received: by 2002:a05:600c:4f49:b0:436:6460:e67a with SMTP id 5b1f17b1804b1-43668a3a334mr476528105e9.25.1736261154086;
        Tue, 07 Jan 2025 06:45:54 -0800 (PST)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43661200abesm597380345e9.18.2025.01.07.06.45.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 06:45:53 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Jan 2025 15:45:52 +0100
Message-Id: <D6VX7M6MGZQB.3LU3FBYJK6CZH@gmail.com>
Cc: "Steffen Moser" <lists@steffen-moser.de>
Subject: Re: Potential Broadcast Issues After GTK Key Exchange on ath11k
 with IPQ8072A (QCN5024/QCN5054)
From: "Nicolas Escande" <nico.escande@gmail.com>
To: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <c6366409-9928-4dd7-bf7b-ba7fcf20eabf@steffen-moser.de>
 <Z2Q9POuV-6MIdzRf@pilgrim>
 <b18ede18-0c33-4d14-a7c5-0066cbec39c9@steffen-moser.de>
In-Reply-To: <b18ede18-0c33-4d14-a7c5-0066cbec39c9@steffen-moser.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_064556_786327_33138C6B 
X-CRM114-Status: GOOD (  24.02  )
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

On Sat Dec 28, 2024 at 11:13 AM CET, Steffen Moser wrote:
> Dear Remi,
>
> thank you very much for the pointer to the patch. Sebastian integrated=20
> it into DD-WRT. Now the DynaLink DL-WRX36 runs absolutely smoothly, the=
=20
> WLAN links are stable, the packet loss is gone. No weird states anymore,=
=20
> independent from the group key exchange interval:
>
> https://data.saps.uni-ulm.de/index.php/s/NLNpWqjc8iGsaEM
>
> So your idea was a direct hit! Thank you very, very much. Several months=
=20
> of debugging have come to an end...

So this is at least the second time this commit breaks a setup.
=20
@ath11k why isn't this pushed to mainline ?
This seems to be a clear regression, so even if there is no need to rush th=
ings
in the long run this still needs to to reverted mainline right ?

>
> Thank you very much and all the best for 2025!
>
> Kind regards,
> Steffen
>
> On 19.12.24 4:35 PM, Remi Pommarel wrote:
> > Hi Steffen.
> >=20
> > On Thu, Dec 19, 2024 at 04:02:30PM +0100, Steffen Moser wrote:
> >> Hello everyone,
> >>=20
> >> I've encountered a possible issue in a DD-WRT [1] setup where broadcas=
t
> >> packets stop being delivered after a GTK (Group Temporal Key) exchange=
. This
> >> issue occurs on a system with the following hardware:
> >>=20
> >> =C2=A0=C2=A0=C2=A0 Access Point Hardware: DynaLink DL-WRX36
> >> =C2=A0=C2=A0=C2=A0 Router Software: DD-WRT v3.0-r58819 std (12/13/24)
> >> =C2=A0=C2=A0=C2=A0 CPU: Qualcomm IPQ8072A
> >> =C2=A0=C2=A0=C2=A0 WiFi Chips: Qualcomm QCN5024 and Qualcomm QCN5054
> >> =C2=A0=C2=A0=C2=A0 WiFi Driver: ath11k
> >> =C2=A0=C2=A0=C2=A0 Firmware: WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1
> >> =C2=A0=C2=A0=C2=A0 NSS FW version: NSS.FW.12.5-210-HK.R
> >> =C2=A0=C2=A0=C2=A0 Kernel: Linux WL-AP-EG 6.6.64-rt29 #1791 SMP Thu De=
c 12 16:41:51 +07
> >> 2024 aarch64 DD-WRT
> >>=20
> >> The behavior is such that after a GTK exchange, the AP can get into a =
"weird
> >> state". When being there, broadcast frames like ARP or mDNS are no lon=
ger
> >> reliably delivered to connected clients while unicasts come still thro=
ugh.
> >> In this "weird state", the channel quality (active time vs. busy time)=
 goes
> >> down and latencies to the still reachable WIFI clients rise.
> >=20
> > This looks a lot like an issue we hit a while back. There is this patch
> > [0] from Qualcomm's wlan-open repository. It is a revert of [1]. Using
> > that the issue was never reproduced. Maybe this can help.
> >=20
> > Also adding ath11k list.
> >=20
> > Regards.
> >=20



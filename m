Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA6ECCA0EC4
	for <ath11k@archiver.kernel.org>; Mon, 11 Aug 2025 09:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gc1j0g+sS3ET9hSghi71HrzdGP44q2m0atbgQRqxQc4=; b=Zgd9jYX7V5CtBtdlZdtMaILfDR
	wc8vh3QWMf79hjg+BAwUnqLql5tmt7ICwRMe9kc85UVa5Tkb3j30rQCoLrngGV0gb8856vGk7Gzo4
	N4U4IYUcix8CrM/d327zedqiyf/Pj1TH+HzD3OCPbMhLL0XOdP2El3DPeYqc4fHF5cGTQ3h7jfsQk
	sRxS/bCKZ+E1n3Jh7avM6WWEEiT6y6psPqAKEi2352MSCZHz0Js5hHw3cs7g1WawauCrhNVGXIGhJ
	oxC+8HPw9uS/2nFmTMWHE4mE9W6jr/UTl6LoXi+ChOYZyQmD2nX3wakgxZYuBx+43sf5fuAjHKswR
	TMnCY92Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulOco-000000072XC-04OJ;
	Mon, 11 Aug 2025 09:15:26 +0000
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulOXC-0000000706v-0imk
	for ath11k@lists.infradead.org;
	Mon, 11 Aug 2025 09:09:40 +0000
Received: by mail-vs1-xe2c.google.com with SMTP id ada2fe7eead31-4fc0716d942so2939825137.3
        for <ath11k@lists.infradead.org>; Mon, 11 Aug 2025 02:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=moment-tech.20230601.gappssmtp.com; s=20230601; t=1754903376; x=1755508176; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gc1j0g+sS3ET9hSghi71HrzdGP44q2m0atbgQRqxQc4=;
        b=i1FspVCPgYdWWTcp2dmAPQIRIL5wUjaJaZjaU6DAdGX36B/aYSVd/Ny9yApdpeYhXF
         RdFLbucdQtVqEdkO2QyVuXf5zlf6/QRpMZh2HrBPbSZL0PuL71lrZpG0JgxD3M/3ZtI3
         NzfGfpnOj7drqQwD6e9gYM83IW3zcpXkxFx4AtGRXUrHQlghc+ZnI2EFkC0e/JyEz3QX
         1kzDTIT15aDASD+hsLPlZvpBg6aeMjB7GQ2YQETn27Ecw9rG2hBP0E6b+7B8SyTnreaL
         8xQMOezqqibapn6WKYr1pva5irbHxufAHEH7FMNpc+mSp72Ku3yo1xgb9okVbvoc4lnR
         HF0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754903376; x=1755508176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gc1j0g+sS3ET9hSghi71HrzdGP44q2m0atbgQRqxQc4=;
        b=h2i/C2dg3Z3JGg0QlqVXUKE0b3trhRFgysT7r547GiNFGifuetJ+gOIPkmJaBYPq/+
         dpmgR9TLidSErmLcdnjKcuQdVZJMBsysqjBGs5Xc2C9X9rxFhGVohIWMcKMERkZ6GiwE
         v6AqPmiYcQ7px/5Jam227fBD3FOqWJK3qCeAoeqSsCbffH4IQpgDL0GMrl4m0qDfSDLH
         AHPNM4EC4EPDv1ONfQAZw0pbkiwoLp3tujD1TLbOQWkc9SEyk5YRKxASLj8sO7v8GcHp
         VtMgCEcQkF+6tyiGFVzE8MZwl2Ggd26wA4VIfhpggL2UtyAwrWZTe19NYGo2AK8/IVJc
         zeZA==
X-Forwarded-Encrypted: i=1; AJvYcCWws3nd4n3DDNqF4zNs1PR9XpyWEfaPz8BH6nwum7KrYg1PfSNjAnlmaUBP8OSQzmA+YBg59sg=@lists.infradead.org
X-Gm-Message-State: AOJu0YxohcUtcZoKMRsa5ap5K5nL2pNJBfKLKrwZzyCtq/52paSUcHC5
	vnxvfnMoQEoMQUQPfg0Ze92TsLKZ97R/348fkNTFEZoXWibeiKCLgpiSLuEyjgKQhy3KMuN0L3D
	HHOfNxnkTpETqICUNYjSllyJ57frpf9cEMyO9xVPn5g==
X-Gm-Gg: ASbGnct/1ba8b5D5saG8kkg26vBwDzgDw7GQTKF2auGiZjetEoQ65/B7NEbAKk1D0Tk
	a5Ayrib6vejb9ACMhRzDA+RdcUCtF6LZ2wePGdZqsKTSydrlmfczaKUc43y+VFdCB/V+/ozT0mZ
	uiOFnqX8uuyDS6Wb6oZ8EINbS301LJHSBH9ckY/G5wicN0hVflvaAXwigZg5fAnQZPnCMba3k6o
	2uyiAhfTA==
X-Google-Smtp-Source: AGHT+IFQgak8B/i94a+5/tbjXnIwCpnB4h6aOXcgY+IDVVxCk8cfgS0uOuyT8W7BCpfjOIILnAyTfuPY6UG63QgkkqM=
X-Received: by 2002:a05:6102:4a95:b0:4e4:5ed0:19b2 with SMTP id
 ada2fe7eead31-5060d6a66f4mr4553961137.9.1754903376243; Mon, 11 Aug 2025
 02:09:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250611164004.38580-1-balsam.chihi@moment.tech> <91fa8b1d-7bd0-4beb-80ef-eb65d2562f17@oss.qualcomm.com>
In-Reply-To: <91fa8b1d-7bd0-4beb-80ef-eb65d2562f17@oss.qualcomm.com>
From: Balsam Chihi <balsam.chihi@moment.tech>
Date: Mon, 11 Aug 2025 11:08:53 +0200
X-Gm-Features: Ac12FXwSxuo-bHRaus5KmWu1qrTQOh3m2ZczARj2_k3P9ErkLfczw-KP-36POdc
Message-ID: <CAONkfw5Xyk8CGmVDpWZfkWnuCcFq6400jUkqyeMDtS0UNSh9vg@mail.gmail.com>
Subject: Re: [PATCH] ath11k: pci: avoid unsafe register access during shutdown
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	jjohnson@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_020938_462075_6DF23910 
X-CRM114-Status: GOOD (  33.67  )
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

On Fri, Jul 25, 2025 at 5:25=E2=80=AFAM Baochen Qiang
<baochen.qiang@oss.qualcomm.com> wrote:
>
>
>
> On 6/12/2025 12:40 AM, balsam.chihi@moment.tech wrote:
> > From: Balsam CHIHI <balsam.chihi@moment.tech>
> >

Hello, sorry for the delay. I was OoO.

> > During system reboot or module removal (rmmod), a crash was observed
> > due to a synchronous external abort caused by invalid register access
> > in ath11k_pci_clear_dbg_registers(). This happens when the device is
> > already powered off and the driver attempts to read debug registers.
>
> What does 'powered off' mean exactly here? is WLAN powered by an internal=
/external supply
> that will be removed during rmmod/reboot?

The "powered off" means that the wlan card is rmmod or reboot.
It is not powered by external supply.

>
> >
> > The crash log shows:
> > root@OpenWrt:~# reboot
> > [  343.663492] Internal error: synchronous external abort:
> > 0000000096000210 [#1] SMP
> > [  343.670992] Modules linked in: [...]
> > [  343.842432] CPU: 7 PID: 9435 Comm: procd Tainted: G O 6.6.86 #0
> > [  343.849746] Hardware name: LS1088A
> > [  343.856969] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BT=
YPE=3D--)
> > [  343.863933] pc : ath11k_pci_get_msi_irq+0x18a0/0x1900 [ath11k_pci]
>
> I don't see any relationship between ath11k_pci_clear_dbg_registers() and=
 this PC pointer.
> So how did you locate the problematic register access then?

I tyied to look for the problem based the PC pointer but I was not
abled to find it.
So, I added prints in ath11k driver to find out where it stucks,
classical debug method.
Then I found out that any "ath11k_pcic_read32()" call fails on rmmod
ath11k_pci or reboot,
but they work fine when insmod/boot ath11k_pci.

>
> > [  343.870125] lr : ath11k_pcic_init_msi_config+0x98/0xc4 [ath11k]
> > [...]
> > [  343.950800] Call trace:
> > [  343.953241]  ath11k_pci_get_msi_irq+0x18a0/0x1900 [ath11k_pci]
> > [  343.959080]  ath11k_pcic_init_msi_config+0x98/0xc4 [ath11k]
> > [  343.964671]  ath11k_pcic_read32+0x30/0xb4 [ath11k]
> > [  343.969477]  ath11k_pci_get_msi_irq+0x528/0x1900 [ath11k_pci]
> > [  343.975230]  ath11k_pci_get_msi_irq+0x1460/0x1900 [ath11k_pci]
> > [  343.981068]  ath11k_pci_get_msi_irq+0x1750/0x1900 [ath11k_pci]
> > [  343.986906]  pci_device_shutdown+0x34/0x44
> > [  343.991004]  device_shutdown+0x160/0x268
> > [  343.994928]  kernel_restart+0x40/0xc0
> > [  343.998594]  __do_sys_reboot+0x104/0x23c
> > [  344.002518]  __arm64_sys_reboot+0x24/0x30
> > [  344.006529]  do_el0_svc+0x6c/0x100
> > [  344.009931]  el0_svc+0x28/0x9c
> > [  344.012986]  el0t_64_sync_handler+0x120/0x12c
> > [  344.017344]  el0t_64_sync+0x178/0x17c
> > [  344.021009] Code: f94e0a80 92404a73 91420273 8b130013 (b9400273)
> > [  344.027102] ---[ end trace 0000000000000000 ]---
> >
> > This patch adds a `power_on` flag to conditionally skip debug register
> > reads when the device is not powered, preventing invalid memory access.
>
> why is only 'read' concerned here?

Good question, I can't explain why only the reading fails but not the writi=
ng.

>
> You are skipping several 'read' in this change, could you help narrow dow=
n which
> individual read instance causes this?
>

All read calls fail on rmmod/reboot, when
ath11k_pci_clear_dbg_registers() is called.
But they all succeed when insmod/boot ath11k_pci.

> >
> > With this change, the system no longer crashes on reboot or rmmod,
> > and the driver continues to function correctly when reloaded.
> >
> > Tested-on: QCN9074 hw2.0 PCIe on LS1088A
> > Tested-on: OpenWrt 24.10.1
> > Fixes: crash on reboot/rmmod due to invalid register access
> > Signed-off-by: Balsam CHIHI <balsam.chihi@moment.tech>
> > ---
> >  drivers/net/wireless/ath/ath11k/pci.c | 36 ++++++++++++++++-----------
> >  1 file changed, 21 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wirele=
ss/ath/ath11k/pci.c
> > index 78444f8ea153..0c1b55957557 100644
> > --- a/drivers/net/wireless/ath/ath11k/pci.c
> > +++ b/drivers/net/wireless/ath/ath11k/pci.c
> > @@ -203,16 +203,18 @@ static void ath11k_pci_soc_global_reset(struct at=
h11k_base *ab)
> >               ath11k_warn(ab, "link down error during global reset\n");
> >  }
> >
> > -static void ath11k_pci_clear_dbg_registers(struct ath11k_base *ab)
> > +static void ath11k_pci_clear_dbg_registers(struct ath11k_base *ab, boo=
l power_on)
> >  {
> > -     u32 val;
> > +     if (power_on) {
> > +             u32 val;
> >
> > -     /* read cookie */
> > -     val =3D ath11k_pcic_read32(ab, PCIE_Q6_COOKIE_ADDR);
> > -     ath11k_dbg(ab, ATH11K_DBG_PCI, "pcie_q6_cookie_addr 0x%x\n", val)=
;
> > +             /* read cookie */
> > +             val =3D ath11k_pcic_read32(ab, PCIE_Q6_COOKIE_ADDR);
> > +             ath11k_dbg(ab, ATH11K_DBG_PCI, "pcie_q6_cookie_addr 0x%x\=
n", val);
> >
> > -     val =3D ath11k_pcic_read32(ab, WLAON_WARM_SW_ENTRY);
> > -     ath11k_dbg(ab, ATH11K_DBG_PCI, "wlaon_warm_sw_entry 0x%x\n", val)=
;
> > +             val =3D ath11k_pcic_read32(ab, WLAON_WARM_SW_ENTRY);
> > +             ath11k_dbg(ab, ATH11K_DBG_PCI, "wlaon_warm_sw_entry 0x%x\=
n", val);
> > +     }
> >
> >       /* TODO: exact time to sleep is uncertain */
> >       mdelay(10);
> > @@ -223,14 +225,18 @@ static void ath11k_pci_clear_dbg_registers(struct=
 ath11k_base *ab)
> >       ath11k_pcic_write32(ab, WLAON_WARM_SW_ENTRY, 0);
> >       mdelay(10);
> >
> > -     val =3D ath11k_pcic_read32(ab, WLAON_WARM_SW_ENTRY);
> > -     ath11k_dbg(ab, ATH11K_DBG_PCI, "wlaon_warm_sw_entry 0x%x\n", val)=
;
> > +     if (power_on) {
> > +             u32 val;
> >
> > -     /* A read clear register. clear the register to prevent
> > -      * Q6 from entering wrong code path.
> > -      */
> > -     val =3D ath11k_pcic_read32(ab, WLAON_SOC_RESET_CAUSE_REG);
> > -     ath11k_dbg(ab, ATH11K_DBG_PCI, "soc reset cause %d\n", val);
> > +             val =3D ath11k_pcic_read32(ab, WLAON_WARM_SW_ENTRY);
> > +             ath11k_dbg(ab, ATH11K_DBG_PCI, "wlaon_warm_sw_entry 0x%x\=
n", val);
> > +
> > +             /* A read clear register. clear the register to prevent
> > +             * Q6 from entering wrong code path.
> > +             */
> > +             val =3D ath11k_pcic_read32(ab, WLAON_SOC_RESET_CAUSE_REG)=
;
> > +             ath11k_dbg(ab, ATH11K_DBG_PCI, "soc reset cause %d\n", va=
l);
> > +     }
> >  }
> >
> >  static int ath11k_pci_set_link_reg(struct ath11k_base *ab,
> > @@ -368,7 +374,7 @@ static void ath11k_pci_sw_reset(struct ath11k_base =
*ab, bool power_on)
> >       }
> >
> >       ath11k_mhi_clear_vector(ab);
> > -     ath11k_pci_clear_dbg_registers(ab);
> > +     ath11k_pci_clear_dbg_registers(ab, power_on);
> >       ath11k_pci_soc_global_reset(ab);
> >       ath11k_mhi_set_mhictrl_reset(ab);
> >  }
>


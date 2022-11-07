Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC8F0C4332F
	for <ath11k@archiver.kernel.org>; Mon,  7 Nov 2022 17:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JHjD85M2fjT21S3igDhNKtEUtkL0REAN956V7puhXc4=; b=Pa3vc5p/LhPU0q
	+j49iyNoIepf8I7ee+jpFbp3q+F5FasIZqChsUb2vMkn2MvONqMleBDOnl93E0stjPOJ23RbBPWMA
	ntnbrP2uQanHwQ/22GXlM5gXOiuUxcD7npbyfjc5aTLR9W200bj3lO165PkviejnMhvxoYWbit9J2
	nyzfK3affGjwWakPJg4VnTweJMF4q5Lve1aMuKTvVzq6NEfIBYqAIe74ehuh3HwwfpTQY4SXltzyS
	3O43+vWxPlTF50I2lYBTXMHdbJAU13sK0Qt4V3J5bFWG295e/nQhsZPK+kVrDvhcHg2Uiuu0B0HP8
	kDNkpRO5e9P9mbFJh40g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os5ix-00GaON-OY; Mon, 07 Nov 2022 17:15:51 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os5iv-00GaLr-IG
	for ath11k@lists.infradead.org; Mon, 07 Nov 2022 17:15:51 +0000
Received: by mail-pl1-x633.google.com with SMTP id u6so11630456plq.12
        for <ath11k@lists.infradead.org>; Mon, 07 Nov 2022 09:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LTjXi97uR4XogIu6puuF858HlEW2qY3mXXi3YgbVyuQ=;
        b=TzCU+QAP9K5fMmrp7SlNAU4rY+0hRfCIESlt1z0me4mn2THUsK1UtyGPAQld6+Hnpw
         NA2o9y0cNj+ATFzYyPJrJzvkWxkOjGJyK4k1+K3flYRsm177BsPJ77EFEqM9T1Yei3Wv
         ZHtd4T6CVTutX2U2tn/yH5M4jKJiDdFU+tVBiiXCtc5clXsAOhDUhMYpi1fbwZiqN2Tw
         iz6rBAT3GfnmlWjHzTymOaZV7EL9tHyo1LQz2uAtOVH3QzlQcUIZ4saKMNq4hcNaDDMV
         OMbiYrK6ih2C+5ABlf5+TNI0wVDTkEcxr6i1t9A3vRlp7OrzwCFIM7sfTNoktWyAiIfz
         pQhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LTjXi97uR4XogIu6puuF858HlEW2qY3mXXi3YgbVyuQ=;
        b=R2IgrrK0MeX8PM2YRbwyfUOGHbwTlxOat/BpYrXN5RiCWe/bLyq06ovkfiWf8xa+WS
         OFUerjAnD/M0HjSrv6XQNbfeGOOjVeaRiZ8xUFipjVHkm/ndOaw9gXj+NqPbySPjbhqa
         Hx4eFtWu1DbCG+vLZaDF3vX9/n3UwSv23cH16xTCIC4rIo57+91sYvYpxBVq3lTAKELN
         CCBAysU8a/Mc8HWEsC4z3QXscPgbypCJVhUwPOYWn6vCQ/oxH6+4xZ7wcwMPQDW19qMW
         dHmjktnXs5F46/WToV/MgaeUhqSinXGW8cokBs/DiMKMwha85TgMSmiok9+q2XzMpRAd
         Y/hg==
X-Gm-Message-State: ACrzQf286MOk3Y5CgE+X69VshzXSJV+T+x5TcVnUgjtbtDQgdUqax34b
	6RZLKymeLmsYMaPxOXQlpbRqV23Lpzes/krHO+4=
X-Google-Smtp-Source: AMsMyM7Ta3jOzYwDilL3rRtbb8+XPHLNKrKcMutr0lEqim5tMfJfS/76spKVnPU0bryeuEMbct8w03U+qXcdmCxAV14=
X-Received: by 2002:a17:90a:86c6:b0:213:36b6:1b4c with SMTP id
 y6-20020a17090a86c600b0021336b61b4cmr53258702pjv.7.1667841348032; Mon, 07 Nov
 2022 09:15:48 -0800 (PST)
MIME-Version: 1.0
References: <20221105194943.826847-1-robimarko@gmail.com> <20221105194943.826847-2-robimarko@gmail.com>
 <9d61676a-888a-b172-141d-62257e2e9e84@quicinc.com>
In-Reply-To: <9d61676a-888a-b172-141d-62257e2e9e84@quicinc.com>
From: Robert Marko <robimarko@gmail.com>
Date: Mon, 7 Nov 2022 18:15:36 +0100
Message-ID: <CAOX2RU6NGVi1j-Es=t5LkqbOb9LCfWC9Rkqa4x00dPWqXUDfKw@mail.gmail.com>
Subject: Re: [PATCH 2/2] wifi: ath11k: use unique QRTR instance ID
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: mani@kernel.org, kvalo@kernel.org, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	gregkh@linuxfoundation.org, elder@linaro.org, hemantk@codeaurora.org, 
	quic_qianyu@quicinc.com, bbhatt@codeaurora.org, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, ath11k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org, ansuelsmth@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_091549_633838_01170E50 
X-CRM114-Status: GOOD (  32.90  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Mon, 7 Nov 2022 at 16:10, Jeffrey Hugo <quic_jhugo@quicinc.com> wrote:
>
> On 11/5/2022 1:49 PM, Robert Marko wrote:
> > Currently, trying to use AHB + PCI/MHI cards or multiple PCI/MHI cards
> > will cause a clash in the QRTR instance node ID and prevent the driver
> > from talking via QMI to the card and thus initializing it with:
> > [    9.836329] ath11k c000000.wifi: host capability request failed: 1 90
> > [    9.842047] ath11k c000000.wifi: failed to send qmi host cap: -22
> >
> > So, in order to allow for this combination of cards, especially AHB + PCI
> > cards like IPQ8074 + QCN9074 (Used by me and tested on) set the desired
> > QRTR instance ID offset by calculating a unique one based on PCI domain
> > and bus ID-s and writing it to bits 7-0 of BHI_ERRDBG2 MHI register by
> > using the SBL state callback that is added as part of the series.
> > We also have to make sure that new QRTR offset is added on top of the
> > default QRTR instance ID-s that are currently used in the driver.
> >
> > This finally allows using AHB + PCI or multiple PCI cards on the same
> > system.
> >
> > Before:
> > root@OpenWrt:/# qrtr-lookup
> >    Service Version Instance Node  Port
> >       1054       1        0    7     1 <unknown>
> >         69       1        2    7     3 ATH10k WLAN firmware service
> >
> > After:
> > root@OpenWrt:/# qrtr-lookup
> >    Service Version Instance Node  Port
> >       1054       1        0    7     1 <unknown>
> >         69       1        2    7     3 ATH10k WLAN firmware service
> >         15       1        0    8     1 Test service
> >         69       1        8    8     2 ATH10k WLAN firmware service
> >
> > Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-01208-QCAHKSWPL_SILICONZ-1
> > Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01208-QCAHKSWPL_SILICONZ-1
> >
> > Signed-off-by: Robert Marko <robimarko@gmail.com>
> > ---
> >   drivers/net/wireless/ath/ath11k/mhi.c | 47 ++++++++++++++++++---------
> >   drivers/net/wireless/ath/ath11k/mhi.h |  3 ++
> >   drivers/net/wireless/ath/ath11k/pci.c |  5 ++-
> >   3 files changed, 38 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
> > index 86995e8dc913..23e85ea902f5 100644
> > --- a/drivers/net/wireless/ath/ath11k/mhi.c
> > +++ b/drivers/net/wireless/ath/ath11k/mhi.c
> > @@ -294,6 +294,32 @@ static void ath11k_mhi_op_runtime_put(struct mhi_controller *mhi_cntrl)
> >   {
> >   }
> >
> > +static int ath11k_mhi_op_read_reg(struct mhi_controller *mhi_cntrl,
> > +                               void __iomem *addr,
> > +                               u32 *out)
> > +{
> > +     *out = readl(addr);
> > +
> > +     return 0;
> > +}
> > +
> > +static void ath11k_mhi_op_write_reg(struct mhi_controller *mhi_cntrl,
> > +                                 void __iomem *addr,
> > +                                 u32 val)
> > +{
> > +     writel(val, addr);
> > +}
> > +
> > +static void ath11k_mhi_qrtr_instance_set(struct mhi_controller *mhi_cntrl)
> > +{
> > +     struct ath11k_base *ab = dev_get_drvdata(mhi_cntrl->cntrl_dev);
> > +
> > +     ath11k_mhi_op_write_reg(mhi_cntrl,
> > +                             mhi_cntrl->bhi + BHI_ERRDBG2,
> > +                             FIELD_PREP(QRTR_INSTANCE_MASK,
> > +                             ab->qmi.service_ins_id - ab->hw_params.qmi_service_ins_id));
> > +}
>
> What kind of synchronization is there for this?

None from what I could tell.
>
> Does SBL spin until this is set?

No, the default value is 0x0 and it will boot with that.
>
> What would prevent SBL from booting, sending the notification to the
> host, and then quickly entering runtime mode before the host had a
> chance to get here?

As far as I know nothing really, but this is a question for QCA.
I have tried to make a generic solution from various bits and pieces they
are using downstream but which are really not suitable for upstream.

I agree it's not ideal, but the worst that could happen is that card
won't work which is current
behavior anyway.

Not being able to use AHB + PCI or multiple PCI cards is really
annoying as I am not able
to utilize most of the 5GHz spectrum on my router due to this.

Regards,
Robert
>
>
> > +
> >   static char *ath11k_mhi_op_callback_to_str(enum mhi_callback reason)
> >   {
> >       switch (reason) {
> > @@ -315,6 +341,8 @@ static char *ath11k_mhi_op_callback_to_str(enum mhi_callback reason)
> >               return "MHI_CB_FATAL_ERROR";
> >       case MHI_CB_BW_REQ:
> >               return "MHI_CB_BW_REQ";
> > +     case MHI_CB_EE_SBL_MODE:
> > +             return "MHI_CB_EE_SBL_MODE";
> >       default:
> >               return "UNKNOWN";
> >       }
> > @@ -336,27 +364,14 @@ static void ath11k_mhi_op_status_cb(struct mhi_controller *mhi_cntrl,
> >               if (!(test_bit(ATH11K_FLAG_UNREGISTERING, &ab->dev_flags)))
> >                       queue_work(ab->workqueue_aux, &ab->reset_work);
> >               break;
> > +     case MHI_CB_EE_SBL_MODE:
> > +             ath11k_mhi_qrtr_instance_set(mhi_cntrl);
> > +             break;
> >       default:
> >               break;
> >       }
> >   }
> >
> > -static int ath11k_mhi_op_read_reg(struct mhi_controller *mhi_cntrl,
> > -                               void __iomem *addr,
> > -                               u32 *out)
> > -{
> > -     *out = readl(addr);
> > -
> > -     return 0;
> > -}
> > -
> > -static void ath11k_mhi_op_write_reg(struct mhi_controller *mhi_cntrl,
> > -                                 void __iomem *addr,
> > -                                 u32 val)
> > -{
> > -     writel(val, addr);
> > -}
> > -
> >   static int ath11k_mhi_read_addr_from_dt(struct mhi_controller *mhi_ctrl)
> >   {
> >       struct device_node *np;
> > diff --git a/drivers/net/wireless/ath/ath11k/mhi.h b/drivers/net/wireless/ath/ath11k/mhi.h
> > index 8d9f852da695..0db308bc3047 100644
> > --- a/drivers/net/wireless/ath/ath11k/mhi.h
> > +++ b/drivers/net/wireless/ath/ath11k/mhi.h
> > @@ -16,6 +16,9 @@
> >   #define MHICTRL                                     0x38
> >   #define MHICTRL_RESET_MASK                  0x2
> >
> > +#define BHI_ERRDBG2                          0x38
> > +#define QRTR_INSTANCE_MASK                   GENMASK(7, 0)
> > +
> >   int ath11k_mhi_start(struct ath11k_pci *ar_pci);
> >   void ath11k_mhi_stop(struct ath11k_pci *ar_pci);
> >   int ath11k_mhi_register(struct ath11k_pci *ar_pci);
> > diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
> > index 99cf3357c66e..cd26c1567415 100644
> > --- a/drivers/net/wireless/ath/ath11k/pci.c
> > +++ b/drivers/net/wireless/ath/ath11k/pci.c
> > @@ -370,13 +370,16 @@ static void ath11k_pci_sw_reset(struct ath11k_base *ab, bool power_on)
> >   static void ath11k_pci_init_qmi_ce_config(struct ath11k_base *ab)
> >   {
> >       struct ath11k_qmi_ce_cfg *cfg = &ab->qmi.ce_cfg;
> > +     struct ath11k_pci *ab_pci = ath11k_pci_priv(ab);
> > +     struct pci_bus *bus = ab_pci->pdev->bus;
> >
> >       cfg->tgt_ce = ab->hw_params.target_ce_config;
> >       cfg->tgt_ce_len = ab->hw_params.target_ce_count;
> >
> >       cfg->svc_to_ce_map = ab->hw_params.svc_to_ce_map;
> >       cfg->svc_to_ce_map_len = ab->hw_params.svc_to_ce_map_len;
> > -     ab->qmi.service_ins_id = ab->hw_params.qmi_service_ins_id;
> > +     ab->qmi.service_ins_id = ab->hw_params.qmi_service_ins_id +
> > +     (((pci_domain_nr(bus) & 0xF) << 4) | (bus->number & 0xF));
> >
> >       ath11k_ce_get_shadow_config(ab, &cfg->shadow_reg_v2,
> >                                   &cfg->shadow_reg_v2_len);
>

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

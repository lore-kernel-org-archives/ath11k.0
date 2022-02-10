Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E945C433F5
	for <ath11k@archiver.kernel.org>; Thu, 10 Feb 2022 01:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cadTSxDBaSaRUdAiH9pTHer2vboYVHdwG+0D+JoiaP0=; b=hmhGHBqlHN5IHL
	DEIP8CGfOpKkJjyQrj1YdE9Z0ISBJ40Ip7eM2p2punujIpHlwgZtXP1pl+fuUiXO3T/QbZkY35rIs
	ztm58iNVMdfrLvG74Cj6NSzlkUBLz2EHyaneuYOw+x4w8Qb2LGVFfml0Lja/0NyNDvrGdkqGNdZ/P
	MA3CGVCdzG3p01aTsTSH3IeImtlPToj2bycnNXCd93syYtYWNFaVqTv8eqEZg1dtyceG9/J9jFDHi
	BCze6TCC3LoRNmCCYpIg/7Wfe71Q5n7lCAfitFLMmOmC7qKx3WMQTqfsb3yCrWEkGMTw6wZelrY5J
	WUC+7eEyufvYTnQSuO+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHxu3-002AP4-3l; Thu, 10 Feb 2022 01:05:43 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHxu0-002AOT-MX
 for ath11k@lists.infradead.org; Thu, 10 Feb 2022 01:05:42 +0000
Received: by mail-il1-x133.google.com with SMTP id p11so3193451ils.1
 for <ath11k@lists.infradead.org>; Wed, 09 Feb 2022 17:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e4w1CApPhPDgmcFgoua9r1tKXruanOSQmLFyp0HkppI=;
 b=RBcfMgtXqLtIv9YJQLaPRKF42VFVYLSLtyXrVcIFzeZdBZAXqjMZE4pPfVx8KMW+sc
 AbaJxQFfLnQfZhCNqdGtlu6F/mzRB8thWMz0cejSGY6ZYbaAPGBdGDmk9RJgFluWmkVa
 +QLMI4Rp850o4+P6UR9PXCRIi4zJPlEHIdlbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e4w1CApPhPDgmcFgoua9r1tKXruanOSQmLFyp0HkppI=;
 b=bMis9pVI/r3RX6U1ye0KRPgM1n5H/967sv7Idc2EfVT8YKGKdB8pS0XsJfbQbi+kkF
 AFKdJPJ7pBlpZYy98h1MQlAhXiX6SDNUtRn4IvE7MJElh5D+tpA6VzJqVrbkXl8xZZVB
 pAOIFcz3OMG7I6xBYxEF7OKhbAqkQitliBFkXeeKqZ4T+xCd8bgF9inT4K8tfY66Z6uq
 t0gCqn85nvBOWydvgvdWooWv8QhOiZojDSoPKlkKjTMyUd0tgNQb44UMhW/fnheAs7OS
 eXLK4ziGk1cfPiUGCdU9+vuvhpYOedBpJG3whk6zCTTJVYY2gpxMZIt79+4PNtd584vU
 XAEg==
X-Gm-Message-State: AOAM530P9OF30fMd+2KgO/etDGJ+Tu3vW2z9sFh34HJ5gs4ISgiF5PiZ
 +QV+AcsYxOqiVMvSFTsLTWgQLcQOKeljeWE5AlMFtg==
X-Google-Smtp-Source: ABdhPJwNbjhKO1NI3h25Hc1gnTydBgfZyYC9Qo/rZi9Jc8eA2/B4A82ki8D3OQ3s8Fw/7xtoGh5TmcCkdpK6Xo6MEag=
X-Received: by 2002:a05:6e02:1e08:: with SMTP id
 g8mr2784767ila.278.1644455133779; 
 Wed, 09 Feb 2022 17:05:33 -0800 (PST)
MIME-Version: 1.0
References: <20220207093023.10605-1-quic_bqiang@quicinc.com>
In-Reply-To: <20220207093023.10605-1-quic_bqiang@quicinc.com>
From: Abhishek Kumar <kuabhs@chromium.org>
Date: Wed, 9 Feb 2022 17:05:23 -0800
Message-ID: <CACTWRwugAHA87-AuEkC7tXEEuOhef_FrWBjjk4pQXZvpmHQ65A@mail.gmail.com>
Subject: Re: [PATCH] ath11k: Reset PCIE_GPIO_CFG_REG register when power on
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, 
 Abhishek Kumar <kuabhs@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_170540_774858_5555001E 
X-CRM114-Status: GOOD (  19.25  )
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

On Mon, Feb 7, 2022 at 1:41 AM Baochen Qiang <quic_bqiang@quicinc.com> wrote:
>
> On some modules, PCIE_GPIO_CFG_REG is not initialized to right value,
> this will cause WCN6855 hardware fails to be enumerated.
>
> Fix it by force writing the correct value to this register when power
> on.
>
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
Can you elaborate how you tested this ? I can see due to this patch
shows resource temporarily unavailable after running simulated wifi
crash in a loop.
>
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath11k/pci.c | 11 +++++++++++
>  drivers/net/wireless/ath/ath11k/pci.h |  3 +++
>  2 files changed, 14 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
> index d73b522a0081..06968ad488b0 100644
> --- a/drivers/net/wireless/ath/ath11k/pci.c
> +++ b/drivers/net/wireless/ath/ath11k/pci.c
> @@ -445,6 +445,16 @@ static void ath11k_pci_force_wake(struct ath11k_base *ab)
>         mdelay(5);
>  }
>
> +static void ath11k_pci_gpio_reset(struct ath11k_base *ab)
> +{
> +       int val;
> +
> +       ath11k_pci_write32(ab, PCIE_GPIO_CFG_REG, PCIE_GPIO_RESET_VAL);
> +       mdelay(10);
> +       val = ath11k_pci_read32(ab, PCIE_GPIO_CFG_REG);
> +       ath11k_dbg(ab, ATH11K_DBG_PCI, "gpio cfg: 0x%x\n", val);
> +}
Looks like you have added delay before reading which gets printed as a
debug log. In this case, I don't think you should add the
unconditional delay and read the register unconditionally but rather
should do only if debug is enabled. Thought ?
> +
>  static void ath11k_pci_sw_reset(struct ath11k_base *ab, bool power_on)
>  {
>         mdelay(100);
> @@ -461,6 +471,7 @@ static void ath11k_pci_sw_reset(struct ath11k_base *ab, bool power_on)
>         ath11k_pci_clear_dbg_registers(ab);
>         ath11k_pci_soc_global_reset(ab);
>         ath11k_mhi_set_mhictrl_reset(ab);
> +       ath11k_pci_gpio_reset(ab);
>  }
>
>  int ath11k_pci_get_msi_irq(struct device *dev, unsigned int vector)
> diff --git a/drivers/net/wireless/ath/ath11k/pci.h b/drivers/net/wireless/ath/ath11k/pci.h
> index 61d67b20a0eb..2716fc7745d6 100644
> --- a/drivers/net/wireless/ath/ath11k/pci.h
> +++ b/drivers/net/wireless/ath/ath11k/pci.h
> @@ -52,6 +52,9 @@
>  #define WLAON_QFPROM_PWR_CTRL_REG              0x01f8031c
>  #define QFPROM_PWR_CTRL_VDD4BLOW_MASK          0x4
>
> +#define PCIE_GPIO_CFG_REG                      0x0180e000
> +#define PCIE_GPIO_RESET_VAL                    0xc5
> +
>  struct ath11k_msi_user {
>         char *name;
>         int num_vectors;
> --
> 2.25.1
>

Thanks
Abhishek

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

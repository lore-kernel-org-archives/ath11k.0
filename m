Return-Path: <SRS0=d2dB=OO=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81A77C433EF
	for <ath11k@archiver.kernel.org>; Fri, 24 Sep 2021 09:08:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5240B60EB4
	for <ath11k@archiver.kernel.org>; Fri, 24 Sep 2021 09:08:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5240B60EB4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UUBo/Kw6zauuODU2BGIrDclXrPl7KfTOriPL8nknMXM=; b=gCC0wiKL+EUY8a
	VNgom3pW8nCJptFFFCHuuiyfLbZI2sDBvHwDYpreQygiamDPEUXiar3TbwFs+0uaDDC3GEgT8N0kf
	c8AKlbsRfv5tjTlNB3i7g2Hwux9qR/HP52vwmK5JzAKZkTv05M695OCPlKqXY8zzvdGXDRGAIs7N4
	sXQiMF2P6tviMLmwGUXSraOFiKMu27BOQnZu4qEnceKGQNQOPqEcZwDAyZ4Pbg+gX8mGtkWhLidvu
	6BEkOSZinQts9Sym786AxXzrQRqL7yh4Y/jS/bOui2ALit5WlMdsAfE/ElLfVHyf48CXF+OQMhINZ
	kBBDNqcD6CISX1OaxrtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mThBm-00Dm8i-VC; Fri, 24 Sep 2021 09:08:14 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mThBi-00Dm7J-2S
 for ath11k@lists.infradead.org; Fri, 24 Sep 2021 09:08:13 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632474491; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=P3RD3M7+g2Yi/4ZTx3R1aVwoD6LBprfi6LPXWTp3dew=;
 b=R0xVg5xVdG3D5aRLKcJ0npdNxXWeYYzI8VgAXaNONbNd33TXLrRu/mlXo3FUw3S/iJwhXqck
 4VuaMmCYc52ohFZFZFMMLurzlmBSpetdGgatw69C06AXIranFOIkqlQIcdcy8uQQiPSHnKSh
 trh4CsEZThZs2YscXsw+kH+eTqs=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 614d9564ec62f57c9a98ef8c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 24 Sep 2021 09:07:48
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id ADC73C43616; Fri, 24 Sep 2021 09:07:47 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 96D24C4360D;
 Fri, 24 Sep 2021 09:07:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 96D24C4360D
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Carl Huang <cjhuang@codeaurora.org>, Loic Poulain <loic.poulain@linaro.org>,
 ath11k@lists.infradead.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 linux-wireless@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [regression] mhi: ath11k resume fails on some devices
References: <871r5p0x2u.fsf@codeaurora.org>
 <CAMZdPi8UJLvBFQd8-nf-iHAQh8cEuihq97PUFfZ7Q=rxRQoPsg@mail.gmail.com>
 <20210916111218.GA12918@thinkpad>
 <CAMZdPi94607mZorp+Zmkw3seWXak6p9Jr05CQ5hhfgKQoG8n7Q@mail.gmail.com>
 <20210916163529.GA9027@thinkpad> <87k0jgxyjp.fsf@codeaurora.org>
 <20210916171927.GB9027@thinkpad>
 <b7c0906041dcafb43be215bd4f55326a@codeaurora.org>
 <20210923085926.GD6083@thinkpad>
Date: Fri, 24 Sep 2021 12:07:41 +0300
In-Reply-To: <20210923085926.GD6083@thinkpad> (Manivannan Sadhasivam's message
 of "Thu, 23 Sep 2021 14:29:26 +0530")
Message-ID: <8735putk82.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210924_020812_035079_8FF35B59 
X-CRM114-Status: GOOD (  12.49  )
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

Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:

> For aid debugging, please see the state the device is in during mhi_pm_resume().
> You can use below diff:
>
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index fb99e3727155..482d55dd209e 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -898,6 +898,9 @@ int mhi_pm_resume(struct mhi_controller *mhi_cntrl)
>         if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state))
>                 return -EIO;
>  
> +       dev_info(dev, "Device state: %s\n",
> +                TO_MHI_STATE_STR(mhi_get_mhi_state(mhi_cntrl)));
> +
>         if (mhi_get_mhi_state(mhi_cntrl) != MHI_STATE_M3)
>                 return -EINVAL;

This is what I get with my NUC testbox:

[  970.488202] ACPI: EC: event unblocked
[  970.492484] hpet: Lost 1587 RTC interrupts
[  970.492749] mhi mhi0: Device state: RESET
[  970.492805] ath11k_pci 0000:06:00.0: failed to set mhi state: RESUME(6)

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

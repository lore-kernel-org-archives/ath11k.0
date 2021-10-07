Return-Path: <SRS0=tHTJ=O3=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74975C433F5
	for <ath11k@archiver.kernel.org>; Thu,  7 Oct 2021 09:56:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 277CC6117A
	for <ath11k@archiver.kernel.org>; Thu,  7 Oct 2021 09:56:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 277CC6117A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pzQwz8uaUCJaqbt5td1St5RYahW1rFWDyEFg5L1xKSM=; b=FJAz8Q0fqps+cU
	EUOYMRHc8Y0Ugg/6TqCDeXZl2f5w6x6BkKYVFco9aoW66amfSrGxTQTt5T5FNlFPQX7OJ6qH7QsF9
	g/+9YluwgAgPLPOXgeQgaK+xj0Aslo9gAPeGkC3+WdAl5qgqahzKbtNfvQqIZuAlKKZbDqd5Yzvw0
	AycQqjmGLOkvAQ8oYrij/sT7dc+GdRhYrwl38lHWWShhzdumMDbZgBR02tA5w/Ln0h4YgSN/OIn5t
	TISe8jA/T4iPVusKVE2uCDWN4BWXBW7H87lV3gUfiq61FlaAPY58u6N8h5FKgkYxTvZ85wc8s++Ct
	xCz9gPXeBAfRUI6EpueA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYQ8I-00Gn1w-RW; Thu, 07 Oct 2021 09:56:10 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYQ8F-00Gn0u-6U
 for ath11k@lists.infradead.org; Thu, 07 Oct 2021 09:56:10 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633600568; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=JPSPpsHMPoMb0VA37Z4j/oJJWZ6PIItI66wnYCMe2qo=;
 b=iqB7Bvx93gGw6paEhGI+CJ1X444ury9AqoVBqVUYCFmRYLjR3w17xVnP0Q0ecxVqoILphEYm
 oCpdckEnUHfsSKy4LAbAdZDzjxR7QS5FQ4jp3ueQgFN9CQozS+DgaitiQSwE5kakoc5O6/te
 6FZk7ImdRdOJRZT5zkyustoHgrI=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 615ec430a45ca7530793b970 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 07 Oct 2021 09:56:00
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B0F47C4360D; Thu,  7 Oct 2021 09:55:59 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 399CBC4338F;
 Thu,  7 Oct 2021 09:55:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 399CBC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Carl Huang <cjhuang@codeaurora.org>, Loic Poulain <loic.poulain@linaro.org>,
 ath11k@lists.infradead.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 linux-wireless@vger.kernel.org, regressions@lists.linux.dev, 
 mhi <mhi@lists.linux.dev>
Subject: Re: [regression] mhi: ath11k resume fails on some devices
References: <871r5p0x2u.fsf@codeaurora.org>
 <CAMZdPi8UJLvBFQd8-nf-iHAQh8cEuihq97PUFfZ7Q=rxRQoPsg@mail.gmail.com>
 <20210916111218.GA12918@thinkpad>
 <CAMZdPi94607mZorp+Zmkw3seWXak6p9Jr05CQ5hhfgKQoG8n7Q@mail.gmail.com>
 <20210916163529.GA9027@thinkpad> <87k0jgxyjp.fsf@codeaurora.org>
 <20210916171927.GB9027@thinkpad>
 <b7c0906041dcafb43be215bd4f55326a@codeaurora.org>
 <20210923085926.GD6083@thinkpad> <8735putk82.fsf@codeaurora.org>
 <20210924095755.GB19050@workstation>
Date: Thu, 07 Oct 2021 12:55:52 +0300
In-Reply-To: <20210924095755.GB19050@workstation> (Manivannan Sadhasivam's
 message of "Fri, 24 Sep 2021 15:27:55 +0530")
Message-ID: <874k9t9n13.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_025608_866909_2281D686 
X-CRM114-Status: GOOD (  19.21  )
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

(adding also mhi list)

Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:

> On Fri, Sep 24, 2021 at 12:07:41PM +0300, Kalle Valo wrote:
>> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:
>> 
>> > For aid debugging, please see the state the device is in during mhi_pm_resume().
>> > You can use below diff:
>> >
>> > diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
>> > index fb99e3727155..482d55dd209e 100644
>> > --- a/drivers/bus/mhi/core/pm.c
>> > +++ b/drivers/bus/mhi/core/pm.c
>> > @@ -898,6 +898,9 @@ int mhi_pm_resume(struct mhi_controller *mhi_cntrl)
>> >         if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state))
>> >                 return -EIO;
>> >  
>> > +       dev_info(dev, "Device state: %s\n",
>> > +                TO_MHI_STATE_STR(mhi_get_mhi_state(mhi_cntrl)));
>> > +
>> >         if (mhi_get_mhi_state(mhi_cntrl) != MHI_STATE_M3)
>> >                 return -EINVAL;
>> 
>> This is what I get with my NUC testbox:
>> 
>> [  970.488202] ACPI: EC: event unblocked
>> [  970.492484] hpet: Lost 1587 RTC interrupts
>> [  970.492749] mhi mhi0: Device state: RESET
>
> Looks like the MHI device went into RESET state! It also looks to be a
> firmware thing. But let's nail this down before adding any workaround in
> the MHI stack.
>
> Can you also rebuild the kernel with MHI debug enabled and capture the
> logs in faliure case?

So what I should exactly do to enable debug messages?

I have this in my Kconfig:

CONFIG_MHI_BUS=m
# CONFIG_MHI_BUS_DEBUG is not set
# CONFIG_MHI_BUS_PCI_GENERIC is not set

And AFAICS CONFIG_MHI_BUS_DEBUG only enables the debugfs interface, I
doubt you meant that.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

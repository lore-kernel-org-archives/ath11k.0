Return-Path: <SRS0=ZjKK=FV=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15E96C4361B
	for <ath11k@archiver.kernel.org>; Thu, 17 Dec 2020 08:42:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFCDE2388B
	for <ath11k@archiver.kernel.org>; Thu, 17 Dec 2020 08:42:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFCDE2388B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bs54vYoRjQ9wisTZlwettNkRHBEVjuy+j3Sawo5Bq18=; b=Kvt81ic4YltUA3cGvxF4hpvaQ
	n4h4SFf71Q9ajWlY4cbe/ZBIhtVApwIYWncoZp5TZVEmsJSuoJLPUqmejmqbiPajchIIizfYXKfCz
	Fl8DWIcDRJjF32uTlwLPnD4sepi97xeTKEWgg5Owqq3q+SaSx6ZYPOd1Fip93/Oeo7P3S3wMMb/Uo
	yAjdE2iWS9zcQnFV0HEgp6AHF/r1fhrwsVCK3xvMoIuC/QCr/1ShpWAdHdN/8Wfl64E4ytB8zTIC1
	if/iFTgGItomapODfjr5RQK2E9GOP4e1S6kplnk86q3dgmhU+eR7V6hF9k3C0BT4nHyNzQI0WSBON
	bFrLCG6ng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kporb-0004xJ-CJ; Thu, 17 Dec 2020 08:42:19 +0000
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kporX-0004vO-47
 for ath11k@lists.infradead.org; Thu, 17 Dec 2020 08:42:16 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608194535; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=Nlgan6qAjEFTnhdDz9T96328IpBYvI/OWgsp/H+412Q=;
 b=OyP6ObaTHhd6FRxBOJ+3Nu8YYv2BthUlpqLWbXlRIH/7Bu7JbnIlal5yKOLuPP0gOXjweoJW
 Jcd9PQNVEcfd1V/rzkslyIQ+ccCOf7bFEg8RzcHPCG1nsNBmHtBeAeP1m+QKph9Dwv41NRyE
 Z4eoSi761oJCsRIF3VkR9YF1AHA=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5fdb19da031793dcb4ce2465 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 17 Dec 2020 08:42:02
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6CE7DC43464; Thu, 17 Dec 2020 08:42:02 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id F0D08C433C6;
 Thu, 17 Dec 2020 08:41:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F0D08C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: ath11k: crashes with 1 MSI vector, workaround disable MHI M2 state
References: <87pn3axhm1.fsf@codeaurora.org>
Date: Thu, 17 Dec 2020 10:41:56 +0200
In-Reply-To: <87pn3axhm1.fsf@codeaurora.org> (Kalle Valo's message of "Wed, 16
 Dec 2020 10:47:18 +0200")
Message-ID: <871rfovn6z.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_034215_370999_F4508D9E 
X-CRM114-Status: GOOD (  27.58  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: Stephen Liang <stephenliang7@gmail.com>, wink@technolu.st,
 Jeffrey Hugo <jhugo@codeaurora.org>, Carl Huang <cjhuang@codeaurora.org>,
 Bhaumik Bhatt <bbhatt@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Hemant Kumar <hemantk@codeaurora.org>, ath11k@lists.infradead.org,
 Mitchell Nordine <mail@mitchellnordine.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Kalle Valo <kvalo@codeaurora.org> writes:

> To keep the discussion organised I'll start a new thread about weird
> kernel crashes we are seeing on ath11k, and include MHI folks as well in
> case they have any ideas. This is a long story, but I try to summarise
> this as short as I can :)
>
> Recently Dell released laptops with QCA6390. Unfortunately there's a
> BIOS bug[1] and ath11k only receives 1 MSI vector, opposed to 32 vectors
> it needs. Carl implemented a proof of concept patch[2] which worked fine
> on some platforms, for example I didn't see any issues on my Intel NUC
> with QCA6390.
>
> But once we people with Dell XPS 13 9310 started testing Carl's patches
> started reporting weird kernel crashes. This is what wink reported[3]:
>
> ----------------------------------------------------------------------
> So up until this point, everything is working without issues.
> Everything seems to spiral out of control a couple of seconds later
> when my system attempts to actually bring up the adapter.  In most of
> the crash states I will see this:
>
> [   31.286725] wlp85s0: send auth to ec:08:6b:27:01:ea (try 1/3)
> [   31.390187] wlp85s0: send auth to ec:08:6b:27:01:ea (try 2/3)
> [   31.391928] wlp85s0: authenticated
> [   31.394196] wlp85s0: associate with ec:08:6b:27:01:ea (try 1/3)
> [   31.396513] wlp85s0: RX AssocResp from ec:08:6b:27:01:ea
> (capab=0x411 status=0 aid=6)
> [   31.407730] wlp85s0: associated
> [   31.434354] IPv6: ADDRCONF(NETDEV_CHANGE): wlp85s0: link becomes ready
>
> And then either somewhere in that pile of messages, or a second or two
> after this my machine will start to stutter as I mentioned before, and
> then it either hangs, or I see this message (I'm truncating the
> timestamp):
>
> [   35.xxxx ] sched: RT throttling activated
>
> After that moment, the machine is unresponsive.  Sorry I can't seem to
> extract this data other than screenshots from my phone at the moment,
> you can see the dmesg output from 6 different hangs here:
>
> https://github.com/w1nk/ath11k-debug
> ----------------------------------------------------------------------
>
> Wink even made videos available[3].
>
> After extensive debugging from wink he found out that disabling M2 state
> makes the all problems go away:
>
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -55,12 +55,12 @@ static struct mhi_pm_transitions const dev_state_transitions[] = {
>         },
>         {
>                 MHI_PM_M0,
> -               MHI_PM_M0 | MHI_PM_M2 | MHI_PM_M3_ENTER |
> +               MHI_PM_M0 | MHI_PM_M3_ENTER |
>                 MHI_PM_SYS_ERR_DETECT | MHI_PM_SHUTDOWN_PROCESS |
>                 MHI_PM_LD_ERR_FATAL_DETECT | MHI_PM_FW_DL_ERR
>         },
>         {
> -               MHI_PM_M2,
> +               MHI_PM_M0,
>                 MHI_PM_M0 | MHI_PM_SYS_ERR_DETECT | MHI_PM_SHUTDOWN_PROCESS |
>                 MHI_PM_LD_ERR_FATAL_DETECT
>         },
>
> And indeed now we have numerous people reporting that with this
> workaround ath11k is stable on their Dell XPS 13 9310 laptops. What on
> earth could cause these kernel crashes/interrupt storms? And why is it
> visible only on Dell laptops? Why does disabling M2 state fix it?
>
> Also something to investigate is does AC power vs battery power have
> something to do with this? Can that affect M2 states somehow?
>
> Any other ideas how to debug this? This is a very weird problem.

I was told that some registers are not allowed to be accessed during M2
state, so it looks like wink was spot on with his workaround. And ASPM
is also related, which might explain why not everyone see these
problems.

This is all still very sketchy and I'm trying to get more information.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

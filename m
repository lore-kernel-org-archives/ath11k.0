Return-Path: <SRS0=Dsd9=FU=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A999C0018C
	for <ath11k@archiver.kernel.org>; Wed, 16 Dec 2020 08:47:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8CEA207BC
	for <ath11k@archiver.kernel.org>; Wed, 16 Dec 2020 08:47:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8CEA207BC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/6b5rYa03XdWdbxOqh+tbUrfj62q83saUnRIkOezbng=; b=EXFogn4zmnfjxzWjt0KK2lQ3EL
	y+5/yF0vVR1H0oNDY8IgdH7uXLmucEsp4W1Sn8mm2dO7GbKb2JiyvyzliPj7ImvvRTXSlvCg/Tz3t
	LzphfYmiOX1oRTY4pFhLITD9X+K4HpWlp+XZhs3RnE1xB8thZCyF6b3zWUkEQuT3aa1G8Y3tThSSs
	ABW5mqFHkv6yS64TyAyiEx3lmYunnA5yGV+FhceicHZzxdywlUqDprVX/18wDvBWUW3CmasBEZdTB
	T/7yAZb/PQ0mQASUpet2941deIf6mGgxvS/JBXpTKFbUOda/eS2cQvYzJKgQVcUAQiD33fPd/5wBy
	0Eg3p8aQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpSTB-0005t3-Vi; Wed, 16 Dec 2020 08:47:38 +0000
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpST9-0005se-Bx
 for ath11k@lists.infradead.org; Wed, 16 Dec 2020 08:47:36 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608108452; h=Content-Type: MIME-Version: Message-ID: Date:
 Subject: Cc: To: From: Sender;
 bh=f0b5NfjIyTOhSVxXYCi7e5IKd2eCBO1bIuRxD73cw0k=;
 b=sTQ3LrxU8/WSK0OtrCHPoNSeWt0O5Jv+nzb0BibuXzLsQtbtUft3GG94KwBwQ8UHEiAiTW7s
 MB5s/hbwBAM5GNygiWDExLc42llSzIiRiydIhoHVk5ul917R9+C6Zl/MHRwn8pMOQFjifOe6
 PItWxu+u4VtjQW2TOSgMsAVlrPg=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 5fd9c99d7549779c5b7c05a7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 16 Dec 2020 08:47:25
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 631F1C433CA; Wed, 16 Dec 2020 08:47:24 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 92E55C43463;
 Wed, 16 Dec 2020 08:47:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 92E55C43463
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Hemant Kumar <hemantk@codeaurora.org>, Jeffrey Hugo <jhugo@codeaurora.org>,
 Bhaumik Bhatt <bbhatt@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: ath11k: crashes with 1 MSI vector, workaround disable MHI M2 state
Date: Wed, 16 Dec 2020 10:47:18 +0200
Message-ID: <87pn3axhm1.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_034735_470897_10747B43 
X-CRM114-Status: GOOD (  16.30  )
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
Cc: Stephen Liang <stephenliang7@gmail.com>,
 Carl Huang <cjhuang@codeaurora.org>, ath11k@lists.infradead.org,
 wink@technolu.st, Mitchell Nordine <mail@mitchellnordine.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hi MHI devs,

To keep the discussion organised I'll start a new thread about weird
kernel crashes we are seeing on ath11k, and include MHI folks as well in
case they have any ideas. This is a long story, but I try to summarise
this as short as I can :)

Recently Dell released laptops with QCA6390. Unfortunately there's a
BIOS bug[1] and ath11k only receives 1 MSI vector, opposed to 32 vectors
it needs. Carl implemented a proof of concept patch[2] which worked fine
on some platforms, for example I didn't see any issues on my Intel NUC
with QCA6390.

But once we people with Dell XPS 13 9310 started testing Carl's patches
started reporting weird kernel crashes. This is what wink reported[3]:

----------------------------------------------------------------------
So up until this point, everything is working without issues.
Everything seems to spiral out of control a couple of seconds later
when my system attempts to actually bring up the adapter.  In most of
the crash states I will see this:

[   31.286725] wlp85s0: send auth to ec:08:6b:27:01:ea (try 1/3)
[   31.390187] wlp85s0: send auth to ec:08:6b:27:01:ea (try 2/3)
[   31.391928] wlp85s0: authenticated
[   31.394196] wlp85s0: associate with ec:08:6b:27:01:ea (try 1/3)
[   31.396513] wlp85s0: RX AssocResp from ec:08:6b:27:01:ea
(capab=0x411 status=0 aid=6)
[   31.407730] wlp85s0: associated
[   31.434354] IPv6: ADDRCONF(NETDEV_CHANGE): wlp85s0: link becomes ready

And then either somewhere in that pile of messages, or a second or two
after this my machine will start to stutter as I mentioned before, and
then it either hangs, or I see this message (I'm truncating the
timestamp):

[   35.xxxx ] sched: RT throttling activated

After that moment, the machine is unresponsive.  Sorry I can't seem to
extract this data other than screenshots from my phone at the moment,
you can see the dmesg output from 6 different hangs here:

https://github.com/w1nk/ath11k-debug
----------------------------------------------------------------------

Wink even made videos available[3].

After extensive debugging from wink he found out that disabling M2 state
makes the all problems go away:

--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -55,12 +55,12 @@ static struct mhi_pm_transitions const dev_state_transitions[] = {
        },
        {
                MHI_PM_M0,
-               MHI_PM_M0 | MHI_PM_M2 | MHI_PM_M3_ENTER |
+               MHI_PM_M0 | MHI_PM_M3_ENTER |
                MHI_PM_SYS_ERR_DETECT | MHI_PM_SHUTDOWN_PROCESS |
                MHI_PM_LD_ERR_FATAL_DETECT | MHI_PM_FW_DL_ERR
        },
        {
-               MHI_PM_M2,
+               MHI_PM_M0,
                MHI_PM_M0 | MHI_PM_SYS_ERR_DETECT | MHI_PM_SHUTDOWN_PROCESS |
                MHI_PM_LD_ERR_FATAL_DETECT
        },

And indeed now we have numerous people reporting that with this
workaround ath11k is stable on their Dell XPS 13 9310 laptops. What on
earth could cause these kernel crashes/interrupt storms? And why is it
visible only on Dell laptops? Why does disabling M2 state fix it?

Also something to investigate is does AC power vs battery power have
something to do with this? Can that affect M2 states somehow?

Any other ideas how to debug this? This is a very weird problem.

Wink and others, in case I missed something please do fill in.

Kalle

[1] https://lore.kernel.org/ath11k/87mtzxkus5.fsf@nanos.tec.linutronix.de/

[2] https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=ath11k-qca6390-bringup&id=742b5de85acf7f25ca327c66c2b71d4f2cb6c245

[3] https://drive.google.com/drive/folders/1wvxZI5XtwPSrm0-6-Ov50cUfqBXSXeNz?usp=sharing

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

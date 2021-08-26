Return-Path: <SRS0=rto1=NR=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35F01C432BE
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 16:35:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E83BE60FD9
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 16:35:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E83BE60FD9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sV+n8AJszLldPe6xy/Ebf+aru4ZrjL/inzglJDpJaNI=; b=mg6cQwKnWU44zT
	icwqIps1r+7Fd50X29Opw0AABE9VgAxS5pDT7O8fyOLYvxQqVASFdvLcq7HRKMzrHmPxGKbAsZdrg
	i4/XGi2eABR+ifb4qiNVXouiheK5o/cow31RI1M3Ocr7z3kyulh/UffavVG0Nqw1QKEIjTObG6UEg
	ZNS6n7NUlzL9Vjh6XbjyOzaPB3ppb3fm6PrzuSJ+NvBURegRGvFAwaJ0XiguS4FulsSoPB4fLX2e/
	F/a+JbpYkDeQyFGzjXQUVc7mL3pGDrLREaRnjiCrfAE5X5eoxlmQOHZwvDBw14NLob0ZJJzLbCGXy
	as74yOUi2oysBg8qTVJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJILK-00AaPb-HP; Thu, 26 Aug 2021 16:35:06 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJIL7-00AaNS-45
 for ath11k@lists.infradead.org; Thu, 26 Aug 2021 16:34:59 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1629995695; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=RUzgoB5Wzejq4UjttdL32gI6WODI4MFawRGmvOvlL7A=;
 b=qG/b0GY2bIDofx+bH1bpG7w8slGR+G+PRaQ1DSRguB1+Ad6dG7LV7YYfLzX4j1/2iqqoK21t
 MVH7WjFzBFP1V11pE/i2/4sx+ycK5d0dKioF9pggEDVKw+EMgJeugzHk+MKQ3oaGHHT/BHMk
 hZ8xFHqpSTKzaRm/hE3TEQEZwV0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 6127c2a1fc1f4cb692558b5d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 26 Aug 2021 16:34:41
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A46ADC4360D; Thu, 26 Aug 2021 16:34:41 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id CF4F2C43460;
 Thu, 26 Aug 2021 16:34:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org CF4F2C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Loic Poulain <loic.poulain@linaro.org>
Cc: kuba@kernel.org, davem@davemloft.net, netdev@vger.kernel.org,
 ath11k@lists.infradead.org, regressions@lists.linux.dev,
 hemantk@codeaurora.org, nschichan@freebox.fr, manivannan.sadhasivam@linaro.org
Subject: Re: [PATCH] qrtr: mhi: Fix duplicate channel start
References: <1629992163-6252-1-git-send-email-loic.poulain@linaro.org>
Date: Thu, 26 Aug 2021 19:34:32 +0300
In-Reply-To: <1629992163-6252-1-git-send-email-loic.poulain@linaro.org> (Loic
 Poulain's message of "Thu, 26 Aug 2021 17:36:03 +0200")
Message-ID: <87a6l46u7b.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_093455_899423_FBE74720 
X-CRM114-Status: UNSURE (   9.69  )
X-CRM114-Notice: Please train this message.
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

Loic Poulain <loic.poulain@linaro.org> writes:

> commit ce78ffa3ef16 ("net: really fix the build...") handling a merge
> conflict causes the mhi_prepare_for_transfer() function to be called
> twice (with different flags), leading to QRTR probing issues.
>
> Fixes: ce78ffa3ef16 ("net: really fix the build...")
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Thanks for the patch, but with this patch the whole kernel crashes. I
tested on a NUC box with QCA6390 using v5.14-rc7. Unfortunately no
netconsole at the moment as I'm moving my workstations.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

Return-Path: <SRS0=vfh3=IC=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31655C433DB
	for <ath11k@archiver.kernel.org>; Thu,  4 Mar 2021 17:21:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D41CF64F3D
	for <ath11k@archiver.kernel.org>; Thu,  4 Mar 2021 17:21:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D41CF64F3D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=02vkgglPjBbliGPcp2h1OJ9vNHSi13QgM6N4582Rj50=; b=UUQ1gWCpfhajljep9KdJt8a7e
	WXfFLfJzfW/CbiUQXtFKCrb/zoXKwIMJ+NTS1Py1R0rRaxKHdtyBp/t92bfORf4xxfNqYZL7EcjjB
	xvXOaIj2NTIMgUh7dNnhmr5e5PkH4qxi+q7vfuYDyNAt3vuhZna6+jciscz0Y3glVoGwr4y+bDXcM
	BUy1d0aZZ/M1D+n89Vf++fB9GagPwEeFZJ2A0OB4KQ8BFoXdlSNn6muQoVwcODasQtf95mhcqzZZi
	PILsGbmAumqQD42PA/ixYJDB8tSUY4VK9qvZnIvsppS6py9zA+bSLFdbZUS63iMbKxOMoal7LKv+H
	S9U8l8Nhw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHrfK-009Pdd-Rh; Thu, 04 Mar 2021 17:21:35 +0000
Received: from z11.mailgun.us ([104.130.96.11])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHrfC-009Pbc-Ae
 for ath11k@lists.infradead.org; Thu, 04 Mar 2021 17:21:33 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1614878489; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=ktAWgMbXCvDZwWNBGkjqcNePucXjOUTQyk0mtbVGRoM=;
 b=M7z9TvFVsWxXNcVbNEzcv+PtsKqFUsYEGZpui8+snevKSRQRr1qYizo9jDaKf1GpnuyJplvp
 RW0yhagHMkizfRP3eL8pYs0qFZ+fUyPuhxMaeC1NqkOuarjXURB1pJTXc7IVyGcJwwbo7TGo
 XZtjKIto1PQt3buavMuHZ0DGLR4=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 60411710e5eea4c43b0de252 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 04 Mar 2021 17:21:20
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 64FBAC433C6; Thu,  4 Mar 2021 17:21:20 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 70726C433CA;
 Thu,  4 Mar 2021 17:21:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 70726C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Hemant Kumar <hemantk@codeaurora.org>,
 Bhaumik Bhatt <bbhatt@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 ath11k@lists.infradead.org
Subject: Re: [regression] mhi: mhi_pm_st_worker blocked for more than 61
 seconds.
References: <87im6755ii.fsf@codeaurora.org> <20210304151004.GA29563@work>
Date: Thu, 04 Mar 2021 19:21:16 +0200
In-Reply-To: <20210304151004.GA29563@work> (Manivannan Sadhasivam's message of
 "Thu, 4 Mar 2021 20:40:04 +0530")
Message-ID: <87blby6dir.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
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

> Hi Kalle,
>
> On Thu, Mar 04, 2021 at 04:59:33PM +0200, Kalle Valo wrote:
>> Hi MHI folks,
>> 
>> I upgraded my QCA6390 x86 test box to v5.12-rc1 and started seeing
>> kernel crashes when testing ath11k. I don't recall seeing this on v5.11
>> so it looks like a new problem, but I cannot be 100% sure. Netconsole
>> output is below. I have most of the kernel debug functionality enabled
>> (KASAN etc).
>> 
>> I can fairly easy reproduce this by looping insmod and rmmod of mhi,
>> wireless and ath11k modules. It does not happen every time, but I would
>> say I can reproduce the problem within 10 test loops or so.
>> 
>> Any ideas what could cause this? I have not bisected this due to lack of
>> time, but I can test patches etc.
>> 
>
> Not sure if this is related, Loic sent a patch which fixes an issue with
> "mhi_pm_state_worker":
>
> https://patchwork.kernel.org/project/linux-arm-msm/patch/1614161930-8513-1-git-send-email-loic.poulain@linaro.org/
>
> Can you please test see if it fixes your issue also?

Thanks for the link, but unfortunately not :( I was able to reproduce
the issue just after 3 insmod/rmmod loops.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

Return-Path: <SRS0=tHTJ=O3=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8D71C433EF
	for <ath11k@archiver.kernel.org>; Thu,  7 Oct 2021 09:48:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9B4C61090
	for <ath11k@archiver.kernel.org>; Thu,  7 Oct 2021 09:48:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B9B4C61090
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2NZRKvSy50MDDYQAYXQtCpevoRH7gQzmYH+jUvkRbPY=; b=xDcKE49Q93ntCO
	u0IfYDtlBdI1pbchLwqDtn4tPSU1J8I1IFokoyY0WmLH/41ZIHTOhbGeX9OIHt1qwvvuc5YjGKkpX
	ERiVwwdZL0BbcbwM+CCEijyG6ct5wiAPz8Eu/tJIb2hH5njj4SBS0qoLiRf1TEaFioSZ0mUJMn60r
	4kRevTiYv50uT3BYH/jdF64oJZ1dZuRhmolZoSOjEivJgxeOFWARsrWl6yMdl3yHw3aC/of5J66W6
	qG1+/5iL8dbcWNGsNw4hVm/y2RTamgLUaoO3ySVlGHXsFrKlNAB0POoCGdoTaXtFAeGv3dApwthxH
	WJrLUlBGvLHVyw2Vtqcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYQ19-00GkbB-Nd; Thu, 07 Oct 2021 09:48:47 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYQ0q-00GkUi-D8
 for ath11k@lists.infradead.org; Thu, 07 Oct 2021 09:48:30 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633600108; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=vGI68wyoqpDAZBA89Pt6Cbg+azmy5aIwL+2+C+Cr1xA=;
 b=QSVgt/banqdKsqcpgk/71OjsQRzfXFHCC9bvSwtyJulom/hvi/tjR1zVFGon8L/F+5mY5Hq6
 AhHnZrPHs1IcKM0zBTGhQ4CVh3BfFEOHXGaaHozQkkj9YvWtAqxzQAVxrhT1ps6nVo3ymhfN
 hujoyD78SswCLlSL1lhuHW78xXw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 615ec26b0e38ad481d31a43d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 07 Oct 2021 09:48:27
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C1049C43617; Thu,  7 Oct 2021 09:48:26 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 56A93C4338F;
 Thu,  7 Oct 2021 09:48:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 56A93C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Loic Poulain <loic.poulain@linaro.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, regressions@lists.linux.dev, 
 mhi <mhi@lists.linux.dev>
Subject: Re: [regression] mhi: ath11k resume fails on some devices
References: <871r5p0x2u.fsf@codeaurora.org>
 <CAMZdPi8UJLvBFQd8-nf-iHAQh8cEuihq97PUFfZ7Q=rxRQoPsg@mail.gmail.com>
 <877df6tlnq.fsf@codeaurora.org>
 <CAMZdPi8P7YZPhPir+WfS3cY_a7He1m2Pq2uqBhczPdEeoNRb0Q@mail.gmail.com>
Date: Thu, 07 Oct 2021 12:48:19 +0300
In-Reply-To: <CAMZdPi8P7YZPhPir+WfS3cY_a7He1m2Pq2uqBhczPdEeoNRb0Q@mail.gmail.com>
 (Loic Poulain's message of "Fri, 24 Sep 2021 11:43:55 +0200")
Message-ID: <87a6jl9ndo.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_024828_522632_019F1F77 
X-CRM114-Status: GOOD (  17.50  )
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

(adding the new mhi list, yay)

Hi Loic,

Loic Poulain <loic.poulain@linaro.org> writes:

>> Loic Poulain <loic.poulain@linaro.org> writes:
>>
>> > On Thu, 16 Sept 2021 at 10:00, Kalle Valo <kvalo@codeaurora.org> wrote:
>>
>> >> At the moment I'm running my tests with commit 020d3b26c07a reverted and
>> >> everything works without problems. Is there a simple way to fix this? Or
>> >> maybe we should just revert the commit? Commit log and kernel logs from
>> >> a failing case below.
>> >
>> > Do you have log of success case?
>>
>> A log from a successful case in the end of email, using v5.15-rc1 plus
>> revert of commit 020d3b26c07abe27.
>>
>> > To me, the device loses power, that is why MHI resuming is failing.
>> > Normally the device should be properly recovered/reinitialized. Before
>> > that patch the power loss was simply not detected (or handled at
>> > higher stack level).
>>
>> Currently in ath11k we always keep the firmware running when in suspend,
>> this is a workaround due to problems between mac80211 and MHI stack.
>> IIRC the problem was something related MHI creating struct device during
>> resume or something like that.
>
> Could you give a try with the attached patch? It should solve your
> issue without breaking modem support.

Sorry for taking so long, but I now tested your patch on top of
v5.15-rc3 and, as expected, everything works as before with QCA6390 on
NUC x86 testbox.

Tested-by: Kalle Valo <kvalo@codeaurora.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

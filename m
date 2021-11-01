Return-Path: <SRS0=iaLC=PU=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7004CC433EF
	for <ath11k@archiver.kernel.org>; Mon,  1 Nov 2021 12:54:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C52F60F70
	for <ath11k@archiver.kernel.org>; Mon,  1 Nov 2021 12:54:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3C52F60F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cdNJvg/jh/+FTATrWdSDBQUZ0NU4n27y3Xyo7onLNnQ=; b=aH/vPZNliPvWs3
	1yQw4ZL25Tc3hkwMNU09vMkUIWzMktuxZrPNrH189RARHWfl9IDBs8T4qjpJOrUyt9HpFNF5nFYPj
	y7EfVHc7SmyE53CrnhUitFoypIksupjyX7x9Im3wu0eZGHWzrrH0vRTOfAMM1Fo5Jl0/xPI58YpRt
	mXJjme/fkDD0p9MFMApzHrP1CIrBjpZvXT9r/QHhLaVxoZDrW1dBkwSTm7jT5yzwZJv2mmFedU+Nj
	bj8UVsqXYWZ9PtJrO3MAt+AHZjUKyDW2utO4uwRXcyBeD6fxMA54xYbXidLKN8RZMRUnE+DZX6Sw/
	i388VhBmOj1Rzb2aUq3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhWpT-00GQLe-4l; Mon, 01 Nov 2021 12:54:23 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhWpK-00GQKx-M9
 for ath11k@lists.infradead.org; Mon, 01 Nov 2021 12:54:21 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1635771259; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=pTEJm147qCnNe8uPJy6D4bV7tl07arc3/GV92ugpV80=;
 b=f/wFKaJkCidYggaY97XCQrzaSU1gsNr6A2inYpYUdn4Ssrdu4h7IpaPYEfOq1zQ9CQW/WC+0
 Okam6A251z18ZYSUxQ0QVqqYw4R6CR0iyf3Q7ls1G7HEyKxFXU0sva/WLSMoj7LSDOVhiK52
 0YwiIEJnva1SJb1ZEG1asthID6M=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 617fe34997bbea7fcc2a764c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 01 Nov 2021 12:53:29
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5E946C4360C; Mon,  1 Nov 2021 12:53:28 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E0F4DC43460;
 Mon,  1 Nov 2021 12:53:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org E0F4DC43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Sven Eckelmann <sven@narfation.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Karthikeyan Kathirvel <kathirve@codeaurora.org>
Subject: Re: [PATCH] ath11k: clear the keys properly when DISABLE_KEY
References: <20211026155446.457935-1-sven@narfation.org>
 <26869605.A2Tbvc0WiF@ripper> <87sfwl494s.fsf@codeaurora.org>
 <4399157.2QDAq5Xuus@ripper>
Date: Mon, 01 Nov 2021 14:53:24 +0200
In-Reply-To: <4399157.2QDAq5Xuus@ripper> (Sven Eckelmann's message of "Thu, 28
 Oct 2021 14:43:16 +0200")
Message-ID: <877dds2g1n.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211101_055419_698310_0C488CE0 
X-CRM114-Status: GOOD (  20.32  )
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

Sven Eckelmann <sven@narfation.org> writes:

> On Thursday, 28 October 2021 14:38:27 CEST Kalle Valo wrote:
> [...]
>> But it doesn't either break anything either, right? So in that respect I
>> would like to keep the Tested-on tag in the commit log to document how
>> it was tested.
>> 
>> Though I'm not sure what I do now, do you think I should the patch still
>> or should I drop it?
>
> It seems like QCA wanted to have a look again at the problem. So I would 
> suggest to drop it or mark it as "Changes Requested".

Ok, thanks. I see that someone already marked it as Rejected in
patchwork, and I don't think it was me :)

> I cannot make any statements about whether it actually clears anything 
> in the firmware because I neither have documentation nor source code of 
> it. So only persons which have more knowledge about it can work on this 
> problem.

Can someone from QCA comment?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

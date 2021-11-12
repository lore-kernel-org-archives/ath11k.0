Return-Path: <SRS0=U53r=P7=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B923C433F5
	for <ath11k@archiver.kernel.org>; Fri, 12 Nov 2021 13:09:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B67DB61073
	for <ath11k@archiver.kernel.org>; Fri, 12 Nov 2021 13:09:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B67DB61073
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FTShcce9RLZYXtXXAnRYArEyQNFngRdO1Ge465NGk0o=; b=Z5h2lTjD6zaOTd
	EpHWs9t6qnLooBQi+lIG54gxSSeJAnSc4+b7AfzXJ2XntVZcwTObR6dp0yiMABEXFg5p9p18JScnH
	S1j+t8RE4VJ8hK9uaA28tNc6yCW6oGyqmzGBy2/6UJ53bmQ54DuZotMvEiAnM9mnzgEFfFPe6Ja+N
	ceADmKSvGW+r5l6g9Z7yneRgcAKR8TGC6F9jBhaSh7TsW1R4xGVzCVxot/tuKw06oILXtLy7gz7lv
	sXiYAQJTy9w/oqExZtyVPTwsXzJRqbYvFbNcpZGtDzJ0ynlBxfw6ZKYEID2pC3NHULLMR+2WYnUkl
	HmEBjrnUOnvd0VaLumtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlWJ5-00ATnD-Ew; Fri, 12 Nov 2021 13:09:27 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlWHp-00ATRu-9c
 for ath11k@lists.infradead.org; Fri, 12 Nov 2021 13:08:11 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1636722488; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=idTeMM7ZAuNiYybOeMEMu2LLBS1k4AQg85DiyOvbLmI=;
 b=Wihh/7j6W1mCAWUBdJ5mvbg5RWbYJsfrTXp6j2LPrjXxYnxyTRDPEgeLvQry3jF2j2snU9uw
 0KKr6AcUficZ9OcR+iH6TmA7Z4YeFGOLLeziTMH8jRVbE64p6jgfcUDeR6Ickbtu+SVQaN1A
 tMo4IX/5R/i3xXrE7roht/Iz4Qw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 618e6734a445961e72f3beb2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 12 Nov 2021 13:08:04
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 198C9C43460; Fri, 12 Nov 2021 13:08:04 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 67F4DC4338F;
 Fri, 12 Nov 2021 13:08:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 67F4DC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: P Praneesh <ppranees@codeaurora.org>
Cc: ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org
Subject: Re: [PATCH v3 00/12] ath11k: optimizations in data path
References: <1630560820-21905-1-git-send-email-ppranees@codeaurora.org>
Date: Fri, 12 Nov 2021 15:07:56 +0200
In-Reply-To: <1630560820-21905-1-git-send-email-ppranees@codeaurora.org> (P.
 Praneesh's message of "Thu, 2 Sep 2021 11:03:28 +0530")
Message-ID: <87sfw1iksz.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_050809_436640_96D93CF5 
X-CRM114-Status: UNSURE (   9.54  )
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

P Praneesh <ppranees@codeaurora.org> writes:

> This patchset covers optimizations in rx (first 7 patches)
> and tx (remaining 5 patches) data path.
>
> Running UDP DL/UL traffic on IPQ8074 5G radio showed an average 5-10%
> improvement on a 4 core platform

These had multiple conflicts but luckily they were relatively easy to
fix. But please do check my changes in the pending branch:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/log/?h=pending

Here's where I had conflicts:

Applying: ath11k: allocate dst ring descriptors from cacheable memory
Using index info to reconstruct a base tree...
M	drivers/net/wireless/ath/ath11k/core.c
M	drivers/net/wireless/ath/ath11k/dp.c
M	drivers/net/wireless/ath/ath11k/dp.h
M	drivers/net/wireless/ath/ath11k/hw.h
Falling back to patching base and 3-way merge...
Auto-merging drivers/net/wireless/ath/ath11k/hw.h
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath11k/hw.h
Auto-merging drivers/net/wireless/ath/ath11k/dp.h
Auto-merging drivers/net/wireless/ath/ath11k/dp.c
Auto-merging drivers/net/wireless/ath/ath11k/core.c
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath11k/core.c
Recorded preimage for 'drivers/net/wireless/ath/ath11k/core.c'
Recorded preimage for 'drivers/net/wireless/ath/ath11k/hw.h'
error: Failed to merge in the changes.
Patch failed at 0002 ath11k: allocate dst ring descriptors from cacheable memory


Applying: ath11k: modify dp_rx desc access wrapper calls inline
Using index info to reconstruct a base tree...
M	drivers/net/wireless/ath/ath11k/dp_rx.c
Falling back to patching base and 3-way merge...
Auto-merging drivers/net/wireless/ath/ath11k/dp_rx.c
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath11k/dp_rx.c
Recorded preimage for 'drivers/net/wireless/ath/ath11k/dp_rx.c'
error: Failed to merge in the changes.
Patch failed at 0003 ath11k: modify dp_rx desc access wrapper calls inline

Applying: ath11k: avoid additional access to ath11k_hal_srng_dst_num_free
Using index info to reconstruct a base tree...
M	drivers/net/wireless/ath/ath11k/dp_rx.c
Falling back to patching base and 3-way merge...
Auto-merging drivers/net/wireless/ath/ath11k/dp_rx.c
Applying: ath11k: avoid active pdev check for each msdu
Using index info to reconstruct a base tree...
M	drivers/net/wireless/ath/ath11k/dp_rx.c
Falling back to patching base and 3-way merge...
Auto-merging drivers/net/wireless/ath/ath11k/dp_rx.c
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath11k/dp_rx.c
Recorded preimage for 'drivers/net/wireless/ath/ath11k/dp_rx.c'
error: Failed to merge in the changes.
Patch failed at 0005 ath11k: avoid active pdev check for each msdu

Applying: ath11k: remove usage quota while processing rx packets
Using index info to reconstruct a base tree...
M	drivers/net/wireless/ath/ath11k/dp_rx.c
Falling back to patching base and 3-way merge...
Auto-merging drivers/net/wireless/ath/ath11k/dp_rx.c
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath11k/dp_rx.c
Recorded preimage for 'drivers/net/wireless/ath/ath11k/dp_rx.c'
error: Failed to merge in the changes.
Patch failed at 0006 ath11k: remove usage quota while processing rx packets

Applying: ath11k: add branch predictors in process_rx
Using index info to reconstruct a base tree...
M	drivers/net/wireless/ath/ath11k/dp_rx.c
Falling back to patching base and 3-way merge...
Auto-merging drivers/net/wireless/ath/ath11k/dp_rx.c
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath11k/dp_rx.c
Recorded preimage for 'drivers/net/wireless/ath/ath11k/dp_rx.c'
error: Failed to merge in the changes.
Patch failed at 0007 ath11k: add branch predictors in process_rx

Applying: ath11k: avoid while loop in ring selection of tx completion interrupt
error: sha1 information is lacking or useless (drivers/net/wireless/ath/ath11k/dp.c).
error: could not build fake ancestor
Patch failed at 0010 ath11k: avoid while loop in ring selection of tx completion interrupt

Applying: ath11k: add branch predictors in dp_tx path
Using index info to reconstruct a base tree...
M	drivers/net/wireless/ath/ath11k/dp_tx.c
M	drivers/net/wireless/ath/ath11k/mac.c
Falling back to patching base and 3-way merge...
Auto-merging drivers/net/wireless/ath/ath11k/mac.c
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath11k/mac.c
Auto-merging drivers/net/wireless/ath/ath11k/dp_tx.c
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath11k/dp_tx.c
Recorded preimage for 'drivers/net/wireless/ath/ath11k/dp_tx.c'
Recorded preimage for 'drivers/net/wireless/ath/ath11k/mac.c'
error: Failed to merge in the changes.
Patch failed at 0011 ath11k: add branch predictors in dp_tx path

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

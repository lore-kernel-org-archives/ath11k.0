Return-Path: <SRS0=L+f/=QE=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94AB8C433EF
	for <ath11k@archiver.kernel.org>; Wed, 17 Nov 2021 07:46:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B2FB613DB
	for <ath11k@archiver.kernel.org>; Wed, 17 Nov 2021 07:46:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5B2FB613DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RVcRmuQy11Ft6/A7Pp0ns6ieDQYvTmj2RQG6HK0kBCY=; b=XELrlDir7ZZgJP
	5TQlnjFU4rXBnJu8Yb3H+mRCzF3og8y7FNKgOEH6STNyo6GpfXRR/BbqUByIhdH2SudB4msXov1a+
	1RrOATCorpz3fZrEmd31JJtOE9Mmtxjad9VNxpg031YNU+u//iUgo3W7rqvJb/zBA2okhR7Q35K2m
	QS5sQcCaevSZ+PDmYx/grthham3oPUugKnoHk0GziJZ2Jsch8ktEL5eyce3v4w9p989F9cvRr9KMR
	RXTbAZtHTo2Kb2Azijj4jwKICKKkCQI7YFXouswEsBxB/LOG3chr1kTQt6FUOV+7c+MgtDYtQpe8s
	A7py27mcgp9JqAbJVP2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnFeF-003r8Z-CW; Wed, 17 Nov 2021 07:46:27 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnFeC-003r85-8K
 for ath11k@lists.infradead.org; Wed, 17 Nov 2021 07:46:25 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637135184; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=I5OOw4SM9yWpCwvl2NtPuiLV0r2JfBhwPewGvFBEsxk=;
 b=l6UQMnTjoDSjL7ZVvHw1bvx9hY/7HgLoKGjzqCI7/R/EsudqFx+N68BJo7Q1kcTMp5wXcDA1
 /ipPbo7eq+mOin48JNxngiWRqCpuUYgQAllhYuXq5v8ekJ1clcVl2aKPRDq5aCgZrsvYzJUw
 8rvHbcw5WKxMfLMqFt1qKt/t7wg=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 6194b34fc48ba48884d05421 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 17 Nov 2021 07:46:23
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 52597C4360D; Wed, 17 Nov 2021 07:46:23 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D613EC4338F;
 Wed, 17 Nov 2021 07:46:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org D613EC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath11k: fix destination monitor ring out of sync
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1637061007-28663-1-git-send-email-quic_kathirve@quicinc.com>
References: <1637061007-28663-1-git-send-email-quic_kathirve@quicinc.com>
To: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163713517984.10263.11890947454711763377.kvalo@codeaurora.org>
Date: Wed, 17 Nov 2021 07:46:23 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_234624_379084_67CE22B0 
X-CRM114-Status: GOOD (  10.80  )
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

Karthikeyan Kathirvel <quic_kathirve@quicinc.com> wrote:

> More than 20000 PPDU id jumping causing status ring and destination
> ring processing not sync. The status ring is processed and the
> destination ring is not processed. Since destination is not reaped for
> so long, backpressure occurs at the destination ring.
> 
> To address this issue update the PPDU id with the latest PPDU, this
> will allow the destination ring to be reaped and will prevent the
> rings from getting out of sync.
> 
> Signed-off-by: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Tested-on tag missing, please reply to this message and I can add it to the commit log.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1637061007-28663-1-git-send-email-quic_kathirve@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

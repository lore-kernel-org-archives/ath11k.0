Return-Path: <SRS0=utSp=QC=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F59FC433EF
	for <ath11k@archiver.kernel.org>; Mon, 15 Nov 2021 09:43:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5E5B61BA9
	for <ath11k@archiver.kernel.org>; Mon, 15 Nov 2021 09:43:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C5E5B61BA9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9ZAf7CGvipXKgBNfK7tpBPpoM1r7gigVk6YjD5hBQWQ=; b=APQZOV+GclJC79
	YhHBDgfwiBGJB66GNe0W6bpAIPx1KcJSf4CZiyBJI09NJws3dK8YNtk8xgm7Gc9vL/N35rqLyOdrF
	hTVWJRyWVxAaPst5kgm8zzvX/KmfpbAyrmbrzYzeiWqkpDRWPiv83FJaXTXBkGRc0Nb6iaFT1ucOZ
	KXjlzH//i4V1FEdfrRB/8TodkxZ2DaB9izcYS5RLCoxdo9q2h5EbTkxrPGm3nfuoPP6wd/caggVDM
	6Vnq9090zg0UNt9FOe53gMVlias8YkGogBR93n6l6KqTY+5AXXMtGwf6ybFsd1ctQ4JTxxrcFWhz2
	chZfQVUgK0EY6ckZgMSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmYWW-00EyvR-0J; Mon, 15 Nov 2021 09:43:36 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmY6D-00EsMO-Nh
 for ath11k@lists.infradead.org; Mon, 15 Nov 2021 09:16:27 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1636967785; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=bpZL+q7ylYqfWYa50owNWfgHuEbTwHQmE4pl0+BxEpM=;
 b=oiP4jRCyeqXVXvIuRGpSNH8e5WP0APyu90HT9CBywhJwHY222r6vLzQDDBzk3Yr4d1oHbjCT
 D/OXMmyagApE7p8d8Dp0+AJclNmoV+FtKzhooxDamQOusc5ZToFTt0n5U98Tz93B1GrUaoX6
 QUBsfYudFC9IMBxLwi0mE+Z4/jg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 61922569e10f164c25ddf5ee (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 15 Nov 2021 09:16:25
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 9E2D1C43460; Mon, 15 Nov 2021 09:16:24 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 42456C4338F;
 Mon, 15 Nov 2021 09:16:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 42456C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: avoid unnecessary BH disable lock in STA kickout
 event
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1636560388-24955-1-git-send-email-quic_periyasa@quicinc.com>
References: <1636560388-24955-1-git-send-email-quic_periyasa@quicinc.com>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163696778139.20888.10875511119499508444.kvalo@codeaurora.org>
Date: Mon, 15 Nov 2021 09:16:24 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_011625_918285_262CA8CC 
X-CRM114-Status: UNSURE (   7.51  )
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

Karthikeyan Periyasamy <quic_periyasa@quicinc.com> wrote:

> In STA kickout event processing, the peer object is protected
> under spin lock BH. Release this lock after picking up the vdev_id
> from the peer object instead after ieee80211_report_low_ack().
> This will minimize the lock hold period which will improve
> performance since base_lock is used across the data path.
> This was found in code review.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-00729-QCAHKSWPL_SILICONZ-3 v2
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

4c375743c5fe ath11k: avoid unnecessary BH disable lock in STA kickout event

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1636560388-24955-1-git-send-email-quic_periyasa@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

Return-Path: <SRS0=L+f/=QE=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1646C433EF
	for <ath11k@archiver.kernel.org>; Wed, 17 Nov 2021 08:54:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4423D6187F
	for <ath11k@archiver.kernel.org>; Wed, 17 Nov 2021 08:54:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4423D6187F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0aXem6SANPbNic7lh9LjdmE3N9/kwvpch5moyXR2t+k=; b=RfR86mcDE/1aEO
	m8I/sdLvH7A0gUK8iMSuG7XcDVZTxPXfibQfJzF9tt6kx5KbY+MSBNDCXJsrOkl978l+t0KxdmzKT
	8zB01YEZo25rASsnMrCDjoB3tEa4W6xnsbEHSbmLjzKGWUg5JOupZJpZirf2jduwNNfpxC0DjloL7
	9118stq6wSGFWLqpDyM96aMEeKCbthzTx/67qS6rUjU9xx7tieWcdGgLCYYb+1J57SEhdkDHs38Tz
	GtVEizJqZ1rMj4721iez21pwTjdJIlAnLbFlye+gPVe8c27UwqO8wpYOg7xnELC5n50mkrb9RRq4r
	dL9a+pBfbJxyhP/vh8ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnGiT-0041aY-6R; Wed, 17 Nov 2021 08:54:53 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnGiQ-0041Zz-M6
 for ath11k@lists.infradead.org; Wed, 17 Nov 2021 08:54:52 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637139290; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=aBn45QqAhQiM5PL3L6GAjgX7r0wnurx4OAUSnZ0zK+c=;
 b=e2zxN7OSE1Ub0Z1bE9I8jNjR9owLr+/yWgr0kvZDejRBZFniYMWmPSo5axGy2r4ZntkFuAb6
 40ETYcl/dBSFK/XDENvspg1AWOEWbb4VEjF5QNHM/nsVzQdAAEmEM+5yZB+notGtgw8YxYjC
 w7prspwktBWstcwyuSvnLZCVoFU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 6194c359c48ba48884f14c84 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 17 Nov 2021 08:54:49
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8C560C4360D; Wed, 17 Nov 2021 08:54:49 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 25230C4338F;
 Wed, 17 Nov 2021 08:54:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 25230C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: add read variant from SMBIOS for download board
 data
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20211011082433.30415-1-wgong@codeaurora.org>
References: <20211011082433.30415-1-wgong@codeaurora.org>
To: Wen Gong <wgong@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 wgong@codeaurora.org
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163713928364.10263.15372409026240983506.kvalo@codeaurora.org>
Date: Wed, 17 Nov 2021 08:54:49 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_005450_827944_3C98DA7F 
X-CRM114-Status: UNSURE (   9.60  )
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

Wen Gong <wgong@codeaurora.org> wrote:

> This is to read variant from SMBIOS such as read from DT, the variant
> string will be used to one part of string which used to search board
> data from board-2.bin.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> 
> Signed-off-by: Wen Gong <wgong@codeaurora.org>

I'm dropping all patches listed below in one go. I didn't manage to
apply any of these without conflicts, please remember to always use
ath.git master branch as the baseline to avoid conflicts.

9 patches set to Changes Requested.

12549401 ath11k: add read variant from SMBIOS for download board data
12549415 ath11k: add wait operation for tx management packets for flush from mac80211
12549419 ath11k: change to treat alpha code na as world wide regdomain
12549431 ath11k: report rssi of each chain to mac80211
12549433 ath11k: Add signal report to mac80211 for QCA6390 and WCN6855
12549449 ath11k: report tx bitrate for iw wlan station dump
12554953 ath11k: add support for hardware rfkill for QCA6390
12583807 ath11k: add 11d scan offload support
12583809 ath11k: calculate the correct NSS of peer for HE capabilities

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211011082433.30415-1-wgong@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

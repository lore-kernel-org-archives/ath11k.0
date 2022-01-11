Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA60C433F5
	for <ath11k@archiver.kernel.org>; Tue, 11 Jan 2022 14:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ye5fbJEazHl29Fo9lAckDYJGWo4roavdxcEHAua6018=; b=cGuSjw1SZ+XjH8
	/MB21J/Y67m7NYyyoc0BVd7tTKn/12FNoaM/d7WZZZrwfw+rWys7u6pLYcQhZR0JKSInfcJWmW/Kr
	IT/Bh/64ei59LYLlnsevQ7yyDHIbvWJKUnbVDknh7ChyKXgmyvqrKT1tJJyh4Ok0NcuQVZRxX1Cx+
	QGkEshvH4eptv+/x0nTnhWKuQGNXCNCku+iAJ5tOsGW63xIP5VEOSOrhITA4894OCBDGwEkNFOGsj
	3oZ1zdVUFHoGYkZOLuLWoBACMHFIkCTszhoDQUarYM7GptLkLyj4AQXh1XrWwmcV1ElTR+IG8Rws4
	AL+f0fPYBN1hZwHJmIow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7IRS-00GbrZ-Nz; Tue, 11 Jan 2022 14:48:06 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7IRP-00Gbqx-6L
 for ath11k@lists.infradead.org; Tue, 11 Jan 2022 14:48:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 79994B81AE7;
 Tue, 11 Jan 2022 14:48:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16BADC36AEB;
 Tue, 11 Jan 2022 14:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641912478;
 bh=JProxxHbLeb6RR/bZ7wwigyGt5oeXzxAhYMtPoVWmdo=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=EFUTng+wYtOqYRaRDIrsBj2a7K5caRMWKynQ+YUyYAT5XDAubt0kyq8JsAiNDLFr/
 Nxa+YtDNPd/jYjkB1jAm0iTwes91PnBywsH5oku04iYPPPkfFHvcWBG1I430ViZYmU
 so/i/4ERGiVo6rNiZE2ZH2SiF8+D/E43liJqWit1W0gzmTVpRhyzO7wuiKgGArF8rs
 caymH9jwvDdBjGNyXDctw8hXyKnNLSyGtL+l5RoSk4cfyHIRuxZhJdy8RXx/ZrQ1h0
 Op2a7tVB/IYeAWi2g0uBOwfObf3y6BtqZHVbwbep7oJQAuxxCN4w0AMX+EF+mG2pZq
 3bvG3QRAZAUWg==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Reconfigure hardware rate for WCN6855 after vdev
 is started
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20211223103728.85022-1-quic_bqiang@quicinc.com>
References: <20211223103728.85022-1-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164191247608.9547.17482352957965001303.kvalo@kernel.org>
Date: Tue, 11 Jan 2022 14:47:57 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_064803_402782_EFD7B6D6 
X-CRM114-Status: UNSURE (   8.85  )
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

Baochen Qiang <quic_bqiang@quicinc.com> wrote:

> There is an issue that WCN6855 tries to connect to an AP using
> a hardware rate of 1Mb/s , even though the AP has announced
> expected rates as [24, 36, 48, 54] in Probe Response frame.
> 
> The reason is that WCN6855 firmware clears hardware rate info
> of management frames when vdev starts and uses 1Mb/s as default.
> To solve it, reconfigure the rate after vdev is started.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>

Failed to apply, please rebase.

error: patch failed: drivers/net/wireless/ath/ath11k/core.h:587
error: drivers/net/wireless/ath/ath11k/core.h: patch does not apply
stg import: Diff does not apply cleanly

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211223103728.85022-1-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

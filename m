Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3139AC433F5
	for <ath11k@archiver.kernel.org>; Mon,  2 May 2022 13:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lPxODRpxMoKLbqm5Ix77XZYNnQBgcid2CATTzWurj/A=; b=Ro/MHrVEEKcx+V
	dRC77dhmOPP8XE6mNNaoYD2/mEG1TPSolMX53cKpi68mjL/lOtfnOJCnfY9dj0thooyYUSm6o2C2t
	nBvNHA48sIQlahbexbY2Oyq/j1ND0zOouBVsfRYa0ODxT/ZdJtsWPIm3uZvLcp+LsFA1LlAyPXnCv
	mbT0ALkbLbkcYWOek+jJwMHkL1LM1kkdmsUINMTZIvlfHa0w/6jNUPDMfKYuoNrommVpAm5x46j4A
	Es/bW4gl4m/fJ+PGsYVKi2NWO9xM77F8luqbgBM7EdTQrNmOb7vRuA0rDplTXKu6mN6oDYZbcrZIL
	oW9JJvtCRK2F7tmweEyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlWYg-001KMl-DF; Mon, 02 May 2022 13:57:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlWYb-001KMQ-FU
 for ath11k@lists.infradead.org; Mon, 02 May 2022 13:57:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DC2EE60B5A;
 Mon,  2 May 2022 13:57:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CD21C385AC;
 Mon,  2 May 2022 13:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651499864;
 bh=UsUVrQ8Uf8ZrHtaZGxrQgHbyM/8ZtJmWeyFLUL+cXiY=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=Bthfaf+kqA7O5R8dVeo33lK49k7ZoAVrDsHRmNm9jKWx4K8DJOGPu62/WS/qlxldL
 A+EvwZaWCRKKDKMIiA8pR7YIQko1kMm8fh8uOMp8ilcswxSKYZJHZplfUujPD+qEQT
 6J7V2FKHitKGGhiDPYOnIwJ/ZemVqYWFijt6u4CtPKIq7U8hHqEFEuYT+oJ1jS2Zc0
 gViZVQ4pX4wTdf3KOjuJIH/DnMF9MrwqRG0M7mJwhqe4Ss5tMaQYaMFlhBGrY8xB8g
 VqkZ8/jDyGUw7Gpwf1EkOWHlcSv/Yua1OO8VVPOUwfqA6nBrnSkBtMGzqVTME1AfoA
 Ljy1k+K1ah69g==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: change management tx queue to avoid connection
 timed out
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220428023320.4007-1-quic_wgong@quicinc.com>
References: <20220428023320.4007-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <165149986115.16977.2375062909122184081.kvalo@kernel.org>
Date: Mon,  2 May 2022 13:57:43 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_065745_608093_64C157F0 
X-CRM114-Status: GOOD (  11.05  )
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

Wen Gong <quic_wgong@quicinc.com> wrote:

> In the phase of wlan load, it has hw scan and 11d scan which sent to
> firmware by ath11k, then hw scan and 11d scan will use about 14 seconds,
> and meanwhile ath11k_reg_update_chan_list() is running in workqueue of
> ath11k_base, and wait for 11d scan/hw scan finished. When the hw scan
> finished, mac80211 will start to connect and send management packet,
> at this moment, ath11k_reg_update_chan_list() is still waiting for 11d
> scan finished, so wmi_mgmt_tx_work of ath11k will not run and thus the
> tx management packet also not send out and lead authentication timed
> out.
> 
> log:
> INFO kernel: [  187.885322] wlan0: authenticate with 72:6c:57:43:9f:90
> INFO kernel: [  187.937266] wlan0: send auth to 72:6c:57:43:9f:90 (try 1/3)
> INFO kernel: [  188.626944] wlan0: send auth to 72:6c:57:43:9f:90 (try 2/3)
> INFO kernel: [  189.650999] wlan0: send auth to 72:6c:57:43:9f:90 (try 3/3)
> INFO kernel: [  190.651917] wlan0: authentication with 72:6c:57:43:9f:90 timed out
> 
> Change wmi_mgmt_tx_work to another queue workqueue_aux of ath11k_base,
> then connection success.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

3a597f0d425b ath11k: change management tx queue to avoid connection timed out

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220428023320.4007-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

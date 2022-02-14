Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12314C433F5
	for <ath11k@archiver.kernel.org>; Mon, 14 Feb 2022 17:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5WBeuHGQJtwGr1T3ATAOHAqh+tviEFYrmPH1ZApgK0E=; b=wclLMzzQYhTalP
	AlC1FDCKbs+tDr1vZwUUlNJt7KBpUlThsG70NSkLth59LiHrb9NZ7LrHCPzMDm10CkRuRt+3zi+7P
	x2vGtDWj5G8pJfpCf245XaLC2LOsWINp5aeIJ4pLZNhrzxiik19xL9yRVEWv0dWfAwRqAfVwLheem
	wiuBhRdN+7oxsj4R9xQPdJo7nsr7qF85k05Dv/ZDSytWsK78RI4Fl4W7h5dLno68Ww5MK3xjsYNIq
	HFUAyrsDrMrwNSbrR+/ATYA/vNQ/PtNXLYT7SIP5pp3vdHQay0LSbKRX6GK9VxqaEFx/XnPIrNWxX
	utHQ+VJ2rxDExaoBuirw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJfQC-00GQIH-SS; Mon, 14 Feb 2022 17:45:56 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJfQA-00GQHw-3U
 for ath11k@lists.infradead.org; Mon, 14 Feb 2022 17:45:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CD633B811DC;
 Mon, 14 Feb 2022 17:45:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 775E0C340E9;
 Mon, 14 Feb 2022 17:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644860748;
 bh=JOBmuLpYMO9AGh+G2jtHoYb6XFhfIGc6Qj+i753pEGg=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=ivJdt0ZZiwQbjYsBtB6FlyUwfNUmMfbLG7tk72s6lqp5mROYpk/0E7T0ewKbyvugn
 t4H7gpgO0emUdXw2MRlrgD3RWa9kzg9e4n/tl63+cTqD84id+xixDfqI9HkbmHpLEE
 3NkS/r3ImBZYyDAblm+qk6elKDL+PGOSRakalfKrAvFJVGxUdCqjRb5r9p7LDmfTqL
 sWhN3RPwSP2Q+hzHqsW/UAl6TEa3u9iOkA4rLYiV8/KYuOtamYi4JKi0FK+Qc+xiTs
 E4VxpRUcNZMAaeaFhP35f3JeLPqDgO2d0t58lNODDQXeFJINJ2ZduRGWq5su6niAm+
 N917D4zEG/7uw==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: fix uninitialized rate_idx in
 ath11k_dp_tx_update_txcompl()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220209060816.423-1-quic_wgong@quicinc.com>
References: <20220209060816.423-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164486073463.4355.2988755414965557803.kvalo@kernel.org>
Date: Mon, 14 Feb 2022 17:45:47 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_094554_364484_9D0F1BB9 
X-CRM114-Status: UNSURE (   7.67  )
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

Wen Gong <quic_wgong@quicinc.com> wrote:

> The rate_idx which passed to ath11k_debugfs_sta_add_tx_stats() by
> ath11k_dp_tx_update_txcompl() is not initialized, add initialization
> for it.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03003-QCAHSPSWPL_V1_V2_SILICONZ_LITE-2
> 
> Fixes: 1b8bb94c0612 ("ath11k: report tx bitrate for iw wlan station dump")
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

8c4c567fa291 ath11k: fix uninitialized rate_idx in ath11k_dp_tx_update_txcompl()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220209060816.423-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

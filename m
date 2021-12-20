Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9672C433EF
	for <ath11k@archiver.kernel.org>; Mon, 20 Dec 2021 16:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qEWx7O+qPC7fCh5ldVOUQIF+OiNVIUDfjUkuUdPBJkc=; b=5FmfGVQ8kqElKi
	WtZO1go4OmDfYPcOt+f9X2UeZ6ay4T57lmB/QB7LjEJ3JmOlx8Gvvm+opMGvdwX64zAzhZje3Y3Oj
	CwFAuHnLTR05ZGXykUGUrn/qa/pb1S9GpvSfIoemtYQuqfSDyNT9xC89uJTCMp4yQA2tIUeiFNxyx
	tg1dPtW/9t5h0jd09BQ6mG5OxIAiv0l2mhMdtkGbgefpXuRKbKxZDxdrEDeBy/lg0mcq7PUvoPj2Q
	l7Hu0CsVdkitPWAAqoED+wiMdsu8m1UgaqvwXRxgG8Fv0NTrMMLKMIGO4ceAwyd4oGHa0S57t2gpe
	AxjsMsQcXP+yiOBhF76w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzLCW-003Dt9-NM; Mon, 20 Dec 2021 16:07:48 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzLCS-003Dqo-TK
 for ath11k@lists.infradead.org; Mon, 20 Dec 2021 16:07:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 80149B80E22;
 Mon, 20 Dec 2021 16:07:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DF9BC36AE2;
 Mon, 20 Dec 2021 16:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640016462;
 bh=yz3yDG/V9AQ7BBwH1yVisQfmMp7BYpv9o0z4GgiFEPU=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=eOuHpIc6GBrTYry9O317l7gn+8Y7hRv6hdI/I6i1o7hvcLmO7fTSFhki2ao0ZnW3I
 tH6yBa6khlYdU001tbZ5Oa7+85NStXkvSHK4w3x8CIKhPcK3fVLLCiW4wvC4S5a4SP
 zAE9XmEL2iHPbGztxz6T5rOtVlwKmGtMYCITDQG04zMQxCiE+rGwjlpAj7/7X05AVs
 pRdCjOpnHmfH1346rnHB+jHsv/QTfeRBehjg609owkYnFX+qeLa4LVPLCeY5mAkyE/
 wGQPIeMiS4t+9F/Ey/aHai6yvS7yuXGqs1ACEbecB9ZsE+8tMBPcM1hnpwm7AhadI4
 LGZBUd4TN2E1g==
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath11k: add signal report to mac80211 for QCA6390 and
 WCN6855
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20211216070535.31732-1-quic_wgong@quicinc.com>
References: <20211216070535.31732-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164001645932.2023.9214611467801746397.kvalo@kernel.org>
Date: Mon, 20 Dec 2021 16:07:41 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_080745_117606_9CBC792B 
X-CRM114-Status: GOOD (  11.23  )
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

> IEEE80211_HW_USES_RSS is set in ath11k, then the device uses RSS and
> thus requires parallel RX which implies using per-CPU station statistics
> in sta_get_last_rx_stats() of mac80211. Currently signal is only set in
> ath11k_mgmt_rx_event(), and not set for RX data packet, then it show
> signal as 0 for iw command easily.
> 
> Change to get signal from firmware and report to mac80211.
> 
> For QCA6390 and WCN6855, the rssi value is already in dbm unit, so
> don't need to convert it again.
> 
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

c3b39553fc77 ath11k: add signal report to mac80211 for QCA6390 and WCN6855

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211216070535.31732-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

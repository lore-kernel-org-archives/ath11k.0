Return-Path: <SRS0=utSp=QC=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6612AC433F5
	for <ath11k@archiver.kernel.org>; Mon, 15 Nov 2021 09:43:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2267D61BA9
	for <ath11k@archiver.kernel.org>; Mon, 15 Nov 2021 09:43:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2267D61BA9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m2WN3uuDfZJpEOYxAdHwZI52asxLJ/mHwHcjhKPxeTA=; b=KiQ1kmtuFERdZI
	Jxt9q/Ss48ndKChL1qfUizCGCaYjosnMBJJXXwYkvopW3I061OZkDJ8fleSzMugKNZunZQiNX7eiN
	EZrKzgFPd6lnnAuZJSZOfb7CTsFh1MORI/7KAp37mt6MGviZVvwHQihfqy1/GhyiAYBxotFMHQnVh
	undh7oP937Ztf25yOHsV+6XTrfjdWPlpUiSq7BpRnlBiqogGu6rLLuolnzguBpKamCkmsVcVr1mbg
	BLskFhyyn3QjqMakPjPabQCa8qb/PfQMz5KcoVKWGwaqmEnHkqlb4/nF4WLs2kScGiZKF7YJrRXbU
	A63y1D6XkUF/188ISAHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmYWR-00Eytx-VK; Mon, 15 Nov 2021 09:43:32 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmY5L-00EsMO-OM
 for ath11k@lists.infradead.org; Mon, 15 Nov 2021 09:15:33 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1636967728; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=T8+RQzVfslpBOJviaoNoPaFLVCw6TxpqzDr9gTCLcrQ=;
 b=jrm3ZepykqRldbfEJMIaQ/MmPrxp1Oet34xg8ht1iikefRWqIxxLgGKlvs6S9zPejamjUGoq
 jxjqYuaxKhvLQRryfPHAqtcrQevNBM1BTv14pmZQpTnrxOW/f0As5XaSh18o0x2dRhfEuT5t
 j2nkeTjGDEVf9V48K4BOuaG/fOw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 61922528b3d5cb1f55c0d778 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 15 Nov 2021 09:15:20
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 413B2C4361A; Mon, 15 Nov 2021 09:15:20 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id CB03DC4338F;
 Mon, 15 Nov 2021 09:15:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org CB03DC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: fix fw crash due to peer get authorized before key
 install
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1636554200-12345-1-git-send-email-quic_periyasa@quicinc.com>
References: <1636554200-12345-1-git-send-email-quic_periyasa@quicinc.com>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163696770288.20888.17754900524964884624.kvalo@codeaurora.org>
Date: Mon, 15 Nov 2021 09:15:20 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_011531_934632_DF058E18 
X-CRM114-Status: GOOD (  10.04  )
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

> Firmware expects host to authorize the peer after the successful key
> install. But host authorize the peer before the key install, this trigger
> the firmware assert which leads to Q6 crash. To avoid this Q6 crash, host
> should authorize the peer after the key install. So introduce is_authorized
> in peer object to identify that peer is authorize or not. When
> IEEE80211_STA_CONTROL_PORT flag is unset, peer move to authorize state
> before the vdev up. When the same flag is set then peer move to authorize
> state after vdev up. So added authorise check in ath11k_bss_assoc() to
> handle the earlier state transition case. Also added the WMI authorize
> procedure in ath11k_mac_op_sta_state() to handle the non-earlier state
> transition case.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01492-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

85f36923be47 ath11k: fix fw crash due to peer get authorized before key install

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1636554200-12345-1-git-send-email-quic_periyasa@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

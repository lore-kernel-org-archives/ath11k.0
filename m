Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09317E706E5
	for <ath11k@archiver.kernel.org>; Thu, 21 Sep 2023 08:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8iif5t717RCXfXwTAWEhQ9jPDV21mEGDO87UwFVYFIk=; b=4bMrZwNDQ29h5g
	pD7/7nxE+MOjRrrNZV/BlH7ZrNXeoVLyDb7786n7tiWXIhjs4+cT8vtzVXVjIbaxxE8lEHyxhj/l5
	PXMsL0QScD7c2IneclTTzpRc5GF4ACEfYtm6k3vLYj0uEUZrZgb5Rz3jZgOBDGA2Nu9D9VjVRg06l
	8jgi+sM2xg18IxZvKic6Y6Sy2VHQTP/g7UwklFiA4WvAML9QxlesjKzqAGY8OMb6bx/NvOkEGZJbe
	u1AlIt6GwIkyLb+M8zko5uRZfiySbo+e5LecHPCOoaMf2924kiNy4JMdgLwSsOAwYPsYUXwWXMzvJ
	oGsYGgcJFDpCnYQ/440Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjEnU-005T9C-2U;
	Thu, 21 Sep 2023 08:12:28 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjEnR-005T8C-1o
	for ath11k@lists.infradead.org;
	Thu, 21 Sep 2023 08:12:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 5D5B6CE1689;
	Thu, 21 Sep 2023 08:12:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00DA5C116B2;
	Thu, 21 Sep 2023 08:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695283941;
	bh=T9axprIpl0XduYk3n2EqzXInDwp6YLqpLyjrX8stzrw=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=maVjgWzQpzPgDxayY1N1p0/7EJ+tKT+bbOcaL1VNcdxV83qItOQNXXz68oraB3o4j
	 Z3GPQXWxLIJHh56KAPiyIG59Clc+WE351I2w6klhy44GMIqMzUkaPhxp4cAWA3jJEy
	 dMUWHmouIRsxcATDpaA/sikt23/4TQEhTlzBQ9gDWeTgQDJezUpX7kVm+RpvmskGTc
	 WMDj3B6Y0BS/XSdisIP8m7s8K+XFcQLzqPW/ba0tHH2qlHxnts/KWvj6sLUnTHQJH3
	 MibcbD23NpF9e3WnOTtzyyk7e4roXRprIIpHSfFAbzevlw7KZ/H8EBCnj1/IReCjZm
	 a5TrvxpxLS5Qg==
MIME-Version: 1.0
Subject: Re: [PATCH v2] wifi: ath11k: fix boot failure with one MSI vector
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230907015606.16297-1-quic_bqiang@quicinc.com>
References: <20230907015606.16297-1-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169528393922.1539628.7842522127045869453.kvalo@kernel.org>
Date: Thu, 21 Sep 2023 08:12:20 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_011225_811331_7421DE35 
X-CRM114-Status: GOOD (  11.16  )
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

> Commit 5b32b6dd96633 ("ath11k: Remove core PCI references from
> PCI common code") breaks with one MSI vector because it moves
> affinity setting after IRQ request, see below log:
> 
> [ 1417.278835] ath11k_pci 0000:02:00.0: failed to receive control response completion, polling..
> [ 1418.302829] ath11k_pci 0000:02:00.0: Service connect timeout
> [ 1418.302833] ath11k_pci 0000:02:00.0: failed to connect to HTT: -110
> [ 1418.303669] ath11k_pci 0000:02:00.0: failed to start core: -110
> 
> The detail is, if do affinity request after IRQ activated,
> which is done in request_irq(), kernel caches that request and
> returns success directly. Later when a subsequent MHI interrupt is
> fired, kernel will do the real affinity setting work, as a result,
> changs the MSI vector. However at that time host has configured
> old vector to hardware, so host never receives CE or DP interrupts.
> 
> Fix it by setting affinity before registering MHI controller
> where host is, for the first time, doing IRQ request.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-01160-QCAMSLSWPLZ-1
> 
> Fixes: 5b32b6dd9663 ("ath11k: Remove core PCI references from PCI common code")
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

39564b475ac5 wifi: ath11k: fix boot failure with one MSI vector

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230907015606.16297-1-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

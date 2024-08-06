Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD133C52D6D
	for <ath11k@archiver.kernel.org>; Tue,  6 Aug 2024 07:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ni30t3dPOIHgEm9AFGeqlMLDzh2J3uxy9boU8a3n8PY=; b=AqN5POTsjxjqZf1r8UboK9yRCP
	nzKgf9ODXNUprRHRC7DXcqtp2uq5e+fq7K1z866r8mmGycldwXr+Wd6AxTzwdaVHVDbS+5+ep4D/G
	hC83xgdOSPDFEXV5eq2zy0iRmw5IVqtaH4Pcz+ADvEV5uQLlr9O2FZccyXRfEq/ej4tfNGQ+qBBul
	13tQpUM9Lx/dqFqJZp3ppDukgxTDpvpNywHxGpKXAGqgm+m4WlAPl0Gb9p2OKvp0NrLvS7aWxT1QI
	VfVEvBnK9Mum1kVGRy3T957sc0fjq0hDTLwD/g8QFtblcaCKtiz7f5y3dSQ0EWShpalx+Bg5nEM25
	R12g2e1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbEv7-00000000pvG-1xMX;
	Tue, 06 Aug 2024 07:47:49 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbEv3-00000000pua-0eV2
	for ath11k@lists.infradead.org;
	Tue, 06 Aug 2024 07:47:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 03EDECE0E03;
	Tue,  6 Aug 2024 07:47:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31EC1C32786;
	Tue,  6 Aug 2024 07:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722930462;
	bh=1UbbIFrv0mSiqPTE1GE0Op9VJp8q3naA0OnSJVR7moY=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=BK+lr9354AvBISUEwphTDYVGIpSbPOz1Ux+by7a8qyHDDnGsgWB4Aox77Jh+OuhoQ
	 ASeWcKFprBZTAp/subGlK3Nb3nARr+XWp0Cck6BUGsibw3w5Vzkw5aJWN/VhJ9OK4S
	 dXRptJ/bjX1KQPJF36kQEN+/CPn2fLXpo6/KJb9f4QepJ2tbXnVHDf/2xrD0XDAWA9
	 e2HOfLzAdrjO8EExvh24rEaybpODu7bfULz6mJ4mEXReLHdS+r+pp2gI3gF+mmgcm/
	 UhK4LiI74YzDKFVV9tfZsfdO6KBnh+uxecRZg7VBHTm+4y99YW3gjS5zDN3hk9UM/O
	 d33AvQdA1qqgw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] wifi: ath11k: add tx delay to TSF
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <1686636183-1026-1-git-send-email-quic_haric@quicinc.com>
References: <1686636183-1026-1-git-send-email-quic_haric@quicinc.com>
To: Hari Chandrakanthan <quic_haric@quicinc.com>
Cc: <quic_kvalo@quicinc.com>, <ath11k@lists.infradead.org>,
 <linux-wireless@vger.kernel.org>,
 Hari Chandrakanthan <quic_haric@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <172293045918.3540390.14108368692909594030.kvalo@kernel.org>
Date: Tue,  6 Aug 2024 07:47:41 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_004745_395911_A845C09A 
X-CRM114-Status: GOOD (  12.55  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hari Chandrakanthan <quic_haric@quicinc.com> wrote:

> In ath11k AP, the TSF timestamp mod the beacon interval does not vary
> and is close to 0.
> It is expected to be around 384us for 2 GHz and  54us for 5 GHz/6 GHz.
> 
> The value of the TSF timer at TBTT is a multiple of the beacon interval,
> while the value of the TSF timestamp in the beacon accounts for medium access
> delay and physical implementation-specific delays through the PHY,
> which could cause the value of the TSF timestamp mod the beacon interval
> to vary.
> 
> An AP sending a beacon frame shall set the value of the beacon frame’s
> timestamp so that it equals the value of the STA’s TSF timer at the
> time that the data symbol containing the first bit of the timestamp
> is transmitted to the PHY plus the transmitting STA’s delays through
> its local PHY from the MAC-PHY interface to its interface with the WM.
> 
> In ath11k the physical implementation-specific delays were not accounted
> for TSF timer and it resulted in incorrent TSF timer values.
> 
> Add the physical implementation-specific delays in the TSF of beacon
> template and probe response, so that the TSF holds proper values in the
> beacon and probe response.
> 
> tx delay for 5 GHz/6 GHz:
> 20(lsig)+2(service)+32(6mbps, 24 bytes) = 54us + 2us(MAC/BB DELAY)
> tx delay for 2.4 GHz:
> 144 us (LPREAMBLE) + 48 (PLCP Header) + 192 (1Mbps, 24 bytes)
> = 384 us + 2us(MAC/BB DELAY)
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00192-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Hari Chandrakanthan <quic_haric@quicinc.com>

Dropping this, please rebase if still needed.

error: patch failed: drivers/net/wireless/ath/ath11k/core.h:365
error: drivers/net/wireless/ath/ath11k/core.h: patch does not apply
error: patch failed: drivers/net/wireless/ath/ath11k/mac.c:1437
error: drivers/net/wireless/ath/ath11k/mac.c: patch does not apply
error: patch failed: drivers/net/wireless/ath/ath11k/wmi.c:8627
error: drivers/net/wireless/ath/ath11k/wmi.c: patch does not apply
stg import: Diff does not apply cleanly

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1686636183-1026-1-git-send-email-quic_haric@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches



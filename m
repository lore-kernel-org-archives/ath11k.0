Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC9BFC4332F
	for <ath11k@archiver.kernel.org>; Wed,  2 Nov 2022 15:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UFAvqXi/Ah1y7WYarX2nvuG73gNmUoP2CA+ZJRQAHyc=; b=Q9c6NsaATxI6YV
	/QClV4LKKHPd4Cq5SlJKOZzwHQYaIGEnypc0mOLrPcalZRyCXO4Hcmenffd6nn8Wf63wtqXxN+Xni
	szM5ScJD2M+JLtsbVAsZmm9l58aGFl4/7fMQORAmzvVPnh54tb7ioDFW4rzEF3oQzmIt1NFCTUq9A
	N9yxkjmZBjwHMhvCsIRKRwEKjOV9i2Ts33/RAbv7dj3MwollB75a7D0rJgst4tyrE0oZuY4NPT0KE
	/3pUJApgaD/2xLhfOub9ltqyeqbIPNxR9itH8BWpAnkhJLi2dOs/QiCyZ9UhVwKEJmA9JZBdr/R9t
	gcE+xrcwAUWomd7eByiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqG3y-00Btlq-0L; Wed, 02 Nov 2022 15:53:58 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqG3v-00BtjP-3I
	for ath11k@lists.infradead.org; Wed, 02 Nov 2022 15:53:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id AAA5BB822DD;
	Wed,  2 Nov 2022 15:53:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F62EC433D6;
	Wed,  2 Nov 2022 15:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667404432;
	bh=giDt3b+ZyHrsaDQ8U7LNdJ82qFVrIpbBLkCjORuwo3k=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=CDDvlzIcPhZS1ensHRxN66iZdb+Ik82yS3lEf86tw/uzWekYwdUxPMBOTL01iBt5v
	 31r2U4DyDGPWSqh3N4YUSPH9FgMBfmuWnmgID80NK/U5ptgTLr2PEYEfPWW5V9K8D8
	 8Y8wJu7XYs4o+aWLKJYTIOWRVz2hAKcX2oTKtPQo5ZxRVCy/tSqENiFTZds7qh+RhK
	 3SX1iZA7V/+F0mvN9r5XYpj/DwF2D/lk1HnSnCAqdvgD3RHMU/GGZVCmLw+bBSfeou
	 yaL4oFfAlJ7/4HZB0wwwQmBth78vaG+1UZs5or7VtSnnaTfWjkwFCwQ1dAMTUdePy5
	 tPWlGaLsopWLg==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath11k: Fix qmi_msg_handler data structure
 initialization
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20221021090126.28626-1-quic_rbhattac@quicinc.com>
References: <20221021090126.28626-1-quic_rbhattac@quicinc.com>
To: Rahul Bhattacharjee <quic_rbhattac@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Rahul Bhattacharjee <quic_rbhattac@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166740442931.20386.6032191659181258004.kvalo@kernel.org>
Date: Wed,  2 Nov 2022 15:53:51 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_085355_325517_39335457 
X-CRM114-Status: UNSURE (   9.16  )
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

Rahul Bhattacharjee <quic_rbhattac@quicinc.com> wrote:

> qmi_msg_handler is required to be null terminated by QMI module.
> There might be a case where a handler for a msg id is not present in the
> handlers array which can lead to infinite loop while searching the handler
> and therefore out of bound access in qmi_invoke_handler().
> Hence update the initialization in qmi_msg_handler data structure.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Rahul Bhattacharjee <quic_rbhattac@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

ed3725e15a15 wifi: ath11k: Fix qmi_msg_handler data structure initialization

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20221021090126.28626-1-quic_rbhattac@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66DBBC433FE
	for <ath11k@archiver.kernel.org>; Tue, 11 Oct 2022 07:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pH+0moWw/mfg/3r2AWoFJeAGb0Fc6ECIXp1m2RUTx/Y=; b=gbNGMD6dFnVmBE
	FbYKVrRcpa29KL7f41ClHfr6RhYt0fCCHf/z9cG7T6yrWustNQbxzLrgGnrJ4YdOuj+IHoM+rjQyy
	28ThkHEiIERuuhqEvjOHUyhGNBYxaZZ5DdofG39s4xCiip3eDjuh5gwc4WjSRF8wMOWLa0wMJ9x6H
	SADH3wflCClCoYXtbbAqRVSO/+ULLvtZJ81ejCk5d7589LPdZqsogt+qOOx+aJEmPPofOSztb81r1
	a4FsdFrXdiNj3GWmfFhIFmTJHUfgl6e3TQm7RzAo0Hz8UDL8XLb7PimxEGPqymXVBwpdbpe/tUEzA
	09GX+3YJWJGhtVHCWYsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiA10-003dNr-Je; Tue, 11 Oct 2022 07:49:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiA0y-003dNG-6s
	for ath11k@lists.infradead.org; Tue, 11 Oct 2022 07:49:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0BB2A61122;
	Tue, 11 Oct 2022 07:49:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A84F2C433D6;
	Tue, 11 Oct 2022 07:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665474560;
	bh=1WwSYM23oQxupcqStJLm5dOD3V1ZFzvJPyXZLixzaEI=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=gh/oqtMl+fLOoVycmWzsk5oRwgBrOuqrHr3+A9rSH5K2wlxqLqGB1bEXNFvMVFLkz
	 2uDSSwv1wMfXNUvtH7sy2kozNpOIo1QhtRPinVXDFyImWi6gjv7QSfG2rCmxRzw9ah
	 gdv2uaAJJoUuyPnSek095Oh8NJEzhBv4VNgVtSTXxsyXGTpFrmK5f0YSziQ21b3sK5
	 gsIJjTywEmPAkr1TtCD1maSz8zUQNru5NKdrtzGAijCK1v9XXhPyuTG6rOn9ljZ5oU
	 74q7Ax0QYuTjezqBiQqk5nDga0Dkf8n39FCrU0RgpeBaVmRcTvtAT83tYcXOiTxS/M
	 7Abx80/aSaZpg==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath11k: Send PME message during wakeup from D3cold
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20221010033237.415478-1-quic_bqiang@quicinc.com>
References: <20221010033237.415478-1-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166547455486.8038.9803492494856020045.kvalo@kernel.org>
Date: Tue, 11 Oct 2022 07:49:19 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_004924_316326_AC235A33 
X-CRM114-Status: UNSURE (   8.27  )
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

> We are seeing system stuck on some specific platforms due to
> WLAN chip fails to wakeup from D3cold state.
> 
> With this flag, firmware will send PME message during wakeup
> and this issue is gone.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3

The firmware you are using is old, please update to the latest one:

https://github.com/kvalo/ath11k-firmware/tree/master/WCN6855/hw2.0/1.1/WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.16

It's very important that the testing happens on latest components.

No need to resend because of this.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20221010033237.415478-1-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

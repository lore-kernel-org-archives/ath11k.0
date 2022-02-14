Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8185C433F5
	for <ath11k@archiver.kernel.org>; Mon, 14 Feb 2022 17:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BvV2NEcqr1X9Jfd+tOlkGyPazgxKGC0Asqe7tHTZoqw=; b=JQVbdqbAzDDt4m
	J8Uq28HNRpk4DLl8vFW0DjZoA1fSK2Iv6rUPxI+OHMAUBdFPgRnCrM4lk7Sxo4jLc54C3DqXWeHtS
	pQTVYOKCNHNO9zZe9Swa0EJ/E4BQrkqQMaW+EU/S3TXksKMW2MFoJM85MWoTa34O1NQEOvpF8YmDm
	hvXxJikPsMfU5iDI/d3z1eZBXo6RwFlauldtRqOjXmjZrf/XERfFSgPWIN2D/XnbcHvCjcyyFCRM5
	ZcQqbKtj/j1AjWTa+hl/EXIPRgB9Z44d0KaOjtYbpWwIkq90EgwIDjl/9IgiH0pMo/XZ1e9cz+0bo
	uPLw5kZsK5xMGgcHLV0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJfRf-00GQPk-NR; Mon, 14 Feb 2022 17:47:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJfRd-00GQPT-AQ
 for ath11k@lists.infradead.org; Mon, 14 Feb 2022 17:47:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E108161599;
 Mon, 14 Feb 2022 17:47:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E4B7C340E9;
 Mon, 14 Feb 2022 17:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644860844;
 bh=MDolvpeYbkZQWOyDXYeyhtIlGQ/yEDl7GGAp7F8ATBY=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=DQvOV2WZaNwqLulN7CrgLGnf5/u2vXHQpqQPL2ELWj4nJiqUlhWlg4rFdP3FTeInd
 i7NqjTyyiEbwZJDwk0By7SOmycv6aIxATZW7gUHFw2qT4pomIv0s0rrSBhR2a2LrpN
 daGSE8xt44S+LzLNj9g31QSTmB29iOkiDSqJy6DB29rfbr7n/FnUGv3YtzLeuGACNM
 ugTuipsQ4cVRAz3P8y8baEeBDIqvs0IlURv2zGXz4qhRDXqA32xhjf4lNquWGIKpgC
 mKXf0MpGVlpMhcRMHa93FEBWpLCPTBGo79KnkL0OGVXqnSUhfZwcaNYuvI3kXzxaZ4
 mzG75BIQRrQTw==
MIME-Version: 1.0
Subject: Re: [PATCH v4] ath11k: fix destination monitor ring out of sync
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220210064706.6171-1-quic_kathirve@quicinc.com>
References: <20220210064706.6171-1-quic_kathirve@quicinc.com>
To: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164486084170.4355.17341295247550421852.kvalo@kernel.org>
Date: Mon, 14 Feb 2022 17:47:23 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_094725_451362_D4123E8B 
X-CRM114-Status: UNSURE (   9.70  )
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

Karthikeyan Kathirvel <quic_kathirve@quicinc.com> wrote:

> More than 20000 PPDU id jumping causing status ring and destination
> ring processing not sync. The status ring is processed and the
> destination ring is not processed. Since destination is not reaped for
> so long, backpressure occurs at the destination ring.
> 
> To address this issue update the PPDU id with the latest PPDU, this
> will allow the destination ring to be reaped and will prevent the
> rings from getting out of sync.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1.r1-00026-QCAHKSWPL_SILICONZ-2
> Signed-off-by: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

1e15aacd1238 ath11k: fix destination monitor ring out of sync

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220210064706.6171-1-quic_kathirve@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B5C8C352A1
	for <ath11k@archiver.kernel.org>; Wed,  7 Dec 2022 17:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8NU0JgW6i8USDm9vRfqsVFBKHummo5C2zx2QogrEYRo=; b=kHbS3S+witL13F
	xgfw0/1qmKVIEZYpys+BUdFD+wLrPoQyT6XqdyABSONOvcurhibzEAHyiSAjlovTTn6iazaWf9Et2
	QM1XoPT0e208oiF0dF72rvht9rJvMwYnxdjBYlhOyXxzGNx/9Rl2MZa1WOpX/O1XAeAGMf4MFXhFg
	8B1St6KBiEvkxalYgQVuN55aq2VnY2/THmmg6/vqgRbjMiU/OjKWLOkwYrHUEJIFw6Klyznc1pJRY
	SpIEbV/wd8+kkXTSDTrAcnCkONBujTI6+FhcDbR6u4JfLBAdVMPfb/G2/TX2hhoC/TAY5fmyXCyfg
	ZUH3lrpMOwU9RXsCfgPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2y2s-007FFw-DA; Wed, 07 Dec 2022 17:17:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2y2q-007FAs-Bn
	for ath11k@lists.infradead.org; Wed, 07 Dec 2022 17:17:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E63D161B50;
	Wed,  7 Dec 2022 17:17:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3932DC433D6;
	Wed,  7 Dec 2022 17:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670433439;
	bh=tPvUf0/sHdPV2YSh+0nDeUZk9yqOADgoGBRp/xdd1ec=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=QNWHRme9Df4ybFR7rFOSzuxpFvTW3G8Qp7Az4UX8sbO0IWRdl1CPnBvxx0Ut0Uf9J
	 ejCxHHXihKOfaMYAzd+gA1gwKxI3OzNW4604voB7AQwkOfG4fUuTa6pjr07hf1ni4v
	 16l43HKxOwvn3e3r6MXq1ZxpIBupIuWpP7nuOHwWFoI2L7hru0bxjo2Ah42P7CGy7Q
	 gJMGWAm2l5j9QoUTzu4swvRqpahw5n1UDkqpM+AvTbQ0HHt+U96oVA7e8/ds1BiH1e
	 Ax2bpxMc/szaPSvYsIdRAZTh0H1nG2TYQP9MPVd+LNLW/UdH1PXz8BnlII8YtRwVjw
	 4x6bWlr0Cx9Jg==
MIME-Version: 1.0
Subject: Re: [PATCHv2 1/8] wifi: dt: bindings: net: add IPQ5018 compatible
 entry
 for ath11k
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20221122132152.17771-2-quic_kathirve@quicinc.com>
References: <20221122132152.17771-2-quic_kathirve@quicinc.com>
To: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Sriram R <quic_srirrama@quicinc.com>,
 Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <167043343244.16838.6003784480944515283.kvalo@kernel.org>
Date: Wed,  7 Dec 2022 17:17:18 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_091720_476179_86E1A76E 
X-CRM114-Status: UNSURE (   5.91  )
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

> Add IPQ5018 device support for ath11k.
> 
> Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
> Co-developed-by: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
> Signed-off-by: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

8 patches applied to ath-next branch of ath.git, thanks.

679d708a10ec dt: bindings: net: ath11k: add IPQ5018 compatible
8dfe875aa24a wifi: ath11k: update hw params for IPQ5018
26af7aabd2d8 wifi: ath11k: update ce configurations for IPQ5018
b42b3678c91f wifi: ath11k: remap ce register space for IPQ5018
711b80acbdfb wifi: ath11k: update hal srng regs for IPQ5018
ba60f2793d3a wifi: ath11k: initialize hw_ops for IPQ5018
69968f88f177 wifi: ath11k: add new hw ops for IPQ5018 to get rx dest ring hashmap
25edca7bb18a wifi: ath11k: add ipq5018 device support

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20221122132152.17771-2-quic_kathirve@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

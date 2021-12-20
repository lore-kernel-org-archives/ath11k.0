Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A5D2C433FE
	for <ath11k@archiver.kernel.org>; Mon, 20 Dec 2021 18:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RERQ/dWIhciIEKiDaVbYlrTzmqD1PHjEFZRu/U9odFg=; b=ccHaTFw1BC7nHi
	FTk2uhBp8qB3Y9P1NPJG53GnSA54dkFO9zBibxtwJFppt8oSveq7djKPml8WbIRboXBEzbPikX/MO
	aKmBpTlgSSUAGvyhCmiRo8LGL0UBx/LYxuyeLdzQjljtelh8Pjz4rg31PWnL+Ldag5vaai5NkpFAx
	RtHi/BXthvR8OPTKlPrbtBZMMkTVJwLJEWHWbkM2OM+5ODiUGI++DJky3GqYgn+mgEpDlIlYmZJUf
	sRRkIt/h211wnDTWrj4C5r5JTs+suOyFg7nlWIpa03amHgDKN71pOXDt5gfVhPJ75tN2ewohZB5OG
	I4/futH3tXgTdha4LVxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzNPR-003nV0-Sr; Mon, 20 Dec 2021 18:29:17 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzNPP-003nU2-3k
 for ath11k@lists.infradead.org; Mon, 20 Dec 2021 18:29:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C186BB8105C;
 Mon, 20 Dec 2021 18:29:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92642C36AEB;
 Mon, 20 Dec 2021 18:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640024951;
 bh=x2D/e90keyKyOypZN4KNCx5gAdnARqtaazKowqro98s=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=UnT1M3PF0TIz/nGR2rFLD5qHlqEFIw74L63SX7NuimIvbsQMW9MMIuRj6X9TDhcx0
 SIAdOTfgrS9OHZ2RE+32+VoUofHiEJ90LCfRLMkndi77+PZNBXcJ6V0wK+Y9q+ma6j
 xrRy98TEIAoOWDWAxgfxHkCgrIeRn7Zth1BrchNYOnMNlcwaCdJy0ju//94ZByFUlN
 +Ho0x1+/0nUIAYckpXxzBTYO3ncrmEN1f4RylwX3d/buS4A+B1clnTE1RdjtHZ6Pby
 pDRIOQqaZeWt37j/HaR1jx4KjX/5VxAgmBzjN/YLMqxY4beYh8k9jl+KoLgyaUGGa8
 MQrL+6xq8JBNw==
MIME-Version: 1.0
Subject: Re: [PATCH v3] ath11k: report tx bitrate for iw wlan station dump
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20211217093722.5739-1-quic_wgong@quicinc.com>
References: <20211217093722.5739-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164002494893.8180.8615133352100294578.kvalo@kernel.org>
Date: Mon, 20 Dec 2021 18:29:10 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_102915_331041_8B77B9B9 
X-CRM114-Status: UNSURE (   9.74  )
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

> HTT_T2H_MSG_TYPE_PPDU_STATS_IND is a message which include the ppdu
> info, currently it is not report from firmware for ath11k, then the
> tx bitrate of "iw wlan0 station dump" always show an invalid value
> "tx bitrate: 6.0 MBit/s".
> 
> To address the issue, this is to parse the info of tx complete report
> from firmware and indicate the tx rate to mac80211.
> 
> After that, "iw wlan0 station dump" show the correct tx bit rate such
> as:
> tx bitrate: 78.0 MBit/s MCS 12
> tx bitrate: 144.4 MBit/s VHT-MCS 7 short GI VHT-NSS 2
> tx bitrate: 286.7 MBit/s HE-MCS 11 HE-NSS 2 HE-GI 0 HE-DCM 0
> tx bitrate: 1921.5 MBit/s 160MHz HE-MCS 9 HE-NSS 2 HE-GI 0 HE-DCM 0
> 
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

1b8bb94c0612 ath11k: report tx bitrate for iw wlan station dump

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211217093722.5739-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

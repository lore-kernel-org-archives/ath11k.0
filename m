Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41AA3C433EF
	for <ath11k@archiver.kernel.org>; Tue,  5 Apr 2022 08:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6eM+FNvmGPQ60YkBmZtLX0eKqwpY0lTQ26hwNX4vJ8I=; b=Ixtm7DFmk6LNyF
	4LUAqM9+3G7QB2Xte2ggpZ+rsrd/6ODg60lIWhqrtJ70tqg6r3Iqj5euC4Nt0Q4EcNjKH+ITRo1kL
	p03ToHBuWTFzRTC7Fetyf6A2wqIQuC/KlJuODt4yDTdmKIEHYPBIkjH2EnCCA6hgL1mhRvEuqMTUO
	sPZIW3q1rO+Ox6/rOiKjViOwXFaDsFgQ2W+10bUt3f0HImlcCu6PuVedwmmrlIJlWktG5srKlxD5g
	yk5f84wvdXCsGaM7RapE2PQYppzJ5MZIiy9e08GKAfhro8KR8xSABWkfTy5clWvDPPFxuO/sYE+oM
	MDrviFCDLFhCXX+ueQmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbeHm-0009XR-Lq; Tue, 05 Apr 2022 08:11:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbeHk-0009Wu-DI
 for ath11k@lists.infradead.org; Tue, 05 Apr 2022 08:11:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DB688609D0;
 Tue,  5 Apr 2022 08:11:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88FB8C385A0;
 Tue,  5 Apr 2022 08:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649146291;
 bh=lfSf3YuaNH30TPILlbBPZ1DPyWyyk4WrXjhN08cVlWw=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=GJK1ClGYOw/fBj4KN+e8VWpptZeAC2Uo/c0NOoed/ZDSetUpLU3OKHq55lbO3H9d1
 Y+fsjzxdSfbGdeMMYrs//amTWJBbFwcXmDqYi7K1p0CUz87cZocQMmE1xTLTsQRQz1
 cEcaAP8Mf210oeBctoXvq79vpa5OP7HZW1PVHNQP7deSFhZx1SaMYBt4EfHWvj6lS0
 LUOvGUiGrcTjsOzifGr0Lt47+BHU143fgWa1Stmf+UktWXCC3Xza+Q+YOnUzELM0zn
 YjpsI3xX4sHNFOJUbHdmrlpRXiCmvJor33gzkBIrxWFb0yEu2mcQZeHxmQIgkj/zEl
 4JeTR9Y3pX81Q==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Remove unnecessary delay in ath11k_core_suspend
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220331002105.1162099-1-quic_bqiang@quicinc.com>
References: <20220331002105.1162099-1-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164914628848.12306.8288528929953544140.kvalo@kernel.org>
Date: Tue,  5 Apr 2022 08:11:30 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_011132_530568_D1B70C39 
X-CRM114-Status: UNSURE (   7.83  )
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

> The intended delay in ath11k_core_suspend is introduced in commit
> d1b0c33850d2 ("ath11k: implement suspend for QCA6390 PCI devices"),
> now with ath11k_mac_wait_tx_complete added in commit ba9177fcef21
> ("ath11k: Add basic WoW functionalities"), that delay is not
> necessary now, so remove it.
> 
> This is found in code review.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-02431-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

2dd398dee7aa ath11k: Remove unnecessary delay in ath11k_core_suspend

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220331002105.1162099-1-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

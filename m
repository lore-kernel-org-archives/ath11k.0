Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A636C77B70
	for <ath11k@archiver.kernel.org>; Mon, 17 Apr 2023 10:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gRGSTeetjyZKNF7sVItqardo/KVKMrKD1F+VGb5c+70=; b=Ro8WqecZW1SYjM
	goI7HZO2vp5kHobC2Xs4BZFOJfUP5exzckg3cusny/G221bSRJoaplETasD40Ofj8PI+Oh87bgzM6
	euyTS5n5YLjh8/EkX+aq/wKPCWdbcIo8uAmLoYwJzFzkl1V01Q3sZrgDCTJkOwFjTT2U3vyB7M0TT
	1uSDDO494C0u812SiMiV1P+YXNH+WDVraRrUAmI4uhJZIeepGoLgt1JzjwKSKgE/YhcRxxnm18vnT
	FtEb7sVFjLNQDBhfZamlrUOheq0AISw9DU3RzDnR46iPygKbVlmcG34joX8JhyQ/DVL8fKnnIqtp1
	zfbGTKIdHWkV3JKSu7fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poLs6-00FhLa-2u;
	Mon, 17 Apr 2023 10:14:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poLs3-00FhKh-2O
	for ath11k@lists.infradead.org;
	Mon, 17 Apr 2023 10:14:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E9D546207C;
	Mon, 17 Apr 2023 10:14:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70C2AC433D2;
	Mon, 17 Apr 2023 10:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681726442;
	bh=SJ8Cjrcif9Zvy5yUgdgzzrInVemuGtS1n7KSjHiLBSs=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=Jz/8dNNN4qiIFAvn9NdY5cvBhSERTyXR6xVXHIqAqXaya52hUcod9ticnARpPscmH
	 q2Tpxwh8KemQ73AtgtRwovcfck20bLNDsRbM65KPBqr2t66kQY64iuE8AraqnHqYjI
	 DVwb2I26Ozyyh3kUdRJ5uDa/Lvs35kUShpj+pEMg0+LU7j9FmXhA5RNEbi8IZfCqBM
	 B6q6TBiumu7YWf/2p0EpVxn63PNyjAqlyDN9vPuA/ynhq5i/bWAYBok9w4GhVQgY0N
	 soSbRGGEEjBbJSKvWG7BbWyWs6VbtvZlRIeIgKhgwxeVdzeRFF8NGqSoDyN0xqGgsr
	 YM7ctWpTym/cw==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath11k: Disable Spectral scan upon removing
 interface
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230328071150.29645-1-quic_tamizhr@quicinc.com>
References: <20230328071150.29645-1-quic_tamizhr@quicinc.com>
To: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <168172643941.9486.9756032017777540721.kvalo@kernel.org>
Date: Mon, 17 Apr 2023 10:14:01 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_031403_813871_0F9197F1 
X-CRM114-Status: UNSURE (   6.41  )
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

Tamizh Chelvam Raja <quic_tamizhr@quicinc.com> wrote:

> Host might receive spectral events during interface
> down sequence and this might create below errors.
> 
> failed to handle dma buf release event -22
> failed to handle dma buf release event -22
> 
> Fix this by disabling spectral config during remove interface.
> 
> Tested-on: IPQ5018 hw1.0 AHB WLAN.HK.2.6.0.1-00861-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

5c690db63b45 wifi: ath11k: Disable Spectral scan upon removing interface

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230328071150.29645-1-quic_tamizhr@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

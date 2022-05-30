Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72EE2C433F5
	for <ath11k@archiver.kernel.org>; Mon, 30 May 2022 11:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2AtzgiKtljUUj+z0lgIA3vDNXGt2ob4uDbOLCfqkDB0=; b=jiq4SxxHb1dAC4
	JLCCiMQerloCgwhtRrPs5YYUhBm9iqUb5qdX1TAjuEqlsF4pmuzV6kmc/10p67vf9aaGiQVNvt4aD
	Xptq+Y2Q/qzAmc37lfBVfIdXuhIPaMFwux6VLKQAvYN5R9rMUUkksdbRLnNV3WP5DzSav8tg6l2Rd
	xhJmPk5wv9dc2LrJyCG/4YQ+asQpU43xuHkzEPOmAn8Vv0L5qxhC+JEX7mZ8DMTSgYdSpXflgHvjK
	IN8Cj6n7FJ8j472LrQ3p0OKGU9lzSXU0OO4jg1tNQ3BETMLpm5gSTctdgQ7kvtHyk2CnyOZVIrKkm
	ENs/3VWdu99giiwk4IvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvdVz-006KTb-OP; Mon, 30 May 2022 11:24:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvdVx-006KTE-Gm
	for ath11k@lists.infradead.org; Mon, 30 May 2022 11:24:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BCB7560FF6;
	Mon, 30 May 2022 11:24:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C5C9C385B8;
	Mon, 30 May 2022 11:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653909888;
	bh=3rCztYnL0uwrE4akRgpJAA1Ox2xAa2Imi8tNSao/Wvo=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=lwwCq3/da6jzkONa3Z68CTJR3Wbet5w5EWEF2UNn3ElmDPry5TahB8vUmS/NkbGX4
	 bU9mFXcmDwMTgvWHaenKGWgmDiK1rO/VvGeftkogYnbdkzm8arECa0X+4RfPOAuT5W
	 MCAg/ZYj33WG11GDYysxAxSAI+tM/XadN9T+WeP4WnyYCiEI3VCMJ7KlajaI1J5l/E
	 aYA+BbRAvZ53cEAg9bV3JSQnwS0y/3aulmGJ77A1Ls69kcKUU98BxsHYxyG00rKBqn
	 yf4NaBkiRfokwHtAa7lKvNwhE2fE31Z7WxnWS1wuzSfjabm+cpu7877vGNVIG0+q5Q
	 KSfjC6++B4qeQ==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: fix IRQ affinity warning on shutdown
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220523143258.24818-1-johan+linaro@kernel.org>
References: <20220523143258.24818-1-johan+linaro@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <165390988385.3436.2436370511020233863.kvalo@kernel.org>
Date: Mon, 30 May 2022 11:24:45 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_042449_643403_FD8381A1 
X-CRM114-Status: UNSURE (   8.32  )
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

Johan Hovold <johan+linaro@kernel.org> wrote:

> Make sure to clear the IRQ affinity hint also on shutdown to avoid
> triggering a WARN_ON_ONCE() in __free_irq() when stopping MHI while
> using a single MSI vector.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
> 
> Fixes: e94b07493da3 ("ath11k: Set IRQ affinity to CPU0 in case of one MSI vector")
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

3bd0c69653ac ath11k: fix IRQ affinity warning on shutdown

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220523143258.24818-1-johan+linaro@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

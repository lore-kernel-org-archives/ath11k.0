Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B25B1C04FFE
	for <ath11k@archiver.kernel.org>; Fri, 17 May 2024 06:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gUq0dltKXljTT+k5BGcJEhu4T9Z0ON1mMfhMndXWQn0=; b=WhsMivsDjqILhKpcYYxTREaFhX
	qzAZ2Yuiwpf6cIB0T5skDhUdDWhs+Vt36zWcHhRgiQE5zxE6hc4uHSsWQFdpxI3ztk29PAbyjis4S
	HlQLfPex9hkb5Ey3vekmLdbPQ7Ro2/Sl5Wy2y9DjJKP7Fo1xk1vp2bf6ahTbOcTC6vvT9qwlGqcOz
	ODHBjvPfiBpXf26pN+9ob5cSMvge8f/WT6EJn7yZsqqBnl+MnZI32Gqmg+fZKUusN49CXc3ZQPTEK
	LhpKm61+58DcuBxbwAel9cREktbP6lH2rQLJyZyuokVQQD3s4C3Xg2DDel0PS4SSqEuvAjiXjIE93
	eNo+5Iag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7rUn-00000006zkU-1Rsb;
	Fri, 17 May 2024 06:55:13 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7rUk-00000006zk8-22iF
	for ath11k@lists.infradead.org;
	Fri, 17 May 2024 06:55:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 40191CE1371;
	Fri, 17 May 2024 06:55:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA7AFC2BD10;
	Fri, 17 May 2024 06:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715928907;
	bh=SW3ZvHpjpz+gPQr9MPYdbKfCS55xJrzsHF5C2fLpP4A=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=Ekm0KA1N3po+VN2nl8FSMBex8fDe067oxg0wA6WvdlgUU58un+aV1gF21ycHzFrse
	 eHk/2boT+e2eArMJguHCfklPoa6WgJZMabAf0T2arkdy2uwIkOX2n4cbz5stwQ8g34
	 j4g9t1HYqnhFVvov+MxuBzN6hUg2JS0LM2bp5Xukj3RwBbjvWlltFkpXIoQlGp7nMU
	 3k3RMri0gA+wPzyiPd7riO9xOkKMTD6CQMX7YrMjB9XA+iMK3lrSFrFyVXzD4mh6N8
	 a0L0WeIXt0S4znk4ICduCdvMDTSenLJRPct99xMhXuIIZr38cMNaAsJlQ13q9bjxWs
	 krm+GumiOio+w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH wireless-next] ath11k: Fix error path in
 ath11k_pcic_ext_irq_config
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240508185902.70975-1-leitao@debian.org>
References: <20240508185902.70975-1-leitao@debian.org>
To: Breno Leitao <leitao@debian.org>
Cc: horms@kernel.org, Jeff Johnson <jjohnson@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org (open list:NETWORKING DRIVERS (WIRELESS)),
 ath11k@lists.infradead.org (open list:QUALCOMM ATHEROS ATH11K WIRELESS
 DRIVER), linux-kernel@vger.kernel.org (open list)
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171592890381.3197586.18328283621008534575.kvalo@kernel.org>
Date: Fri, 17 May 2024 06:55:05 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_235510_765128_FE826198 
X-CRM114-Status: UNSURE (   7.53  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Breno Leitao <leitao@debian.org> wrote:

> If one of the dummy allocation fails in ath11k_pcic_ext_irq_config(),
> the previous allocated devices might leak due to returning without
> deallocating the devices.
> 
> Instead of returning on the error path, deallocate all the previously
> allocated net_devices and then return.
> 
> Fixes: bca592ead825 ("wifi: ath11k: allocate dummy net_device dynamically")
> Signed-off-by: Breno Leitao <leitao@debian.org>
> Reviewed-by: Simon Horman <horms@kernel.org>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-current branch of ath.git, thanks.

637c435f08ea wifi: ath11k: Fix error path in ath11k_pcic_ext_irq_config

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240508185902.70975-1-leitao@debian.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches



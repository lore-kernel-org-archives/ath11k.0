Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4AF6C27C65
	for <ath11k@archiver.kernel.org>; Tue, 11 Jun 2024 18:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B/5P7EW5Dto4SAKYyQgcaH+3N9X60mX7HaD0PNzwEW0=; b=4OGm8LpBM3KX8vOLUryEMczDw0
	CGbq5em/Hy52hWuhyh1Aqid2DazLRqLvCNVM/GdXoUjvLj+q0vEMXTebHFG8dmihtaWJGmmVmUU+J
	31U9smBqP3sHTXjX5BCqG5UDf6KYs27928n6Z9LQRs6u8q1frZwQrH84fceKDws/b6Ilnv4Jdsa00
	HM6ffeF+wjN4Hko1MUmNsxEUiCXm3e89PKsYQKvwj0p7+iMSd0gLj4x/LGAhjjXMMNGb0BOiSxHPX
	uFn56svF9DjZfIx3uu4iuG7snzJ1fQcRkK6StP2vJfkn3JZyA5Ue6A3qfp7KoaCgBDKaFHRS6l5AE
	fVB/gdJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH6TC-00000009sqe-2j1g;
	Tue, 11 Jun 2024 18:43:46 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH6T9-00000009sor-2ZQZ
	for ath11k@lists.infradead.org;
	Tue, 11 Jun 2024 18:43:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id ED3B3CE1D75;
	Tue, 11 Jun 2024 18:43:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F091C4AF49;
	Tue, 11 Jun 2024 18:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718131421;
	bh=RK5lFeShPdN2/t41StVtrCf7E+vf0TXH4AeWM81OjIQ=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=a4Iwu+bFQFRgi132I29iD7u5eRfPfCk7UcR7slPAZImjNQaFGhVuME/2WvatElvvY
	 aLomAoSru4gVcCOBO3Zx1nwNYsdtnJPaqZ1Oyy1XIw/OicqDXyQMSnegclNBYk6ygp
	 D3fE4bDr7NozfWluL1lB5xLCO1nKeBWS+3U21+jzH2MWMOGg5EqDwwBig655n6evjj
	 NyJ9YiHrXaU3FqSOOBDoanXsd5udksPMrt9IdUagvRUd2Xk+zpkro1hRJZnJXJNnpu
	 BGbdn7VY9rQzzIzMn5DUymB+kcVg2kfCBa0+v4SCoxZ0bCGiEPQUZImqJVqpHk3koJ
	 5ulZtOVXlerOQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] wifi: ath11k: fix wrong handling of CCMP256 and GCMP
 ciphers
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240605014826.22498-1-quic_bqiang@quicinc.com>
References: <20240605014826.22498-1-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_bqiang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171813141843.3564613.12568256142700301980.kvalo@kernel.org>
Date: Tue, 11 Jun 2024 18:43:40 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_114344_134070_AB922073 
X-CRM114-Status: UNSURE (   7.97  )
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

Baochen Qiang <quic_bqiang@quicinc.com> wrote:

> Currently for CCMP256, GCMP128 and GCMP256 ciphers, in ath11k_install_key()
> IEEE80211_KEY_FLAG_GENERATE_IV_MGMT is not set. And in ath11k_mac_mgmt_tx_wmi()
> a length of IEEE80211_CCMP_MIC_LEN is reserved for all ciphers.
> 
> This results in unexpected management frame drop in case either of above 3 ciphers
> is used. The reason is, without IEEE80211_KEY_FLAG_GENERATE_IV_MGMT set, mac80211
> will not generate CCMP/GCMP headers in frame for ath11k. Also MIC length reserved
> is wrong. Such frame is dropped later by hardware:
> 
> ath11k_pci 0000:5a:00.0: mac tx mgmt frame, buf id 0
> ath11k_pci 0000:5a:00.0: mgmt tx compl ev pdev_id 1, desc_id 0, status 1
> 
> From user point of view, we have observed very low throughput due to this issue:
> action frames are all dropped so ADDBA response from DUT never reaches AP. AP
> can not use aggregation thus throughput is low.
> 
> Fix this by setting IEEE80211_KEY_FLAG_GENERATE_IV_MGMT flag and by reserving proper
> MIC length for those ciphers.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Reported-by: Yaroslav Isakov <yaroslav.isakov@gmail.com>
> Tested-by: Yaroslav Isakov <yaroslav.isakov@gmail.com>
> Closes: https://lore.kernel.org/all/CADS+iDX5=JtJr0apAtAQ02WWBxgOFEv8G063vuGYwDTC8AVZaw@mail.gmail.com
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

d2b0ca38d362 wifi: ath11k: fix wrong handling of CCMP256 and GCMP ciphers

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240605014826.22498-1-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches



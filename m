Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B12DC48BEF
	for <ath11k@archiver.kernel.org>; Thu, 15 Feb 2024 11:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KxCUAoAbmNxfjIrHQ5Hkpqn7Xwk/idTJpeBwzF+HfWQ=; b=snMo0RH7PgLJGvjQhcDzYOwM5j
	/NaTNvI3e1RTdXH7N9qEkTAplfHFBHsSaIiAI8AUWtP/79yTFlKiRyB4dPMji/3tPrc2Jjnb9gAlV
	XLQQkMKNI1i8VPzqv7d0gtz2XdsbYQ6ULDGdnk9WH5oUnMCX03JhmBaTibIZpJy8zK+matzBo+j0W
	hB+GoeuwCGP+fkCeNiIr5gnmLIJnvee7M3xCHNmtiQm/DzQ0UKeDeipFptxRWjNJBWZO6SGbw1jXf
	qiEDEWPQoFg68WYwsOquAHAtjdYzVzyWxo+Bz+NY138lDNPGzeTZWVD+cfa7Avas9x0wHL0SSEMOH
	wcu/XCwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raZpu-0000000G0s3-0qeO;
	Thu, 15 Feb 2024 11:23:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raZpq-0000000G0rB-37D5
	for ath11k@lists.infradead.org;
	Thu, 15 Feb 2024 11:23:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CAA8D61D09;
	Thu, 15 Feb 2024 11:23:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A93E4C433C7;
	Thu, 15 Feb 2024 11:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707996201;
	bh=C6N3/0wDtLwXR2sls+yfk8OM9K0bXFSbUJdhXTIGiio=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=a1fh7ZBmGtPpE82FyDq9nxpbueQQohdFqDif/jHUAMNjH4Piwx4+4HY2r5utCj6cx
	 FZOC8RxDfExSJVeh5kVc16dpbZqeLHZ6D1qzLAM4JZ7kOlwKX14W5LTt9FChEhvyJJ
	 eVWsql3kmW0ueKjAH1OHsYMWAEo9gAIFhQkZ3j8Dp61/JfKKFN/uRGKjzpfkyQhgRY
	 shFcAiarBoPOQbMWjYHu3CVKvI1W3oVCi3VEuLnkd1tm7zO0zbKuY+yJenMuMjbWYZ
	 zTa5A33BujfML7he9yG04bPKyR1eARqTS0kPgZqYLLGGC6L9jZ6N0cSbAUqCrCDV2I
	 /lZ8CD4Jhxmjw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/2] wifi: ath11k: supports 2 station interfaces
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230714023801.2621802-2-quic_cjhuang@quicinc.com>
References: <20230714023801.2621802-2-quic_cjhuang@quicinc.com>
To: Carl Huang <quic_cjhuang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_cjhuang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170799619862.3860606.4011867869809767711.kvalo@kernel.org>
Date: Thu, 15 Feb 2024 11:23:20 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_032322_859527_4CE6300F 
X-CRM114-Status: UNSURE (   8.63  )
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

Carl Huang <quic_cjhuang@quicinc.com> wrote:

> Add hardware parameter support_dual_stations to indicate whether 2 station
> interfaces are supported. For chips which support this feature, limit total
> number of AP interface and mesh point to 1. The max interfaces are 3 for such
> chips.
> 
> The chips affected are:
> 
>  QCA6390 hw2.0
>  WCN6855 hw2.0
>  WCN6855 hw2.1
> 
> Other chips are not affected.
> 
> For affected chips, remove radar_detect_widths because now
> num_different_channels is set to 2. radar_detect_widths can be set only when
> num_different_channels is 1, see mac80211 function wiphy_verify_combinations
> for details. This means that in affectected chips DFS cannot be enabled in AP
> mode.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
> 
> Signed-off-by: Carl Huang <quic_cjhuang@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

f019f4dff2e4 wifi: ath11k: support 2 station interfaces
24395ec11707 wifi: ath11k: provide address list if chip supports 2 stations

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230714023801.2621802-2-quic_cjhuang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches



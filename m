Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA04C433F5
	for <ath11k@archiver.kernel.org>; Mon, 21 Feb 2022 10:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xmjeDqK3V7wU4rrQjQQhJBns+ASfEAWy70fUF/Vbv14=; b=m9oz7BpvHlVarM
	FpKrAPCuwd+5dBQnSKjYzC7jctX/O24Levr8UsK8zgmtdGVuhdCyj7etUqmSI4zIV8gIWeTIyVj/7
	4PGEVAwws0fSDVC/O5Zb4R4LhaeTUhZSvqT89F4l4zjF4fZihVx7cBUVh1mhu4yl3TIFYaWgv262i
	25mI51ALTs0L+A2/9DzgNT1QhwAxIL7S9dxg/frcQHTGCnbN/yif92SQrXa+luDg/fmPZpOLb7FWY
	kVDrPJRoDC3MMqsdUj8ohau79WxfwqhFO8HE1JHpbNbKS03CbiqLpKxz4VecvSPzsbeFaMmhfriuj
	KaGtzOXHz9T3We8DVv0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM6EQ-0055Db-G2; Mon, 21 Feb 2022 10:47:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM5aI-004luU-PV
 for ath11k@lists.infradead.org; Mon, 21 Feb 2022 10:06:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BC623608C0;
 Mon, 21 Feb 2022 10:06:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38B10C340E9;
 Mon, 21 Feb 2022 10:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645437981;
 bh=FT0e8Ht5k2q94glinU6HbAj1Aa95MsDKe6+mdPkdouE=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=H3wq1wfdA8lQLYul6bP8asnyX6BA9V58maliPHvk7yE5KEenCk8pREM+gcYRt1nJd
 AzAzyHdJfsj8kHpoPr1FCPo6IWdRIqte5M8McY0LzjA0xtuYCNCT7fnaG6bXLZjYx4
 2ntHbjGUYkZyEE7hdGHeX/sXkXEzPk1i5YWqE/kL4ASigHdhoHeJzi+OYjhOFnz+Mx
 Stv2bxZbYqWtK2Omv3GRpDyT+OSm/F3FdtmE8fSZtybD74xFnjaYW/Y10oaEI14PJL
 nGLy3aOyGXMxaKTAxsaMz2a15NW46yrtmVDdKW/lZM25m2NfbOEgLIekSd+3iU9lZq
 zLHIQEMiGS7XA==
MIME-Version: 1.0
Subject: Re: [PATCH v6 1/6] ath11k: add ath11k_qmi_free_resource() for recovery
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220209060012.32478-2-quic_wgong@quicinc.com>
References: <20220209060012.32478-2-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164543797644.26423.1127777778096359819.kvalo@kernel.org>
Date: Mon, 21 Feb 2022 10:06:20 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_020622_939260_A14311BD 
X-CRM114-Status: UNSURE (   7.01  )
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

> ath11k_qmi_free_target_mem_chunk() and ath11k_qmi_m3_free() is static
> in qmi.c, they are needed for recovery, export them in a new function.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03003-QCAHSPSWPL_V1_V2_SILICONZ_LITE-2
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

3 patches applied to ath-next branch of ath.git, thanks.

5f71968e3c76 ath11k: add ath11k_qmi_free_resource() for recovery
e52b6a02bfc0 ath11k: fix invalid m3 buffer address
03e0add74212 ath11k: configure RDDM size to mhi for recovery by firmware

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220209060012.32478-2-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

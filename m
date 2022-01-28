Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DCDFC433F5
	for <ath11k@archiver.kernel.org>; Fri, 28 Jan 2022 12:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LUhnlE8vK1aER9uWmzEEAFV3QAWn4Kz8+SnnxD5llgg=; b=3hy/sAabClZNGH
	EJmErgvGqTr19L4ib8vULdTUfHPhkm0njIUNeUJvKuuB74ib/73ZwTp71dL5Y/dqbY+PH3vDaU+rU
	VXFSsOv1IoRNn2SpO5MtvpGZ9Cboeh9L44ZGp4PQ9uA/13smLpvwmcdc5nuXlRJGqo/wOuT8Fg14e
	658whIVPkTuBXgsWOuMKQgt5vVrH8lICJ1XD1Jaz4AayQCaHKk5z+T1sfYdclebdp2YrhDTAuAvp6
	LtfWewIt2jzaJDjuQCWjQlt/1TAdSvYwNUt+wDvZJ0Z19k4LnD9siMoT32lOsekj8bIDWzWfGlRip
	HXH2W2tv8evRCzg/3vwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDQdh-0023Lv-0k; Fri, 28 Jan 2022 12:46:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDQRj-001yhz-U7
 for ath11k@lists.infradead.org; Fri, 28 Jan 2022 12:33:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6A7ED61B08;
 Fri, 28 Jan 2022 12:33:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB721C340E0;
 Fri, 28 Jan 2022 12:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643373222;
 bh=oG8gDDpka20GtbCIqwZ9VlLsUTtrPGOprKqV9D+rH8M=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=aK31KYs+3hC0Pg5hp5VYCRLTqBz/fHNKYxrxisEuNyaDJD4FVnCsITPbJUxZjDA6X
 fK2NwejzLxvdipQm+Seo9jhpDW1O7yqlzo6TTCViG3is0QM1sSrlZxu6FFINpYHA94
 Z2SzsU/st+psG41RhbIdr+GhlBALBOKJCc5RkCPnhsOQ07b3s84+N0Wg58aLGDAKEQ
 p/BqgFY3qU7oQwJgMbFYJt1PqARaYVvvvMuk/IsulARsRxI2T7df6jBMAY2gIaVC3L
 LyPi/+wFeZKbn20oZvbDzaa0Tdrdhw2JTV+yafJYg5qUVU3+jNABYjJ6WKt7bfEd3D
 UiL56HdD89cdQ==
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath11k: set WMI_PEER_40MHZ while peer assoc for 6 GHz
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220119034211.28622-1-quic_wgong@quicinc.com>
References: <20220119034211.28622-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164337322019.4876.12031068891666275250.kvalo@kernel.org>
Date: Fri, 28 Jan 2022 12:33:41 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_043344_070366_CEB54460 
X-CRM114-Status: UNSURE (   7.41  )
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

> When station connect to AP of 6 GHz with 40 MHz bandwidth, the TX is
> always stay 20 MHz, it is because the flag WMI_PEER_40MHZ is not set
> while peer assoc. Add the flag if remote peer is 40 MHz bandwidth.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03003-QCAHSPSWPL_V1_V2_SILICONZ_LITE-2
> 
> Fixes: c3a7d7eb4c98 ("ath11k: add 6 GHz params in peer assoc command")
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

1cb747192de2 ath11k: set WMI_PEER_40MHZ while peer assoc for 6 GHz

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220119034211.28622-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29692C433EF
	for <ath11k@archiver.kernel.org>; Fri, 28 Jan 2022 12:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vHUCy5+22da0uocXFDFuBrFxR36facRycx9AcKJmDEY=; b=u5dbMlZAUps8Eh
	A9DnvxouqQ2QNQIa1K0QOwMWU/UdR4oao5GQ8DxU9KMnwvTbd5vxdNOgAUlMcEMM7MgzXEMsGmszm
	mSIBeX8ZfTluYWqL+8k5vPOGU/c4AW0Xjg6ifacO575DK1488Q3wZYQlicexCoAqF9biVTdKXTr+1
	hmS5NVZQQycsH6z4VNquSsam0u9qp9ogO28FoWfUT8zo4HEDRKX+vJY4cEIATGNtaLT+Kk/XLJ9fk
	soqH1hKJAjNDy4ravo1pnIRUrmv5GhQkpL0oUoqc2cyQW8OSAPa+gXS/MIcs3mO5HnriMEQ94YjYi
	zFjP5zd+RbCKUnrSh/hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDQfG-0023yO-Qo; Fri, 28 Jan 2022 12:47:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDQUb-001zjQ-3x
 for ath11k@lists.infradead.org; Fri, 28 Jan 2022 12:36:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8CF8761B14;
 Fri, 28 Jan 2022 12:36:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DAFAC340E0;
 Fri, 28 Jan 2022 12:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643373400;
 bh=p0mR1n9ytCzDF6gknLkijc6pYipo5egtlddRvfLC/ro=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=sdFlzZFXR5OFDCuMAuV6YwEqjwooa0geVyu4ny2HTFUbZX4FyDCN71pTYSFmOYKLy
 H0WaVSzs2LC1B1frcx0eD77iJQ/JTR9vTYVcOFMX1j1XYamnjJlJVfPyZMni5i/WDB
 unzxCQmvOd2h7riNbnNVaciZRrR6B0/koGhmAAHbkzljvYpTvpZ5jItA74b1tQcjLe
 +0PIsjpcURMlRVRAWtedP44ZbdxRDg1Z08779k05fwwzP9Cp0tdq63sfxxFfhx+UBg
 L8fbc6Z1jUK2GGfffLLI0hFvWRamSd+tXnvZAvQ0ud0LrUbZ5LGaX0NuQT64WzPjsY
 Ie6MrY3CippWA==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: avoid firmware crash when reg set for
 QCA6390/WCN6855
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220119041355.32014-1-quic_wgong@quicinc.com>
References: <20220119041355.32014-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164337339737.4876.9836049185308281740.kvalo@kernel.org>
Date: Fri, 28 Jan 2022 12:36:38 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_043641_300235_33F95E0E 
X-CRM114-Status: UNSURE (   9.69  )
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

> For the NL80211_REGDOM_SET_BY_USER hint from cfg80211, it set the new
> alpha2 code to ath11k, then ath11k send WMI_SET_INIT_COUNTRY_CMDID to
> firmware for all chips currently. When test with WCN6855/QCA6390 chips,
> this WMI CMD leads firmware crash.
> 
> For AP based chips(ipq8074/qcn9074), WMI_SET_INIT_COUNTRY_CMDID is used
> to send to firmware, for STATION based chips(WCN6855/QCA6390), it need to
> use another WMI CMD WMI_SET_CURRENT_COUNTRY_CMDID.
> 
> Add flag current_cc_support in hardware parameters, it is used to
> distinguish AP/STA platform. After that, the firmware will work
> normal and the regulatory feature works well for QCA6390/WCN6855.
> 
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03003-QCAHSPSWPL_V1_V2_SILICONZ_LITE-2
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

0d6e997b7621 ath11k: avoid firmware crash when reg set for QCA6390/WCN6855

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220119041355.32014-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

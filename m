Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E5D3C433F5
	for <ath11k@archiver.kernel.org>; Fri, 30 Sep 2022 06:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zqMgd7iFxul6Y7rKVtdowR3BfOheuKGm3n1BxtYklKw=; b=NEdxuf6aGgIm/Q
	+VsAeDYjX/Q0YRfebAdf7HTXpUCww7tDzho6N8CcWyRDbtwx6tuXTH2Jl0INSmZ5qvGl4O5wJbI5W
	dBKx+pKrojaqvq2ItmcXFNAJki2IZXQwImqt4DcC+5q3MK1WWN8YPiRiIKpgnZGjxLK6gZINAb3w5
	z6ENmIU+d8V30Li2cl2++irR/e16YTMFY0kn+NX8f3uK67Nqb7ntULuvfXrFPWrY5N2ANN9p87h+d
	4BCTERVwpkZyYLPuYdFphHsTKX3Eo6q3+/LxnJFr1HoeWpuE3U/wZkbbJGrUg7aknc8u251Qf6Z8l
	6/h8z5H2iGC79cMUNPaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oe9aK-007XHr-MW; Fri, 30 Sep 2022 06:33:20 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oe9aI-007XGX-3d
	for ath11k@lists.infradead.org; Fri, 30 Sep 2022 06:33:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5F354B8242D;
	Fri, 30 Sep 2022 06:33:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 532F4C433C1;
	Fri, 30 Sep 2022 06:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664519594;
	bh=AjE9ttVTxQyrvvGBjQ3K8rHuqcgBsgTiY5i7Op2lqCk=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=bDJJnYEqYzM4l65RDTROm+w8PISHo921Ac6jWMvAarrMre1y3XGMVkt3JS629UAxx
	 VwU/rZ8Z7ZNC7S2ikUdOXGTkxe0fOZ4m6LuwiY2jDdXuh7DoLFwL0lCVoSP2MSWwT6
	 oJSftY0DVGukgk/S9lbFfTkPgnIp6nGZtZE6qtQfu8pXj3QNjeycpL9vPMLy3SePyi
	 w8BI5IOB7TXo+a5z3aVdDtcS+JKkJ3LKcfwIF2qOVKd4xkdtN838QQBHWVt5QCBjTn
	 J9nQ0Nqvi5u2ADHM5JRWLlCid7HMwBTexGVjwyKtW0CCjJXqt+abEioOZYCLjTB+gR
	 byspQAAaE/hBQ==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath11k: Don't exit on wakeup failure
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220928015140.5431-1-quic_bqiang@quicinc.com>
References: <20220928015140.5431-1-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166451959112.6083.18119896187567020828.kvalo@kernel.org>
Date: Fri, 30 Sep 2022 06:33:13 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_233318_327735_264A3EBF 
X-CRM114-Status: UNSURE (   8.87  )
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

> Currently, ath11k_pcic_read() returns an error if wakeup()
> fails, this makes firmware crash debug quite hard because we can
> get nothing.
> 
> Change to go ahead on wakeup failure, in that case we still may
> get something valid to check. There should be no mislead due
> to incorrect content because we are aware of the failure with the
> log printed.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

45d2e268369b wifi: ath11k: Don't exit on wakeup failure

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220928015140.5431-1-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

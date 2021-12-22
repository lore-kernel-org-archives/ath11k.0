Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC8BC433EF
	for <ath11k@archiver.kernel.org>; Wed, 22 Dec 2021 06:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LE7lRYb02eQHGx6O/7nzobEFtqKSBN4dTJ3WwDP3Y+Y=; b=WiZl2QxsI2gG8X
	E8BGSnWjcFTpAbxSLrFfGrP2sGqh6TOZIGx15ao7AFJ40UlA6HyC2+227LtajrXnxpyF6TqM6ttpR
	pCrKz73cbaCU5fXn6+ez8Pm3OySCQAyjDCYKX+zYgknG0pOY3eiziVJpJL6n36yj3TEU8FAlHuuO+
	fxYN9GknVSe84KzC1uTd6S3C00vo9LeTaOjh1LFmCr7ReEJVi88zJPQUDHx86d/rDcquaUlpkXqMC
	A8PpnNx9Fz4WYDda+sKOAq/FLTpIlGQxyjAnepa47aFMHLJPNAccLny0JWm1oyOEsOmtDUd5m5CG+
	lfNoaiRAUcO3f9+I/M4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzuil-009Ii6-MI; Wed, 22 Dec 2021 06:03:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzuii-009Igw-4x
 for ath11k@lists.infradead.org; Wed, 22 Dec 2021 06:03:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 74EC1617EB;
 Wed, 22 Dec 2021 06:03:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E35F9C36AE8;
 Wed, 22 Dec 2021 06:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640153002;
 bh=PlsFc8W7aK+8N7MO3x46ipD5VZxjQyDnFawGUFk0RYA=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=WOOIgTpKTfRyxKKdKskgF5p1x2+FVjd0OUiQPTOvEcXurgbI1UKoYh5Rqqk2AJ4Ic
 JIPWUlCBE1YSIZZisj0klrYRzfI31q3yn7YwhURgxyUgrXkfbYPIWv+kH1NG+XfwrK
 yS54mqz8Uk5/cDwtLAZKMFwpLkgXtllEVA8pNPRg19NjFUOcoyFD3DhYjCkE+Jq6Zx
 SKBwWmoD2MtDlIpAQX0E9UMkijhCAVGWu94sz7MDVc+ttbG0jEnLFCqu/b0Biza9SP
 CZjzlIPhUmcb76bui4BVI9bwKz3YwzrpVpF8Vrk87t+lXkrP4PSjHqMN2+tzwJTPaC
 ZkM22nu8zvT0Q==
MIME-Version: 1.0
Subject: Re: [PATCH v3] ath11k: add support of firmware logging for WCN6855
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20211220121053.357087-1-quic_chengwan@quicinc.com>
References: <20211220121053.357087-1-quic_chengwan@quicinc.com>
To: Cheng Wang <quic_chengwan@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_chengwan@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164015300023.20356.3611729757458723636.kvalo@kernel.org>
Date: Wed, 22 Dec 2021 06:03:21 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_220324_424285_2A5F4CD0 
X-CRM114-Status: UNSURE (   6.72  )
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

Cheng Wang <quic_chengwan@quicinc.com> wrote:

> Host enables WMI firmware logging feature via QMI message.
> Host receives firmware logging messages on WMI_DIAG_EVENTID, then
> sends logging messages to user space via event tracing infrastructure.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> 
> Signed-off-by: Cheng Wang <quic_chengwan@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

42da1cc7bd53 ath11k: add support of firmware logging for WCN6855

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211220121053.357087-1-quic_chengwan@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

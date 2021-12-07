Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 481F2C433F5
	for <ath11k@archiver.kernel.org>; Tue,  7 Dec 2021 15:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rVrDX4Pz+m56Yaul8vkjg1Cej49t2cWYu2vrTx2bAts=; b=GYel943EG80kb/
	rZ7GEJ6WMUjDu3FzaIIhBEvFwe3+si1MZZAzk/GV6Ai91RQLqTz8Y+RjWOU9ZXvq3gChZ105qOnbJ
	ADJH3y/QBvk0KF4UUi5IidH1KKMnWmI4H7vclT/jSlsRrhk8nH/jCG7JlEWPpbPUysFjrzafzNLRO
	jjhOsEDYDlH3+CYwEFU//qUvmCJdLkbrSwPWs4/4RQh9No0Of+a81qPduDOLRAq+yiVO75rnwFCGC
	kURY9GltC9A0FiPc6AZUjk0745kW/GTzk4NT3Z+erqSaaQFty9Lf0/nYnhBD5RhQTZSlp7x6ee4Z0
	YLGR1kBmY1bw74Zzf9DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mucOs-009Dil-6e; Tue, 07 Dec 2021 15:29:02 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mucDv-0099p6-GI
 for ath11k@lists.infradead.org; Tue, 07 Dec 2021 15:17:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 9ED88CE1B1C;
 Tue,  7 Dec 2021 15:17:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A71AC341C3;
 Tue,  7 Dec 2021 15:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638890259;
 bh=oSFI12w9GF8Up8bhsLXI4q0Q8nILHFuyvJMfcRNsC08=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=RKoPwrANetU/rG28CyI0ZuBKI8ePQSOfmOAzeMO20IpCVlEIF9t7Lwh+T1ZSIYhS/
 d7cvgq+WZxyh7mB+a2PLEdeWSiaLChHkC5WlrPFLUmVUR9nW8NaeKQvgEKBujOhy1k
 keYVNX6Mf1qM/J3ya8gQ6rvONRqgq7S/PHhwNfgIc6D7unY6Cu+n5lALWjy1R8bIMv
 2wxG9ATbwswJ2Ds+eV7AQgg4SZ3NpnugB88H6SIBLSZKA+EegE0cNfHRLH/vErhWhW
 jTiQGzlWV0BKBmbyknlh3FyL3W77uq4CydRpboytofVEaB0H8yb6pwsHwRP6aUXcbD
 F8rCQfYE9Jwrw==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: add support for WCN6855 hw2.1
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20211129025613.21594-1-quic_bqiang@quicinc.com>
References: <20211129025613.21594-1-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163889025741.23771.2385053244216172509.kvalo@kernel.org>
Date: Tue,  7 Dec 2021 15:17:38 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_071743_815666_6DA3D30D 
X-CRM114-Status: GOOD (  11.79  )
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

> Ath11k fails to probe WCN6855 hw2.1 chip:
> 
> [ 6.983821] ath11k_pci 0000:06:00.0: enabling device (0000 -> 0002)
> [ 6.983841] ath11k_pci 0000:06:00.0: Unsupported WCN6855 SOC hardware version: 18 17
> 
> This is caused by the wrong bit mask setting of hardware major version:
> for QCA6390/QCN6855, it should be BIT8-11, not BIT8-16, so change the
> definition to GENMASK(11, 8).
> 
> Also, add a separate entry for WCN6855 hw2.1 in ath11k_hw_params.
> 
> Please note that currently WCN6855 hw2.1 shares the same firmwares
> as hw2.0, so users of this chip need to create a symlink as below:
> 
>         ln -s hw2.0 hw2.1
> 
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
> 
> Fixes: 18ac1665e785 ("ath11k: pci: check TCSR_SOC_HW_VERSION")
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

d1147a316b53 ath11k: add support for WCN6855 hw2.1

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211129025613.21594-1-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

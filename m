Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E31CD13CF
	for <ath11k@archiver.kernel.org>; Mon,  2 Sep 2024 16:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=39BO5qVfmiJKIS+zvSbvu7px0pXsPIdr+AhYzPy7LP0=; b=AbK0xgqXGvLC1nJBzL+aolkRzV
	Geiy6g5tXWgpKWDL5a+IxntRuLBF4CQ1lHwEdy1BXeQ59K84VHLNbFaioi2wBCr4FT8ierQSEDnYY
	xxBGCYwKbSuhqGlH7rXQQthRjlXYo7csj7QWgqWw+y38X8MtWQuQVcKYxvEddQWZBtKvvGMwNIPx/
	vVQcSoShvUQLy4TjpUWbI19r1HKovsC6ni31YohrlAIqkCrwu9m8ogdFbHAwrmKFquCoJvmTGdS4J
	qnSBP0Mu2X7VqfJITwucZS2vm3Rdd/Y3QtM0PDl2B1hoRCFP5xPwUioqBhrot5Gl6IMNPNPitRCXI
	yD2B6beQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slA0F-0000000F2A7-0JRs;
	Mon, 02 Sep 2024 16:34:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slA0C-0000000F29e-2BvM
	for ath11k@lists.infradead.org;
	Mon, 02 Sep 2024 16:34:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 330C25C57C9;
	Mon,  2 Sep 2024 16:34:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54C47C4CEC2;
	Mon,  2 Sep 2024 16:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725294843;
	bh=R99Yspo7qOwlFSyFpIa+UsYtg9P68MkPvx+vhVddyws=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=f9pS7vGJ/o/s1cQulEoXL3o+oUI2L7M6W3+CweuibcTxV2k7ON+o7FwXFmy7TMwFk
	 Cn08IGWPbsGtf5VVx0ufHpny0cB668whEkyVHF3T5YBAocajKN7kf4i25ScnzU5b/G
	 ibrO5z3dCFYSHy71wOXACL2tVpfGR2ZXCxMETdxhBTpKooncRBuRk8qDJ38ORpP55V
	 KU/SzGvz76ThAO9fYUOnKykSbsZ875dMLR5FX2zuEc5MV9KsG2lai2Tp18c51+CPbh
	 bk/F8j+VrMFxDDU86JKvxO/UDx+6zCtnBpoojf81zKVtUWsjmvBfAEgNgsSs2P7Kl5
	 Zm2gY1PYVVLiw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH ath-current 2/2] Revert "wifi: ath11k: support
 hibernation"
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240830073420.5790-3-quic_bqiang@quicinc.com>
References: <20240830073420.5790-3-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_bqiang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <172529484025.723394.135704024474690225.kvalo@kernel.org>
Date: Mon,  2 Sep 2024 16:34:02 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_093404_662820_76397EA8 
X-CRM114-Status: UNSURE (   6.65  )
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

> This reverts commit 166a490f59ac10340ee5330e51c15188ce2a7f8f.
> 
> There are several reports that this commit breaks system suspend on some specific
> Lenovo platforms. Since there is no fix available, for now revert this commit
> to make suspend work again on those platforms.
> 
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=219196
> Closes: https://bugzilla.redhat.com/show_bug.cgi?id=2301921
> Cc: <stable@vger.kernel.org> # 6.10.x: d3e154d7776b: Revert "wifi: ath11k: restore country code during resume"
> Cc: <stable@vger.kernel.org> # 6.10.x
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-current branch of ath.git, thanks.

2f833e8948d6 Revert "wifi: ath11k: support hibernation"

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240830073420.5790-3-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
https://docs.kernel.org/process/submitting-patches.html



Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40DB6C52D6D
	for <ath11k@archiver.kernel.org>; Tue,  6 Aug 2024 07:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7O9Ss9mU4VrrjF5P5RkN3EUik/h0EJYRWalLiaSe5J0=; b=c0Sqi8Yn29lOC45H7bW2PVGYCq
	YpjSQ8mrU1I3rNqQpnFpXIgEyB7LBK2Ap0jTYL6ZvPeDZRpL3gURsODu9td7IT50X0KXDcFQA3BL7
	2M111H4KDk9TN6StWD/KdGRT5eUqQkLLUGJ80WJzk57Jg3KdRd1mVqyQ8Kgingh/BE6ir5JtdZ1Zs
	YyJHDJ+bj4Vr54O9dN0DdOX480YHKJzlO/pblz5mikGF3yzQVhznK0EKJfCS96TQhVhsciIfyjKbM
	nQ+0czWzeLDvddA6o3+EmsZPowASmY8U4ygHxgzB5SQ+tbPwfdXtI5n5MRKzOOM4NP2hxLxGx9ra8
	Bnm91s/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbEtP-00000000pjF-0L6K;
	Tue, 06 Aug 2024 07:46:03 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbEtM-00000000piQ-0fGp
	for ath11k@lists.infradead.org;
	Tue, 06 Aug 2024 07:46:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8A99BCE0B2E;
	Tue,  6 Aug 2024 07:45:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC2A8C32786;
	Tue,  6 Aug 2024 07:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722930357;
	bh=1evXblcSYvb5qmHw2FupWWsp4jq4UbWaaxs6X99ERLg=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=JQfA+6N+K3aNud0gxxGN8p+XxG1gAUILNnkbhe2HtJGHwiPzuo27N4kRaM8t2Q5YC
	 EsoOtQOF6t9jypWEkZ0brn2BVRCb0jNDqWKg8NYNo1Kw723IlA0xZXsvgCddJ+cxQw
	 lM0qDgxfGJKKNQd9Z4qlLJ4X1wyEo1nUCS8BvwMA0BbLwzZFAhrQGpfa6vIgr+8Cv1
	 wmcuBI0k62Bb0+wOkVOOgURzk1fxlS4WW9PNKtDWXCEK1EUoVVSphx8dhCm8Z3CoBY
	 B1gIagT5QNp8RNIErhi04XSwugygKvKmAV43bVFmrRGlxo8gj6NMWM6Qm2mHwgchFF
	 PUqcNIPNSEkmA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath11k: update proper pdev/vdev id for testmode
 command
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230424092420.12794-1-quic_rajkbhag@quicinc.com>
References: <20230424092420.12794-1-quic_rajkbhag@quicinc.com>
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
 Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <172293035522.3540390.11633694817898356836.kvalo@kernel.org>
Date: Tue,  6 Aug 2024 07:45:56 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_004600_409299_B4B71BB2 
X-CRM114-Status: UNSURE (   8.20  )
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

Raj Kumar Bhagat <quic_rajkbhag@quicinc.com> wrote:

> From: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
> 
> User can extend test mode command support to set vdev and pdev params
> for debug purpose at run time by sending vdev/pdev param set command
> through the testmode command interface.
> 
> Fill the proper pdev/vdev id in driver since, pdev/vdev id details may
> not be available at user space. It will make sure that the proper
> vdev/pdev ids are sent to firmware.
> 
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> 
> Depends-On:
> 	[v3,3/4] wifi: ath11k: factory test mode support
> 
> Signed-off-by: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>

Please rebase.

error: patch failed: drivers/net/wireless/ath/ath11k/testmode.c:250
error: drivers/net/wireless/ath/ath11k/testmode.c: patch does not apply
stg import: Diff does not apply cleanly

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230424092420.12794-1-quic_rajkbhag@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches



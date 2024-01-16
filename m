Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A8AC47077
	for <ath11k@archiver.kernel.org>; Tue, 16 Jan 2024 12:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8wQHJwT/hCQrIyZ5bVn2vJcmKvSCnN6MMfC69IyOF6Q=; b=Qbw0looftz122tVohfIX6UkNLg
	5t5j4I17faJHsurodH0aaP4Y54VQrLrDhimhWf0bWd1c1Mu4nhmQUVi/5rbRB6CNeDA3w3fmdLSbN
	SrEoioWrn72aOx1Dona+Mrhr14bZSnhF9Pr6YxtBdN/+LnBUQ2clzz47Bx5HSibgxy/KDZOqW6cx1
	q3v4NHyaCugz9u3j0Px1kG5dssqZKP0Kkq+O9kA9OxBaUQa8qnyc2FDmGfVgwDWZ9W9B6iNnIucCQ
	aD2dy5l8qM37HPRAsP85ZseNRxZAmecJibjxwetwjjAzKxCzAb2U93cdashfSmt0g1qJIZbwvW3gT
	pERiaahA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPiTD-00C41P-2c;
	Tue, 16 Jan 2024 12:23:07 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPiTA-00C3zp-1b
	for ath11k@lists.infradead.org;
	Tue, 16 Jan 2024 12:23:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 39B6CCE180B;
	Tue, 16 Jan 2024 12:23:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74FD0C433C7;
	Tue, 16 Jan 2024 12:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705407780;
	bh=qJeF0QupdVph/4ADySJ3CnvcNj7AZtCl9Ege8tvHEP4=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=MMximzzAL1Md58R4H797IpGCcSTu/ZbQaD59DXfXyddUllmq/fE4Z3vVuE99GpbCQ
	 6ZA9ITo3/HFGvvLrGgz57/e3uCDs2+1JIkbMT2sr5ufHdG1vEtc/gYmmZOW4GZYERK
	 bRWHNTV5tJfT6J4OWTnBseG46bah33FvBH8di9dJRhaau96u56GBjeylmNJmc0Foqe
	 /QVwMWNi+o+rnxZepEOHPMTA/Mu2S4RApw3eNAF+OQIvJllQeI5xLd0oDGclofVDUQ
	 wJ4uX3WBbyM3vOkpZNyaHg9zPbDf17LH2vGVzcBUHs5vdC0S6Rrj9gIL/H9InMThQQ
	 cL8KdKkw2Yybw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath11k: document HAL_RX_BUF_RBM_SW4_BM
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240111-document-hal_rx_buf_rbm_sw4_bm-v1-1-ad277e8ab3cc@quicinc.com>
References: <20240111-document-hal_rx_buf_rbm_sw4_bm-v1-1-ad277e8ab3cc@quicinc.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath11k@lists.infradead.org>,
 <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170540777761.1846129.10373492994129239501.kvalo@kernel.org>
Date: Tue, 16 Jan 2024 12:22:59 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_042304_721248_50D28610 
X-CRM114-Status: UNSURE (   5.97  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> wrote:

> Commit 7636c9a6e7d7 ("wifi: ath11k: Add multi TX ring support for WCN6750")
> added HAL_RX_BUF_RBM_SW4_BM to enum hal_rx_buf_return_buf_manager. However,
> as flagged by the kernel-doc script, the documentation was not updated:
> 
> drivers/net/wireless/ath/ath11k/hal.h:689: warning: Enum value 'HAL_RX_BUF_RBM_SW4_BM' not described in enum 'hal_rx_buf_return_buf_manager'
> 
> So update the documentation. No functional changes, compile tested only.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

9666ad011992 wifi: ath11k: document HAL_RX_BUF_RBM_SW4_BM

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240111-document-hal_rx_buf_rbm_sw4_bm-v1-1-ad277e8ab3cc@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches



Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B527C433EF
	for <ath11k@archiver.kernel.org>; Mon, 28 Mar 2022 11:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ES82BXO7KXt/VgRqCxICOo4D4frxRjOxqUXL11qbP/o=; b=19Fa+X/YPcGhzE
	8njRloU4R1i+h35HX5f1w/tu5SZzhk2zR9iQvae3U5dSv6KBFbDEt1BAMu64vI6UpRytQuSHFpaqT
	JBrSeRdlPDfh3H6WvRpUGz6p0uycTQO4vfIWskM5Sqkg+xFaDQBmvkG/Wjoxkbb6JNy59L/pm5knl
	F0vQ5MA1nD7NTH7YtNEOnseg+62t09T5kZxVazQdU8RgT0OP+px5SAMLkToI4S9MvX9MeuEGpAqut
	Y3CD4/Fo8SOW7GYsFp+FAUSVQpqYUaqg+tMimGR/F1JQ+fdK4iwq6Diot+k2UbwhYroesPqUok8H9
	zVBzYkdgWNlv2poOH5/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYnsv-008Qok-KJ; Mon, 28 Mar 2022 11:50:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYnss-008QnY-LU
 for ath11k@lists.infradead.org; Mon, 28 Mar 2022 11:50:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4072461305;
 Mon, 28 Mar 2022 11:50:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DA04C004DD;
 Mon, 28 Mar 2022 11:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648468205;
 bh=x9eKyuj2KmrT7dFpC0fUVZrekzKi7+BNPmEVT2exOK0=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=hmmJNrjsVxR2lMahV4w1UzWvSzvDm+OY66Y0nIRwp0Szk9qx37wNZHA0gL3US453d
 kctXdoMDRIGLW4HNAq531f9cAjXCX3tT9Q7RjU/l0m4kOk68u1NsopxB5CeqRCubse
 GNkYmN8FWdFGOf0YmZ5nbCzCMnRuJo4Wy0HOtj4ovSopXQUGKdt+x1lJbmbqZMKCiB
 ZiooffZBAlS/PFsX8OZjfIOnMG84xdIbftJB/DSkH+hwOxohhPvzLhXGZZp0tfTphB
 ngMSJp6Qst6nTRyDKMDxeOJ54/AmOifrXZFT7CvFmYnc15kjNpBHOgYhL6HIcprO2H
 79nxoUk0K2XGQ==
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath11k: store and send country code to firmware after
 recovery
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220324011856.11014-1-quic_wgong@quicinc.com>
References: <20220324011856.11014-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164846820213.31335.9001260494172365360.kvalo@kernel.org>
Date: Mon, 28 Mar 2022 11:50:04 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_045006_773099_775F9EEF 
X-CRM114-Status: UNSURE (   8.79  )
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

> Currently ath11k does not send the country code to firmware after device
> recovery, as a result the regdomain info is reported from firmware by
> default. Regdomain info is important, so ath11k also need to restore
> it to the value which was used before recovery.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

b2beae327e03 ath11k: store and send country code to firmware after recovery

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220324011856.11014-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

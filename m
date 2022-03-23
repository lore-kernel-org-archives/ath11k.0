Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3681C433EF
	for <ath11k@archiver.kernel.org>; Wed, 23 Mar 2022 08:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UAhwMzih09zOBrSUTDlx1LdtZKbphE6ld6vD/nVXrpM=; b=F5eg8XA6pcUECy
	hkq+sLQVWRKM+2FIj46oe9rXeeAEjmr6RdYDtc5BXU913YQ6P3Mo2x2ddZGwtqVpjIHRfeCo1Zk+X
	45Ym8AC+/40Jt4obFqBVZ0UOl4lDs3++/8hHzvFLSo0Sru6UnRciAeTP5CXqEud7K76Jn34NgENZ9
	zighXaMerkyt3gmSXBvdccOW9FkRC1RKtrfH5hRejrz0T6RbGAEN190BZn3+CcRsrAgB+Nxk2//kv
	QggjdAkxeskadM9Sierlh1bLvMGlO9sd87e0dGeGznE95UnMbUyrcQrc32IIlI5gYI7YsuYg1Q8YY
	kesU/xljp0nyWsYZR8iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWwmD-00DAB1-MI; Wed, 23 Mar 2022 08:55:33 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWwmB-00DAAb-7a
 for ath11k@lists.infradead.org; Wed, 23 Mar 2022 08:55:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DACE1B81E37;
 Wed, 23 Mar 2022 08:55:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF16DC340E8;
 Wed, 23 Mar 2022 08:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648025728;
 bh=nZ1JgEfV1rqC/sZez7dqsVtQDIRMWneohHn3iaq+qVk=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=LFYmJIK87r8SLQNbik9a4rWTCLSGgz2NfQEbyr72LLVkR+bL120BnlMac0PqfVcnW
 m5wDI+ZizLa1PM8ppgcufujb0As9QrZjF8qjhV1Ynj1l+J7x2HOj2pLju4gua9fTw/
 5EXvmtUFe5x4jkNewc4CRUP8SnAr7uDm7B1Ra196PQ+EsF2lRMO/50gybjzLuvy8Hd
 EexgQEBHe+x3jlTqCLAgqgqLsw1s/0zuvj4UAeq8oGu0cunnpwJOoHY//nDrcVj4ym
 XQ/NXdSYZqeIxzIEs4MXQgPu0mkGtF46jdCPeU6muYTM3fv27FfKCxQWWRJ/pvJiFl
 VLHLkzV34pRdQ==
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] ath11k: remove unused ATH11K_BD_IE_BOARD_EXT
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220319023543.14288-2-quic_wgong@quicinc.com>
References: <20220319023543.14288-2-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164802572546.545.8976809392299986572.kvalo@kernel.org>
Date: Wed, 23 Mar 2022 08:55:27 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_015531_447225_0B0EA03E 
X-CRM114-Status: UNSURE (   7.27  )
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

> Currently ATH11K_BD_IE_BOARD_EXT is not used, so remove it.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

7fb376ad7d3f ath11k: remove unused ATH11K_BD_IE_BOARD_EXT
0c104b6163e3 ath11k: disable regdb support for QCA6390

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220319023543.14288-2-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

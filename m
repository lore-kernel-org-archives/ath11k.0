Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58949C433F5
	for <ath11k@archiver.kernel.org>; Wed, 18 May 2022 07:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nVP2u3bS46IYDcSGzxpSUeMcfAIR418wfGrYPrrG4t4=; b=M9ms2N/4RCOlci
	DIfpPAPLSl4oc0pQTyV/5xFU09uMp2jgvgMIzS+U8kBRtzRFSRGspxuxEEXSYZk+Ya+AnPP0uf86T
	1EyN8ylRVyXozjmlBsb1LGS9niDiAt+Mgvz8r2DMLNYMtBPGaHcw6uRCKFCkDBWlNYjl560aGFePj
	SrVO+cabEn4Wa7+uZqxVWKq0x4imwKn1bQgbD2LPr2MhYMC80pJcnjenkZPMrCAyh9fTJ83OgGs/8
	MgaEsiYJRupC3I4ohX5xsLdVLdBmWUabnGUW6cm02+uL0qUIOuezo1Rb2eRMRClqFLksgv1VZbRfr
	4Rr2oT0uDIPfYLwVf62A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrDrK-00HasY-8e; Wed, 18 May 2022 07:12:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrDrH-00Haqf-8j
 for ath11k@lists.infradead.org; Wed, 18 May 2022 07:12:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C690260FF8;
 Wed, 18 May 2022 07:12:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47554C385AA;
 Wed, 18 May 2022 07:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652857954;
 bh=z/X42d9v4hrwB2VxgYWnDWUJLgsq2SN0xSyewQpjVwA=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=BIA4JbxGS2lM6e1KdXKIG2aazzoTMU4zUsJqo5i8cNR7hZg4cdM7iG4dBrsYkgah/
 Gn1Q2TePFDprOgthiKDbQEmRzy1DQJnwb67DEcfKlOMyBmCWrKKffkVm+8o0hIUQiI
 KCAK43LWFDQyDXEAkb86h9acIS50CgggPJfpPUdFIR2gY969c7WU7NuJ7nXMScWmyL
 fwm3TpY8yoovb91Xt1csQ0KBOIr/7lPHfm4zIUJ8MtW7qp8PBRAul7r7IXQx4bQqvB
 yD+MkVpcO9yja3cIlydtmAvv0kZjUeRRkeLdU5/uM4GJ/EMCfQsm8rjhb62ytEi+Zr
 v3ubKdLcJHe0A==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: update missing mumimo and ofdma stats
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <1652152236-12038-1-git-send-email-quic_srirrama@quicinc.com>
References: <1652152236-12038-1-git-send-email-quic_srirrama@quicinc.com>
To: Sriram R <quic_srirrama@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Sriram R <quic_srirrama@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <165285795034.12190.3249589731146996992.kvalo@kernel.org>
Date: Wed, 18 May 2022 07:12:33 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_001235_396025_C09D9897 
X-CRM114-Status: UNSURE (   7.09  )
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

Sriram R <quic_srirrama@quicinc.com> wrote:

> Update the missing MU-MIMO/OFDMA info in PDEV RX,
> trigger and schedule stats. i.e HTT stats type 10, 12 and 17
> respectively.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4-01209-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

fdb8fc34a6fb ath11k: update missing MU-MIMO and OFDMA stats

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1652152236-12038-1-git-send-email-quic_srirrama@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

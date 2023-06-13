Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 839DEC88CB4
	for <ath11k@archiver.kernel.org>; Tue, 13 Jun 2023 09:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u3RqQsbsvGyEDvLKjDSvH/sGGvMipIZFjnxKY3iOS4o=; b=Kyvbw1wsIBjR7I
	9MCZi16NWoXIDBH91uyrS9eN5uDD/cRskuDxY80wwB4Q3CznCgCBbK2RB90Ot1DfUW+cyic5V+mpT
	FjSa8CBRhXxKP0DEmRZxuayTsJlcHM+2RZ2PXcVWhgUTl2igALhbn6IL3/guVu98fpS2MHasA8TW8
	RD401/7fiiB7hdeMKI+jFHXapSUFlgMJeTNr1e+X1ua/viMkltPpJTXsPuWhDCH0TYEoN7f54qdfm
	VCxrWu8OSCvhZA9JnjZGlmo5FaTNJ3SjzeuhVZ/fUEmVwrry1IitUeD5eKVScM5Uz3tk/DzhbubCT
	zfXBajCC5OAVM8SD+bvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q903o-007ThS-29;
	Tue, 13 Jun 2023 09:11:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q903l-007TgK-10
	for ath11k@lists.infradead.org;
	Tue, 13 Jun 2023 09:11:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DC94963109
	for <ath11k@lists.infradead.org>; Tue, 13 Jun 2023 09:11:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FE1EC433D2;
	Tue, 13 Jun 2023 09:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686647488;
	bh=4J/691CsI7iG+Ig8jeZXas086ObQ/IY7YU1DUEGxjZQ=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=Xc6Nv1O2wrWHsWQhHoTVrImB1W11pXFuuGRl5wPOVK8tsZYtAe3w4du/hNHsn+NRP
	 VabKRc0IQpaxpM4tF6q8MRSVQnEFFjF8luBBe9jbSK4JQpabVZiqb9a49cDZDh9X9s
	 ygqVNBG9lIzraN0zBJBZ5Y/fOJP++hT17a6zv9+WmZTwhK5yFnBSpLKruX7B0V1cxX
	 n9DLRYQnABk0wbIBnTbHv5GFJGY6COKybnWEfZrG9AZLGL6Bmj9HyKSPOBJVGrH2pV
	 8Ub/ycw9qfFK2I0CvD2d5j5+8tYWpDTbVhZxl/oeoTp+m8puGzZESZjMGdITl1Gp6J
	 niaJnHkSNe1Ig==
MIME-Version: 1.0
Subject: Re: [PATCH 01/15] wifi: ath11k: debug: remove unused ATH11K_DBG_ANY
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230609142440.24643-2-kvalo@kernel.org>
References: <20230609142440.24643-2-kvalo@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <168664748569.2274.11917166268138935303.kvalo@kernel.org>
Date: Tue, 13 Jun 2023 09:11:27 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_021129_385793_7711E6DB 
X-CRM114-Status: UNSURE (   6.84  )
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

Kalle Valo <kvalo@kernel.org> wrote:

> It's not used anywhere so can be easily removed.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
> 
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

15 patches applied to ath-next branch of ath.git, thanks.

d13936d57927 wifi: ath11k: debug: remove unused ATH11K_DBG_ANY
9a599e968f02 wifi: ath11k: print debug level in debug messages
fc3b984a7d99 wifi: ath11k: remove manual mask names from debug messages
e5df15773d8d wifi: ath11k: add WMI event debug messages
8fbeaca7a001 wifi: ath11k: remove unsupported event handlers
90a9fb5b6618 wifi: ath11k: wmi: cleanup error handling in ath11k_wmi_send_init_country_cmd()
afba35d7d125 wifi: ath11k: wmi: use common error handling style
00608b40ae1a wifi: ath11k: wmi: add unified command debug messages
332c65628938 wifi: ath11k: pci: cleanup debug logging
947b5e224818 wifi: ath11k: dp: cleanup debug message
06819e471f28 wifi: ath11k: debug: use all upper case in ATH11k_DBG_HAL
ac483942616a wifi: ath11k: hal: cleanup debug message
cf036c416e9a wifi: ath11k: don't use %pK
3512593884b3 wifi: ath11k: htc: cleanup debug messages
4f52ec65a9ae wifi: ath11k: debug: add ATH11K_DBG_CE

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230609142440.24643-2-kvalo@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

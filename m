Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 231B2C433F5
	for <ath11k@archiver.kernel.org>; Wed,  4 May 2022 05:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yokUBh1g/XCdu5xSLbP3olByR7i8csDAv793tQcTJhI=; b=Fl743Gr/5FszNb
	RCBo8WeXJP5RINGL/2bTkqLsH8omkRbup/PZrWi5ZM6/MYZqYnvGkoNHmYXGgSAWFyEh8IOgrnMlA
	iwPHPoo05dTXtrWPWjQ6pew9CICuUtkwrhWWsTyb6H+7VYdRKajx8Ge6JvitX2e1gJQRMuBxiMCij
	740mAJDt5roig/9Tc6TBh7i4j6RJoYL3gmK7cAvxPJr7nkPV/uqlVJDEwGd5Em69YTB5budVe3IEG
	fKeDkniNT8XBMah6+zJO1Yzmlsqucllp4UN9YD9n8ICvbVIss4RsQB0ivCQxeQUVfX2keByEvmSxJ
	57mSi6Gds3wX7L4YUD7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nm7rh-008ska-Og; Wed, 04 May 2022 05:47:57 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nm7re-008sjw-4V
 for ath11k@lists.infradead.org; Wed, 04 May 2022 05:47:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7DDB0B823E2;
 Wed,  4 May 2022 05:47:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 564D8C385A4;
 Wed,  4 May 2022 05:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651643271;
 bh=lPaxMDnEb8CGp/k+R7ms4YI/h82d9xkmM+ovtzYYFds=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=BArvJ6F4rYGIG5U+W8/D5KIawiShQob4LjX55c2nIEofF17N/me8YEFmfXwz5LzLh
 J1di5L4i3yUgTG3OnH0wb7USklTdJtn2FJx+xPvrPp3qgq3cUtcSINS/rhutQ4cfG6
 BZVd1Zvjog0fsu+1EBoCrcRZJoJdgr3G8IcHa9bnmjD75+7ju7iY9ZPpXtrSCxilgm
 AQapet8T63K/RISEsnB/XzXswEcchXCuzqldvT4jHzJokghSI/pe41UvLR6yJyJPzz
 I76wa8nLeBXXHdQ84+uAXPmwfufL7yDIpTiC2DOW//gZ3vqhGO3BWhPmnUS0FBC1R5
 f8AvzsBKkZfpw==
MIME-Version: 1.0
Subject: Re: [PATCH v3] ath11k: Add support for targets without trustzone
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220328062032.28881-1-quic_mpubbise@quicinc.com>
References: <20220328062032.28881-1-quic_mpubbise@quicinc.com>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <165164326664.16064.14437072371247614794.kvalo@kernel.org>
Date: Wed,  4 May 2022 05:47:50 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_224754_404959_3DA3222A 
X-CRM114-Status: UNSURE (   8.52  )
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

Manikanta Pubbisetty <quic_mpubbise@quicinc.com> wrote:

> Add the support to attach WCN6750 and map iommu domain
> for targets which do not have the support of TrustZone.
> 
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00573-QCAMSLSWPLZ-1
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00192-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

f9eec4947add ath11k: Add support for targets without trustzone

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220328062032.28881-1-quic_mpubbise@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

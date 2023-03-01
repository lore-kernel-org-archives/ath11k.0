Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0589C7EE2F
	for <ath11k@archiver.kernel.org>; Wed,  1 Mar 2023 14:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wTdvOszpkvWop/ta1Q/kKb4IO2492WzqcrOIwtQntHI=; b=QSaDPmSOQYfhmR
	dawEb4rFVBss8LGG1eT+PKPiJkz2iqjAbsPctshrIPLefvCTv/tLUCBF/HfaRJW589Wxde1vXFKqR
	03hge9N4+DldZ8bY9W+uIhmL0h/kBmFXJJ7XCKAb9Ry0OVQoUT4D/TfZRBCgLOMJoaOCTKPf8Ylqi
	Eb5GOSizZ37k77cMIsU+dFkzUWzBhSMn6GEQCs7zPvxGZOx4oRl9JckSutJhARjmk9Kr3T4EDBrNj
	KB2TWb2GFvd4kLpSohS0JfOL0W7U9D8GpAXjI9eGRr3AMdvjAaMNvyjgoWkNEqq0HQiWwYxfcKmYh
	X7JYoto/NHJrsEQGf/aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXNAH-00GPu3-H1; Wed, 01 Mar 2023 14:10:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXNAE-00GPsv-4p
	for ath11k@lists.infradead.org; Wed, 01 Mar 2023 14:10:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 88E2D612EA;
	Wed,  1 Mar 2023 14:10:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9A34C433EF;
	Wed,  1 Mar 2023 14:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677679836;
	bh=95EbawGRJarKXNkGR0ibN/sMlYLi0RfOACr+KSxrnII=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=W5KzF3D4Thu27h5oOem2tHY+4u2WMkFqwWuaspa5STMkDwjNvkrFJ0djCuR3G91y3
	 TbdXkHsV1a17ZY8eF/fKgp9hdyd37eB/3JR9QR0WMmFJjFeydQMgnrieIrDIn0RSTJ
	 R38ss6PXeckNNhQf436b234nf6wp25RfZQ+GUwzJVv2RSj4oUTdR2IIa2eD51F3Cpb
	 /lZ8q5b8fIWMHY14TyM1YMmgzVe7Dk9CerWLq1VDMoIg2ZpoMuxj6h0TndesVIjwVK
	 K0V8Co7WMOcZZCrVmhMZp8DL7RTDUXffYo2JFpkzrwCbg7AmLFCn83VDlUSCmkYNTl
	 jo/C08qy0Mt1Q==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath11k: Add tx ack signal support for mgmt packets
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20221219053844.4084486-1-quic_mkenna@quicinc.com>
References: <20221219053844.4084486-1-quic_mkenna@quicinc.com>
To: Maharaja Kennadyrajan <quic_mkenna@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Abinaya Kalaiselvan <quic_akalaise@quicinc.com>,
 Maharaja Kennadyrajan <quic_mkenna@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <167767983108.16862.568764684446801499.kvalo@kernel.org>
Date: Wed,  1 Mar 2023 14:10:34 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_061038_278190_BB4D94BA 
X-CRM114-Status: UNSURE (   7.39  )
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

Maharaja Kennadyrajan <quic_mkenna@quicinc.com> wrote:

> Add support to notify tx ack signal values for management
> packets to userspace through nl80211 interface.
> 
> Advertise NL80211_EXT_FEATURE_ACK_SIGNAL_SUPPORT flag
> to enable this feature and it will be used for data
> packets as well.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Abinaya Kalaiselvan <quic_akalaise@quicinc.com>
> Signed-off-by: Maharaja Kennadyrajan <quic_mkenna@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

01c6c9fccbd5 wifi: ath11k: Add tx ack signal support for management packets

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20221219053844.4084486-1-quic_mkenna@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

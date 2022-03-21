Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6224AC433EF
	for <ath11k@archiver.kernel.org>; Mon, 21 Mar 2022 10:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0BqwoexIg04LZDxmLHskOu83OOXlL686AK3oUrKx5pE=; b=c4uRD8/sp4su8+
	3r78N8MpIep1h0f67lTHEW48vATr4c1ym7E3YP87MH4upKs1UXmNNMZBeddoCvClIOjz6sCb2k1uo
	4wBIxWl4fJU+sWQtNbmiwBZOd1NoY50tX+PYHoiUURvuhgqWOHoEk4NzhwwYTpfmUOTJu4tYWZ3C1
	3o6+lbHhBmszly2xyA50UYea8iILDkZrFc0KpUpadLxwy4dSmPAiYUneKXENvXGVzNhUVfRSOYNfd
	pNgnblMLjmHAbj6a86Pu8cN1ROXfbqAQFKEOMdAxP7iSZLVTXsLSKbL15wt8Q5Nr0mOUpkwsVoDwN
	9/dzj57P4J0S/Zi6hTew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWFiA-007OU4-Sl; Mon, 21 Mar 2022 10:56:30 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWFi8-007OT3-2X
 for ath11k@lists.infradead.org; Mon, 21 Mar 2022 10:56:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 48865B81222;
 Mon, 21 Mar 2022 10:56:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2BAEC340E8;
 Mon, 21 Mar 2022 10:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647860184;
 bh=4mYhdp7wdOTKJVNeK9LXMAkVP48EPteDhFnTB6L6ELM=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=uSrRzWCQi2jQox0ZbQmycba8Ywd4J8BAH5SBjABAVzB7KKy3CyoZUFWWdHGsaltp0
 YyqYKTy74YWWpxr3U+shBHJMzQRsoIKokVZAz2lEDmdH+GArVI78nDURQ45WfP1rIp
 sQ3Sa2sRNdY0SvjIaTwTcQx/IPEkEa4qo2gVatQhNE2c/UMaPpN1ZzgXvAJTVfwuaR
 T/X9AXfOPUgy0PbDhWRTeMTxXn5/5bqef553t/dD8i3R67XnrLgLe+Wjdr2iMjFoMk
 9buMNBMK8LGQctNQ4G15aEcF0JfBqYg7jB7o8gr1eeuMYLAcvBhECZmq/U6z/tgikq
 w69geHVwVrdjQ==
MIME-Version: 1.0
Subject: Re: [PATCH v1] ath11k: change fw build id format in driver init log
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <1646825065-7736-1-git-send-email-quic_haric@quicinc.com>
References: <1646825065-7736-1-git-send-email-quic_haric@quicinc.com>
To: <quic_haric@quicinc.com>
Cc: <quic_kvalo@quicinc.com>, <ath11k@lists.infradead.org>,
 <linux-wireless@vger.kernel.org>,
 "Hari Chandrakanthan" <quic_haric@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164786017948.19083.6373161692942293952.kvalo@kernel.org>
Date: Mon, 21 Mar 2022 10:56:23 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_035628_310876_DDD9F372 
X-CRM114-Status: UNSURE (   8.40  )
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

<quic_haric@quicinc.com> wrote:

> Currently fw build id is printed during init as follows.
> 
> fw_version 0x250684a5 fw_build_timestamp 2021-07-13 10:57
> fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
> 
> The string "QC_IMAGE_VERSION_STRING=" is removed from the log
> to improve readability.
> 
> With this patch the fw build id is printed during init as follows.
> fw_version 0x250684a5 fw_build_timestamp 2021-07-13 10:57
> fw_build_id WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Hari Chandrakanthan <quic_haric@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

72a9bff38654 ath11k: change fw build id format in driver init log

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1646825065-7736-1-git-send-email-quic_haric@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

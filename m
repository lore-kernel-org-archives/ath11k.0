Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F02CD68F5
	for <ath11k@archiver.kernel.org>; Tue, 10 Oct 2023 07:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q/88CHInXW0JC5pYbWpKY7zaXJ0xmE2fa/hMD+o1HjQ=; b=H6clhIqYaJ6dBD
	uSvX1ekXozDWVpGhYYR/dG3SL30c9EyhUl2sQilWgDpkJFHuSbfVrpQXGqKv+BH2cDHpPws1qGnuw
	Qu4bol/skryItdYwSLtxXvt26yQtZJyCr4pZysGaBTwyaV00XvEyCL8DtmYN5keVqKdAqOcdGijFD
	n6F0J0GXFrIyBxi/o9r6GXl0jKmb49NUqWjczvVLMt5AQxuRFVqx43LbHOXGDptnFBxLC8bB+ayfd
	yFmUOz3c39rMILL+tpzba25qqnTdrXPIaeD72Un19TA1/rO8ZEece/hrkEUzyxkjSCE90DPovtoyU
	oDN+JOkTA/FRGHQ6Rp7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qq75W-00Ch3A-2q;
	Tue, 10 Oct 2023 07:23:30 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qq75U-00Ch2n-0y
	for ath11k@lists.infradead.org;
	Tue, 10 Oct 2023 07:23:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 78859CE1BFE;
	Tue, 10 Oct 2023 07:23:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3FECC433C8;
	Tue, 10 Oct 2023 07:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696922605;
	bh=ov8mQoiPuDvyppz0707yD4QUGRw0hSxq2OdsgOrCKjU=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=cuszz+DrTvLMYNMq3EsgEVg8QixFxCtFFYMIgQog9aSg0jJyn95ilz9hS8ER6w0vw
	 LEH4M8V+pylXhgkWaF8kOAh6JxtT0ScQzyZTnOXnvXWKzwp0ILRkGmDIV6cJ5P7jMy
	 X8xSdv22wC98fxVZIr4CQlJLoiPOu3jdl2bwusPHO6CWo9lqeXlQc2FjPfmECHVPI4
	 p4s0WUqFdHiOjcVWY/D6lKYSDiqDgrY3l8vY5yweLWbw5iKWkG9Wo7nTePSgAByYz2
	 6xTAMyH5+ZxTo5Q3uncjEDJV1vOCsdoqdObxxiNWcnph2wPXPWeRwkLkDA+B4veMOD
	 7ig8ofWKYxT6A==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath11k: call ath11k_mac_fils_discovery() without
 condition
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231004044915.6817-1-quic_alokad@quicinc.com>
References: <20231004044915.6817-1-quic_alokad@quicinc.com>
To: Aloka Dixit <quic_alokad@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Aloka Dixit <quic_alokad@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169692260273.2589238.2783908442272487567.kvalo@kernel.org>
Date: Tue, 10 Oct 2023 07:23:24 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_002328_516317_F1FEE466 
X-CRM114-Status: UNSURE (   7.16  )
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

Aloka Dixit <quic_alokad@quicinc.com> wrote:

> Mac80211 does not set flags BSS_CHANGED_FILS_DISCOVERY and
> BSS_CHANGED_UNSOL_BCAST_PROBE_RESP if there are no updates to
> FILS discovery and unsolicited broadcast probe response transmission
> configurations respectively. This results in the transmissions getting
> stopped during BSS change operations which do not include these
> attributes. Remove the checks for the flags and always send the existing
> configuration to firmware.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

e149353e6562 wifi: ath11k: call ath11k_mac_fils_discovery() without condition

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231004044915.6817-1-quic_alokad@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

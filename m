Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D63C6379F
	for <ath11k@archiver.kernel.org>; Fri, 17 Feb 2023 15:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7z9GJkZ2YIDkTHErMlLpLnhN3Y9IIQ8nWkEM+GMWrw4=; b=kysKZH/S+IwFN/
	2iVyZ/xMt/JMUkxVpFphSoNGwawUCD0gQ+Lpx3VBnsqrAtvahGTu94LozC8F+uar9lQrzcU1g7TyN
	RoGo5bhVi2Af9SEUf44rEWeREhuXvYv888TEoSi7xwXKXidS3jrITqDzr7D+j5ieZPVU1hgAoQ83f
	K3bwRMTZS54DFrbx0BrYkfZnIP1J3GJJLhkElp6gdJ+eEhKYLDfX790l0iwa/mS687v1JOYIp23r0
	AdJsXy6yVrs9AURCRvgWQqRt/FSqVTaYeq1DSwuFF+7hJLHcYXUMXui2RNq1hdYqQsQXAMma0YF/C
	Oog/+BzOduzeIBljbarA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT37J-00Ewei-9e; Fri, 17 Feb 2023 15:57:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT37F-00Ewck-W3
	for ath11k@lists.infradead.org; Fri, 17 Feb 2023 15:57:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B9C9461E10;
	Fri, 17 Feb 2023 15:57:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DDC1C433EF;
	Fri, 17 Feb 2023 15:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676649460;
	bh=g8Q+/5BohF9DA50sSIUOESQeowqyhkU5uSpAtgg+bIo=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=PVo6edfuRWyPDs50DOZYRLy3R/jE1/D3DXWifZsAMSNSj3w1/hCoPuvyB4r81xpmJ
	 cKwjzDT0dLBXpF2wgbCoJwN6fCGr/U+GBJnXyXktGT/cjx2j6ocSe4fkkCGDYhARmT
	 eciGQ+mixo2sQJMEePFyxAqZgNvFf7exV54A4U/ZpOL8B8WmsjfEogSIX/4+U50Hid
	 /V9Aj3mRIjf2w2RvAbooryTFvyLvK7dh5q8TKR8DdNQW9hkEK8rgN7Ha3XOieFNSlw
	 NyUWTRVeqXv2Ts2lU+GMgPirXI+97yL76GSluehqnzALd2NSymSnWzGYpcy9iwUL7G
	 OR62LFgFb2SLA==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath11k: Set ext passive scan flag to adjust passive
 scan start time
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20221222131720.11368-1-quic_tamizhr@quicinc.com>
References: <20221222131720.11368-1-quic_tamizhr@quicinc.com>
To: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <167664945324.27521.5550862746397183155.kvalo@kernel.org>
Date: Fri, 17 Feb 2023 15:57:39 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_075742_157140_8FD47489 
X-CRM114-Status: UNSURE (   7.84  )
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

Tamizh Chelvam Raja <quic_tamizhr@quicinc.com> wrote:

> Set the WMI_SCAN_FLAG_EXT_PASSIVE_SCAN_START_TIME_ENHANCE flag
> while sending the scan command.  If this flag is enabled when the
> incoming scan request comes with a strict start time and its duration
> overlaps with next TBTT, then target adjust the start time accordingly
> for passive scan. Target supporting this feature will advertise
> WMI_TLV_SERVICE_PASSIVE_SCAN_START_TIME_ENHANCE.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01467-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

cf8f3d4deb02 wifi: ath11k: Set ext passive scan flag to adjust passive scan start time

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20221222131720.11368-1-quic_tamizhr@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

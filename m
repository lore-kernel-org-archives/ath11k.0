Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B4B9C04A68
	for <ath11k@archiver.kernel.org>; Wed, 27 Jul 2022 10:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tgB+C5091vZvaqtRgW301XyDS7Beqp+iCxM6/066cwI=; b=aY6Hcy8BDjndDc
	CV+xSPYgZlxVNPD8aWUQ4isC8RPC4q+h0d5heSuDxMKsPDkRHComHQXYxe4lIxGA2cMgnTrlxTw+4
	xcisLuTbmsXzeYbwkM/znEn0ghXEXcKTgQC2JJvHJIwUGads6e0MrNgB3rJGoWJr+B+896zmWhz9M
	BYUXUKzCmhtm3ObcYscsLJuXt7pCe/GgyRmT4krPTQrWaKYj4tL+AA6xO/7+f0+dEXCio46URMW5N
	bG48X2WLH0N3KOtcl3U87RCwq1KJqLO2c2A7BPo1dttWNIZ9AG4r7qRIIkeq7hTC6M9dcKRxzW2Jw
	MkULzscgyODl8WM/eYzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGe97-00CIB6-DO; Wed, 27 Jul 2022 10:20:05 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGe93-00CI8P-Tv
	for ath11k@lists.infradead.org; Wed, 27 Jul 2022 10:20:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 591CAB82014
	for <ath11k@lists.infradead.org>; Wed, 27 Jul 2022 10:20:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4491BC433C1;
	Wed, 27 Jul 2022 10:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658917199;
	bh=vGy4avFvnSXh1+8K+r+y01EKaoKmQk8GxVtuOyg5cRU=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=urK5w3VJFecpIWgxHtGE6LJ52W0LW050eFUEtltl+S0vMoZQo5gGll3Bu/ljfmb2M
	 cgBto2Ievu1HVyz0tzSGAyQqh9VFYl6Kd9tjQgHrb9ENbr66N678iFvnmr7jBW46xm
	 Ygmt2gYLHsdXtxer/a3nUunpBCvSlWBzCnEiiHYOYVclMmQhkPddzcx0qwUIN08QzE
	 d/OqPdcoqukwOdy3ln2j54fBYArHG6KpH440z0FIMWpCuZQZC3qE8KIW5aCLEWfNs5
	 Tpsb+YDb2GhbI5bm9JnrVhrftJRBzirdu7AIDqo0X09WKRwWI4qjequPeUfFiqNzFF
	 zt6NcKh54Pv+w==
MIME-Version: 1.0
Subject: Re: [PATCH] Revert "ath11k: add support for hardware rfkill for
 QCA6390"
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220708164656.29549-1-kvalo@kernel.org>
References: <20220708164656.29549-1-kvalo@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <165891719619.18387.7495759163759552127.kvalo@kernel.org>
Date: Wed, 27 Jul 2022 10:19:58 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_032002_180807_E897C4D6 
X-CRM114-Status: UNSURE (   7.34  )
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

> This reverts commit ec038c6127fa772d2c5604e329f22371830d5fa6. Tyler reported
> that on L390 Yoga Thinkpad with QCA6390 the suspend was failing because of this commit.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.9
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=215881
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

169ede1f5948 Revert "ath11k: add support for hardware rfkill for QCA6390"

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220708164656.29549-1-kvalo@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

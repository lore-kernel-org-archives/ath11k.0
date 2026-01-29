Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F50D358C2
	for <ath11k@archiver.kernel.org>; Thu, 29 Jan 2026 06:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1aP+p3pkuZEJ5WqF20qIXkmTR7lKKQv4XO2CS/5zgQk=; b=vDvN/O7jCTndbi5P5E5SHp7kjF
	sHE31610FceJ3ESYTwK1761oxWIjT/J1cvUAUwkPvmUag2M6v/l/cZd2D6cwp8G6RBK1cU88Q5/68
	h54hWr4r3BtBb7d8zjWqUww735GHXbYyEs88BLN3mfzaEIqCZMl/koUo+v5hW2ZvGJQ4mjEyDjba0
	t5H4+m660fb9IVok4wGMkWLVWoiCCE5kT0Px64ZX0I2pQ7hWmjj5n3Mwb5hJ0yVF4+/ywrDTTlyzs
	sWk50cZ7wxp8uUTaH6ej8bvZisnU1bofsRdjkh+i3sPq/BJnpwvFpZgyOT9DoBC8OtcYK8h/IR2nn
	rnfzr83g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlLHl-0000000HJpW-0Hgy;
	Thu, 29 Jan 2026 06:13:45 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlLHh-0000000HJo6-1JEX
	for ath11k@lists.infradead.org;
	Thu, 29 Jan 2026 06:13:43 +0000
Received: from LAPTOP-N070L597.localdomain (unknown [221.228.238.82])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3262103f5;
	Thu, 29 Jan 2026 14:13:31 +0800 (GMT+08:00)
From: Zilin Guan <zilin@seu.edu.cn>
To: jeff.johnson@oss.qualcomm.com
Cc: ath11k@lists.infradead.org,
	baochen.qiang@oss.qualcomm.com,
	jianhao.xu@seu.edu.cn,
	jjohnson@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	zilin@seu.edu.cn
Subject: Re: [PATCH v2] wifi: ath11k: fix memory leaks in beacon template setup
Date: Thu, 29 Jan 2026 06:13:30 +0000
Message-Id: <20260129061330.796429-1-zilin@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <6cc72c12-6f50-4e91-9b7a-bde8633009c4@oss.qualcomm.com>
References: <6cc72c12-6f50-4e91-9b7a-bde8633009c4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9c0862afff03a1kunme0f4efb7101759
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDGU5MVktDQ04ZTB1NTUJDS1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJSUpVSUlDVUlIQ1VDSVlXWRYaDxIVHRRZQVlPS0hVSktJSE5DQ1VKS0tVS1
	kG
DKIM-Signature: a=rsa-sha256;
	b=N+33e20hZPujV9M4SD7xaqas3npKFRMKKSSOOir1i5JvxRvctx8KW3XzrUeVG+4zlGZGjyuKumJtt0E1T5zwvyOLRMitdG5a7puLGouLfO2kzleozibEq64/YaHZ9CLKJH3xVwvUY6PWQiJYD0v9i2vk3DeJ2cydFl1lRnoSYZs=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=1aP+p3pkuZEJ5WqF20qIXkmTR7lKKQv4XO2CS/5zgQk=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_221341_993121_A08CEE35 
X-CRM114-Status: GOOD (  26.84  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Wed, Jan 28, 2026 at 08:30:22AM -0800, Jeff Johnson wrote:
> On 1/19/2026 10:37 PM, Zilin Guan wrote:
> > The functions ath11k_mac_setup_bcn_tmpl_ema() and
> > ath11k_mac_setup_bcn_tmpl_mbssid() allocate memory for beacon templates
> > but fail to free it when parameter setup returns an error.
> > 
> > Since beacon templates must be released during normal execution, they
> > must also be released in the error handling paths to prevent memory
> > leaks.
> > 
> > Fix this by adding the missing deallocation calls in the respective
> > error paths.
> > 
> > Compile tested only. Issue found using a prototype static analysis tool
> > and code review.
> > 
> > Fixes: 3a415daa3e8b ("wifi: ath11k: add P2P IE in beacon template")
> > Fixes: 335a92765d30 ("wifi: ath11k: MBSSID beacon support")
> > Suggested-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> > Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
> > ---
> > Changes in v2:
> > - Use unified exit paths for cleanup.
> > 
> >  drivers/net/wireless/ath/ath11k/mac.c | 25 +++++++++++++++----------
> >  1 file changed, 15 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> > index 4dfd08b58416..42edcc5e9e49 100644
> > --- a/drivers/net/wireless/ath/ath11k/mac.c
> > +++ b/drivers/net/wireless/ath/ath11k/mac.c
> > @@ -1561,8 +1561,10 @@ static int ath11k_mac_setup_bcn_tmpl_ema(struct ath11k_vif *arvif,
> 
> while looking to apply this patch I noticed the following logic earlier in the
> function:
> 
>  	beacons = ieee80211_beacon_get_template_ema_list(tx_arvif->ar->hw,
>  							 tx_arvif->vif, 0);
>  	if (!beacons || !beacons->cnt) {
>  		ath11k_warn(arvif->ar->ab,
>  			    "failed to get ema beacon templates from mac80211\n");
>  		return -EPERM;
>  	}
> 
> I did not look at ieee80211_beacon_get_template_ema_list()
> But if it is possible that this can return a valid beacons pointer with
> beacons->cnt == 0, then won't this also leak the beacons allocation?
> 
> Given that ieee80211_beacon_free_ema_list(beacons) can handle a NULL
> beacons pointer, perhaps this should also goto free?

Hi Jeff,

Thanks for pointing that out.

I looked into the allocation chain for 
ieee80211_beacon_get_template_ema_list():

ieee80211_beacon_get_template_ema_list()
	|__ __ieee80211_beacon_get()
		|__ ieee80211_beacon_get_ap_ema_list()

It seems that ieee80211_beacon_get_ap_ema_list() only returns a valid 
pointer when ema->cnt is non-zero. Therefore, a valid beacons pointer with 
beacons->cnt == 0 is likely unreachable under the current mac80211 
implementation, making the existing check more of a defensive programming
measure.

However, for the sake of strict logical consistency, it would make sense 
to use the goto path there as well.

Do you think it's worth updating this in a v3, or is the current v2 
sufficient given the current call logic?

Best regards, 
Zilin


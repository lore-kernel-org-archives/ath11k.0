Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B2A4C433FE
	for <ath11k@archiver.kernel.org>; Tue,  8 Nov 2022 10:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cOCwCKZvgszisZ/ywRpPWrWZbO9C93RmimDgOhlnLMw=; b=iMsnwZH8BeBhwi
	08TFO4fLDVLCx+Fq5DJSldt8m+M56VU3CBz1WLsUaNnJna06nxbQ/HxEOblxT7W9CgPwzm8VQ/nGR
	vuQLarOX1u9ZKZuFaChJWcSpM9686LZ3lBX6dTy94esSaPox/oCMc31HMFwDaTxYjQAHGoKcIXkNJ
	F75CEmP/kSK2fulOdjjviC15BgtkXNy+l8gCAUgM3P4gaiyKpNY15IncaDTFiMEaOiqExpWA6a8sG
	27hqcCBWhHVPQNKN29/FSBz3BeQTiIDOiuWfnWWYitXWenKkKfO71EPXI+L/FCnv1eNS1s0AGVZ+6
	QdoBCWMqsCyWXf6AU7bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osLfC-004QbL-Fp; Tue, 08 Nov 2022 10:17:02 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osLf9-004Qak-HD
	for ath11k@lists.infradead.org; Tue, 08 Nov 2022 10:17:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E4CDAB819B8;
	Tue,  8 Nov 2022 10:16:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F441C433D6;
	Tue,  8 Nov 2022 10:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667902616;
	bh=aiZ1rVErp+MnWyEzbTE6C+1D5vFOLe8Gr860yiFpIuI=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=vL/Bk2pJGYCA7ODdJo3ynX+zuOGHu7pOJ0vFgnV0lviMrRVwU4PMiTyag3ErYku3O
	 cwAEw7MTNfcdAyXtrI0+wmUtZcIQjkBy6V6LL9u95oHtMnHLVISxjiQXQfOTt6XW7g
	 yeTouuylWi6mOImb2MJLsxwqyBirLc3b0BS9GiHQjEpgg4eex2VUKAEQSxBwYjPmRm
	 0FYjBnhR8SARrZhjRXG5LUyu3DRFW7++ZsDj+3S5s0juEAn/TWvKPitazrYBdyQBJ0
	 AWlMjc4XrkuJZ8199aw0Tog6Y7iYZIayt/ztLpYs6eCOPsnAxtjMJ8AMa6kyLNAyiM
	 Mvy906mvhtoyQ==
MIME-Version: 1.0
Subject: Re: [PATCH v2] wifi: ath11k: Trigger sta disconnect on hardware
 restart
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20221104085403.11025-1-quic_youghand@quicinc.com>
References: <20221104085403.11025-1-quic_youghand@quicinc.com>
To: Youghandhar Chintala <quic_youghand@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>,
 Youghandhar Chintala <quic_youghand@quicinc.com>,
 kernel test robot <lkp@intel.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166790261226.18646.8349764958072116285.kvalo@kernel.org>
Date: Tue,  8 Nov 2022 10:16:55 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_021659_741279_77F80D4B 
X-CRM114-Status: GOOD (  12.79  )
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

Youghandhar Chintala <quic_youghand@quicinc.com> wrote:

> Currently after the hardware restart triggered from the driver, the
> station interface connection remains intact, since a disconnect trigger
> is not sent to userspace. This can lead to a problem in targets where
> the wifi mac sequence is added by the firmware.
> 
> After the target restart, its wifi mac sequence number gets reset to
> zero. Hence AP to which our device is connected will receive frames with
> a  wifi mac sequence number jump to the past, thereby resulting in the
> AP dropping all these frames, until the frame arrives with a wifi mac
> sequence number which AP was expecting.
> 
> To avoid such frame drops, its better to trigger a station disconnect
> upon target hardware restart which can be done with API
> ieee80211_reconfig_disconnect exposed to mac80211.
> 
> The other targets are not affected by this change, since the hardware
> params flag is not set.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> 
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
> 
> Signed-off-by: Youghandhar Chintala <quic_youghand@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

a018750a2cce wifi: ath11k: Trigger sta disconnect on hardware restart

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20221104085403.11025-1-quic_youghand@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

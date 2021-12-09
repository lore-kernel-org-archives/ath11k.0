Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E6D0C433EF
	for <ath11k@archiver.kernel.org>; Thu,  9 Dec 2021 17:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rUgiDicpn2qHxYAgTunyAi6UVU77+CdDuzMDQmvOZfU=; b=cZfVe8vZVQj4J+
	9e8blJJra0S6gzgp7dvwjCWbFWvtLDe9SFUASk4gCnZG8/Urj3Ocair9G44jXhI+tZAWE6u4vQrBI
	8iAfU1KvRq7ijA11ecLPyMhWKWY1tQ0KhvSh4L3m+cYMEm7l8GbkoiNA/BzgvRPel2YkPaFIQsd3o
	rrpf3CdGmVJeOK+wEG3azBzkZ1wPGt1mw0Rw1CKJFlg+ScHJeY/DCqMSJ/iXgEP+7XMnJ3keJeuHI
	MkPQiOZdE+y79dbM570Xe+jwIvhj367pkdSloY3mvVd0fIuqR6btGNoGg+iyB5tBJLWjXsatFqGcp
	LhcOggBt5O1HqhPreGMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvN9q-00Gx1d-Gq; Thu, 09 Dec 2021 17:24:38 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvN9n-00Gx0b-3D
 for ath11k@lists.infradead.org; Thu, 09 Dec 2021 17:24:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 5C366CE2746;
 Thu,  9 Dec 2021 17:24:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E665C341C7;
 Thu,  9 Dec 2021 17:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639070671;
 bh=VSoKfdOMvZ0Mat+gtRItv2IWHD8WwiWIfUocuzs8l4k=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=e787boEWcioch69eFTNAHUsKQtIPcb0BEMYqF+lyCkf9tYVgcsU2bbuii+F6BfqNa
 Yd8nz1eDJCaIvYW6UbcBD7senIRWObe1UencknH1kl5w19/h73LonM/tbRtWivDVJM
 PUEyAGOS1u5X3wbrNJvcm2D3dkHggXDx/wbU5Q2Rht/0aWSAaw5SivekGMkVRIe0IU
 k0e2G0U0oUyeDjkQQ0Qvxrd/kkcjpMgRfQr5RNB1fa1XnZBNvNcDgu7ts9zI3rSVtX
 u8ytIpS2cx13gArlrRU8AVWiaP4ty+CZMn5hNNNeUiCef3YoJt8zFBDmdluDk5hftA
 qBw1oh0P3YIdw==
From: Kalle Valo <kvalo@kernel.org>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 04/15] ath11k: allow only one interface up simultaneously
 for WCN6855
References: <20211026111913.7346-1-quic_wgong@quicinc.com>
 <20211026111913.7346-5-quic_wgong@quicinc.com>
Date: Thu, 09 Dec 2021 19:24:28 +0200
In-Reply-To: <20211026111913.7346-5-quic_wgong@quicinc.com> (Wen Gong's
 message of "Tue, 26 Oct 2021 07:19:02 -0400")
Message-ID: <877dcdwv1v.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_092435_357979_EC11DBEF 
X-CRM114-Status: GOOD (  18.80  )
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

Wen Gong <quic_wgong@quicinc.com> writes:

> Currently ath11k support both station/AP mode for WCN6855, and it is
> configured with single_pdev_only, it means it has only one ath11k
> and one ieee80211_hw which registered in mac80211 and one wiphy
> registered in cfg80211. Now it does not have requirement to start
> up both station and AP interface simultaneously for WCN6855, this
> is to disable station and AP concurrency mode.
>
> After this patch, when station interface is up, then AP interface
> can not start up. AP interface can start up after station interface
> down. Also when AP interface is up, station interface can not start
> up. station interface can start up after AP interface down.
>
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
>
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath11k/core.h |  5 +++++
>  drivers/net/wireless/ath/ath11k/mac.c  | 17 ++++++++++++++++-
>  2 files changed, 21 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
> index a65f7d00eea2..e6c4963e41ac 100644
> --- a/drivers/net/wireless/ath/ath11k/core.h
> +++ b/drivers/net/wireless/ath/ath11k/core.h
> @@ -972,4 +972,9 @@ static inline bool ath11k_support_cc_ext(struct ath11k_base *ab)
>  	       test_bit(WMI_TLV_SERVICE_REG_CC_EXT_EVENT_SUPPORT, ab->wmi_ab.svc_map);
>  }
>  
> +static inline bool ath11k_support_6G_cc_ext(struct ath11k *ar)
> +{
> +	return ath11k_support_cc_ext(ar->ab) && ar->supports_6ghz;
> +}

All lower case and please move also this to hw.h:

ath11k_hw_supports_6g_cc_ext()

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

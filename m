Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44CA8C433EF
	for <ath11k@archiver.kernel.org>; Wed,  1 Dec 2021 17:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oZlqT01QBxfiV7760px/hRp5ueIthIW918+bHoVxdig=; b=SKaZ+1y47HxS4L
	p02CawFgl+o5dKAAe3JYtMqiIUkfvK3mePCkc3L1vewuAxMycfaEyLhg9gNnmftDNGP9PyPhb83vo
	w2PXMjouATqm1RtVmRbkA9nE++Uf+hHZzyyG96o/kQ60q4iBcB21bFw1m9URKjXqRkvmYg78Yv4Sb
	gbW4LsM/N/esyr32X32ABChgICI605kwP51JTjYeW4tQosbR4auTCsjX6x2TGn1MAFejNMmNEF6wI
	kvlklEY487ZWAziXzoACtuHPv9gAa53jcqj1MjBJOmyLg1tQxz7FKuiF/j+XRLkPDKzu7AJGRAQnz
	ICNNUhNYugY5mEd3xwbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msTJc-009ZGx-0P; Wed, 01 Dec 2021 17:22:44 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msTJZ-009ZFR-4V
 for ath11k@lists.infradead.org; Wed, 01 Dec 2021 17:22:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1638379361; x=1669915361;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vlNXZUymzyuuroQ9ghBCswMVj5MU29+Wcv0U/rbpDLc=;
 b=XPnwAfcDWtYE8+wnX5sbF93FKbKhcTqtCiGRvfiBqb88AbLSSsJ8pFJp
 NIBvM+gAtGDpve80NO1jOSMqtt3AWKgX/NNcPiNRh1ockmT/wrtDOYHYB
 QWfRoz89dcy8VRJMhv9t1+oGSjdwCIrzm4OfDULzkSHxIAvidSgBMFCAN 4=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 01 Dec 2021 09:22:39 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2021 09:22:38 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 1 Dec 2021 09:22:38 -0800
Received: from [10.48.242.103] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Wed, 1 Dec 2021
 09:22:37 -0800
Message-ID: <a29a8153-2a4f-1876-ec48-47e08db00a98@quicinc.com>
Date: Wed, 1 Dec 2021 09:22:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.1
Subject: Re: [PATCH] ath11k: Fix a NULL pointer dereference in
 ath11k_mac_op_hw_scan()
Content-Language: en-US
To: Zhou Qingyang <zhou1615@umn.edu>
CC: <kjlu@umn.edu>, Kalle Valo <kvalo@codeaurora.org>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Manikanta Pubbisetty
 <mpubbise@codeaurora.org>, Shashidhar Lakkavalli <slakkavalli@datto.com>,
 Govindaraj Saminathan <gsamin@codeaurora.org>, Vasanthakumar Thiagarajan
 <vthiagar@codeaurora.org>, Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>,
 <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20211130084304.72160-1-zhou1615@umn.edu>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20211130084304.72160-1-zhou1615@umn.edu>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_092241_265290_9C927780 
X-CRM114-Status: GOOD (  22.18  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 11/30/2021 12:43 AM, Zhou Qingyang wrote:
> In ath11k_mac_op_hw_scan(), the return value of kzalloc() is directly
> used in memcpy(), which may lead to a NULL pointer dereference on
> failure of kzalloc().
> 
> Fix this bug by adding a check of arg.extraie.ptr.
> 
> This bug was found by a static analyzer. The analysis employs
> differential checking to identify inconsistent security operations
> (e.g., checks or kfrees) between two code paths and confirms that the
> inconsistent operations are not recovered in the current function or
> the callers, so they constitute bugs.
> 
> Note that, as a bug found by static analysis, it can be a false
> positive or hard to trigger. Multiple researchers have cross-reviewed
> the bug.
> 
> Builds with CONFIG_ATH11K=m show no new warnings, and our static
> analyzer no longer warns about this code.
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
> ---
>   drivers/net/wireless/ath/ath11k/mac.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index 1cc55602787b..095f1f9b7611 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -3237,8 +3237,13 @@ static int ath11k_mac_op_hw_scan(struct ieee80211_hw *hw,
>   	arg.scan_id = ATH11K_SCAN_ID;
>   
>   	if (req->ie_len) {
> -		arg.extraie.len = req->ie_len;
>   		arg.extraie.ptr = kzalloc(req->ie_len, GFP_KERNEL);

Your patch looks good, but since you are touching this code IMO this 
should be changed to kmemdup() and we should remove the memcpy() below.

> +		if (!arg.extraie.ptr) {
> +			ret = -ENOMEM;
> +			goto exit;
> +		}
> +
> +		arg.extraie.len = req->ie_len;
>   		memcpy(arg.extraie.ptr, req->ie, req->ie_len);
>   	}
>   
> 


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

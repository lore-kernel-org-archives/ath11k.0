Return-Path: <SRS0=wCOK=JB=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8045DC433B4
	for <ath11k@archiver.kernel.org>; Sun,  4 Apr 2021 12:56:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BC166128D
	for <ath11k@archiver.kernel.org>; Sun,  4 Apr 2021 12:56:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BC166128D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7hddZzJvbvgYPMjlZocMdT68ymrE4Gnm22YOIPFclQ0=; b=FVKEacW++ZSvVbEcico88E9Oe
	9RSTph7ks9MEMJAf+vxqqUyi78WPkBrtKS8KSOmEtzFK2WS7onQ4CDb0EfXpv4vGKnKPWnZciehbs
	2SDgjuAFta3R4GKz2F2XYUNzDgz+IUoqJybxDFAAqeSMAB57T2St2bvAHotD2XiJW6+GR07YiiSyF
	1cBJIHD81soZ6QPBkljsxU5tr7J/5sXqoGikl+nq84kDuUKMx0GPnnS7AsS/DXKLwCPLi8s+ccEJM
	1Rk4iBm5VlJO0cxb+ZA9v7ktjuh8L6ZdHrm/krG+JSm27F67TLpIBBqSVAZz4SDszzUjInhspNwT0
	2IamQ91Hw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lT2J2-00FkGT-LX; Sun, 04 Apr 2021 12:56:44 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lT2Iy-00FkG5-5X
 for ath11k@lists.infradead.org; Sun, 04 Apr 2021 12:56:43 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1617541001; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=jEMRUAMh/TKgCIXDHS1CDEDrjjZuYl9CfCWWxLqsKns=;
 b=iF/QB0dccTi4aQvtM2bWuEKf7JXo3dIqjX/2sEjTMSxgRKRCZzMT+187i9Q6xdVyFA1zilKH
 zUS6P9p9NT6HJyLHH8P6rHg4TfW0AQnwcVjsCQopDTLPgIzKdadLnRS54WiJFGqYX1ovGxvr
 qiM5XEvpfB2pdJf8OMjj9YhepD0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 6069b77c2cc44d3aea9c0101 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sun, 04 Apr 2021 12:56:28
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 40178C433C6; Sun,  4 Apr 2021 12:56:28 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: pradeepc)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 97C80C433CA;
 Sun,  4 Apr 2021 12:56:26 +0000 (UTC)
MIME-Version: 1.0
Date: Sun, 04 Apr 2021 05:56:26 -0700
From: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
To: Karthikeyan periyasamy <periyasa@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, John Crispin
 <john@phrozen.org>, pradeepc=codeaurora.org@codeaurora.org
Subject: Re: [PATCH V8 1/3] ath11k: switch to using ieee80211_tx_status_ext()
In-Reply-To: <183cd636909cec0b8d20da8515c146ab@codeaurora.org>
References: <1616105397-1482-1-git-send-email-pradeepc@codeaurora.org>
 <1616105397-1482-2-git-send-email-pradeepc@codeaurora.org>
 <183cd636909cec0b8d20da8515c146ab@codeaurora.org>
Message-ID: <c369ab155fe070ffc9c129662a3e71c8@codeaurora.org>
X-Sender: pradeepc@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210404_135641_494027_08EA6207 
X-CRM114-Status: UNSURE (   9.07  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 2021-03-18 22:31, Karthikeyan periyasamy wrote:
>> -	ieee80211_tx_status(ar->hw, msdu);
>> +	spin_lock_bh(&ab->base_lock);
>> +	peer = ath11k_peer_find_by_id(ab, ts->peer_id);
>> +	if (peer) {
>> +		arsta = (struct ath11k_sta *)peer->sta->drv_priv;
>> +		status.sta = peer->sta;
>> +		status.skb = msdu;
>> +		status.info = info;
>> +		status.rate = &arsta->last_txrate;
> 
> Assigning arsta holded last_txrate pointer to status.rate create race
> condition problem b/w sta delete and ieee80211_tx_status_ext, no ?
> Hw we ensure that arsta pointer is valid until
> ieee80211_tx_status_ext() processing?
> 
> Instead why don't we have local struct rate_info and assign like below
> code snippet
> 
>         struct rate_info rate;
> ...
>         rate = arsta->last_txrate;
>         status.rate = &rate;
> 
> Thanks,
> Karthikeyan P
Thanks Karthikeyan, I have addressed this in V9..

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

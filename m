Return-Path: <SRS0=GTBl=G6=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C6C6C433E0
	for <ath11k@archiver.kernel.org>; Wed, 27 Jan 2021 02:46:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86FEB206CB
	for <ath11k@archiver.kernel.org>; Wed, 27 Jan 2021 02:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86FEB206CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WwmDfvOpZ85I4+Hjx2EPTR+KtSgwjrnus8mtVZKZ/tU=; b=PozbgY+f3Vqp5xtMH0LGH9scU
	OGn2Bpy6Loq1XyHF7pHGrNRvP4sqLkqdzdiIOd4gIe8sBdAh/Uil9mHbzlXOQ803q1tLZxgjZwW3x
	PxPYNE3VMZhVOnlc6fIM2Pypnmv+BpATj2ClWUqr0tXL6dUEgbEVZjz+yA94BzV+SJcdzwjnncUn4
	YjYk1laAArhinlOGbQcPq68l2Ul7qHrVTyrhnwg+AvJZ8jkKcGGRttuunpiXVQ9NvIHOY/liGOYdX
	KnvW29mAP+UAkdYjS3up1VDzCCMNDWQfg7bpxHhqqnZPjHIjYkmdujDVAnT8xN2XTSvNJuEOeyCl6
	D+F1UHJjQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4aqz-0003qV-Rx; Wed, 27 Jan 2021 02:46:45 +0000
Received: from a1.mail.mailgun.net ([198.61.254.60])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4aqw-0003q0-Hq
 for ath11k@lists.infradead.org; Wed, 27 Jan 2021 02:46:44 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1611715603; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=qw/kVL84SAVbHjsbqYNnOyC+Y4xO3RhPA7uTRHVZgAg=;
 b=gPfDfWCNCzlk5Cl8DOJpuO3CxZTNXN6+naWi0YS95ynI7lfp7C6RrquRx/Vk/ETZsufbWDAD
 KuwSbMzRQ4G3Q1yDgvEu4x5iVRPVEaebfTfVpJgBujwyc+erayfsCwHD3Im1tMYxAI7uriC8
 pYrqIwwOPIyTQ71kBhs1mC+GP6Y=
X-Mailgun-Sending-Ip: 198.61.254.60
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 6010d4095677aca7bd05f29b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 27 Jan 2021 02:46:33
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 08835C43461; Wed, 27 Jan 2021 02:46:33 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: periyasa)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id BFAEDC433C6;
 Wed, 27 Jan 2021 02:46:32 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 27 Jan 2021 08:16:32 +0530
From: Karthikeyan periyasamy <periyasa@codeaurora.org>
To: Peter Oh <peter.oh@eero.com>
Subject: Re: [PATCH] ath11k: Update tx descriptor search index properly
In-Reply-To: <959ea12a-e35b-5867-c55e-7f62e2956b09@eero.com>
References: <1608305041-21946-1-git-send-email-periyasa@codeaurora.org>
 <959ea12a-e35b-5867-c55e-7f62e2956b09@eero.com>
Message-ID: <d6cbfd2aff787faa3be69252b2677df9@codeaurora.org>
X-Sender: periyasa@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210126_214643_597414_4B2C9922 
X-CRM114-Status: GOOD (  11.05  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 2020-12-19 00:53, Peter Oh wrote:
> On 12/18/20 7:24 AM, Karthikeyan Periyasamy wrote:
>> Tx descriptor search index field should be updated with hw peer id
>> and not by AST Hash. Incorrect search index causes throughput 
>> degradation
>> in all the platforms. so updated the search index field with hw peer 
>> id,
>> which is a common change applicable for all the platforms.
>> 
>> Tested-on: IPQ8074 hw2.0 AHB 
>> WLAN.HK.2.4.0.1-01492-QCAHKSWPL_SILICONZ-1
>> 
>> diff --git a/drivers/net/wireless/ath/ath11k/peer.c 
>> b/drivers/net/wireless/ath/ath11k/peer.c
>> index b69e7eb..f49abefa 100644
>> --- a/drivers/net/wireless/ath/ath11k/peer.c
>> +++ b/drivers/net/wireless/ath/ath11k/peer.c
>> 
>> @@ -309,7 +310,11 @@ int ath11k_peer_create(struct ath11k *ar, struct 
>> ath11k_vif *arvif,
>>     	peer->pdev_idx = ar->pdev_idx;
>>   	peer->sta = sta;
>> -	arvif->ast_hash = peer->ast_hash;
>> +
>> +	if (arvif->vif->type == NL80211_IFTYPE_STATION) {
>> +		arvif->ast_hash = peer->ast_hash;
>> +		arvif->ast_idx = peer->hw_peer_id;
>> +	}
> 
> How about non STATION type?
> 

no need of configuring the ast_idx, ast_hash field for non station type. 
Its recommended by HW/FW team.

Thanks,
Karthikeyan P

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

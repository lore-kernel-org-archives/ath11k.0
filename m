Return-Path: <SRS0=hMZx=IQ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 034CCC433DB
	for <ath11k@archiver.kernel.org>; Thu, 18 Mar 2021 20:25:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9856C64EB9
	for <ath11k@archiver.kernel.org>; Thu, 18 Mar 2021 20:25:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9856C64EB9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RvRWX2tH/klgkY6u0cGD2nP6EwvnNU42V2QwHVvJ5H8=; b=cSs6D36DAGQjj2fKiJQ945cYm
	GYJyLlu9KXiJa1qGFN5xC9u3TNbEjCbGHn/GHCgfxfOoeJStGMb9Icxf/ipbCb/EfOVpD0CbV0JMn
	zK81XOyvM1hje2C2HzdYHA87oDNJT41g8KpVitWcPYoMNT8KOks5ZdKwDmasynb/FLMLTLKum/MZT
	RAm/IB0vHMZ1GNxF9lPaiPbIcTyZlySo7bh82uAj5Jt2y9oahRBLJpPsssZiN9qVpYkqxAFXAr82S
	gUGDuKS3rdneg2/spc2/DTJ2q7CiWc3qszxNABdMInYIS4CmpgSFFcx3W3AV/XTWgGnqZSdqaOKtw
	+KIFRMWqQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMzCe-005zNj-GN; Thu, 18 Mar 2021 20:25:08 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMzCY-005zN6-QE
 for ath11k@lists.infradead.org; Thu, 18 Mar 2021 20:25:06 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1616099104; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=jnf5OevRfRzndK6VJ9m/LFXR55ww48JvW9oCoFKzSGM=;
 b=hMn3/8e785h7dWD5QwXUshY/781jdF4jgvPTrmc9EdxR5YWypEWer0oZMc2NEZq4osl3zJI8
 PfuqGqrSrXyqgJ63H8BUCspNFkcQ1lv8iupVj6Eht8tLDRqXnow2esbi+UIvOOruC4JKThLj
 WhYS7n2mrq35Ei1F7BrS8rMxibQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 6053b70e21031618f668ceb1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 18 Mar 2021 20:24:46
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6EF69C433CA; Thu, 18 Mar 2021 20:24:46 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: pradeepc)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B7227C433C6;
 Thu, 18 Mar 2021 20:24:44 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 18 Mar 2021 13:24:44 -0700
From: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
To: Karthikeyan periyasamy <periyasa@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, Miles Hu
 <milehu@codeaurora.org>, John Crispin <john@phrozen.org>,
 pradeepc=codeaurora.org@codeaurora.org
Subject: Re: [PATCH v7 1/3] ath11k: switch to using ieee80211_tx_status_ext()
In-Reply-To: <65a8f70609a1758611c97205abd205f2@codeaurora.org>
References: <20210305230337.23047-1-pradeepc@codeaurora.org>
 <20210305230337.23047-2-pradeepc@codeaurora.org>
 <65a8f70609a1758611c97205abd205f2@codeaurora.org>
Message-ID: <dde25ece7fcbc6a0f268c98aa461d792@codeaurora.org>
X-Sender: pradeepc@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_202504_806576_F8B3CE67 
X-CRM114-Status: UNSURE (   8.00  )
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

>> +	spin_lock_bh(&ab->base_lock);
>> +	peer = ath11k_peer_find_by_id(ab, ts->peer_id);
>> +	if (peer) {
>> +		arsta = (struct ath11k_sta *)peer->sta->drv_priv;
>> +		status.sta = peer->sta;
>> +		status.skb = msdu;
>> +		status.info = info;
>> +		status.rate = &arsta->last_txrate;
>> +	}
>> +	rcu_read_unlock();
>> +	if (peer)
>> +		ieee80211_tx_status_ext(ar->hw, &status);
>> +	else
>> +		dev_kfree_skb_any(msdu);
>> +	spin_unlock_bh(&ab->base_lock);
> 
> Why ieee80211_tx_status_ext() kept under spin_lock?
> 
> Thanks,
> Karthikeyan P
Thanks Karthikeyan for the review..Yes, spin lock could be avoided for
ieee80211_tx_status_ext(). I will address this in next revision.

Thanks
pradeep

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

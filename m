Return-Path: <SRS0=TjBW=IR=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF605C433E0
	for <ath11k@archiver.kernel.org>; Fri, 19 Mar 2021 05:32:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7476664F65
	for <ath11k@archiver.kernel.org>; Fri, 19 Mar 2021 05:32:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7476664F65
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EWuDAVcAN+z/6BY0Ady5vYGCR/UpwaDtA/QWBSyVUZ0=; b=Cn0ls3IA2x9TciyFhSHyUBcic
	frbWNlqE+PqQ69esTDVDtmxOU00q0HfpfZCYX40LOPd1KnA0UbRe/1Um49aVwnG6WE4X6KI2+Pdxa
	Abfyq22Vr1T6567YiZAKAVoFQdMFRs/9pPheYTmo5j1Tqo/vj1+D9voLINGwD4mtmj+LK9my8CAdk
	SnN0d4JEcvF+Jj1Eo45bAgvZPRM0hu3q7ShaTxGTZu4kJnY5uyzfzAeMTQrWFByBQsyK7H4r/mqef
	+3Ep9/JhQNkgRE/7yJBNoTvlSsF5PHCOJ9oH2D1ZSPIpARToyOU4HFkTznNRkFyBBBe5N0OAn3SB5
	RSrP/8wAw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lN7jp-006aUV-VC; Fri, 19 Mar 2021 05:31:58 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lN7jj-006aTv-DT
 for ath11k@lists.infradead.org; Fri, 19 Mar 2021 05:31:56 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1616131914; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=4Fw/9ix5c3ONb9JlAoxaOb2rJAyzpG4j9/cNWCYvGSs=;
 b=N1m2UKjkfUn6vujZlvOBWl4hT4421+ve08XXCUgeSOZ3f+wph9t6pLSOiQQxIPiC1VcDdPq0
 xjMOblftTF27BiQ1JfrBooFEdv6ikSMPv86QtAri5BcuPdbMOiaHWfGzJsczYD+GFBteDaVN
 /ioZXmh5v5JQUJbRX9kYQnEvgxk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 605437426dc1045b7dc82d1b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 19 Mar 2021 05:31:46
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 74D37C433ED; Fri, 19 Mar 2021 05:31:45 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: periyasa)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 2B99BC433CA;
 Fri, 19 Mar 2021 05:31:45 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 19 Mar 2021 11:01:45 +0530
From: Karthikeyan periyasamy <periyasa@codeaurora.org>
To: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, Miles Hu
 <milehu@codeaurora.org>, John Crispin <john@phrozen.org>,
 pradeepc=codeaurora.org@codeaurora.org
Subject: Re: [PATCH V8 1/3] ath11k: switch to using ieee80211_tx_status_ext()
In-Reply-To: <1616105397-1482-2-git-send-email-pradeepc@codeaurora.org>
References: <1616105397-1482-1-git-send-email-pradeepc@codeaurora.org>
 <1616105397-1482-2-git-send-email-pradeepc@codeaurora.org>
Message-ID: <183cd636909cec0b8d20da8515c146ab@codeaurora.org>
X-Sender: periyasa@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210319_053154_460285_0A7136AE 
X-CRM114-Status: UNSURE (   6.67  )
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


> -	ieee80211_tx_status(ar->hw, msdu);
> +	spin_lock_bh(&ab->base_lock);
> +	peer = ath11k_peer_find_by_id(ab, ts->peer_id);
> +	if (peer) {
> +		arsta = (struct ath11k_sta *)peer->sta->drv_priv;
> +		status.sta = peer->sta;
> +		status.skb = msdu;
> +		status.info = info;
> +		status.rate = &arsta->last_txrate;

Assigning arsta holded last_txrate pointer to status.rate create race 
condition problem b/w sta delete and ieee80211_tx_status_ext, no ?
Hw we ensure that arsta pointer is valid until ieee80211_tx_status_ext() 
processing?

Instead why don't we have local struct rate_info and assign like below 
code snippet

         struct rate_info rate;
...
         rate = arsta->last_txrate;
         status.rate = &rate;

Thanks,
Karthikeyan P

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

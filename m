Return-Path: <SRS0=2hxC=FW=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3642FC4361B
	for <ath11k@archiver.kernel.org>; Fri, 18 Dec 2020 19:23:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1FDE23B85
	for <ath11k@archiver.kernel.org>; Fri, 18 Dec 2020 19:23:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1FDE23B85
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=eero.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iUJSfqqL27ANAajcOiiCdR9cWiv5DmTd3lkmzJQFw48=; b=FkW1aucdn8lE2WcvRnIIT/sMc
	fpZakgz63tyKSKSIFHqd4DS6Pkj2WjacAFKMNHzIdFfn30un4DXMxqWknoo9ZAA2DPI40bStz1G1f
	MQFfmay1Au/VMxWHrpbYnpJRq598X6kI0NqjFuChfDBxrW0cCvZXUSLatogQItLSTvwJrHdpFd0lB
	CwJZ4tG1B+EvuN3SEhUGJ9MaHwqtRV40tezOhnEvTXRliqn7SHGUrYISUUsrxw4ATDQXl7zqLAhdA
	ZNhFtshT9H+znl+Fj9xAdHvA2m2Z7e8TV1+w7E7q6JtWNgfMCiH1I9W6GClWaRRIIgbo/28rPgm4o
	wI5EhUJfg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqLM2-0006Ei-7U; Fri, 18 Dec 2020 19:23:54 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqLLz-0006EB-Bz
 for ath11k@lists.infradead.org; Fri, 18 Dec 2020 19:23:52 +0000
Received: by mail-pf1-x42d.google.com with SMTP id t22so2125604pfl.3
 for <ath11k@lists.infradead.org>; Fri, 18 Dec 2020 11:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eero.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=RtiyhyBkL4tfd0RAGR/mPDiJQVNxW+PMiUHl3EQBP/w=;
 b=RinV89pA5JcUZowGG657O+HY/Gtx+v7rGrcbd8GB03LBGrMc6G9skx56mHEOK6VTiD
 r/wlKvMZtUI4aEKrqDXpkBBITMrU8CIMtyy9OVu133431dsZjxliXpMvtUyBz3ntFaiN
 avVWK7yWl+DEWqXF2Eg9YqJHaaGcqxJSfBw0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=RtiyhyBkL4tfd0RAGR/mPDiJQVNxW+PMiUHl3EQBP/w=;
 b=KSVeevpQKcLt3oirQst06Abry0Fm9/PDyNb1oRrHZX5u9J8Tv1dEOINjJky2X5iNB+
 RU7dtMex0lo5YDyLNfzi4w6duS2fSczoGnfu+oXNtJ0rsl8X17YbHNhG9pszbyoC7HQr
 qjRHIjjsMi6HXpkA+fW2Fzt3VrJM4iUtoZtbluiZhqe/UfQpJ5zIdHTycJbeCb9ly5EZ
 3ejtPZGMSxV9h5/YXgaQ52Y7huKgtEFeh/wTzknR/ERfOmyrlaPdjDoaC2Q1U3Omxv8l
 I4ghFWl3o/V8GGW1Gw/fKU/dO3pg6gvsn4zSZg+LzgBOZs+K68d9NOMR+bIdjRxNaUZj
 bsSg==
X-Gm-Message-State: AOAM532ZJIz7MXvqtROEevL6MSBDVC3QzeVk0qSdS+0ImKcu73c82DAe
 6LM6vMykSKCnj3+MooTP0OfGSg==
X-Google-Smtp-Source: ABdhPJx/AP5DkoyJQ+EP9RmbLoqe5jtY9waPKfIHojLEl6YmcUPmFecZjyAFwGtl6+gddayD8Wo3yA==
X-Received: by 2002:a63:c644:: with SMTP id x4mr5527568pgg.421.1608319427564; 
 Fri, 18 Dec 2020 11:23:47 -0800 (PST)
Received: from [192.168.4.200] (c-76-102-118-9.hsd1.ca.comcast.net.
 [76.102.118.9])
 by smtp.gmail.com with ESMTPSA id z10sm9562004pfr.204.2020.12.18.11.23.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Dec 2020 11:23:46 -0800 (PST)
Subject: Re: [PATCH] ath11k: Update tx descriptor search index properly
To: Karthikeyan Periyasamy <periyasa@codeaurora.org>,
 ath11k@lists.infradead.org
References: <1608305041-21946-1-git-send-email-periyasa@codeaurora.org>
From: Peter Oh <peter.oh@eero.com>
Message-ID: <959ea12a-e35b-5867-c55e-7f62e2956b09@eero.com>
Date: Fri, 18 Dec 2020 11:23:44 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1608305041-21946-1-git-send-email-periyasa@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201218_142351_550804_419F1EA1 
X-CRM114-Status: GOOD (  13.36  )
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
Cc: linux-wireless@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org


On 12/18/20 7:24 AM, Karthikeyan Periyasamy wrote:
> Tx descriptor search index field should be updated with hw peer id
> and not by AST Hash. Incorrect search index causes throughput degradation
> in all the platforms. so updated the search index field with hw peer id,
> which is a common change applicable for all the platforms.
>
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01492-QCAHKSWPL_SILICONZ-1
>
> diff --git a/drivers/net/wireless/ath/ath11k/peer.c b/drivers/net/wireless/ath/ath11k/peer.c
> index b69e7eb..f49abefa 100644
> --- a/drivers/net/wireless/ath/ath11k/peer.c
> +++ b/drivers/net/wireless/ath/ath11k/peer.c
>
> @@ -309,7 +310,11 @@ int ath11k_peer_create(struct ath11k *ar, struct ath11k_vif *arvif,
>   
>   	peer->pdev_idx = ar->pdev_idx;
>   	peer->sta = sta;
> -	arvif->ast_hash = peer->ast_hash;
> +
> +	if (arvif->vif->type == NL80211_IFTYPE_STATION) {
> +		arvif->ast_hash = peer->ast_hash;
> +		arvif->ast_idx = peer->hw_peer_id;
> +	}

How about non STATION type?


Thanks,

Peter


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

Return-Path: <SRS0=KApm=NQ=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92E29C432BE
	for <ath11k@archiver.kernel.org>; Wed, 25 Aug 2021 21:56:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5632060EE4
	for <ath11k@archiver.kernel.org>; Wed, 25 Aug 2021 21:56:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5632060EE4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=eero.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CHkR7Oa6lPGByBHPADxJhWwACybN7LuIie+49/jNzaI=; b=NJV1M2X7sO2M/KBnh5DZQxphdl
	/YkJU1QwDXr1AvnJwOcz4/bHK4/nY4bOx1S2d+LxzsKzD4GS5RVw41/5bCMdf4aVZTkfmqxhjcUBN
	eOpqM0DA74jeYzioTMk4Uvz+Nu71fhMMgZFF/OBDlu4HzPMAnt4pdeJYO/qyg30utT4tLdBmyPLEU
	/MT8kpGwWVZtjPNsduTRcY4dGUxJVFynDg7lDW9kH5+Cv4hcL3L9ItFVROH4EwPEU16kAMPUrkLxB
	Hk84DS/9c0WEbUcb/ejD8O+CQgIJPCGJqRA592YDPbNMKb5Ku0rJBHUdKpU9OYuuXyBsyv2x4/sGK
	rJ6ru3/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJ0sg-008ZHW-MC; Wed, 25 Aug 2021 21:56:22 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJ0sa-008ZH8-Ny
 for ath11k@lists.infradead.org; Wed, 25 Aug 2021 21:56:20 +0000
Received: by mail-qt1-x836.google.com with SMTP id g11so779030qtk.5
 for <ath11k@lists.infradead.org>; Wed, 25 Aug 2021 14:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eero.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=BqZHyCQ+ZtRXhu36KVaGHkhitAs2yNa7TyGZghJpS00=;
 b=W5G2Zj11SONKDaKUAXuJyI7ECC0XlvUKcjisURXCEDHOWJmV/wdW3BQuxClJtlgwGh
 8POCXs0BDHY7R75VzO8D+TnBJyM8NG21+H3PxODoGgeXnvRaVUrym8f/H7zNI7Ra2enl
 2g3BTgL/RJzJzmLnDeZHzfLxM9ME8sEKs3Zw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=BqZHyCQ+ZtRXhu36KVaGHkhitAs2yNa7TyGZghJpS00=;
 b=cky+LpPkonUy7JR9AMu4dxAgvdz6UlAOE2AQlwDnU53O0jUbQJ47IRUE6UM4zWtApk
 J3EPIQrgjbHDMT7xQv2JupdLnxZuE6+uu9FTlfS8nngZJEe34gNmH7wl2QbnrBwpI5eW
 4JIsRIBTRKWUW4SfV2kyrVkLSAFgRYtTzCsa99GE5P23ww1BwVEs0FO7OMoMxR8DnHpB
 o1f3JPqlT9HPAA3dgjKMgUQd51FOLeZ2LYBJuvRBCUa6ggLDTE656lv6RY0GMgMxlfiP
 khzU2VJZRHoKfQuz4fty01dZkeQBuHeS1rlZrGf/UvEjxVeM/lmOMeZrQ3E8APIMfL8V
 QgUA==
X-Gm-Message-State: AOAM5300r1F5fc4WEq1rhM5l9eoyiC+AR+L94B/NOOvfR9IOyFpoqVEV
 MuoFQ0QTvjk+2gdIvwlCyzF9BA==
X-Google-Smtp-Source: ABdhPJwQfWI7ufnrj99gZ4aNyiNHofH7qULvzyzpRi6m9lvYmbqKKWQ3+Z+7Z+rehISyYjIdJu+hgw==
X-Received: by 2002:a05:622a:120d:: with SMTP id
 y13mr465870qtx.10.1629928574320; 
 Wed, 25 Aug 2021 14:56:14 -0700 (PDT)
Received: from ?IPv6:2600:1700:38c5:675f:d171:ff55:3554:62a5?
 ([2600:1700:38c5:675f:d171:ff55:3554:62a5])
 by smtp.gmail.com with ESMTPSA id q184sm1013531qkd.35.2021.08.25.14.56.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Aug 2021 14:56:13 -0700 (PDT)
Subject: Re: [PATCH v2 12/12] ath11k: avoid unnecessary lock contention in
 tx_completion path
To: P Praneesh <ppranees@codeaurora.org>, kvalo@codeaurora.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Karthikeyan Periyasamy <periyasa@codeaurora.org>,
 Jouni Malinen <jouni@codeaurora.org>
References: <1629884277-18759-1-git-send-email-ppranees@codeaurora.org>
 <1629884277-18759-13-git-send-email-ppranees@codeaurora.org>
From: Peter Oh <peter.oh@eero.com>
Message-ID: <288e574d-0de0-9002-b853-5fa1db3bd3f7@eero.com>
Date: Wed, 25 Aug 2021 14:56:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1629884277-18759-13-git-send-email-ppranees@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_145616_969669_2792493A 
X-CRM114-Status: GOOD (  10.18  )
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


On 8/25/21 2:37 AM, P Praneesh wrote:
> @@ -584,16 +580,15 @@ void ath11k_dp_tx_completion_handler(struct ath11k_base *ab, int ring_id)
>   			continue;
>   		}
>   
> -		spin_lock_bh(&tx_ring->tx_idr_lock);
> -		msdu = idr_find(&tx_ring->txbuf_idr, msdu_id);
missing spin_lock(&tx_ring->tx_idr_lock);here?
> +		msdu = idr_remove(&tx_ring->txbuf_idr, msdu_id);
>   		if (unlikely(!msdu)) {
>   			ath11k_warn(ab, "tx completion for unknown msdu_id %d\n",
>   				    msdu_id);
> -			spin_unlock_bh(&tx_ring->tx_idr_lock);
> +			spin_unlock(&tx_ring->tx_idr_lock);
>   			continue;
>   		}
> -		idr_remove(&tx_ring->txbuf_idr, msdu_id);
> -		spin_unlock_bh(&tx_ring->tx_idr_lock);
> +
> +		spin_unlock(&tx_ring->tx_idr_lock);
>   
>   		ar = ab->pdevs[mac_id].ar;
>   

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k

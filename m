Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E255C0218D
	for <ath11k@archiver.kernel.org>; Tue, 28 Jan 2025 22:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KUBj3z+QlIiU8/W3AdzN3Qhed9pVzFFAvcMrnqtnFIw=; b=abHbzsE4/lMlw6YfkVxnomYAOS
	bjyjsfB3UET6aINuRqdh6mGbrGo7auBz1YAZMASq+LHcD4nJVgvPHCaxIaqQZwVq52y64C5Sq9606
	XPJBx58BXzq2BXYzXKbMCUTLn/BfezPKMLMJMF4Q+PGcBmghWEEjcuM8tAX7Jqd5PkYhzUFLn4aL6
	MU6cO3OQSE+upBQG6rYp8AlmrZDznK886nn/hlfyb9CJXujE3NLOaL94hxQJf9HyaFlc6cokOgpEU
	+TVTmrbHFxb3YTvpg4OsSxP1zsRnL/jWuN2gqtwQ+E7bxeF8EtDyF246mX4Z92QmNcjkjngsTm3+A
	kcCh3M3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcu5K-00000005w3y-3yFF;
	Tue, 28 Jan 2025 22:29:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcu5I-00000005w3Y-10SR
	for ath11k@lists.infradead.org;
	Tue, 28 Jan 2025 22:29:29 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50SIsv2L005788
	for <ath11k@lists.infradead.org>; Tue, 28 Jan 2025 22:29:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KUBj3z+QlIiU8/W3AdzN3Qhed9pVzFFAvcMrnqtnFIw=; b=ULjrVbkPn/mQX0XK
	qtnVr600FdWQSeq2L6ruLDG95VHOz+KvkUfFWXOgh7PcktHeJ+yRuPJ0LRLgoOqH
	hu3Z6A39sP9qnQUM0dGzfdSXR8xhUcA+ScMKVArgxXj0SmwLc+khHPj086D/vni8
	qfhRzFg8E/PF2CdqWkvZ/tY8yNYbCsygafLIT2uQTRLBv4MMXmX5jnpNbHuNeDMX
	qr9MsY3L6tWh3SgD3f05DTOFEUM5Rk19AC1rLQzK43MTwrIvY4rLgSFjQMrYEHB0
	u7aU0wOQkmxaLpHXUBSo0kwREOdsoGDLnP4xUeiTLyhPw3qTmmnTEZVDpD4UiWKM
	dHGPiQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44f4x88cxk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 28 Jan 2025 22:29:26 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2166f9f52fbso189179095ad.2
        for <ath11k@lists.infradead.org>; Tue, 28 Jan 2025 14:29:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738103366; x=1738708166;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KUBj3z+QlIiU8/W3AdzN3Qhed9pVzFFAvcMrnqtnFIw=;
        b=h3IJYFyphtx/URSyCQvmqBdeXq2iZWscueRJSn+xrqkk6n081YXvdfTtG2+wFgvedo
         QWm9abqsbi/b6HZXzC3GILYWcXfMNWj7z284SJbaNDOehW0SMTLySvI1vFg0AvWeVYz1
         omaoFmkBN994NqL04Qcr87gveIIcw/fg2IuJwHXFNIPAJH/PGNDw3/gMAgILmydCKLd/
         8jKxTTQ/A/mlPfAZhCPXtKCXbw9Mr3OKY1JhOR0s1pFAlWpuwxRd7ojtkaQ/1tQnaoz4
         JQC59k5yC6KSeSdNKV8AvVaQUkSZwV1I9BUBkivCxEr7JreSOapvoOGTjCr7YvolFsdd
         sYxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGM0R3C905xBgu0GJbWspQ3Zjkj9sgWYb48p98easyKqpNFdXbOswvK2+wteSRCZ6lGCrR8Oc=@lists.infradead.org
X-Gm-Message-State: AOJu0YwR2ePMO06jpFkqDlp+Jm/4LW+It5KbUJ41a978LMUk5xxCEjZ1
	DvvGYma09avspPKBXxZfx4D2pm2esALyYTyRD0GXqS1uo+3v6zTEb/ULNuuf4XIyS/dthIuyxf0
	pd932VWJ527906yq76Gd8JByjFqqwZgXm6L2Uo7Lm5mL0/rpS30ZP8eM93ouk
X-Gm-Gg: ASbGnctHtHIArPXFvjcEZO9ChpcTOWJEA8PdXIgAQKfTxw8xjhHauRgfcQGRbC0yBKr
	rvxmOj7IIO/GnZFjG+8qva6S5Yax9zE729eiGZO+tjPzYszonEg1ezu/A0MOwtNB/MRuVxFPkAf
	++EIhCvq0qLrGRjerqi5WwwvGkzhZQaGmCIiCJUEriRDrVHqyIL8RgOFh0NbblG12GyMdd4DWRt
	kaT/nMaTM2u7Uw6TATv0X6J5JHWby+ioV9u1lJxNuhdhfQpDx78baAtjO8+moVqoYGQhzv/hJ0k
	JH1NO3gTzA26xEQtb949FF+u5CQ8Ubdv/uYa6NguqtUNneFBuvxqreC7iDdv/AsE8pTXe0Cr+w=
	=
X-Received: by 2002:a05:6a20:842a:b0:1e1:c0d7:7502 with SMTP id adf61e73a8af0-1ed7a6233edmr1485566637.37.1738103366084;
        Tue, 28 Jan 2025 14:29:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGhrrizMPrBdFMbKkt6Ls1uVXYfHcnVaDhIk4IsNSg1AmR8KiJrd3m0UAVfDOH8MjaNTmF0Jw==
X-Received: by 2002:a05:6a20:842a:b0:1e1:c0d7:7502 with SMTP id adf61e73a8af0-1ed7a6233edmr1485539637.37.1738103365665;
        Tue, 28 Jan 2025 14:29:25 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a6b2ed8sm9732665b3a.41.2025.01.28.14.29.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 14:29:25 -0800 (PST)
Message-ID: <d5eda793-c7e9-453f-9dbc-07e5df73c47d@oss.qualcomm.com>
Date: Tue, 28 Jan 2025 14:29:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: remove peer extra rssi update
To: Nicolas Escande <nico.escande@gmail.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250117181953.3375273-1-nico.escande@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250117181953.3375273-1-nico.escande@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0vHFxNXATQelnJfTDSn2xKfeA826j1FI
X-Proofpoint-GUID: 0vHFxNXATQelnJfTDSn2xKfeA826j1FI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 malwarescore=0 clxscore=1015 mlxlogscore=999 impostorscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501280164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_142928_305023_9FDF8BFB 
X-CRM114-Status: GOOD (  15.18  )
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

On 1/17/2025 10:19 AM, Nicolas Escande wrote:
> Commit b205ce4c266c (ath11k: support avg signal in station dump) added an

I'll fixup this reference to address the checkpatch error:
ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'Commit b205ce4c266c ("ath11k: support avg signal in station dump")'
total: 1 errors, 0 warnings, 0 checks, 8 lines checked

> extra assignment of arsta->rssi_comb in ath11k_dp_rx_update_peer_stats
> when it added the average rssi support. So lets keeps only one by removing
> the legacy assignment so the two statements about rssi stay next to each
> other. Compile tested only.
> 
> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
> ---
>  drivers/net/wireless/ath/ath11k/dp_rx.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
> index 029ecf51c9efd..24774cba9823b 100644
> --- a/drivers/net/wireless/ath/ath11k/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
> @@ -2831,8 +2831,6 @@ static void ath11k_dp_rx_update_peer_stats(struct ath11k_sta *arsta,
>  	rx_stats->dcm_count += ppdu_info->dcm;
>  	rx_stats->ru_alloc_cnt[ppdu_info->ru_alloc] += num_msdu;
>  
> -	arsta->rssi_comb = ppdu_info->rssi_comb;
> -
>  	BUILD_BUG_ON(ARRAY_SIZE(arsta->chain_signal) >
>  			     ARRAY_SIZE(ppdu_info->rssi_chain_pri20));
>  



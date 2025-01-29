Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B201C02193
	for <ath11k@archiver.kernel.org>; Wed, 29 Jan 2025 23:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=clcrYXE/xU0IeSxr30zaRsk0pTGNb4h/2PI2joNP4us=; b=LLf6Ht96G5ZOaGvTZQsb3cCmBh
	1934ZkPMT0upTXMemrphOHmdFSM4vHgU2skzsgamv916WPA0WOTTPdyczuOgCAiVK/oyNvf8H/tk0
	FwAXcF9dfG5SfWM5me3YJbV47lM/0zH/WOlXZSoPjkhqAiZi/8MojhS/1s6fbiTxtS7uT63D4BzKV
	JXeejcb+nF1mtVyLNWhHVf2XCFeKW3tctb7OLLjgWYdn0Ea0WH/n6QTaDzzAVGLNe0TTltC0RXM1r
	KoiPJaHeG3LyVPR8/o2aOKEL+SY0/OZbBn8VG1pzH17ZkKx8rpieKqyXNh4XGaLc96Rk4XzD6EzKL
	XgzU3gPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdHrO-00000007yif-2UfX;
	Wed, 29 Jan 2025 23:52:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdHrL-00000007yhw-3uc0
	for ath11k@lists.infradead.org;
	Wed, 29 Jan 2025 23:52:41 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50TB4ZmO023872
	for <ath11k@lists.infradead.org>; Wed, 29 Jan 2025 23:52:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	clcrYXE/xU0IeSxr30zaRsk0pTGNb4h/2PI2joNP4us=; b=SKkVnpa0SFS/X8uL
	8AEQ506NSNtJJlcahD1DRCh0UAwcA9oL5B2a7BI3+kAfwy4lir5a6BiyBUjnmEhW
	eclA35H+jjsIN8S5VFdKihIHIKEfsvfTOGxIwLzYo4++vCRkLR6h4TLc+NVpv/YJ
	xKwK+xoNNmbC1zeY6/SDCCi6P58XbWggeT3rjum+q2KReHSn2XteVGEFI6zyJ9aF
	a9QYoB5WfmBFHhNxHfPDEdA1KVMaZPownQA1oNoduMLzr1Y8xg3qt7XLNpwxjDfZ
	0bRsR/CslTpbv0yUvJe8U6lhzFBpDZ+VNgOv5VkJ49RXBAst2Nwf/Bv0jfbv5vdU
	iTuEsQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44fk501m1c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 29 Jan 2025 23:52:38 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-21648ddd461so4141365ad.0
        for <ath11k@lists.infradead.org>; Wed, 29 Jan 2025 15:52:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738194757; x=1738799557;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=clcrYXE/xU0IeSxr30zaRsk0pTGNb4h/2PI2joNP4us=;
        b=Wv4LWt6eCxr2EnEn8SJp93Fv4zvU3MyUVJINO5e1rFbfHUCdlD/J5hruDenjGeAQCZ
         62yQ2x3GnLpN7yRBvjVYoWyGgvKOAcXF7tSSaeN2Y8grAYeTkGugN3gGikearFRaINZs
         +Qohl+ZSZjcgpRcVgfjO/oCX+ik1FZQsLf3o1uIX3IdGUiBNIE0IktfMg/3mYJDvrNQv
         bHoaghOwcYfmYqnMDZ3QLdyU68+qvNzN7SV6qbBoXyPzSeZgHiFt6mfCa7qhg/7wJeEv
         MeR7K8XKMa49HtpOJMLPOCbemGGoqx8K4SL4P74w3Mb6AXNC5kRAL4sY9xh37loTMRGC
         dUoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNCeAQBm+pNSL/r0pKGHpbgI5tQvbchOdyKWKNPx3l4qazlMEdwW+QAltJAJPjxBChwkS0D0M=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6ubc2g0OzHpVcmgwL2kV588zvz3fc6feGGNWGKaDWFyMM5PA/
	YdjFlSR1jHzqA2x1LnlTOjHEGukoV/vbF2Gsvyl4d5xeVr2ixZvEYP6WqGDhEfvlRNOIQMlvfss
	1aM9nChk0vKCQUKVN3TD/5FMc5lWJTIqi1ZoTxvvyQrM5/fM3ZAhkBhrGtGgK
X-Gm-Gg: ASbGncugFRP/dOYa1HXRQtbUh2sIZXDVwXXolS7LEVcmgTOjMU/Y+16QtvzuOktgjUB
	kRirj8FTKKrbYp8mmI6zECIH0ZAkfTHqqMviMV5mbD7FWOKqp5qyRx0q8gDZH5+Axz4OJV/zXwW
	ruF1sEnGaNK29PFr1YcfBXS6CfWe3KUD5wiZya83y2ClIoXiXTw+3BK1SoZuLCa1qHvdrZUUmNv
	WjnfxmJ/GpSuoBz9iUePBG6e/pC0Or+Qeo5vTNTNhDej0TNUNHAxiJaoSsh/Qqa1dWvwipX0ajz
	j9vWAuZFxwS3503LFt0AcI1XGIiW6nmWt5ZAyFxWRbCHgHNUC+Z35c/ZQ/lFuSzMrP3GMhiRyQ=
	=
X-Received: by 2002:a17:903:41c3:b0:215:b190:de6 with SMTP id d9443c01a7336-21dd7c49786mr60956205ad.3.1738194757425;
        Wed, 29 Jan 2025 15:52:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH3H4vVJC6rZ3Hk1xg9tDfL6qJSIWM/KCIRVVCxKy7dxe20bT08UxAnmPL52QeNr66mrIGgFA==
X-Received: by 2002:a17:903:41c3:b0:215:b190:de6 with SMTP id d9443c01a7336-21dd7c49786mr60955995ad.3.1738194757013;
        Wed, 29 Jan 2025 15:52:37 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de32eda31sm1617855ad.109.2025.01.29.15.52.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 15:52:36 -0800 (PST)
Message-ID: <85216244-8348-4fc0-957d-6ffbcbcdb28b@oss.qualcomm.com>
Date: Wed, 29 Jan 2025 15:52:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] wifi: ath11k: refactor transmitted arvif retrieval
To: aloka.dixit@oss.qualcomm.com, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
References: <20250119052250.3488343-1-aloka.dixit@oss.qualcomm.com>
 <20250119052250.3488343-2-aloka.dixit@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250119052250.3488343-2-aloka.dixit@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: DlrIu2c9eJbb7CgGFZVo9mmz3FKAqnER
X-Proofpoint-ORIG-GUID: DlrIu2c9eJbb7CgGFZVo9mmz3FKAqnER
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-29_05,2025-01-29_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 suspectscore=0 mlxlogscore=771 clxscore=1015
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501290181
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_155239_973543_C421E1FB 
X-CRM114-Status: GOOD (  10.91  )
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

On 1/18/2025 9:22 PM, aloka.dixit@oss.qualcomm.com wrote:

...

> @@ -1538,7 +1546,7 @@ static int ath11k_mac_setup_bcn_tmpl_ema(struct ath11k_vif *arvif)
>  	u32 params = 0;
>  	u8 i = 0;
>  
> -	tx_arvif = ath11k_vif_to_arvif(arvif->vif->mbssid_tx_vif);
> +	tx_arvif = ath11k_mac_get_tx_arvif(arvif);
>  
>  	beacons = ieee80211_beacon_get_template_ema_list(tx_arvif->ar->hw,
>  							 tx_arvif->vif, 0);
> @@ -1597,7 +1605,7 @@ static int ath11k_mac_setup_bcn_tmpl_mbssid(struct ath11k_vif *arvif)
>  	int ret;
>  
>  	if (vif->mbssid_tx_vif) {

can/should we remove this test since ath11k_mac_get_tx_arvif() already does
this test? note ath11k_control_beaconing() removes the test

> -		tx_arvif = ath11k_vif_to_arvif(vif->mbssid_tx_vif);
> +		tx_arvif = ath11k_mac_get_tx_arvif(arvif);
>  		if (tx_arvif != arvif) {
>  			ar = tx_arvif->ar;
>  			ab = ar->ab;
...
> @@ -1701,9 +1709,7 @@ static void ath11k_control_beaconing(struct ath11k_vif *arvif,
>  
>  	ether_addr_copy(arvif->bssid, info->bssid);
>  
> -	if (arvif->vif->mbssid_tx_vif)
> -		tx_arvif = ath11k_vif_to_arvif(arvif->vif->mbssid_tx_vif);
> -
> +	tx_arvif = ath11k_mac_get_tx_arvif(arvif);
>  	ret = ath11k_wmi_vdev_up(arvif->ar, arvif->vdev_id, arvif->aid,
>  				 arvif->bssid,
>  				 tx_arvif ? tx_arvif->bssid : NULL,



Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD59CF531F6
	for <ath11k@archiver.kernel.org>; Tue, 14 Apr 2026 07:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dBIASGVnE0aFQr/a2JqCXpFWZWEJCZAiv8D1/xC8KcU=; b=fmuWhXpTODIQhZyWAPAz7k3xBR
	vDJkFsF4DADeOik8frVwXffdNpBXpAw+0KKW5LDoAD3i5/1vCJb/P32R47cqZ53nnxOmXUXbmv3dH
	rlh6Zizy9+FsWhdH+TQVFR970kcz2DrwGqqKWdRQyNjP2zLjbQHaWofOxdihhRKD0KdjH2ur2wF54
	ATBKaDk2SU9lnpsPDIq5BsyXJw+L1OgG2vVENPRqYxrvKvaquE9IiwLk1rsaYYcit2MiUOumGEdi5
	8IWIv31A4T2xDIo9ojVch/I+8vDNdZghOOqOd6lc5IB+TDUKAKgSehItig4FtrTV109VRgNth03Qv
	fQ5E7wjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCXr8-0000000Gse4-2QVt;
	Tue, 14 Apr 2026 07:06:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCXr6-0000000Gsdf-0QUo
	for ath11k@lists.infradead.org;
	Tue, 14 Apr 2026 07:06:41 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E71VQB967321
	for <ath11k@lists.infradead.org>; Tue, 14 Apr 2026 07:06:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dBIASGVnE0aFQr/a2JqCXpFWZWEJCZAiv8D1/xC8KcU=; b=R6lCWZriAbPOeJH8
	Wy12cvaj6HVWnB+TL8YNy3fq02sW2ZsYZo/XLTKGGwBztPnTnVuc+CWP5+iwfUbc
	5szWkXz66iDZCQqbdL11c6JTS0ZE6pEh5pgvt1oN3q0ks2eA1MmoV6g9fWyt/NGr
	4ge5EldxGu1Vc4Djgnx+AT9f+10Xliz/2uT+viZEsaRgBOqTXJ7ouN8REpsxjoJw
	HErWzRsjx3Z/wWZFV6UUakJQL/Iwp4TJnayQk+iLgeQvHXOkvg8wq1rdUlaXOAZW
	P/qEQU2a6aqJbEwxIWfmA5fF52O9uNc+IbNTpbnVa3epSuXorLuPm0QkvPl4/ErO
	Vl9hCg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86v1eqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 14 Apr 2026 07:06:38 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b45cd0bb96so20337845ad.3
        for <ath11k@lists.infradead.org>; Tue, 14 Apr 2026 00:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776150397; x=1776755197; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dBIASGVnE0aFQr/a2JqCXpFWZWEJCZAiv8D1/xC8KcU=;
        b=IJibh2Ok9bpm1/4zJTrf7eyp3s2WSVJFqOkiuD+FHO/pQ2qv/k51z3sA4TN+yoW09m
         QazaI6BjSCEZAFNNqU40ib8Hlj93Gsg5NlFSDLvnYTCcrjqgd7hTKS+yMI+D78vMjLC3
         n9T966g4DrH/FvGhmzLPqbbzg7EamcLjGYOSqcTsZfLD2/qeZut7ML8hzfuzprl/dZNx
         SuobwGLr0xgOvqQdmdrCKKSeInaqmbEvZC8UIhNlaT9yh74PJ3nKvap9IoNHfM/lg075
         jV3JKSfRAZHMHb0wVVZNNLgKNVonbgeWtwdG52oQocTnY+vkopceX+2AZXmhUvZ0H95M
         MNIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776150397; x=1776755197;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dBIASGVnE0aFQr/a2JqCXpFWZWEJCZAiv8D1/xC8KcU=;
        b=SgLGwhug6Tst8a+dVW9ttwT0D6aQq1U3hUCo7aWi8gU+H61bxJNfYFXaTLyLEIGF6O
         nGH2JtfAvA/4NmgKQYqH+XQhBJqG44BR+9dQES3qYq8arEeMHYckQSK3BtuHOL+MQZ1S
         4l23hbJ0GImYZ3AZbyouTAemFtPpJ0cWs9a5eQS8TXlIITU73yS8URNoIVeA1cY3fWkT
         WU/ZuqqGaVvELtLaZHVj7i6zPQ+uMRIqJ4Gdw1he3vUK19K48CDL2Xbez+Cxjq7haX/J
         OarAWYdwJ3sFCruh76+kXjyQpUZc+vu9o9hRXqvYiJfdpmF7806IiN+4tT1rcXURXUTj
         EnUg==
X-Forwarded-Encrypted: i=1; AFNElJ/GNyKlNXm7X6HQKm1TWuy5bE4FOR9/pcxmsV6Hh7qT5bTVJAVStc30xgNHf1rZqOil543c/J0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyLdYkQY8RsMHMPzvyxuzaSw77pQ21Cm/STNDPvSpS/Ty2hpkiH
	3vjARNAKA+QDhq8DfqlBp0N1H6zRBEHKKQu1U80aVO+3RSpEQ7aO2oqXNhub6CdhxWAvyY2Xysj
	fKaaDQjzaffhMvAXVDjIBibugaJVjx3ksNwXWB/X/HPycuDN27wbA67kNjXG19sLZRpi4fVPI
X-Gm-Gg: AeBDietLmcm1yj+C7vEztqs7GbHCtNWSXsL58Y0T89c+tfPROyoiNnsNBcNtep8QKuP
	7/ye3c8CpYnRMmY4o6PyOgHrHwDQdlDR+KjeOH4khbdL67JMyQ/QQxjbvcnEnl0J976ffZfe1XB
	eDm/RIjA3vGHfUfDvfLQFfX3MymSeYo/WLEoau9nfhkssxDZBKpFkmV7C+N2jHtNRzaxvvuq8wp
	toVvEbv0wjUs3owgRlQZ5vGdC7haBk+y1gNN6xxHqV3Xv0iM6M7Xof0ZTjQMYJIOzuakWH0CVxH
	0prb4MnL/CvYRnIj4cvSBUH/yvVaf9dJL8RRSfdHRS3xdmG6PDB067UW7zLFXkiJMXlAmw6bjEO
	IleUA+/e6O4Zw1cMEG3W23YXi7+6ounMA8aVnCyP9XE7QDD4qRWzScSJdrZ4xl/lQylLL+gdKgf
	5B7pIEGV69IyJjCKFN/rGrhonf7PcaQw==
X-Received: by 2002:a17:903:2f08:b0:2b2:4d90:98bd with SMTP id d9443c01a7336-2b2d5a64ef6mr163953905ad.44.1776150397194;
        Tue, 14 Apr 2026 00:06:37 -0700 (PDT)
X-Received: by 2002:a17:903:2f08:b0:2b2:4d90:98bd with SMTP id d9443c01a7336-2b2d5a64ef6mr163953605ad.44.1776150396698;
        Tue, 14 Apr 2026 00:06:36 -0700 (PDT)
Received: from [10.133.33.118] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4f431c3sm131161045ad.79.2026.04.14.00.06.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 00:06:36 -0700 (PDT)
Message-ID: <7dbc3836-c42c-4cbb-a50a-011d82a0ee81@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 15:06:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ath11k: workaround firmware bug where peer_id=0
To: Matthew Leach <matthew.leach@collabora.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20260326-ath11k-null-peerid-workaround-v1-1-0c2fd53202f8@collabora.com>
 <87h5pxlpg4.fsf@collabora.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <87h5pxlpg4.fsf@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA2NSBTYWx0ZWRfX3crQ21pHQb6f
 8pdErL8axJDeR/9bcz7wSSO8rCQljGlaMU7WcBJ12bXlR+TVBjL+hFIv/Q2OYHQDTxxcH1AmFEW
 ryHpCiLcxGCOMJCQAmn4kEIexRwTpaDZO44z7H4g7XiGsF8V89yPAUjJdCik+G81fYpwK4yEqJa
 xQLBHxtBxYx0hJB+WIR7vm0MkmdKqonB6y+xcPpiUKbAtGTdnwjs+nHKBTCMAQYg9FsShmStPJz
 Ro3ySz9VZ/g2E6tP/mrMnPIyrdQtxWtvylwnCZU2z2AVXtiLUoHgt4NzZ+H2EG3mKee9QfT9PoZ
 JaFTgxBj6I0rtwMCgiARDv/4JL9aG/E04lwOhjapGwBh0GSwAfZ+Wsxrt2AI5vMtwcBJ82FlclF
 SKI3UAp5aUkcwcui0deffHtquz6eHJgyTccbv5JY1N5pTfODmRbdHKSEihh2fAv+xu3FonWkoo/
 l1nfMujM2JvQ6uI266g==
X-Proofpoint-ORIG-GUID: x4-xarUK177nnj2V0lkOmL_KSLhPHLpI
X-Authority-Analysis: v=2.4 cv=Iowutr/g c=1 sm=1 tr=0 ts=69dde77e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=QX4gbG5DAAAA:8 a=SC-YAkXmNWsgAJuF7_sA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: x4-xarUK177nnj2V0lkOmL_KSLhPHLpI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 phishscore=0 clxscore=1011 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_000640_310259_DF7DD8E7 
X-CRM114-Status: GOOD (  24.07  )
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



On 3/30/2026 3:57 PM, Matthew Leach wrote:
> Hello,
> 
> Matthew Leach <matthew.leach@collabora.com> writes:
> 
>> This patch caches the peer enctype during the MSDU processing loop,
>> caching it on the first AMSDU sub-frame (is_first_msdu=1
>> is_last_msdu=0) and setting the correct enctype for any subsequent
>> sub-MSDUs.
> 
> I've been looking at creating a patch that addresses the root cause,
> rather than patching incoming frame's flags:
> 
> --8<---------------cut here---------------start------------->8---
> diff --git a/drivers/net/wireless/ath/ath11k/peer.c b/drivers/net/wireless/ath/ath11k/peer.c
> index 6d0126c39301..98348ccfdfbe 100644
> --- a/drivers/net/wireless/ath/ath11k/peer.c
> +++ b/drivers/net/wireless/ath/ath11k/peer.c
> @@ -347,7 +347,7 @@ static int __ath11k_peer_delete(struct ath11k *ar, u32 vdev_id, const u8 *addr)
>  	return 0;
>  }
>  
> -int ath11k_peer_delete(struct ath11k *ar, u32 vdev_id, u8 *addr)
> +int ath11k_peer_delete(struct ath11k *ar, u32 vdev_id, const u8 *addr)
>  {
>  	int ret;
>  
> @@ -372,7 +372,7 @@ int ath11k_peer_create(struct ath11k *ar, struct ath11k_vif *arvif,
>  {
>  	struct ath11k_peer *peer;
>  	struct ath11k_sta *arsta;
> -	int ret, fbret;
> +	int ret, fbret, retries = 3;
>  
>  	lockdep_assert_held(&ar->conf_mutex);
>  
> @@ -400,6 +400,8 @@ int ath11k_peer_create(struct ath11k *ar, struct ath11k_vif *arvif,
>  	spin_unlock_bh(&ar->ab->base_lock);
>  	mutex_unlock(&ar->ab->tbl_mtx_lock);
>  
> +retry:
> +
>  	ret = ath11k_wmi_send_peer_create_cmd(ar, param);
>  	if (ret) {
>  		ath11k_warn(ar->ab,
> @@ -427,6 +429,18 @@ int ath11k_peer_create(struct ath11k *ar, struct ath11k_vif *arvif,
>  		goto cleanup;
>  	}
>  
> +	if (!peer->peer_id) {
> +		if (retries--) {
> +			spin_unlock_bh(&ar->ab->base_lock);
> +			mutex_unlock(&ar->ab->tbl_mtx_lock);
> +			ath11k_peer_delete(ar, param->vdev_id, param->peer_addr);
> +			goto retry;
> +		} else {
> +			ath11k_warn(ar->ab, "Null peer workaround failed for peer %pM, adding anyway",
> +				    param->peer_addr);
> +		}
> +	}
> +
>  	ret = ath11k_peer_rhash_add(ar->ab, peer);
>  	if (ret) {
>  		spin_unlock_bh(&ar->ab->base_lock);
> diff --git a/drivers/net/wireless/ath/ath11k/peer.h b/drivers/net/wireless/ath/ath11k/peer.h
> index 3ad2f3355b14..6325c4d157c7 100644
> --- a/drivers/net/wireless/ath/ath11k/peer.h
> +++ b/drivers/net/wireless/ath/ath11k/peer.h
> @@ -47,7 +47,7 @@ struct ath11k_peer *ath11k_peer_find_by_addr(struct ath11k_base *ab,
>  					     const u8 *addr);
>  struct ath11k_peer *ath11k_peer_find_by_id(struct ath11k_base *ab, int peer_id);
>  void ath11k_peer_cleanup(struct ath11k *ar, u32 vdev_id);
> -int ath11k_peer_delete(struct ath11k *ar, u32 vdev_id, u8 *addr);
> +int ath11k_peer_delete(struct ath11k *ar, u32 vdev_id, const u8 *addr);
>  int ath11k_peer_create(struct ath11k *ar, struct ath11k_vif *arvif,
>  		       struct ieee80211_sta *sta, struct peer_create_params *param);
>  int ath11k_wait_for_peer_delete_done(struct ath11k *ar, u32 vdev_id,
> --8<---------------cut here---------------end--------------->8---
> 
> This patch detects the error condition at the point where a peer map
> request reply is received from the firmware. If the firmware maps with
> peer_id=0, we request that the firmware unmap that peer and map again,
> hoping it selects a peer_id!=0. We attempt this up to three times, at
> which point we give up and let the peer be mapped with an ID of 0.
> 
> This patch addresses the root cause, but I think it's more invasive. I'd
> appreciate some comments as to which approach upstream would prefer. If
> the preference is for the above, I'll send out a v2.

for chips like QCA2066 and WCN6855 etc 0 is a valid value, however this is not for chips
like QCN9074 etc.

so a possible fix would be to add hardware ops based on chips: for QCN9074 we keep the
existing validation on 0 in the ops, while for QCA2066 the ops is a null func. Or even
simper we can remove the validation for all chips.

> 
> Regards,



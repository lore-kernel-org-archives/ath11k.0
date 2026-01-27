Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B594D2FEDA
	for <ath11k@archiver.kernel.org>; Tue, 27 Jan 2026 18:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V1vEsiFeTiiqgiMqeCXQjM3da0iXlQoIsKv9ahLtWOQ=; b=m1zw3ggvbN2Tx2m7bbiDpR81ut
	N0NpRJI6JiCgcKl8BzNeOxzrNbwtrAiK9lHG2ViOu/UQlxI3bxlNU5RM4r6PUURywsX/61FpK3Ms2
	CpiJQvwqg9Y8kHHi9FK8nSvINmv0mkj0xEmXKKTnCPexN2iJat+/bztS7D28tggQ8AK/CwomQhWVZ
	i6jpZWZRXOUDC8gjH+8scOD/wnab87FaEzeX649xQwtlooauyYYgHpBcYM61KS4WqKt8DJqVoP1Zc
	Xgdw2LpQW+5ZEhJLv+GjdkArNhVV2Q/yTPEs1CqRdEYLeTQ9wOf+xVcLsZE9KK+0bnRfNMlQWZLHk
	1kBL788g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vknwp-0000000EpcD-3CQb;
	Tue, 27 Jan 2026 18:37:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vknwj-0000000Epbt-1sCZ
	for ath11k@lists.infradead.org;
	Tue, 27 Jan 2026 18:37:54 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RBxiWc1137473
	for <ath11k@lists.infradead.org>; Tue, 27 Jan 2026 18:37:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V1vEsiFeTiiqgiMqeCXQjM3da0iXlQoIsKv9ahLtWOQ=; b=ogP9fGq3QmJ/d39K
	vAh+dcKgdP05n96pYS6rK6IljIdjLlkkScPfIThdzuQHEQIO4QDTmlQG2LH4wolu
	jU0V38Kw5cnWYtFPsTh29GR7PPqb+sgtcpOZYNqcLqILvl16LMAygE22O7yYXoLQ
	KEwlr3M91xUgOI+MoieMAj8cc7KUCsJa6HNQvI1pXrEofjo9uVLimBFolbRsjICj
	/Gd/ta6dew65Dp0wxjmHehRtsPcHH4yKisXYzGQMxCDq0FMVoBhtvpCVd9ZbXLY0
	ESiXiEzeMBEkdYqi5rNkbMZLuzwmgFomNBjv71YSZJXnEXVqcV3XuwBdfarCvY3i
	taZNig==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxsjej3rw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 27 Jan 2026 18:37:48 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2b6f0b345e3so32126719eec.0
        for <ath11k@lists.infradead.org>; Tue, 27 Jan 2026 10:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769539067; x=1770143867; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V1vEsiFeTiiqgiMqeCXQjM3da0iXlQoIsKv9ahLtWOQ=;
        b=ASLp69GKfOOP1RPTflOS9jY7Jaix/AJg8n0fTIsn7dV4Jf4FpxwWqwcwt03zB/42yr
         FDjiQMdOXTjAHAcARfrjkX9THqRmdLRZhouJ6UUKMrp7BiDF0YqEPKJA8B4jlSau0gkW
         e5b/4bMGaaY/w9N3E3YVkqZbl5Y6pcurB43PcvPHSibDNep9Z2+VTNS+VtQD3plkw8Ax
         JSlp0RF1fAXezgWSNwqhgfsB4piJaVPjSjJT9FjcC/fjygpDc4cSGUs82uHl4/1vw+43
         m7HO2gKf+rTrKdpvp/HjHoItewAiLTTVPQYmQwU9w7MQS3le27UG8oEKTUGqcE6DItar
         0QkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769539067; x=1770143867;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V1vEsiFeTiiqgiMqeCXQjM3da0iXlQoIsKv9ahLtWOQ=;
        b=t0pHJhHprIypmIRbCWOGGWyuJSec2GGWiLfxiNO95HZEC6pFhKT08PvcYXTu8I9AzF
         Od/V0Qr8WOgYC5zWmSpfnuUkMLYoLlhI2zDREkak9cAmXsiBO5q52pn678QMRxkIEcc3
         FElityU6J4yGoiqkvlkGDRI4qFPfoWJUx+frh7MbCSN2SuwjomOYpy0upTBhpP28pXRb
         85XhIEmdT8KCAuM6lOlSws9LxLD5dHGOZBMaUH3NFf8ojeUkIdOhYUuHaFKnNKvtp5sv
         ElXCw3zAFelo0lAI3X55U6SoG10LR4SorS+8w90BWbJ+I2aEClQUWD7GJIgsmCCl3Kp/
         q71g==
X-Forwarded-Encrypted: i=1; AJvYcCWgmTtpOPDxorUibtHU/D69WTe5WtukQAQMVvLlWeHIwZRnu59+jUcMTGkRqUAfcSfwqkhHUag=@lists.infradead.org
X-Gm-Message-State: AOJu0YxCIdgNaCndb1rEEImdQ1EaD98uow2xcnl8iVodCGpprcygrgxe
	edACDoGM9GfM2YaMI3wnZIlKg2zT8B9IKrNPRChQM/RT+MYugxIg2Dm4OVLMsh/+amTVgeWZ6Vo
	hFV6hWgzhNrAlVywelHio65MYm59KTOKMOqcbzOxFyZe57h03geUBEOIpAro0h5IP7dUoYBfl
X-Gm-Gg: AZuq6aIdSrAYv1IouBBOkoIWXPYWU2rhY3+Efr/7FrTz0EabbVjuSWgT5O1+9CaASbO
	SworLr8LyWpyOf+3aYNZXW90oK/yrUl5HwKQePhMHbXP7gKSqh2Tj2/nxnALSsPZ9xSomazjkLt
	k0C7cqaMzjYHltkHMjey81nQpsqR8uGeGe95C6T6FKwFqFeU+rg/guMXJYiDivgF+GLDXrrfRY1
	hJLWnU+ZiTNhk2q/cIBFRUvTiH6CS6C3Ty4XORxv9qhoQX6swLdfXX9dj9OPMy8mJGvgbPEXtVa
	FH7GIHntUH+nT/9GWKNXRrD29VI1LNP6tDdQg7xKgv97wBNqgDW7Hba9yfA0ciP77rBqBFEDyo1
	3p2ssN8yaX8y/pmTf3Z92SvYgtbzL7hOkeVlGhCEEBkM+rQz6RSggtUwTa+CI2Q3NCKbYNA==
X-Received: by 2002:a05:7301:2e87:b0:2b7:2723:c227 with SMTP id 5a478bee46e88-2b78da2a6d0mr1817112eec.31.1769539067122;
        Tue, 27 Jan 2026 10:37:47 -0800 (PST)
X-Received: by 2002:a05:7301:2e87:b0:2b7:2723:c227 with SMTP id 5a478bee46e88-2b78da2a6d0mr1817089eec.31.1769539066551;
        Tue, 27 Jan 2026 10:37:46 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b79cc0df07sm397559eec.30.2026.01.27.10.37.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 10:37:46 -0800 (PST)
Message-ID: <a09671f5-0855-4f80-b373-d0658bdbf34b@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 10:37:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current v2] wifi: ath11k: fix wrong TID passed when
 stopping AMPDU session
To: Pablo Martin-Gomez <pmartin-gomez@freebox.fr>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260126174049.1370659-1-pmartin-gomez@freebox.fr>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260126174049.1370659-1-pmartin-gomez@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDE1MSBTYWx0ZWRfX+dlj3pW0YSYZ
 f7DuN1pz+cNtb/ejdT/LqcNQBGFzPRorgNakMhJkB3CtyG45dY7FWlSg/f5aFLc+9gw3LPes9ln
 2vCLosRZ8i6LRl8xqhMXkFkbJOhRo5TqF+t1xCd0PT6jDpMKyr4BR+4GuLkd5OUHBjCKXnpMdqu
 O0WcgEYsgviyOEF5gQ6SFd2w0Ps4NPNwgYLKRUkQOKcAesOFg7VbxlMBV6sLx+5YIsxxIEgGk2P
 l0HlmJ00YtnSc1ViIxNwm+p+d76WiJWSapvViYkDXvnomn5iS20zVw8WwHijKYl2ngYEh70e3rV
 clJx9E1a9ZnQiJPNdagIQRbG6svoe0eWpRJTOoo8oRzkU4ShgwdXWPZY/2W7pQH9ir2q1utqRyA
 USCKTRCH6r3sZznsjoh/ewLBZEQc1bLM3HsRz+0mRsUzRV/nB7hjPj/GwvXuy7gOHYpshetHQZC
 W1Ieu7bveLLz63vytNQ==
X-Authority-Analysis: v=2.4 cv=Qelrf8bv c=1 sm=1 tr=0 ts=697905fc cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=4MSwVuzKff4lAtYpjw4A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: 8xjJ1mxpMYZ7HekiaoWwmt-vOJeq2-XY
X-Proofpoint-GUID: 8xjJ1mxpMYZ7HekiaoWwmt-vOJeq2-XY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_04,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_103750_070817_FF120DE6 
X-CRM114-Status: GOOD (  21.96  )
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

On 1/26/2026 9:40 AM, Pablo Martin-Gomez wrote:
> When handling a DELBA request, ath11k_dp_rx_ampdu_stop() calls
> ath11k_peer_rx_tid_reo_update() to tear down the BA session for the
> specified TID. However, it currently passes peer->rx_tid instead of the
> entry corresponding to params->tid.
> 
> Since peer->rx_tid is an array, this decays to a pointer to the first
> element, effectively operating on TID 0 regardless of the TID in the
> DELBA request. As a result, the BA session for TID 0 is stopped while
> the intended TID remains active.
> 
> This leads to incorrect BA session state and may significantly reduce
> RX throughput, as traffic that should use aggregation falls back to a
> BA window size of 1 on TID 0.
> 
> Fix this by passing the correct TID entry:
>   &peer->rx_tid[params->tid]
> 
> Fixes: fe201947f8bd ("ath11k: update bawindow size in delba process")
> Signed-off-by: Pablo Martin-Gomez <pmartin-gomez@freebox.fr>
> ---
>  drivers/net/wireless/ath/ath11k/dp_rx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/dp_rx.c b/drivers/net/wireless/ath/ath11k/dp_rx.c
> index b9e976ddcbbf..8db04c38dfba 100644
> --- a/drivers/net/wireless/ath/ath11k/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath11k/dp_rx.c
> @@ -1132,7 +1132,7 @@ int ath11k_dp_rx_ampdu_stop(struct ath11k *ar,
>  		return 0;
>  	}
>  
> -	ret = ath11k_peer_rx_tid_reo_update(ar, peer, peer->rx_tid, 1, 0, false);
> +	ret = ath11k_peer_rx_tid_reo_update(ar, peer, &peer->rx_tid[params->tid], 1, 0, false);

Our ath11k-check scrip reports:
drivers/net/wireless/ath/ath11k/dp_rx.c:1135: line length of 95 exceeds 90 columns

I can split this for you when I apply the patch

>  	spin_unlock_bh(&ab->base_lock);
>  	if (ret) {
>  		ath11k_warn(ab, "failed to update reo for rx tid %d: %d\n",



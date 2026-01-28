Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3225CD35663
	for <ath11k@archiver.kernel.org>; Wed, 28 Jan 2026 02:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=myB7M/GUr59OzzN5PhoOQVsgmBT13emqVNz1IOIRUJY=; b=mmTEDE2ATHpVTNT0+fLrXptFBi
	Ze/4rR3V/I+B5VArr9tmacoP1hFGgTJlXl36KxmJmD8ygRL2iUq9FZ/MzsEPB+oyS5jNrJMxCK0GQ
	F87aoSNiEc9S2DmFHOGdwQWIAjXSd8eqmrSn0H++IG7bNj44l1Oo5LuzOjxI1vuG7gfLCZQ2w79iU
	15MSup1Q9M6KIsX/DqvCcN/SI4+tjqIlcM3w28muHIQj6naR2jrMWU4IHLCPgbsBaLOt0cS+SBxaF
	M/DC+bkyHFsv0bgdMlvTFJZYWl05HcQJ2luFlzNxAlBdV4CQzVvUfNPmpCVxfqh7AFevuw10ewjjC
	Tnq+nytg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkuuj-0000000FHfh-3dEE;
	Wed, 28 Jan 2026 02:04:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkuue-0000000FHeb-3yTj
	for ath11k@lists.infradead.org;
	Wed, 28 Jan 2026 02:04:12 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RKqYof2952913
	for <ath11k@lists.infradead.org>; Wed, 28 Jan 2026 02:04:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	myB7M/GUr59OzzN5PhoOQVsgmBT13emqVNz1IOIRUJY=; b=hD32uCzE6+4vA+F8
	piW6ObzSYkDftoRQyXA4c+NMRnzfcT4in+wBQkPIe9x3qPt2nVKKxAdhBFACboND
	kmtLMZniC6vJsnSKvj1XX4k2E6HPOsUO64309IE4/lEv14yA5BtLQk+NObaAK4eK
	YhGjV8tbiLft+Ur9JGIAixdz1Y3ka+YafZ204/XY7Ivq1IWI1JbYlBps/Q7NtTvL
	EPJHfQm8yBOyDS45F9syJuNhwJav1vgxQ/Vej//QNyet+faWiGJcwjGkiJMyNcZv
	fiK+ICzzTDbdPjEqtq1JbNfZ16N4PtXnjchRtKU05hDBQ8h3OeK0kBPpxyNcDQ3d
	HhpISw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by4sjrsme-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 28 Jan 2026 02:04:07 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-81f39ad0d82so11673856b3a.3
        for <ath11k@lists.infradead.org>; Tue, 27 Jan 2026 18:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769565846; x=1770170646; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=myB7M/GUr59OzzN5PhoOQVsgmBT13emqVNz1IOIRUJY=;
        b=hQRT+N//DOx32/abUHXpxdMXKRZcR9vVPINpvT1Iqigp8U86D7fKrO1k5OogLdYcCj
         ANzs+k37eDy99VmYOghEozsi8t8oUTculFmngvGwTnrdWGqYL12OZADmwY1H1h1aXADz
         sAqmZc0XVdbboPczaY0kaLIyDNq11JBmMXdJXmptsFB9XStutetxbNLN4MYY9iLvg8I8
         oGIUfxUxyTkBFj2EwNcrUHKaCvUB1D0inQbFmehjNrR21qEEI+NIYvy6AmPSoIH9LpZx
         bAwjSj1nuIZKn0ko2cLGpbfuWPbmsdVYgf5RnyJ1FSeSGmj9VNYM6FadnthvQM3rVbfV
         eaTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769565846; x=1770170646;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=myB7M/GUr59OzzN5PhoOQVsgmBT13emqVNz1IOIRUJY=;
        b=jhynkfLsgH5J2W7V/675TrAPo7eELIITi47L+2uAkmZPqLFdTIJ+B7A/fFDVIO+c4L
         5Ebj8ATbGiy5oJJWmqhVj7DY4tm+19c3zYXk5aaXWD7ugjvaAHXiBP/3DOrnWTO1xMxg
         gXXWK66mvpyan1VcgkxsIoSYRr5V1U5BcnpSvY1vN343w2B2WTYUmE9L0auZvdMGEydW
         XVpii3yGvr6L8fL5f6qvXCImKP1aaVt3QepxwViZNc9KKYLaWpr5Kc4bAcklcj42yFLX
         drONiAZwFiIwRpe4c2HB9AtbeJq168WNM+JJ4Ig2f2LbaEkApW244LhNStDCue7rSlWa
         M2uQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5B3KgPNsW1cWmOoDqO0xJNFBgVw5ySLPYvHPShqXJY+fi2Zqi+RAMym2en9qzoFduFvY9CXo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw29ULadEMa5yZO2azFrb4Nbaibww9r9fVJ4MVZhbzY6asVENFw
	zcGbryRPNEBJ0A2aFU6hOEwVmzBHUvZDdLSZZLjrNTcSvQUvb9HSGllN8hBNwRqpfSOwNEf0r0C
	1cIFvLfc0eCLoNfH4SWJajupzDRhPKQkouBSURXwau6cpDSQfcgyh3i5gWNUpqQlt
X-Gm-Gg: AZuq6aKqen7EgD7eOnmlD+K4HAKdHCr3GnqwHbqRqEOuyl24GNoNop5MKZ8vutZ1vJ8
	uXlTXvWigKnTSQYLYHTYoA/o4cI7yBIKw7mGqWYTuSwMdjJpfoU3wH8Lg62nzrVL3jebrWT90Kq
	ZOkb5U45zMd7sx4A6ENe3MBvmpg8hTq5yPIK2h+pjKL3FJad7468v0kL0iZqJ+vGk03DQCLFrNM
	uL5JQuUEu/ih8Pacti0I3LGAKjMqYQesL4F7gY9HUFiaMbRTalzT2pLBDkY2v1yfBNL9GbR0Wi0
	y9X5Oi/qn8EoiRjwUP8mAZFZm9SIvM24eZA/7699KXFTPZNfG5e5Eq2psYFZY5lXbVTohPteTVg
	7saVdktNIGeNoRRBL2iIOGcPj7dyUyWaj1pTvl1X/7gMqrn+ZkUGRHQL7LjyD8/7tAHR6cKU=
X-Received: by 2002:a05:6a00:b95:b0:81f:3fd5:985e with SMTP id d2e1a72fcca58-823692a369dmr3696307b3a.32.1769565846266;
        Tue, 27 Jan 2026 18:04:06 -0800 (PST)
X-Received: by 2002:a05:6a00:b95:b0:81f:3fd5:985e with SMTP id d2e1a72fcca58-823692a369dmr3696281b3a.32.1769565845723;
        Tue, 27 Jan 2026 18:04:05 -0800 (PST)
Received: from [10.133.33.215] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379b1bc68sm827151b3a.2.2026.01.27.18.04.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 18:04:05 -0800 (PST)
Message-ID: <dc806193-c619-49bb-b054-565c4da53955@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 10:04:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current v2] wifi: ath11k: fix wrong TID passed when
 stopping AMPDU session
To: Pablo Martin-Gomez <pmartin-gomez@freebox.fr>, ath11k@lists.infradead.org,
        jeff.johnson@oss.qualcomm.com
Cc: linux-wireless@vger.kernel.org
References: <20260126174049.1370659-1-pmartin-gomez@freebox.fr>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260126174049.1370659-1-pmartin-gomez@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDAxMyBTYWx0ZWRfX+ERnWNF/X+7k
 XCiny7AQbhTbY0AU0nmSUaxoJbmry4RfjM5g/zvpcOK8qOpvB+9nNCOQDGaQTfz7BDK55IUoZ+I
 pm4w5O7gHt7UdSNnfFWFWuUmrUQkTQHKGyBsLw4ZKa+EsQS2GqxmfXwi0XNWFT04JMiz4cCNL5o
 S8FBUcWJUyarj4oEfzIpFNC0LkPa/CqswVmV+qFr46fRchTENDrn4Te201oop/GFsMUdHYjYR8B
 HTGqsbzCOWrsi8pJuFOiN+0cssyU0PjlzU/0ffE3xW+wHgv0+pMpQL3B2HT593Jfg8OHdaeoFfz
 VP/bN/Lw3hOCe7mvYHg3+M59mT4V5pxvvM8hhrVCurz9mjwZcMSRHRASgIFLEvlUBAknMfvOMOy
 n9BYdOx9EJhQqr3+Nt60yFefbsY7om5XnBA/RXGU/AZztUaa6VLryFQSd80GkHZCODWeMRs0r4x
 eshn3JGCV5oSTLRaNTA==
X-Proofpoint-ORIG-GUID: vdStOlpHSJTpfsSrGOn2HRqPlUh6UYYo
X-Authority-Analysis: v=2.4 cv=KezfcAYD c=1 sm=1 tr=0 ts=69796e97 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=4MSwVuzKff4lAtYpjw4A:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: vdStOlpHSJTpfsSrGOn2HRqPlUh6UYYo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_05,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_180409_221094_68B4D672 
X-CRM114-Status: GOOD (  20.27  )
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



On 1/27/2026 1:40 AM, Pablo Martin-Gomez wrote:
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
>  	spin_unlock_bh(&ab->base_lock);
>  	if (ret) {
>  		ath11k_warn(ab, "failed to update reo for rx tid %d: %d\n",

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>



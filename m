Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D996CCA9EBE
	for <ath11k@archiver.kernel.org>; Sat, 10 Oct 2026 17:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t/1QcsDW5BJKU9YLkS92YpjE8gYPmGHsWSBALL/pLBg=; b=ulgidv2VV3TFgA1G9VPtD50tAL
	kM2+vVA2nApMqSgpWGQJj4M9Zng+b4Y9IEOa964OIoOMd1sqp2RisM4ByY+7ifRm/tN5/Hg3UO117
	gmUuBMG/IAObm0t3Ke/6eyj6gNiroferbzYUmvIfYE3fPf9JVbPytJgGqMbo6JvZcD+igWcPOF48t
	YAhIXYPFcnMB2cnUEOeLEPLBNGp1Pm7qEpu3jT0XQj4O9s2RxpeeZW+mBxTWW0Sl3N6HfkgoHD8sK
	cZT+RpNZjVwealOtVj2ADThNtvaHUBFME2jO0RPddotw80Q4ls9XFTgbH78X8VizVCVeNoJXw6mDO
	tOVrUC+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFaXm-00000008JM6-3uO6;
	Sat, 10 Oct 2026 17:07:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFaXj-00000008JKA-1maK
	for ath11k@lists.infradead.org;
	Sat, 10 Oct 2026 17:07:34 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69AFPw9Z641718
	for <ath11k@lists.infradead.org>; Sat, 10 Oct 2026 17:07:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t/1QcsDW5BJKU9YLkS92YpjE8gYPmGHsWSBALL/pLBg=; b=dhAdQ/ycMl+oPia2
	fd8bj0rA4C6/kmqcKWlHITpsqMTg6fOHMqnTdnDYtPu6rsAu94ToumDsdmDOT+7b
	oLitpw8uy+KCF0IJ5vBm6qHAAYHhjgCy2ChbEqSGOTVh33xwGYNb7tV6NvbDhmSW
	fTEzmFRNXCcS5koS2rmh/T8z+Dy6GgeN2o28sNQnOhmlo104/S5EgdQoA3ja7kXt
	A9QeaRBUEaWee/adwXLFSYPEOviys0tUCJfBSFlUJjKT2aty0qZmenPbUjEKkEKl
	Lt16S+u/qCmBcPmFygY+GkjkyM5ar47MTtvZsN/OeicltXFoYzfwjOeu4/u5ofcK
	EJIO+g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7cpghjc7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Sat, 10 Oct 2026 17:07:30 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-358856e5105so2857011eec.0
        for <ath11k@lists.infradead.org>; Sat, 10 Oct 2026 10:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791652049; x=1792256849; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t/1QcsDW5BJKU9YLkS92YpjE8gYPmGHsWSBALL/pLBg=;
        b=VYPy4BOs744ihiYDCximVG4jMbAOIYpTC+0W3vaFwHlxTVgjpo4xcNTtvcpsPVW91F
         0KKbNN2gcOreeSKCnlyKAltk2tR4AS3aNuYZI2ShW/3eT/XzNypc7rdST0Cg2kU+lvuo
         D33foJTFzD6nkWVDVnIVWAu5HNVUTQvHM1DLjkS9e9tt4VVizPF2IJyH745o1p4/g/7s
         GiqW7iMxREnHaVVqnoIvSnqEkfzTYaL934Bp2c6bd8ca61kfy2k0ZpaW6lStC/0mSRen
         ZDLWbZikXAT1ESusV/d305RSPMLe0ijypcPDu+Auumz+e8i+BDq5y2h+VRcrLT+hf1YQ
         /WoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791652049; x=1792256849;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=t/1QcsDW5BJKU9YLkS92YpjE8gYPmGHsWSBALL/pLBg=;
        b=DM+hkeumG6oRtL9Dr8btUeNnAnHpgWJQWy0IEhgJ9xTQUnSNPO4VExRhO03lkd5WJk
         Iplq+F8n+SJKSgassdnHtPzGT4KUJnfiv5d4cl9hFM2ZT0YIan4QV3DqdwYCvdRs8aER
         XityRqUAXbVt84IF6KN8E5cBP68UDaAcOvnNwMsrgJT4CM2UQ2wdcgVTjbHkqs/fySYE
         UsM7EQDNYcq/h4ounC/hJW8EmopfNxSJRbD5eLffrM2aimHlUk+8a2yov9qJvmgOjJlD
         I5+HBw3+yk6S+rV45ioA5eCuy0Y7FNRQBu4Mu+BiCtl+NUsjRDjvPU7XuTQbh+j5HVZc
         UCOQ==
X-Forwarded-Encrypted: i=1; AKwUvBwtEzo8M6/IWK6gnFoFlgYofqZN1PZhC6zdpdTs2IN1KlP3W9eK4FxBl66Dm76weq+EyXza9i0=@lists.infradead.org
X-Gm-Message-State: AFq9FYJX77k46coWzgMJpJA8LcIunvFBYvwutpT0YcNQirnpKjvd6+2W
	i81GfjUa3dlrm77lnODqJHauLfFnBwgS1k8vSEORC7zcdo6ffJfj6fTg+aFBNLdxHNHnvo58rBl
	iQj1Z7NAnMPUjYF9CNx0BLFwLeIzH4Axu2ChKB+2I5UEqvVYLVJCrBRRNHq82Z49/
X-Gm-Gg: AYBFou0gn+pa1AUdD0OHvVTkRU8YPc6qoMUtW5CgTyU10AcZtL8UN2gVVNQB0spfMsx
	a/D+eTtseapZ4ebd8zf+AM27FLsh2gf2ddc3zDshaH8E9ijG0w2uJwuHl3xMv5hyY96j2tlyvLo
	bclOgtN8Qtza89qJc8Yt+Ggp6u054wBv8czbk1LWZvQtf2DyRoqhliqTC7H7lLG8dpb9mzUERxK
	h/za+oG5FY9GqMFvQGHN5fdErqvKsHAAVYkQxvcjtUnHUIWTDzAvdgArHo303FwQG0r+6HdnBPZ
	eql/IPm6XcSHnHnZ4YOZPaFEDEPzuESEPIqBaIqKNcQinAI/1FX8OafQ9yfESsQDa68rRzbeId6
	jjOk10b1DUbsBg5rO/0mzDuHMcHskjF9wHcSOi0p6j7b94Cl6Mfk2abT3Pg==
X-Received: by 2002:a05:7300:8420:b0:351:7f5c:dbe1 with SMTP id 5a478bee46e88-3537e02318amr7699836eec.28.1791652049042;
        Sat, 10 Oct 2026 10:07:29 -0700 (PDT)
X-Received: by 2002:a05:7300:8420:b0:351:7f5c:dbe1 with SMTP id 5a478bee46e88-3537e02318amr7699807eec.28.1791652048453;
        Sat, 10 Oct 2026 10:07:28 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3581f594a41sm9274614eec.23.2026.10.10.10.07.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Oct 2026 10:07:27 -0700 (PDT)
Message-ID: <d7f5ae97-05f0-487d-a31a-38c14e9c9e12@oss.qualcomm.com>
Date: Sat, 10 Oct 2026 10:07:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] wifi: ath: avoid IDR mutation while iterating
To: Jiale Yao <yaojiale02@163.com>, Jeff Johnson <jjohnson@kernel.org>,
        Shashidhar Lakkavalli <slakkavalli@datto.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org
References: <20261003092104.520135-1-yaojiale02@163.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261003092104.520135-1-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDA2OCBTYWx0ZWRfX73MrcBlCtg7x
 QNtj4REJ54j8/AnG5adj6JJDF90BIPL7WQlXqPUe6qZYWqVgoIeuiSYHwRycJDohE59Zc4aPiW4
 uTbagqopRA9Xo0FNLkSf9aNvMqOVcSE=
X-Authority-Analysis: v=2.4 cv=StoFe/O0 c=1 sm=1 tr=0 ts=6aca70d2 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=2dOy96dDxX5ttOVY4VAA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: 5nwtD1-yXSbRAR1c5uB0CKBqH2lsoPU6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDA2OCBTYWx0ZWRfX5IfiJMNdYz9x
 uyUZ115GgtDEALW2sPon5awANuDG0WIZpXwNMr4kNXDv1FhPCYWfdUAR3p8A6Xd6MOi9cLSDyIM
 h1V7CQKM68NA7LHSPczvpjA1YVA3sQn8RP6VrfPwC+O+gIn7xaETH7DGc/lQ0RYVT6bt8iTWnSp
 On+sWW7+aHfh52qgS/gVky7kQfJiYw6WjEnGqB1Wyhb/kD7NsOn/Bx4gHfdJ4GrRiREBCFYJPHz
 B92FjplOw3dgFxe3JO4ih+0ZrH1HpAOZQOZ5Ctcjbw1FjR9by1931dqO1u4czRp0YTc7inSmWUB
 57WKR6w+moBpNrPk4gde10HLXr84rShwclZXbwi3kU6LaprQPa9tzhJSPssMpQfPLelhLYTZEos
 QW6tQM3FXmI1ftXqGVjY6tBqrR/L4zYN6b1RsJL6OuTDEw59gSWbd/NF9qaJaMns5nl7RiE8nMe
 KeU1DGKjHgT9rcKFYjA==
X-Proofpoint-GUID: 5nwtD1-yXSbRAR1c5uB0CKBqH2lsoPU6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_100731_605189_ED0461B8 
X-CRM114-Status: GOOD (  14.04  )
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

On 10/3/2026 2:20 AM, Jiale Yao wrote:
> The ath10k, ath11k, and ath12k cleanup paths walk an IDR while removing
> the current entry. idr_for_each() retains radix-tree iterator state across
> the callback, so that removal can invalidate the walk.
> 
> Use idr_for_each_entry() in each cleanup path. It performs a fresh
> idr_get_next() lookup for every iteration, allowing the current entry to
> be removed safely before its skb is released. Keeping the existing locked
> removal helpers also ensures that a concurrent TX completion cannot find
> an IDR entry which points to an already freed skb.
> 
> Changes in v2:
> - Rework the ath11k and ath12k pending management TX cleanup patches to
>   remove each IDR entry before freeing its skb, as pointed out by
>   Rameshkumar and Jeff.
> - Use idr_for_each_entry() for the pending cleanup callers instead of
>   leaving freed skb pointers in the IDR until idr_destroy().
> 
> Jiale Yao (5):
>   wifi: ath10k: avoid IDR mutation during TX cleanup
>   wifi: ath11k: avoid IDR mutation during pending mgmt TX cleanup
>   wifi: ath11k: avoid IDR mutation during vif mgmt TX cleanup
>   wifi: ath12k: avoid IDR mutation during pending mgmt TX cleanup
>   wifi: ath12k: avoid IDR mutation during vif mgmt TX cleanup
> 
>  drivers/net/wireless/ath/ath10k/htt_tx.c |  7 ++++-
>  drivers/net/wireless/ath/ath11k/core.c   |  3 +--
>  drivers/net/wireless/ath/ath11k/mac.c    | 33 ++++++++++++------------
>  drivers/net/wireless/ath/ath11k/mac.h    |  2 +-
>  drivers/net/wireless/ath/ath12k/core.c   |  3 +--
>  drivers/net/wireless/ath/ath12k/mac.c    | 33 ++++++++++++------------
>  drivers/net/wireless/ath/ath12k/mac.h    |  2 +-
>  7 files changed, 44 insertions(+), 39 deletions(-)
> 

(dropped obsolete codeaurora and quicinc addresses)
Version with the ath10k change updated is in my 'pending' branch:
https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=3d806fd957b02ca1fa7991ffaf6c02ddd3dcbfe4


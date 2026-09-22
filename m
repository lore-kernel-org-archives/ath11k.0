Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A9B2C98302
	for <ath11k@archiver.kernel.org>; Tue, 22 Sep 2026 17:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YoKdxzXqcxs8aDLJDgxMewiJDR0phHL0RqzGzKoDtbA=; b=RfLBfiGKD4YTWvhbOwYI81PRH7
	uvKL799TeAAk93VpFk8Vxzh3ydKuFSohNUZcIqFL8rbB6JPk7oyxa0BEtYgBZ+lD3UgrHe79tVTzn
	kInWY65ty/+UE9NYmFRkSe4lIYHSzdOSkvCu/WlEbtHrsXq7eflkOj5rFOb7nug3il3kbNSpC2BGp
	VVa5MNvvXMg0Lm9x8pEU+LdWek0mJwkSYB4w9CybX2AU2ZIOiDHd4JgGpw2HO48mPZJwXvX9UM4B7
	gpeQShcYucaHyQz9HZGpNR3z9qDCMk7sQPFbvLu9+m77HtoD+KZqefzJ6N8VFBa/PbrIUqujzgobQ
	s70jFW7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x944a-00000006AKy-1QGp;
	Tue, 22 Sep 2026 17:14:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x944X-00000006AJx-3jVK
	for ath11k@lists.infradead.org;
	Tue, 22 Sep 2026 17:14:27 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjMZY3307555
	for <ath11k@lists.infradead.org>; Tue, 22 Sep 2026 17:14:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YoKdxzXqcxs8aDLJDgxMewiJDR0phHL0RqzGzKoDtbA=; b=SH+LZHyYwm2EFfev
	dC5BCRUX03669BE8eC0oX2/hVQM7GGQdKVUNUdu4Itf5aHF9qQvWOX7MmQOwrZGg
	kWcnsZWveGgyMRCrEn2H8nN6mhJLWFQPRtULJLFNTYv1cSWibtySAPnLuuDosrK2
	WuJsH+sc9vYBtwbhj9SZDjxSCF4nMV1MYxKEGmRGckPPpNkjIjpzDsALZHYkyV4A
	Wi0miG0scxa/iKB0GevgxH2N8lUg9+pVqEZ1MI+zPx9gUdwdAbwL2ZWWDOoCZ8u8
	/779x+jpuN2xDyu7BTMFi1aVqBky7lF6RSzfZ/PAHroxEQ2nZzWlv/2Sj++WFsJf
	6Sha7g==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guj113dah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 22 Sep 2026 17:14:25 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-78a58df134aso9598137.2
        for <ath11k@lists.infradead.org>; Tue, 22 Sep 2026 10:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790097264; x=1790702064; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YoKdxzXqcxs8aDLJDgxMewiJDR0phHL0RqzGzKoDtbA=;
        b=B0rwpkqhA1hz0jiFchKRyyvLn5BLjz3P37jnaaU6Bcv26JxIXtEbRRhPei4jii+gsF
         OIBPDqIDKJuOzop25GP7AmTP3p2b8E9iBXpDm3JZaj3KPwJeo6rGDbP+bcTVfJunTC4x
         jaiHDkyOpIGT88MdTqqQs3Q0rrNFodGyFB8YGI8SrVxSZW4VrWswrhIc2+Xx3AdkJthW
         DXgrB9i0khheSfRdRmSxZq5cpW+vQ7rOzAc8zMDBXvwu5uA6oE9MUwFDQLeIbE+EtvC3
         O3MZtInh0xsjxshRzcodxJNN0Gi4NGI3U+Y6ldN7QLem9q6aYA5U0YGl6W6ZB2VYyq9c
         dvwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790097264; x=1790702064;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YoKdxzXqcxs8aDLJDgxMewiJDR0phHL0RqzGzKoDtbA=;
        b=KI4BhVVJy22iwA54hT6+S6hR/icZVXFmAInLnpNSddLQ5R8ri6qCAfiySVzf2YGZiY
         D8E3vXd+zB8gPmuk9IV0GlRo48N1dK2U3ZbG1gnhMjZmfPGS9BL9KLq9OrowDeaIWcX8
         qhx0RbMrbLG8XeJuii4OeNwkxGmHIWYX8mMUuKIpFoqxSamv69r+2r5Ck1xt+f7Cdwqr
         1MqISH6zLo9oYeXH4o4b82xN38hhPTYIB6vwLuzJzdVJtuOHoikFA+TIdzdtK5mXspMR
         ghGhXsq3f4q10u4m8W79Gw5Av0xloasAfbbC15YZk3W3fJPn+uI2joHEcoOrk92g6cUX
         H6eA==
X-Forwarded-Encrypted: i=1; AKwUvByylPsD1co6lcs98ZvBRlrFjYi6GIQKL/IJMS4N/TS0jjR2dHsfoN3rHpiHuWzx5JUUJwkhNW4=@lists.infradead.org
X-Gm-Message-State: AFuF++nD01q+C/z2yzkvmDTd7cjSRGGBa6NT1KuaxjfFxAfWcJnV4v8l
	Q92ADcPe1mXRUmKhiLmRH4sLHxGCkogPGF00Larb+ix3vXeHC1f8poRmZdENLQVHjuJbhFssqW1
	V0X6hhW/RH1yhazoAW73n8yJXkUsW6em2SmNJvEVWjRPieh0XBd4WLBS1YGkhb7PZ
X-Gm-Gg: AYBFou32et9NU3sdFZVRCVX913UJNaMVIzan3B4qYmaqEzfNqhbj5Ws9UQFEL+wLE8P
	b+o4SWcpVCa1zg+Fj+h40kQ2QXhpHYCCznZqzRgvAhssZIwP3tExM1nMMYbXgrepMEME8ms6wOF
	tTE3yKWW8SMxhXGDrOVlfhspk8IK7qCUAF7KyuuSlfI+rMjHlBE1qGcS2XJfGUsFYXfRMP0evBA
	CrftD1exHIi5invqTpepZ449FscKVQJAT/ke6BvxUWdDow8HXC00fRFMpZ19arB/ntuUjuY/p0F
	7f4/zNANnoOdDa1xMPiPQ/CvqqSdKY71g4MobiyQmskUbnIJH/Kd2f6L9s5Hp6agWhaIK4VO0oe
	MCr+tm/ogANdybOx60zmlCKpZlmmnLZ9Eukqz0rM=
X-Received: by 2002:a05:6102:f85:b0:7a7:19aa:f0d1 with SMTP id ada2fe7eead31-7a719aaf773mr6957663137.30.1790097264200;
        Tue, 22 Sep 2026 10:14:24 -0700 (PDT)
X-Received: by 2002:a05:6102:f85:b0:7a7:19aa:f0d1 with SMTP id ada2fe7eead31-7a719aaf773mr6957615137.30.1790097263755;
        Tue, 22 Sep 2026 10:14:23 -0700 (PDT)
Received: from [10.243.142.186] ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdaaf0074sm59131665e9.3.2026.09.22.10.14.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 10:14:23 -0700 (PDT)
Message-ID: <a16d507e-17f7-4074-8817-4b8da3a71c3b@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 18:14:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] net: qrtr: Assign unique node id for MHI endpoints
To: manivannan.sadhasivam@oss.qualcomm.com,
        Manivannan Sadhasivam <mani@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        Bjorn Andersson <andersson@kernel.org>,
        Chris Lew <christopher.lew@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Juha-Matti Tilli <juha-matti.tilli@iki.fi>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
References: <20260921-qrtr-multi-ep-v2-0-27dd80d841a0@oss.qualcomm.com>
 <20260921-qrtr-multi-ep-v2-2-27dd80d841a0@oss.qualcomm.com>
Content-Language: en-US
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
In-Reply-To: <20260921-qrtr-multi-ep-v2-2-27dd80d841a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5flrT-xFVZZaUVh170BS1k8h_kubd9d_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI1MiBTYWx0ZWRfX3dhF5GhbhbVm
 RRlow1JSz7j87+P7S47vGjYWExyAIP0nuSDHTT1bH+GmnE5Lt1IntwUKJs+X++QPLzSnxauL/PD
 Pfs1A6tVUqWuSgJCNsdTTaAfgCZ+2R8=
X-Proofpoint-ORIG-GUID: 5flrT-xFVZZaUVh170BS1k8h_kubd9d_
X-Authority-Analysis: v=2.4 cv=atQnmiZV c=1 sm=1 tr=0 ts=6ab2b771 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=ar2LfINMGabpzH7QhtgA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI1MiBTYWx0ZWRfXxpOim5EgccFc
 IeZgxolYYL1LPNbukybMvJYG43Q4aGfUsFrRGUm2JsLmmlMiB0lgRcPJnZec4Be2hrru8puZVmk
 RWTRGTIBttOUDK7za9YQ1Z2pYuReDf2dDaeI9kGQ7bwkrKSlyO7rj/7ccyK4x2i/zKtZhzW+MRT
 9bzLrP9yZqyOZRQry7nMo4nI6KVKCPclGVS7GutAfwk7T6Gh7+P2bJOmeqieTbIikLhfv3MsNnk
 nhYsIeEH0TUrUP6UD4FZkPCHZr+Y/5ASv0o/qmqDLO89McSNAUqlejOkNRvEI6HRxbk3m3bneXq
 8wU6FIHVO7mYjPRrFiG159FurTNbd9gjrI9v3TuMk7uutAgzud3phPyUui3D0XBIHmzclzwz5Nw
 ZBsTvQyvpBsd9VQA1Qr6uo2xY5X97y0XzaxaAiVGpm9lOe5+0W99QM/FIs23J8xJEx92XT12FY4
 S62MhUXt+c4vZi305cw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 clxscore=1011 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220252
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_101425_934562_C8250DEB 
X-CRM114-Status: GOOD (  10.72  )
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



On 9/21/2026 12:23 PM, Manivannan Sadhasivam via B4 Relay wrote:
> +
> +/* The offset is chosen carefully to not collide with the node ids allocated by
> + * the remote nodes. All the remote nodes use node ids in range 0 to 0xffff.
This assumption does not hold up for QRTR V1 headers where the node ids are 32bit.
QAIC devices use BHI_SERIALNUM as the node ID, and it is definitely larger than
0xFFFF.> + */
> +#define QRTR_NODE_HOST_BASE 0x10000u
>
Thanks,
Youssef


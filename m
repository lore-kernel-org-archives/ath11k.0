Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D0CAECD6C1
	for <ath11k@archiver.kernel.org>; Wed, 11 Feb 2026 17:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CBQ7uHwwoh1rU+2+k+hW6d6IlNu5L0+u/7CTYTHXD+E=; b=wrGqHmPpFAOFaa/w10uLBhg0z8
	/SuqoKXBz7FC9HZtC2LJOsSly7Oq6KO59V8WE87o1yqZyR/H+hL0q6YhPLXHQRGiW05sKNlcVj4Ny
	YFmpHB24iucJBbyCdgpLxIxkLjiaGoXtehEEKllnz2krCcNNnwGzY3b5t3EeaJ2kW3zw5HHEwwzjD
	qp6PU0TlSe2/vzt1j0zzEQZtpZD+XSX2keYDB0d6pzrNJyRvQZ4mrAYwZuhawlHXvaDuK+zA3TRB5
	Wy1cl2sKeFeg7v127ZHP874OBv4D0NdtWSgQxCZLkhwTc44v1Mg5tIlAf38W9QC3/5wxZbTq1rB+T
	3KT/rrlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqDg6-00000000sGf-3UZb;
	Wed, 11 Feb 2026 17:07:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqDg4-00000000sGC-0T8L
	for ath11k@lists.infradead.org;
	Wed, 11 Feb 2026 17:07:01 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61BH4crn2663418
	for <ath11k@lists.infradead.org>; Wed, 11 Feb 2026 17:06:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CBQ7uHwwoh1rU+2+k+hW6d6IlNu5L0+u/7CTYTHXD+E=; b=apwvSDjijTpcoiEf
	sR28pol9DWhm48iDWrSO1YVHK4ezfQnIHdQ3HHU0YQbt2GE93GaeGu454oTSWO8D
	NYFfVcxGTaFFtmhnt2gZIq3W9/U88kyM8SdnCAYJ87Z9lL9XvBGP6+eHaUr3IUET
	RWRtnyZAF8SvEUotVNYlbJGxvy+iQQLuU1CVobPwrs9Y8tSYKkO64koReIyRa7Lj
	E9I6/Tojx602sKaLRUYZC1L9NhhIid6DZyhDWXVQbM26JelFaP7nAvJ4a5nD0y6E
	GT+mI73nF0gSRA048rilfrWr87Ui9eKoMxPiH1IewGKAmUR7A00bdCNDcbqJveY8
	h5hzfQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8wus00br-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 11 Feb 2026 17:06:58 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-124627fc58dso3300192c88.1
        for <ath11k@lists.infradead.org>; Wed, 11 Feb 2026 09:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770829617; x=1771434417; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CBQ7uHwwoh1rU+2+k+hW6d6IlNu5L0+u/7CTYTHXD+E=;
        b=SCfL79+IE35X1YHs3o7V+GNvdzYvtJXEhMXQebzgK2rtjXXHgBiMAbPp1d/NDEw3bn
         vA8qDYzu1GQamzWVrBVAPXCrtTKNCzkUHGTCzUmVD8pfZiedV3IEplF4OLAaE4zXR/Jo
         GY/h7rYR21VDQ5MNk/gTVayhW8cLuuwMA95n9Sg2XPwPzldCD6MLI222Be6g97xeyWb/
         y8VbAYjHQ8nUatn6T8IkbTo/xMe8SglpQY0twtA1gu3v8/FK2ySpJw/1/XreZCGc8zTr
         i+ArfCnR3nxo7gCPfMRrw7sAsUY3BRdF6GJyDr+9HJ28vD8DFIjn088tc7pYabsc2NXH
         d+rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770829617; x=1771434417;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CBQ7uHwwoh1rU+2+k+hW6d6IlNu5L0+u/7CTYTHXD+E=;
        b=Cyo2YmRe5n+LGb5jWBc5ExnHzRJpKiFa5hjtk0i6aGkoiydKD7puvx0vF65pfQGa6J
         /i+JQ1vl1rWj1pjeQmYNMARatI14QBFt2pNQtyj/zpczQO08z0spn8KV2RXSe/3cKdgT
         3O/Sj4IWFD5lGJ7/GZkdJZt7U9jjW/y75FitUDNzFTU3xxTSiw2lUfseAcOALjhPmI0L
         yc5T1w9u9oianbRfxoePmCF2SLc2/CLJnvPrFA7YvdrVtQIhkQWmdtGwxOlv94x3Bi+4
         hpJCvrFGGKErmBKuAeCcJlzZzcGI89JH69FX720z/xnXtEQVnh05tNzB3D14DV52M28p
         SAPA==
X-Forwarded-Encrypted: i=1; AJvYcCWG04/KCeR/fXGXqtvO6PREUsw43TsjVclX+c4RIYJ+2VqEsZNIETwJLNHNizb6VS4TUedNNX8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxQOMFtu1zlyBm+nKaZUirISnFuzzc/Rj51bP3pfSqx2llxM1Em
	3ldxovU6VNcYeGkjRgTugJw0p+id1unxHXgo+/mcRjzqBxJMi8myCbfoXNEOQk63TZoA6S6m98p
	hXH2ppJclCrFxyIWLeECIgvW3MEIZpMfMbvYbdOm+bYobaXrQ00QIBpAKcA239lDzl2UU6gNj
X-Gm-Gg: AZuq6aJYMopJ0bkV/np5s2Zj3wWpKb8IHS6/uLB0IR9Ej/kwFChjml4cw9D1gq40Tpo
	pcccDPaJJYmExJxshFhMgMmNJCPHLuqmviaWWGJScGAXhl8rp8MeO104MVSfn/+tkeHPZghN3wh
	loKAkKvPOMG44aQR3GoiZF9zXG+vfmNejLrHQcOHReI60ozrE6Tq+6OHPCVlos/oi6FOlnUhEXi
	q1fR/d3mVjUPFhSpE2tKY9I4mCsGX5U6KDN+BMupqxqBgNn2V428ZO9jOK8aU1+IgdJZzdFL1VX
	C0MRiNip6GbHw51yxjQzmttdFfDI0CGvxAJmIjOOsnBCkKbIOibMW/25E1AuVE5HtfhTODAfA/5
	6OcoXvAKz0fKG7co2H1HUE5s3w+BndHPdvocSIIggphKZK59z/X+TN3cGpvEZh6U5+wNaNJ7lo3
	o1WaxoIA==
X-Received: by 2002:a05:7022:98f:b0:127:148b:3fcc with SMTP id a92af1059eb24-127148b4661mr5566801c88.8.1770829617351;
        Wed, 11 Feb 2026 09:06:57 -0800 (PST)
X-Received: by 2002:a05:7022:98f:b0:127:148b:3fcc with SMTP id a92af1059eb24-127148b4661mr5566776c88.8.1770829616677;
        Wed, 11 Feb 2026 09:06:56 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1272a69ccb8sm2497550c88.4.2026.02.11.09.06.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Feb 2026 09:06:56 -0800 (PST)
Message-ID: <fde62beb-9b8d-4594-af1f-95690236fe85@oss.qualcomm.com>
Date: Wed, 11 Feb 2026 09:06:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k: WCN6855 hw2.1: board file for Ntmer TW220
To: Pengyu Luo <mitltlatltl@gmail.com>, ath11k@lists.infradead.org
References: <CAH2e8h7BHvRQNo9gK+LPV4EB6WOtm-ahw_c0V00waBs9j99W9g@mail.gmail.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <CAH2e8h7BHvRQNo9gK+LPV4EB6WOtm-ahw_c0V00waBs9j99W9g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JEv5ThrK1YmV0WR2Wr87Z77s4IK6_AMb
X-Authority-Analysis: v=2.4 cv=BLa+bVQG c=1 sm=1 tr=0 ts=698cb732 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=qC_FGOx9AAAA:8 a=nGf75e85f0ss38wusVEA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDEzMiBTYWx0ZWRfX1DaKJ8Jnbd5S
 w8kluDq1TeyXoA/p77nlM8lMpKzAoFGU6zzXLWMUaP1oDBIwABSftSJ8C3nosBK36W6U3JHkBzV
 u/EehlV/BDxS717jRskVBKUtD7HP5Z7hwlkVxESzrgaASg+t6Vy18ZeW3F9OBEDgknqBlGAXWXW
 KQuE2ZySTyqnpi0eiZuu2G0I+InpqkwZMbwi+h5WTPbQds1dz4pDdnS7H5DJ/ZP/aFomc1zjJvm
 5dd+P1Q8V3MjWRF8AgbUPvYYGMNyddIU6DgqYI/AgEgHs2OOomqOz5KO0WQphnam3Aw+NX07zO/
 sSVXcB02ogF/RzYpvPB0HtZn9qbha8q97PkNTx0RObXvoplAtTGD6birXySOYVsqovQeFVSEjYr
 NzdpYAs404nt/vg5xWHDBmu/bhx4crNiulEYgP+BIwvGV4GGyz07QRpEQB80vfKm1GV73d7jSxE
 Nv73fMr+ePwCJvu7p2A==
X-Proofpoint-ORIG-GUID: JEv5ThrK1YmV0WR2Wr87Z77s4IK6_AMb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-11_02,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602110132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_090700_270303_B3BE8451 
X-CRM114-Status: GOOD (  13.24  )
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

On 7/5/2025 10:51 PM, Pengyu Luo wrote:
> Add board file for Ntmer TW220, which is a SC8280XP based device.
> 
> * description for what hardware this is:
> 
> A WCN6855 module found in a SC8280XP based board.
> "bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=18,qmi-board-id=255"
> 
> * origin of the board file (did you create it yourself or where you
>   downloaded)
> 
> It is from the upstream WCN6855 board file, reusing the one originally
> used for LE_X13S, it works well with good RF performance.
> 
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
> 
> ids: "bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=18,qmi-board-id=255,variant=NTM_TW220"
> sha256sum: 77b1b9ef636ce8492723aa7c2ff2c42c2e5e81a43967d7f32bfdef93a31bf8c4
> 
> Best wishes,
> Pengyu

https://git.codelinaro.org/clo/ath-firmware/ath11k-firmware/-/commit/d6eb36900c1f27fdbf60374cdea5e8c0c109912b




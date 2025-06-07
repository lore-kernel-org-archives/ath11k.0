Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C0DC61DB2
	for <ath11k@archiver.kernel.org>; Sat,  7 Jun 2025 14:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hXtbf2FReKIjetqhu5D3Z6E7g4OFjvzRCOjUzDZ67dE=; b=GZiLsq7YKbWK2aWPfahluSRORx
	C6bbvQzOM3nLnaqPcqqzRNJqusX6usm3KuqM79BehWzEZYUvFAbOfQCajFbnVt9j1DIR3zHc3NZYA
	rB2/BSweN18glOnRH6xH2loCVgAtREDDmvq2FnQGmHBya5Xml4SHmWHNrPGwpoYl7nUn2M38XDwul
	TIjB4xJIJiyz9jADbKHX0DbSRW59pPTEAwbSXIPsD6eqilSewNvMwtITuW8x9ifAcM957uwnhdLoi
	tEN2hdsFoL779X1khwOAUOE/fUcOaTNGhHisEDSM9V+VFwQ7YpuEGXVKGvd4Srdau0WhWj2pEf2Or
	BhQnKXlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNumC-00000001mMb-3F9Z;
	Sat, 07 Jun 2025 14:44:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNumA-00000001mLI-04he
	for ath11k@lists.infradead.org;
	Sat, 07 Jun 2025 14:44:03 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 557CohgJ010466
	for <ath11k@lists.infradead.org>; Sat, 7 Jun 2025 14:44:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hXtbf2FReKIjetqhu5D3Z6E7g4OFjvzRCOjUzDZ67dE=; b=eWzanx+ySU3YOt3B
	IDM62QVglaMWYaxUAU4Ym8ggXg7FwIuz2UowZW76Dwf9HAlUD4GKf6E/3sdrDnuV
	l5zROR0iS7KYtokyRf9casQP82Wu6wQlF6jmxyUqUGSfSkYSlxR21bgXMsL2N/ug
	iPaphVxV8H9zKjJLkQmMTWP1kaz6qQ0D+uPxngSo4gLOUlIPoovrsaOx1SU2lxT9
	9PuP2pHsZA4N203tIUue3XxAiTmWPMpVjaKuGSHB3PxDwFGPxZJmqM1u2rUpPix4
	PCIg5mc5uHWJ33uGpmvMt6Iwde7nQFx7x+8IMxxyK9xU9llymZWhXzXwxrGFEfpP
	zaTEaw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ccv0sm2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Sat, 07 Jun 2025 14:44:01 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-23592f5fcb0so47630255ad.3
        for <ath11k@lists.infradead.org>; Sat, 07 Jun 2025 07:44:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749307440; x=1749912240;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hXtbf2FReKIjetqhu5D3Z6E7g4OFjvzRCOjUzDZ67dE=;
        b=xRORWZ6ojB40+bkuo0SmERv1RIkCkX8L3LFlFyT+BxPjAtEu4rxsEraH1OPpgVom1q
         vrfa7TUygFWNuWVyHuTZhYsLck+Mi3999VuO2JlO4zssh5gXeHe3ai/TBvez74ZdEeXY
         4Xdq/kZN2NbB2e1vOITs+SN4xHhSs6kW0N+Z16qsYaX6EwWXKhRZFXR9HpnYCXVZaV+I
         PbRUl0pVFbt+5FSzQmqEapyHfl7Vc/2c+/ycZXBikGs4mMdAZpxbPOwg0iQudGJSBZK7
         Qlcfy3Tw5C/QoKZzPo9k+tmU0JgEqRZ1CztzTKX/duy9K28D0XbhUO6X+ymt4IACZJkU
         pEhQ==
X-Gm-Message-State: AOJu0YzmjIs/OxAHVcF3YHdYuT4Wsmuqv/y34RUE4hjoD7C2KIWyp50c
	XM46hN6DGZIVlB5xReIrLph8j2jpudjR0jQ0lFVFE3LrQH0ctcCNb1k6Mt9EqTrcQcI4eBtklEl
	WgC1LFH7n+gTJQhPa63N0lPo3ge98+4FDfzaxaihvvOJo5rqfdGhYxoLfegYuU88LvrNNhHmZ
X-Gm-Gg: ASbGncsUzvvjePjE6hE2B5vhqJaudwJUmRG3tOPYMUCGkS7um8NR5jT5vP9lLQKWFuC
	3GACgtHGmxUTBJoYpBuFO+7Xc+7CN2XnhcyE/3C5A5NQP7aWFdi8vPKeOtWroga60Dt9t7kg5r8
	XNte0VHz6/vjXA3mlruhMMR7Lmwy6Pr/2TerLbeKgmSVuf35O7yR59s/w4qDpUjnhtUinOTLD/c
	eCpRzCkEgunqZdexgmxaWQEb0i2c+MxlG1CATsXlv0yZ/ESJAx5+ZcWA12PIpkHncA58Ckb/dSf
	S6tbP3GR+MhuYHKiesip2WHHIY3c4/A4q/j6ksVtml4Dgn9oAOPKx7en2K4=
X-Received: by 2002:a17:903:244c:b0:235:866:9fac with SMTP id d9443c01a7336-23601cf0a49mr110758205ad.2.1749307440319;
        Sat, 07 Jun 2025 07:44:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/VLorjX5BRI7TPNkX+9tONq7W/NhEOTC641u+2FOWimaNRu3FAHD9MQK+1OaYFNYuD+yyEg==
X-Received: by 2002:a17:903:244c:b0:235:866:9fac with SMTP id d9443c01a7336-23601cf0a49mr110758015ad.2.1749307439948;
        Sat, 07 Jun 2025 07:43:59 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236030969ebsm27626415ad.72.2025.06.07.07.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 07:43:59 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath11k@lists.infradead.org, Baochen Qiang <quic_bqiang@quicinc.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250220082448.31039-1-quic_bqiang@quicinc.com>
References: <20250220082448.31039-1-quic_bqiang@quicinc.com>
Subject: Re: [PATCH v2 0/7] wifi: ath11k: fixes and refactor to firmware
 stats related functions
Message-Id: <174930743885.154748.16215131311907953495.b4-ty@oss.qualcomm.com>
Date: Sat, 07 Jun 2025 07:43:58 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: CHEfrxobsMIPU6d6GGYsITBAUSaHaQIW
X-Authority-Analysis: v=2.4 cv=TsLmhCXh c=1 sm=1 tr=0 ts=68445031 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=ZLGELXoPAAAA:8
 a=EUspDBNiAAAA:8 a=7-MSMrdUUGO4ovTuh0kA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=CFiPc5v16LZhaT-MVE1c:22
X-Proofpoint-GUID: CHEfrxobsMIPU6d6GGYsITBAUSaHaQIW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDEwNiBTYWx0ZWRfX18iaD5gsWwB6
 6LV+7eyBxDvb4QQhP0eJRu45ywaYnk/Z92npAljnwyHR7SnySbKhVC4OwSNfNd2TY+aoWcj/eIu
 RjIxH89sJgVnzfMHlt8y0smi/RrSRB3C8M8bz94bQzdnq1AYdQp89DuS/gzeUah1l2a6XKu7BrD
 btSE0VrljzGotpaaXG8doJyplWDuvWM8lIhIy3u/17mV5cl6n9gHao3KLwuKjZMGLZ10RdF7gKm
 QdFxruwyNDDDDnzKukA0kdEtK3Y0no91cK6oGy31xYW+iqMhnze7c1jQ9Gn+xNtAxVzxSSP2vyv
 kbtF7UsMN/OUcJaiejM1xzAbawe46FrlIejxP0UOUZSZfKvwkmo+4uWq4LzcPKu14IlWzz4Qlew
 NWEi4elea0cJbcRELEheiaNKPqf/eK+IbaqC+g5e4ctfWQ6vu2b1nV6jxOhgPPALhWikGelJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_06,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506070106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_074402_065123_9A60FBC1 
X-CRM114-Status: GOOD (  11.86  )
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


On Thu, 20 Feb 2025 16:24:41 +0800, Baochen Qiang wrote:
> We get report [1] that CPU is running in hot loop while requesting firmware stats,
> fix it in patch [1/6]. While at it, fix potential failures due to static variables
> in patch [2/6]. patch [3/6] fix potential issues in cases ath11k debugfs is not
> enabled. patch [4/6] fix lock symmetry issue. and the last two patches refactor
> firmware stats request helpers such that we can remove some redundant code.
> 
> [1] https://lore.kernel.org/all/7324ac7a-8b7a-42a5-aa19-de52138ff638@app.fastmail.com
> 
> [...]

Applied, thanks!

[1/7] wifi: ath11k: avoid burning CPU in ath11k_debugfs_fw_stats_request()
      commit: 9f6e82d11bb9692a90d20b10f87345598945c803
[2/7] wifi: ath11k: don't use static variables in ath11k_debugfs_fw_stats_process()
      commit: 2bcf73b2612dda7432f2c2eaad6679bd291791f2
[3/7] wifi: ath11k: don't wait when there is no vdev started
      commit: 3b6d00fa883075dcaf49221538230e038a9c0b43
[4/7] wifi: ath11k: move some firmware stats related functions outside of debugfs
      commit: 72610ed7d79da17ee09102534d6c696a4ea8a08e
[5/7] wifi: ath11k: adjust unlock sequence in ath11k_update_stats_event()
      commit: 81f64165c9dc2d9b070d8240dd369974ebe188d3
[6/7] wifi: ath11k: move locking outside of ath11k_mac_get_fw_stats()
      commit: c5b92a2c18938ebb08e8d4062408ab1524da31c3
[7/7] wifi: ath11k: consistently use ath11k_mac_get_fw_stats()
      commit: 29e2adf2ef2966379bd3fe002530b10dfc3030ba

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


